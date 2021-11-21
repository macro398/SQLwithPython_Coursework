--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-11-21 18:52:05 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 17551)
-- Name: abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abilities (
    name text NOT NULL,
    description text,
    level integer,
    effect text
);


ALTER TABLE public.abilities OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17765)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17474)
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas (
    id integer NOT NULL,
    zone text,
    has_traps boolean
);


ALTER TABLE public.areas OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17472)
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO postgres;

--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 209
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- TOC entry 215 (class 1259 OID 17533)
-- Name: character_inventories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.character_inventories (
    character_name text NOT NULL,
    item_id integer NOT NULL,
    equiped boolean
);


ALTER TABLE public.character_inventories OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17420)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    name text NOT NULL,
    level integer,
    armor_class integer NOT NULL,
    max_hp integer NOT NULL,
    class text NOT NULL,
    race text NOT NULL,
    is_npc boolean NOT NULL,
    played_by integer
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17559)
-- Name: class_abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class_abilities (
    ability_name text NOT NULL,
    class_name text NOT NULL
);


ALTER TABLE public.class_abilities OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17402)
-- Name: classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classes (
    name text NOT NULL,
    description text
);


ALTER TABLE public.classes OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17466)
-- Name: encounters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.encounters (
    id integer NOT NULL,
    area_id integer
);


ALTER TABLE public.encounters OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17464)
-- Name: encounters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.encounters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encounters_id_seq OWNER TO postgres;

--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 207
-- Name: encounters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.encounters_id_seq OWNED BY public.encounters.id;


--
-- TOC entry 211 (class 1259 OID 17490)
-- Name: enemies_in_encounter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enemies_in_encounter (
    encounter_id integer NOT NULL,
    mob_id integer NOT NULL
);


ALTER TABLE public.enemies_in_encounter OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17507)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name text,
    description text NOT NULL,
    value integer
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17505)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 212
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 214 (class 1259 OID 17518)
-- Name: loot_from_encounter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loot_from_encounter (
    encounter_id integer NOT NULL,
    loot_id integer NOT NULL
);


ALTER TABLE public.loot_from_encounter OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17445)
-- Name: mobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mobs (
    id integer NOT NULL,
    name text,
    level integer,
    armor_class integer NOT NULL,
    max_hp integer NOT NULL,
    class text NOT NULL,
    race text NOT NULL
);


ALTER TABLE public.mobs OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17443)
-- Name: mobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mobs_id_seq OWNER TO postgres;

--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 205
-- Name: mobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mobs_id_seq OWNED BY public.mobs.id;


--
-- TOC entry 203 (class 1259 OID 17410)
-- Name: races; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.races (
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.races OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17389)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17387)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 200
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2923 (class 2604 OID 17477)
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- TOC entry 2922 (class 2604 OID 17469)
-- Name: encounters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encounters ALTER COLUMN id SET DEFAULT nextval('public.encounters_id_seq'::regclass);


--
-- TOC entry 2924 (class 2604 OID 17510)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 2921 (class 2604 OID 17448)
-- Name: mobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobs ALTER COLUMN id SET DEFAULT nextval('public.mobs_id_seq'::regclass);


--
-- TOC entry 2920 (class 2604 OID 17392)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3124 (class 0 OID 17551)
-- Dependencies: 216
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abilities (name, description, level, effect) FROM stdin;
rage	Fight with primal ferocity. While raging you have advantage on Strength checks and saving throws, bonus damage to attacks, and gain resistance to physical damage.	1	Rage
reckless attack	Throw aside all concern for defense to attack with fierce desperation.	2	Advantage on attacks from and against.
frenzy	Gain an extra attack each turn	3	Become exhausted until the next long rest.
intimidating presence	Use your action to frighten someone within 30 feet with your menacing precense.	10	Enemy become feared.
bardic inspiration	Inspire someone within 60 feet with your words or music.	1	Assists an ally.
song of rest	use soothing music to help revitalize wounded allies during a short rest.	2	Heal all allies up to 6 hit points.
vicious mockery	You unleash a string of insults laced with subtle enchantments at a creature in range.	1	Up to 4 damage and the target had disadvantage on the next attack it makes.
dimension door	You teleport to another spot within 500 feet.	6	\N
eyebite	One creature of choice within 60 feet suffers the effect of your choice. Sleep - the target falls unconscious waking up if it takes damage or is awoken by another creature, fear - the target must run away from you until the effect ends, or sickened - disadvantage on attacks.	8	Target is feared, unconscious, or has disadvantage on all attacks.
turn undead	As an action, you speak a prayer censuring the undead, all undead in 30 feet are feared.	2	feared
destroy undead	As an action, all undead in 30 feet are destroyed.	5	\N
sacred flame	Flame-like radiance descends on a creature that you can see within range.	1	Up to 8 damage
spare the dying	Touch a living creature that has 0 hit points. The creature becomes stable.	1	Save someone on deaths door.
cure wounds	Heal a creature for up to 8 hit points.	1	Healed for up to 8 hit points.
\.


