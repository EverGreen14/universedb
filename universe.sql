--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: country; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.country (
    country_id integer NOT NULL,
    name character varying(30) NOT NULL,
    population integer
);


ALTER TABLE public.country OWNER TO freecodecamp;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.country_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_country_id_seq OWNER TO freecodecamp;

--
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.country_country_id_seq OWNED BY public.country.country_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    diameter_parsec integer NOT NULL,
    distance_parsec integer NOT NULL,
    "position" numeric NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    explored boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    diameter_parsec integer NOT NULL,
    distance_parsec integer NOT NULL,
    "position" numeric NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    explored boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_table_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_table_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_table_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_table_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_table_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    diameter_parsec integer NOT NULL,
    distance_parsec integer NOT NULL,
    "position" numeric NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    explored boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    diameter_parsec integer NOT NULL,
    distance_parsec integer NOT NULL,
    "position" numeric NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    explored boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: country country_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_country_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_table_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.country VALUES (1, 'US', 12000000);
INSERT INTO public.country VALUES (2, 'CANADA', 10000000);
INSERT INTO public.country VALUES (3, 'SPAIN', 10000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 30000, 0, 0, 'Milky Way', 'aaaaaa', true);
INSERT INTO public.galaxy VALUES (2, 67000, 770, 4244, 'Andromeda', 'aaaaaa', false);
INSERT INTO public.galaxy VALUES (3, 18000, 1000, 3350, 'Triangulum', 'aaaaaa', false);
INSERT INTO public.galaxy VALUES (4, 27000, 37000000, 55330, 'Bode', 'aaaaaa', false);
INSERT INTO public.galaxy VALUES (5, 27000, 37000000, 55330, 'Sombrero', 'aaaaaa', false);
INSERT INTO public.galaxy VALUES (6, 27000, 37000000, 55330, 'Whirlpool', 'aaaaaa', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 27000, 37000000, 55330, 'Moon', 'aaaaaa', true, 3);
INSERT INTO public.moon VALUES (2, 27000, 37000000, 55330, 'Phobos', 'aaaaaa', false, 3);
INSERT INTO public.moon VALUES (3, 27000, 37000000, 55330, 'Deimos', 'aaaaaa', false, 3);
INSERT INTO public.moon VALUES (4, 27000, 37000000, 55330, 'Io', 'aaaaaa', false, 4);
INSERT INTO public.moon VALUES (5, 27000, 37000000, 55330, 'Europa', 'aaaaaa', false, 4);
INSERT INTO public.moon VALUES (6, 27000, 37000000, 55330, 'Ganymede', 'aaaaaa', false, 4);
INSERT INTO public.moon VALUES (7, 27000, 37000000, 55330, 'Callisto', 'aaaaaa', false, 4);
INSERT INTO public.moon VALUES (8, 27000, 37000000, 55330, 'Mimas', 'aaaaaa', false, 5);
INSERT INTO public.moon VALUES (9, 27000, 37000000, 55330, 'Enceladus', 'aaaaaa', false, 5);
INSERT INTO public.moon VALUES (10, 27000, 37000000, 55330, 'Tethys', 'aaaaaa', false, 5);
INSERT INTO public.moon VALUES (11, 27000, 37000000, 55330, 'Dione', 'aaaaaa', false, 6);
INSERT INTO public.moon VALUES (12, 27000, 37000000, 55330, 'Rhea', 'aaaaaa', false, 6);
INSERT INTO public.moon VALUES (13, 27000, 37000000, 55330, 'Titan', 'aaaaaa', false, 6);
INSERT INTO public.moon VALUES (14, 27000, 37000000, 55330, 'Hyperion', 'aaaaaa', false, 6);
INSERT INTO public.moon VALUES (15, 27000, 37000000, 55330, 'Iapetus', 'aaaaaa', false, 7);
INSERT INTO public.moon VALUES (16, 27000, 37000000, 55330, 'Miranda', 'aaaaaa', false, 7);
INSERT INTO public.moon VALUES (17, 27000, 37000000, 55330, 'Ariel', 'aaaaaa', false, 8);
INSERT INTO public.moon VALUES (18, 27000, 37000000, 55330, 'Umbriel', 'aaaaaa', false, 9);
INSERT INTO public.moon VALUES (19, 27000, 37000000, 55330, 'Titania', 'aaaaaa', false, 10);
INSERT INTO public.moon VALUES (20, 27000, 37000000, 55330, 'Oberon', 'aaaaaa', false, 11);
INSERT INTO public.moon VALUES (21, 27000, 37000000, 55330, 'XD', 'aaaaaa', false, 12);
INSERT INTO public.moon VALUES (22, 27000, 37000000, 55330, 'LOOK', 'aaaaaa', false, 13);
INSERT INTO public.moon VALUES (23, 27000, 37000000, 55330, 'THAT MOON', 'aaaaaa', false, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 27000, 37000000, 55330, 'Earth', 'aaaaaa', false, 1);
INSERT INTO public.planet VALUES (4, 27000, 37000000, 55330, 'Mars', 'aaaaaa', false, 1);
INSERT INTO public.planet VALUES (5, 27000, 37000000, 55330, 'Mercury', 'aaaaaa', false, 2);
INSERT INTO public.planet VALUES (6, 27000, 37000000, 55330, 'Venus', 'aaaaaa', false, 2);
INSERT INTO public.planet VALUES (7, 27000, 37000000, 55330, 'Jupiter', 'aaaaaa', false, 3);
INSERT INTO public.planet VALUES (8, 27000, 37000000, 55330, 'Saturn', 'aaaaaa', false, 3);
INSERT INTO public.planet VALUES (9, 27000, 37000000, 55330, 'Uranus', 'aaaaaa', false, 4);
INSERT INTO public.planet VALUES (10, 27000, 37000000, 55330, 'Neptune', 'aaaaaa', false, 4);
INSERT INTO public.planet VALUES (11, 27000, 37000000, 55330, 'Pluto', 'aaaaaa', false, 5);
INSERT INTO public.planet VALUES (12, 27000, 37000000, 55330, 'Eris', 'aaaaaa', false, 5);
INSERT INTO public.planet VALUES (13, 27000, 37000000, 55330, 'Haumea', 'aaaaaa', false, 6);
INSERT INTO public.planet VALUES (14, 27000, 37000000, 55330, 'Makemake', 'aaaaaa', false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 27000, 37000000, 55330, 'Sirius', 'aaaaaa', false, 1);
INSERT INTO public.star VALUES (2, 27000, 37000000, 55330, 'Betelgeuse', 'aaaaaa', false, 2);
INSERT INTO public.star VALUES (3, 27000, 37000000, 55330, 'Rigel', 'aaaaaa', false, 3);
INSERT INTO public.star VALUES (4, 27000, 37000000, 55330, 'Alpha', 'aaaaaa', false, 4);
INSERT INTO public.star VALUES (5, 27000, 37000000, 55330, 'Antares', 'aaaaaa', false, 5);
INSERT INTO public.star VALUES (6, 27000, 37000000, 55330, 'Polaris', 'aaaaaa', false, 6);


--
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.country_country_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_table_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_table_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: country country_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_name_key UNIQUE (name);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

