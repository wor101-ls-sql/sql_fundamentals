--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

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
-- Name: devices; Type: TABLE; Schema: public; Owner: wor101
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.devices OWNER TO wor101;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: wor101
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO wor101;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wor101
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: wor101
--

CREATE TABLE public.parts (
    id integer NOT NULL,
    device_id integer,
    part_number integer NOT NULL
);


ALTER TABLE public.parts OWNER TO wor101;

--
-- Name: parts_id_seq; Type: SEQUENCE; Schema: public; Owner: wor101
--

CREATE SEQUENCE public.parts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parts_id_seq OWNER TO wor101;

--
-- Name: parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wor101
--

ALTER SEQUENCE public.parts_id_seq OWNED BY public.parts.id;


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: parts id; Type: DEFAULT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.parts ALTER COLUMN id SET DEFAULT nextval('public.parts_id_seq'::regclass);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: wor101
--

INSERT INTO public.devices VALUES (2, 'Gyroscope', '2021-06-29 15:05:12.192494');
INSERT INTO public.devices VALUES (3, 'Magnetometer', '2021-06-29 15:24:04.592803');


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: wor101
--

INSERT INTO public.parts VALUES (4, 2, 371);
INSERT INTO public.parts VALUES (5, 2, 372);
INSERT INTO public.parts VALUES (6, 2, 373);
INSERT INTO public.parts VALUES (10, NULL, 1001);
INSERT INTO public.parts VALUES (11, NULL, 1002);
INSERT INTO public.parts VALUES (12, NULL, 1003);
INSERT INTO public.parts VALUES (13, 3, 42);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wor101
--

SELECT pg_catalog.setval('public.devices_id_seq', 3, true);


--
-- Name: parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wor101
--

SELECT pg_catalog.setval('public.parts_id_seq', 13, true);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: parts parts_part_number_key; Type: CONSTRAINT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_part_number_key UNIQUE (part_number);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (id);


--
-- Name: parts parts_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(id);


--
-- PostgreSQL database dump complete
--

