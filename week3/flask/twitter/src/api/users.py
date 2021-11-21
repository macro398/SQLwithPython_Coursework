from flask import Blueprint, jsonify, abort, request
import sqlalchemy
from sqlalchemy.sql.expression import false
from sqlalchemy.sql.functions import user
from ..models import Tweet, User, db, likes_table
import hashlib
import secrets

def scramble(password: str):
    """Hash and salt the given password"""
    salt = secrets.token_hex(16)
    return hashlib.sha512((password + salt).encode('utf-8')).hexdigest()

bp = Blueprint('users', __name__, url_prefix='/users')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    users = User.query.all() # ORM performs SELECT query
    result = []
    for u in users:
        result.append(u.serialize()) # build list of Tweets as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    u = User.query.get_or_404(id)
    return jsonify(u.serialize())

@bp.route('', methods=['POST'])
def create():
    # req body must contain user_id and content
    if 'username' not in request.json or 'password' not in request.json:
        return abort(400)
    # username at least 3 characters long and password at least 8 character long
    if len(request.json['username']) < 3 or len(request.json['password']) < 8:
        return abort(400)
    # construct Tweet
    u = User(
        username=request.json['username'],
        password=scramble(request.json['password'])
    )
    db.session.add(u) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(u.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    u = User.query.get_or_404(id)
    try:
        db.session.delete(u) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    u = User.query.get_or_404(id)
    try:
        if 'username' in request.json:
            u.username = request.json['username']
        if 'password' in request.json:
            u.password = scramble(request.json['password'])
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)

@bp.route('/<int:id>/liked_tweets', methods=['GET'])
def liked_tweets(id: int):
    lt = User.query.get_or_404(id)
    result = []
    for t in lt.tweets:
        result.append(t.serialize())
    return jsonify(result)

@bp.route('/<int:id>/likes', methods=['POST'])
def like_a_tweet(id: int):
    if 'tweet_id' not in request.json:
        return abort(400)
    tweet_id = request.json['tweet_id']
    # Check user and Tweet exists #
    User.query.get_or_404(id)
    Tweet.query.get_or_404(tweet_id)
    try:
        sqlstatement = sqlalchemy.insert(likes_table).values(user_id=id, tweet_id=tweet_id)
        db.session.execute(sqlstatement)
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)

@bp.route('/<int:user_id>/likes/<int:tweet_id>', methods=['DELETE'])
def unlike_a_tweet(user_id: int, tweet_id: int):
    # Check user and Tweet exists #
    User.query.get_or_404(user_id)
    Tweet.query.get_or_404(tweet_id)
    result = sqlalchemy.select().where(likes_table.c.user_id==user_id, likes_table.c.tweet_id==tweet_id)
    try:
        sqlstatement = sqlalchemy.delete(likes_table).where(likes_table.c.user_id==user_id, likes_table.c.tweet_id==tweet_id)
        db.session.execute(sqlstatement)
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)