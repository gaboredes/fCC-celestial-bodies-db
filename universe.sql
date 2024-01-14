--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_in_light_years integer NOT NULL,
    discovered date,
    diameter_in_light_years integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean,
    diameter_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer NOT NULL,
    has_life boolean,
    description text
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text,
    diameter_in_km numeric
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 5, 'Vesta', 'One of the largest asteroids in the asteroid belt, an irregular-shaped protoplanet.');
INSERT INTO public.asteroid VALUES (2, 5, 'Pallas', 'One of the largest asteroids in the asteroid belt, a B-type asteroid.');
INSERT INTO public.asteroid VALUES (3, 5, 'Juno', 'Large main-belt asteroid and the third to be discovered.');
INSERT INTO public.asteroid VALUES (4, 5, 'Eros', 'Near-Earth asteroid and the first discovered and second-largest S-type asteroid.');
INSERT INTO public.asteroid VALUES (5, 5, 'Ida', 'Main-belt asteroid and the first asteroid discovered to have a moon (Dactyl).');
INSERT INTO public.asteroid VALUES (6, 5, 'Mathilde', 'Main-belt C-type asteroid and the first asteroid visited by a spacecraft (NEAR Shoemaker).');
INSERT INTO public.asteroid VALUES (7, 5, 'Gaspra', 'Main-belt S-type asteroid and the first asteroid visited by a spacecraft (Galileo).');
INSERT INTO public.asteroid VALUES (8, 5, 'Hektor', 'Trojan asteroid, the largest Jupiter trojan, and a binary system.');
INSERT INTO public.asteroid VALUES (9, 5, 'Kleopatra', 'Main-belt M-type asteroid and a highly elongated, dog-bone-shaped object.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2537000, '1923-01-01', 220000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 100000, NULL, 100000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, '1774-12-31', 60000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 55000000, '1781-03-13', 120000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 23000000, '1773-02-14', 33000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 29000000, '1781-05-22', 50000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, false, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 12);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, false, 5268);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, false, 4800);
INSERT INTO public.moon VALUES (6, 'Io', 5, false, 3637);
INSERT INTO public.moon VALUES (7, 'Europa', 5, false, 3121);
INSERT INTO public.moon VALUES (8, 'Titan', 6, false, 5150);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, false, 504);
INSERT INTO public.moon VALUES (10, 'Triton', 8, false, 2707);
INSERT INTO public.moon VALUES (11, 'Charon', 9, false, 1207);
INSERT INTO public.moon VALUES (12, 'Phoebe', 6, false, 213);
INSERT INTO public.moon VALUES (13, 'Mimas', 6, false, 396);
INSERT INTO public.moon VALUES (14, 'Dione', 6, false, 1120);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, false, 1527);
INSERT INTO public.moon VALUES (16, 'Titania', 7, false, 1578);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, false, 1523);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, false, 472);
INSERT INTO public.moon VALUES (19, 'Iapetus', 6, false, 1469);
INSERT INTO public.moon VALUES (20, 'Larissa', 8, false, 194);
INSERT INTO public.moon VALUES (21, 'Tethys', 6, false, 1062);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 5, false, 'Innermost planet of the Solar System.');
INSERT INTO public.planet VALUES (2, 'Venus', 5, false, 'Second planet from the Sun, known for its thick atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 5, true, 'Home to a diverse range of life, including humans.');
INSERT INTO public.planet VALUES (4, 'Mars', 5, false, 'The Red Planet, with potential signs of past water.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 5, false, 'Largest planet, a gas giant with a strong magnetic field.');
INSERT INTO public.planet VALUES (6, 'Saturn', 5, false, 'Known for its stunning ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 5, false, 'Ice giant with a unique sideways rotation axis.');
INSERT INTO public.planet VALUES (8, 'Neptune', 5, false, 'The outermost gas giant in the Solar System.');
INSERT INTO public.planet VALUES (9, 'Pluto', 5, false, 'Dwarf planet in the Kuiper Belt.');
INSERT INTO public.planet VALUES (10, 'Alpha Centauri b', 1, false, 'Exoplanet orbiting Alpha Centauri A.');
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 3, false, 'Exoplanet in the habitable zone of Proxima Centauri.');
INSERT INTO public.planet VALUES (12, 'Trappist-1e', 2, false, 'Exoplanet in the habitable zone of the TRAPPIST-1 system.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 2, 'Main-sequence star in the Alpha Centauri binary system.', 1873000);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 'Red supergiant in the Andromeda Galaxy.', 1185760000);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 2, 'Red dwarf, closest known star to the Sun in the Milky Way.', 198500);
INSERT INTO public.star VALUES (4, 'Polaris', 3, 'North Star in the Triangulum Galaxy.', 642000);
INSERT INTO public.star VALUES (5, 'Sol (Sun)', 2, 'Main-sequence G-type star, center of the Solar System.', 1391000);
INSERT INTO public.star VALUES (6, 'Whirlpool Star', 5, 'Star within the Whirlpool Galaxy.', 871000);
INSERT INTO public.star VALUES (7, 'Sombrero Star', 6, 'Star within the Sombrero Galaxy.', 1344000);


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroid asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: planet unique2_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique2_name UNIQUE (name);


--
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: asteroid fk_a_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT fk_a_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