--
-- TOC entry 3126 (class 0 OID 17765)
-- Dependencies: 218
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 17474)
-- Dependencies: 210
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.areas (id, zone, has_traps) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 17533)
-- Dependencies: 215
-- Data for Name: character_inventories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.character_inventories (character_name, item_id, equiped) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 17420)
-- Dependencies: 204
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (name, level, armor_class, max_hp, class, race, is_npc, played_by) FROM stdin;
Boromir Thunderbeard	5	10	49	barbarian	human	f	\N
\.


--
-- TOC entry 3125 (class 0 OID 17559)
-- Dependencies: 217
-- Data for Name: class_abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class_abilities (ability_name, class_name) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 17402)
-- Dependencies: 202
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classes (name, description) FROM stdin;
barbarian	\N
bard	\N
cleric	\N
druid	\N
paladin	\N
ranger	\N
rogue	\N
warlock	\N
wizard	\N
\.


--
-- TOC entry 3116 (class 0 OID 17466)
-- Dependencies: 208
-- Data for Name: encounters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.encounters (id, area_id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 17490)
-- Dependencies: 211
-- Data for Name: enemies_in_encounter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enemies_in_encounter (encounter_id, mob_id) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 17507)
-- Dependencies: 213
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, name, description, value) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 17518)
-- Dependencies: 214
-- Data for Name: loot_from_encounter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loot_from_encounter (encounter_id, loot_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 17445)
-- Dependencies: 206
-- Data for Name: mobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mobs (id, name, level, armor_class, max_hp, class, race) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 17410)
-- Dependencies: 203
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.races (name, description) FROM stdin;
human	Humans are the most adaptable and ambitious people among the common races. They have widely varying tastes, morals, and customs in the many different lands where they have settled. When they settle, though, they stay: they build cities to last for the ages, and great kingdoms that can persist for long centuries. An individual human might have a relatively short life span, but a human nation or culture preserves traditions with origins far beyond the reach of any single humans memory.
elf	Elves are a magical people of otherworldly grace, living in the world but not entirely part of it. They live in places of ethereal beauty, in the midst of ancient forests or in silvery spires glittering with faerie light, where soft music drifts through the air and gentle fragrances waft on the breeze. Elves love nature and magic, art and artistry, music and poetry, and the good things of the world.
dwarf	Bold and hardy, dwarves are known as skilled warriors, miners, and workers of stone and metal. Though they stand well under 5 feet tall, dwarves are so broad and compact that they can weigh as much as a human standing nearly two feet taller. Their courage and endurance are also easily a match for any of the larger folk.
dragonborn	Dragonborn look very much like dragons standing erect in humanoid form, though they lack wings or a tail. The first dragonborn had scales of vibrant hues matching the colors of their dragon kin, but generations of interbreeding have created a more uniform appearance. Their small, fine scales are usually brass or bronze in color, sometimes ranging to scarlet, rust, gold, or copper-green. They are tall and strongly built, often standing close to 6½ feet tall and weighing 300 pounds or more. Their hands and feet are strong, talonlike claws with three fingers and a thumb on each hand.
gnome	A gnomes energy and enthusiasm for living shines through every inch of his or her tiny body. Gnomes average slightly over 3 feet tall and weigh 40 to 45 pounds. Their tan or brown faces are usually adorned with broad smiles (beneath their prodigious noses), and their bright eyes shine with excitement. Their fair hair has a tendency to stick out in every direction, as if expressing the gnomes insatiable interest in everything around.
\.


--
-- TOC entry 3109 (class 0 OID 17389)
-- Dependencies: 201
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 209
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.areas_id_seq', 1, false);


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 207
-- Name: encounters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.encounters_id_seq', 1, false);


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 212
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 1, false);


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 205
-- Name: mobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mobs_id_seq', 1, false);


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 200
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 2959 (class 2606 OID 17558)
-- Name: abilities abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (name);


--
-- TOC entry 2963 (class 2606 OID 17769)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 2944 (class 2606 OID 17482)
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- TOC entry 2946 (class 2606 OID 17484)
-- Name: areas areas_zone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_zone_key UNIQUE (zone);


--
-- TOC entry 2956 (class 2606 OID 17540)
-- Name: character_inventories character_inventories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_inventories
    ADD CONSTRAINT character_inventories_pkey PRIMARY KEY (character_name, item_id);


--
-- TOC entry 2938 (class 2606 OID 17427)
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (name);


--
-- TOC entry 2961 (class 2606 OID 17566)
-- Name: class_abilities class_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_abilities
    ADD CONSTRAINT class_abilities_pkey PRIMARY KEY (ability_name, class_name);


--
-- TOC entry 2932 (class 2606 OID 17409)
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (name);


--
-- TOC entry 2942 (class 2606 OID 17471)
-- Name: encounters encounters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encounters
    ADD CONSTRAINT encounters_pkey PRIMARY KEY (id);


