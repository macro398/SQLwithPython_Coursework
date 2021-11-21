CREATE TABLE categories (
    id SERIAL,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    picture TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE products (
    id SERIAL,
    name TEXT NOT NULL,
    discontinued BOOLEAN NOT NULL,
    PRIMARY KEY(id),
    category_id INT
);

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY(category_id)
REFERENCES categories; 