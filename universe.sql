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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    num_of_stars integer NOT NULL,
    diameter_kpc numeric(6,2) NOT NULL,
    spiral boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    radius_km integer NOT NULL,
    habitable boolean NOT NULL,
    has_moons boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.station (
    station_id integer NOT NULL,
    name character varying(100) NOT NULL,
    capacity integer NOT NULL,
    operational boolean NOT NULL,
    orbiting_planet character varying(100)
);


ALTER TABLE public.station OWNER TO freecodecamp;

--
-- Name: space_station_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_station_id_seq OWNED BY public.station.station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_solar numeric(5,2) NOT NULL,
    is_main_sequence boolean NOT NULL,
    habitable_zone boolean NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: station station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station ALTER COLUMN station_id SET DEFAULT nextval('public.space_station_station_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000000, 52.85, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000, 220.12, true, 'Largest in the local group');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 400000000, 60.12, true, 'Closest to Andromeda');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 300000000, 14.50, false, 'Irregular galaxy near Milky Way');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 890000000, 49.21, false, 'Edge-on spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Whirpool', 10000000, 60.00, true, 'Galaxy with active nucleus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, false, false);
INSERT INTO public.moon VALUES (4, 'Ganymede', 3, 2634, true, true);
INSERT INTO public.moon VALUES (5, 'Callisto', 3, 2410, true, false);
INSERT INTO public.moon VALUES (6, 'Europa', 3, 1560, true, true);
INSERT INTO public.moon VALUES (7, 'Titan', 11, 2575, true, true);
INSERT INTO public.moon VALUES (8, 'Triton', 7, 1353, true, true);
INSERT INTO public.moon VALUES (9, 'Oberon', 7, 761, true, false);
INSERT INTO public.moon VALUES (10, 'Rhea', 11, 764, true, false);
INSERT INTO public.moon VALUES (11, 'Lapetus', 11, 734, true, false);
INSERT INTO public.moon VALUES (12, 'Dione', 11, 561, true, false);
INSERT INTO public.moon VALUES (13, 'Tethys', 11, 531, true, false);
INSERT INTO public.moon VALUES (14, 'Mimas', 11, 396, true, false);
INSERT INTO public.moon VALUES (15, 'Enceladus', 11, 504, true, true);
INSERT INTO public.moon VALUES (16, 'Miranda', 9, 471, true, false);
INSERT INTO public.moon VALUES (17, 'Umbriel', 9, 584, true, false);
INSERT INTO public.moon VALUES (18, 'Ariel', 9, 579, true, false);
INSERT INTO public.moon VALUES (19, 'Charon', 7, 606, true, false);
INSERT INTO public.moon VALUES (20, 'Io', 3, 1821, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, false, true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 69911, false, true);
INSERT INTO public.planet VALUES (4, 'Proxima b', 2, 7160, true, false);
INSERT INTO public.planet VALUES (5, 'Alpha Cen Bb', 5, 7680, false, false);
INSERT INTO public.planet VALUES (6, 'Vega b', 6, 1400, false, true);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 24622, false, true);
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 6, 2439, true, false);
INSERT INTO public.planet VALUES (9, 'GJ 1214b', 6, 2439, true, false);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 6, 5271, true, false);
INSERT INTO public.planet VALUES (11, 'Saturn', 1, 58232, false, true);
INSERT INTO public.planet VALUES (12, 'Venus', 1, 6052, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, true, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 0.12, true, false);
INSERT INTO public.star VALUES (3, 'Betelgueuse', 1, 10.50, false, false);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 2.02, true, true);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 2, 1.10, true, true);
INSERT INTO public.star VALUES (6, 'Vega', 3, 2.10, true, true);


--
-- Data for Name: station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.station VALUES (1, 'International Space Station', 10, true, 'Earth');
INSERT INTO public.station VALUES (2, 'Tiangong', 6, true, 'Earth');
INSERT INTO public.station VALUES (3, 'Skylab', 3, false, 'Earth');
INSERT INTO public.station VALUES (4, 'Mir', 6, false, 'Earth');
INSERT INTO public.station VALUES (5, 'Lunar Gateway', 4, true, 'Moon');
INSERT INTO public.station VALUES (6, 'SpaceX Starship', 100, true, 'Mars');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: space_station_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_station_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (station_id);


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
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


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

