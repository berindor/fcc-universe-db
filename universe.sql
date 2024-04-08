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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    period_in_years numeric(6,2),
    orbital_e numeric(5,4),
    galaxy_id integer DEFAULT 1
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_in_mly numeric(7,2),
    constellation character varying(50),
    notes_from_wiki text
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
    name character varying(50) NOT NULL,
    planet_id integer,
    orbital_period_in_days numeric,
    mean_radius_in_km numeric
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
    name character varying(50) NOT NULL,
    number_of_moons integer,
    has_ring boolean DEFAULT false,
    star_id integer,
    orbital_period_in_days numeric
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
    name character varying(50) NOT NULL,
    number_of_planets integer,
    binary_star boolean DEFAULT false,
    galaxy_id integer DEFAULT 1,
    constellation character varying(50)
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 75.91, 0.9679, 1);
INSERT INTO public.comet VALUES (2, 'Encke', 3.30, 0.8483, 1);
INSERT INTO public.comet VALUES (3, 'Biela', 6.65, 0.7513, 1);
INSERT INTO public.comet VALUES (4, 'Faye', 7.40, 0.5845, 1);
INSERT INTO public.comet VALUES (5, 'Brorsen', 5.46, 0.8098, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky way', 1, 0.00, 'Sagittarius (centre)', 'This is the galaxy containing our solar system, and therefore Earth.');
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 2, 0.16, 'Dorado/Mensa', 'Visible only from the southern hemisphere. It is the brightest patch of nebulosity in the sky.');
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 3, 0.20, 'Tucana', 'Visible only from the southern hemisphere.');
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 4, 2.50, 'Andromeda', NULL);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 5, 2.90, 'Triangulum', NULL);
INSERT INTO public.galaxy VALUES ('Centaurus A', 6, 13.70, 'Centaurus', 'It has been spotted by the naked eye by Stephen James O''Meara.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 27.32, 1738);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.319, 11.267);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1.262, 6.2);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1.769, 1821.6);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.551, 1560.8);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7.155, 2634);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 16.69, 2410);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 0.498, 83.5);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 250.56, 69.8);
INSERT INTO public.moon VALUES (10, 'Elara', 5, 259.64, 43);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 0.942, 198);
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, 1.37, 252);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1.888, 533);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 2.737, 561);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 4.518, 763);
INSERT INTO public.moon VALUES (16, 'Titan', 6, 15.95, 2574.7);
INSERT INTO public.moon VALUES (17, 'Hyperion', 6, 21.28, 135);
INSERT INTO public.moon VALUES (18, 'Iapetus', 6, 79.33, 735);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 2.52, 579);
INSERT INTO public.moon VALUES (20, 'Umbriel', 7, 4.144, 585);
INSERT INTO public.moon VALUES (21, 'Titania', 7, 8.706, 789);
INSERT INTO public.moon VALUES (22, 'Oberon', 7, 13.46, 761);
INSERT INTO public.moon VALUES (23, 'Miranda', 7, 1.413, 236);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, false, 1, 365.25);
INSERT INTO public.planet VALUES (2, 'Mercury', 0, false, 1, 88);
INSERT INTO public.planet VALUES (3, 'Venus', 0, false, 1, 224.7);
INSERT INTO public.planet VALUES (4, 'Mars', 2, false, 1, 687);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, false, 1, 4331);
INSERT INTO public.planet VALUES (7, 'Uranus', 28, false, 1, 30589);
INSERT INTO public.planet VALUES (8, 'Neptunus', 16, false, 1, 59800);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, true, 1, 10747);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri d', NULL, false, 2, 5.122);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', NULL, false, 2, 11.19);
INSERT INTO public.planet VALUES (11, 'Lalande b', NULL, false, 7, 12.94);
INSERT INTO public.planet VALUES (12, 'Lalande c', NULL, false, 7, 2946);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, false, 1, NULL);
INSERT INTO public.star VALUES (3, 'Barnard''s Star', NULL, false, 1, 'Ophiuchus');
INSERT INTO public.star VALUES (4, 'Luhman 16', NULL, true, 1, 'Vela');
INSERT INTO public.star VALUES (5, 'WISE 0855-0714', NULL, false, 1, 'Hydra');
INSERT INTO public.star VALUES (6, 'Wolf 359', NULL, false, 1, 'Leo');
INSERT INTO public.star VALUES (2, 'Alpha Centauri', NULL, true, 1, 'Centaurus');
INSERT INTO public.star VALUES (7, 'Lalande', NULL, false, 1, 'Ursa Major');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

