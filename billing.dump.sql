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
-- Name: customers; Type: TABLE; Schema: public; Owner: wor101
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name text NOT NULL,
    payment_token character(8),
    CONSTRAINT customers_payment_token_check CHECK ((payment_token ~ '^[A-Z]{8}$'::text))
);


ALTER TABLE public.customers OWNER TO wor101;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: wor101
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO wor101;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wor101
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: customers_services; Type: TABLE; Schema: public; Owner: wor101
--

CREATE TABLE public.customers_services (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE public.customers_services OWNER TO wor101;

--
-- Name: customers_services_id_seq; Type: SEQUENCE; Schema: public; Owner: wor101
--

CREATE SEQUENCE public.customers_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_services_id_seq OWNER TO wor101;

--
-- Name: customers_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wor101
--

ALTER SEQUENCE public.customers_services_id_seq OWNED BY public.customers_services.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: wor101
--

CREATE TABLE public.services (
    id integer NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    CONSTRAINT services_price_check CHECK ((price >= 0.00))
);


ALTER TABLE public.services OWNER TO wor101;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: wor101
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO wor101;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wor101
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: customers_services id; Type: DEFAULT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.customers_services ALTER COLUMN id SET DEFAULT nextval('public.customers_services_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: wor101
--

INSERT INTO public.customers VALUES (3, 'Pat Johnson', 'XHGOAHEQ');
INSERT INTO public.customers VALUES (6, 'Nancy Monreal', 'JKWQPJKL');
INSERT INTO public.customers VALUES (7, 'Lynn Blake', 'KLZXWEEE');
INSERT INTO public.customers VALUES (9, 'Scott Lakso', 'UUEAPQPS');
INSERT INTO public.customers VALUES (10, 'Jim Pornot', 'XKJEYAZA');
INSERT INTO public.customers VALUES (11, 'John Doe', 'EYODHLCN');


--
-- Data for Name: customers_services; Type: TABLE DATA; Schema: public; Owner: wor101
--

INSERT INTO public.customers_services VALUES (1, 3, 1);
INSERT INTO public.customers_services VALUES (2, 3, 2);
INSERT INTO public.customers_services VALUES (3, 3, 3);
INSERT INTO public.customers_services VALUES (4, 7, 1);
INSERT INTO public.customers_services VALUES (5, 7, 2);
INSERT INTO public.customers_services VALUES (6, 7, 3);
INSERT INTO public.customers_services VALUES (7, 7, 4);
INSERT INTO public.customers_services VALUES (8, 7, 5);
INSERT INTO public.customers_services VALUES (11, 9, 1);
INSERT INTO public.customers_services VALUES (12, 9, 2);
INSERT INTO public.customers_services VALUES (13, 9, 6);
INSERT INTO public.customers_services VALUES (14, 10, 1);
INSERT INTO public.customers_services VALUES (15, 10, 6);
INSERT INTO public.customers_services VALUES (17, 11, 1);
INSERT INTO public.customers_services VALUES (18, 11, 2);
INSERT INTO public.customers_services VALUES (19, 11, 3);


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: wor101
--

INSERT INTO public.services VALUES (1, 'Unix Hosting', 5.95);
INSERT INTO public.services VALUES (2, 'DNS', 4.95);
INSERT INTO public.services VALUES (3, 'Whois Registration', 1.95);
INSERT INTO public.services VALUES (4, 'High Bandwidth', 15.00);
INSERT INTO public.services VALUES (5, 'Business Support', 250.00);
INSERT INTO public.services VALUES (6, 'Dedcicated Hosting', 50.00);
INSERT INTO public.services VALUES (8, 'One-to-one Training', 999.00);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wor101
--

SELECT pg_catalog.setval('public.customers_id_seq', 11, true);


--
-- Name: customers_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wor101
--

SELECT pg_catalog.setval('public.customers_services_id_seq', 19, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wor101
--

SELECT pg_catalog.setval('public.services_id_seq', 8, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: customers_services customers_services_customer_id_services_id_key; Type: CONSTRAINT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.customers_services
    ADD CONSTRAINT customers_services_customer_id_services_id_key UNIQUE (customer_id, service_id);


--
-- Name: customers_services customers_services_pkey; Type: CONSTRAINT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.customers_services
    ADD CONSTRAINT customers_services_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: customers_services customers_services_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.customers_services
    ADD CONSTRAINT customers_services_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: customers_services customers_services_services_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wor101
--

ALTER TABLE ONLY public.customers_services
    ADD CONSTRAINT customers_services_services_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- PostgreSQL database dump complete
--

