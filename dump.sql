--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-11-17 11:08:59

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

--
-- TOC entry 2951 (class 1262 OID 106496)
-- Name: mymangalist; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mymangalist WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


ALTER DATABASE mymangalist OWNER TO postgres;

\connect mymangalist

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

--
-- TOC entry 628 (class 1247 OID 114689)
-- Name: genre_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.genre_type AS ENUM (
    'shounen',
    'shoujo',
    'seinen',
    'josei',
    'ecchi'
);


ALTER TYPE public.genre_type OWNER TO postgres;

--
-- TOC entry 537 (class 1247 OID 106498)
-- Name: genre_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.genre_types AS ENUM (
    'shounen',
    'shoujo',
    'seinen',
    'josei',
    'ecchi'
);


ALTER TYPE public.genre_types OWNER TO postgres;

--
-- TOC entry 634 (class 1247 OID 114706)
-- Name: rating_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.rating_type AS ENUM (
    'empty',
    '0.0',
    '0.5',
    '1.0',
    '1.5',
    '2.0',
    '2.5',
    '3.0',
    '3.5',
    '4.0',
    '4.5',
    '5.0'
);


ALTER TYPE public.rating_type OWNER TO postgres;

--
-- TOC entry 631 (class 1247 OID 114700)
-- Name: status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_type AS ENUM (
    'unread',
    'read'
);


ALTER TYPE public.status_type OWNER TO postgres;

--
-- TOC entry 625 (class 1247 OID 106532)
-- Name: status_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_types AS ENUM (
    'unread',
    'reading',
    'read',
    'dropped'
);


ALTER TYPE public.status_types OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 114733)
-- Name: mangas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mangas (
    id integer NOT NULL,
    serie character varying(100) NOT NULL,
    author character varying(50) NOT NULL,
    genre public.genre_type NOT NULL,
    volume integer NOT NULL,
    status public.status_type DEFAULT 'unread'::public.status_type NOT NULL,
    image character varying(500),
    rating public.rating_type DEFAULT 'empty'::public.rating_type NOT NULL,
    avaliation character varying(500) DEFAULT 'empty'::character varying NOT NULL
);


ALTER TABLE public.mangas OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 114731)
-- Name: mangas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mangas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mangas_id_seq OWNER TO postgres;

--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 202
-- Name: mangas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mangas_id_seq OWNED BY public.mangas.id;


--
-- TOC entry 2812 (class 2604 OID 114736)
-- Name: mangas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mangas ALTER COLUMN id SET DEFAULT nextval('public.mangas_id_seq'::regclass);


--
-- TOC entry 2945 (class 0 OID 114733)
-- Dependencies: 203
-- Data for Name: mangas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mangas (id, serie, author, genre, volume, status, image, rating, avaliation) FROM stdin;
6	SPYxFAMILY	Tatsuya Endo	shounen	1	unread	https://m.media-amazon.com/images/I/71RPJe1eVCL.jpg	empty	empty
\.


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 202
-- Name: mangas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mangas_id_seq', 6, true);


--
-- TOC entry 2817 (class 2606 OID 114744)
-- Name: mangas mangas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mangas
    ADD CONSTRAINT mangas_pkey PRIMARY KEY (id);


-- Completed on 2022-11-17 11:08:59

--
-- PostgreSQL database dump complete
--