--
-- TOC entry 2948 (class 2606 OID 17494)
-- Name: enemies_in_encounter enemies_in_encounter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enemies_in_encounter
    ADD CONSTRAINT enemies_in_encounter_pkey PRIMARY KEY (encounter_id, mob_id);


--
-- TOC entry 2950 (class 2606 OID 17517)
-- Name: items items_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_name_key UNIQUE (name);


--
-- TOC entry 2952 (class 2606 OID 17515)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 2954 (class 2606 OID 17522)
-- Name: loot_from_encounter loot_from_encounter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_from_encounter
    ADD CONSTRAINT loot_from_encounter_pkey PRIMARY KEY (encounter_id, loot_id);


--
-- TOC entry 2940 (class 2606 OID 17453)
-- Name: mobs mobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobs
    ADD CONSTRAINT mobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2934 (class 2606 OID 17419)
-- Name: races races_description_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_description_key UNIQUE (description);


--
-- TOC entry 2936 (class 2606 OID 17417)
-- Name: races races_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_pkey PRIMARY KEY (name);


--
-- TOC entry 2926 (class 2606 OID 17401)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2928 (class 2606 OID 17397)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2930 (class 2606 OID 17399)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 2957 (class 1259 OID 17806)
-- Name: abilities_by_level_btree_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX abilities_by_level_btree_index ON public.abilities USING btree (level);


--
-- TOC entry 2974 (class 2606 OID 17541)
-- Name: character_inventories fk_character_inventories_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_inventories
    ADD CONSTRAINT fk_character_inventories_characters FOREIGN KEY (character_name) REFERENCES public.characters(name);


--
-- TOC entry 2975 (class 2606 OID 17546)
-- Name: character_inventories fk_character_inventories_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_inventories
    ADD CONSTRAINT fk_character_inventories_items FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 2966 (class 2606 OID 17438)
-- Name: characters fk_characters_classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT fk_characters_classes FOREIGN KEY (class) REFERENCES public.classes(name);


--
-- TOC entry 2965 (class 2606 OID 17433)
-- Name: characters fk_characters_races; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT fk_characters_races FOREIGN KEY (race) REFERENCES public.races(name);


--
-- TOC entry 2964 (class 2606 OID 17428)
-- Name: characters fk_characters_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT fk_characters_users FOREIGN KEY (played_by) REFERENCES public.users(id);


--
-- TOC entry 2977 (class 2606 OID 17572)
-- Name: class_abilities fk_class_abilities_abilities; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_abilities
    ADD CONSTRAINT fk_class_abilities_abilities FOREIGN KEY (ability_name) REFERENCES public.abilities(name);


--
-- TOC entry 2976 (class 2606 OID 17567)
-- Name: class_abilities fk_class_abilities_classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_abilities
    ADD CONSTRAINT fk_class_abilities_classes FOREIGN KEY (class_name) REFERENCES public.classes(name);


--
-- TOC entry 2969 (class 2606 OID 17485)
-- Name: encounters fk_encounters_areas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encounters
    ADD CONSTRAINT fk_encounters_areas FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- TOC entry 2971 (class 2606 OID 17500)
-- Name: enemies_in_encounter fk_enemies_in_encounter_encounters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enemies_in_encounter
    ADD CONSTRAINT fk_enemies_in_encounter_encounters FOREIGN KEY (encounter_id) REFERENCES public.encounters(id);


--
-- TOC entry 2970 (class 2606 OID 17495)
-- Name: enemies_in_encounter fk_enemies_in_encounter_mobs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enemies_in_encounter
    ADD CONSTRAINT fk_enemies_in_encounter_mobs FOREIGN KEY (mob_id) REFERENCES public.mobs(id);


--
-- TOC entry 2973 (class 2606 OID 17528)
-- Name: loot_from_encounter fk_loot_from_encounter_encounters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_from_encounter
    ADD CONSTRAINT fk_loot_from_encounter_encounters FOREIGN KEY (encounter_id) REFERENCES public.encounters(id);


--
-- TOC entry 2972 (class 2606 OID 17523)
-- Name: loot_from_encounter fk_loot_from_encounter_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_from_encounter
    ADD CONSTRAINT fk_loot_from_encounter_items FOREIGN KEY (loot_id) REFERENCES public.items(id);


--
-- TOC entry 2968 (class 2606 OID 17459)
-- Name: mobs fk_mobs_classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobs
    ADD CONSTRAINT fk_mobs_classes FOREIGN KEY (class) REFERENCES public.classes(name);


--
-- TOC entry 2967 (class 2606 OID 17454)
-- Name: mobs fk_mobs_races; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobs
    ADD CONSTRAINT fk_mobs_races FOREIGN KEY (race) REFERENCES public.races(name);


-- Completed on 2021-11-21 18:52:05 UTC

--
-- PostgreSQL database dump complete
--

