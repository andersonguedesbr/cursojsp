--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2019-10-31 00:03:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE posjava;
--
-- TOC entry 2143 (class 1262 OID 16393)
-- Name: posjava; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE posjava WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE posjava OWNER TO postgres;

\connect posjava

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 16424)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto (
    id integer NOT NULL,
    descricao character varying(255) NOT NULL,
    quantidade integer NOT NULL,
    unidade character varying NOT NULL,
    valor double precision NOT NULL
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16422)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produto_id_seq OWNER TO postgres;

--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 183
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_id_seq OWNED BY produto.id;


--
-- TOC entry 188 (class 1259 OID 16465)
-- Name: tblcontato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tblcontato (
    id integer NOT NULL,
    idtipocontato integer NOT NULL,
    contato character varying(255) NOT NULL,
    idusuario integer NOT NULL
);


ALTER TABLE tblcontato OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16463)
-- Name: tblcontato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblcontato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblcontato_id_seq OWNER TO postgres;

--
-- TOC entry 2148 (class 0 OID 0)
-- Dependencies: 187
-- Name: tblcontato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblcontato_id_seq OWNED BY tblcontato.id;


--
-- TOC entry 186 (class 1259 OID 16456)
-- Name: tbltipocontato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tbltipocontato (
    id integer NOT NULL,
    tipocontato character varying(255) NOT NULL
);


ALTER TABLE tbltipocontato OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16454)
-- Name: tbltipocontato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbltipocontato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbltipocontato_id_seq OWNER TO postgres;

--
-- TOC entry 2149 (class 0 OID 0)
-- Dependencies: 185
-- Name: tbltipocontato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbltipocontato_id_seq OWNED BY tbltipocontato.id;


--
-- TOC entry 182 (class 1259 OID 16401)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    senha character varying(50) NOT NULL,
    situacao boolean NOT NULL,
    login character varying(50),
    telefone character varying(20),
    cep character varying(10),
    logradouro character varying(255),
    bairro character varying(255),
    municipio character varying(255),
    uf character varying(255),
    ibge character varying(50)
);


ALTER TABLE "user" OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16399)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO postgres;

--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 181
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 2002 (class 2604 OID 16427)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN id SET DEFAULT nextval('produto_id_seq'::regclass);


--
-- TOC entry 2004 (class 2604 OID 16468)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblcontato ALTER COLUMN id SET DEFAULT nextval('tblcontato_id_seq'::regclass);


--
-- TOC entry 2003 (class 2604 OID 16459)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbltipocontato ALTER COLUMN id SET DEFAULT nextval('tbltipocontato_id_seq'::regclass);


--
-- TOC entry 2001 (class 2604 OID 16404)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 2134 (class 0 OID 16424)
-- Dependencies: 184
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO produto (id, descricao, quantidade, unidade, valor) VALUES (5, 'Areia Lavada - Fina', 10000, 'M3', 151.58000000000001);
INSERT INTO produto (id, descricao, quantidade, unidade, valor) VALUES (9, 'Cimento Tocantins 2', 10, 'Saco - 50KG', 10);
INSERT INTO produto (id, descricao, quantidade, unidade, valor) VALUES (8, 'Cimento Tocantins 3', 10, 'Saco - 50KG', 10);
INSERT INTO produto (id, descricao, quantidade, unidade, valor) VALUES (10, '122', 122, '122', 151.50999999999999);
INSERT INTO produto (id, descricao, quantidade, unidade, valor) VALUES (11, 'Cimento Tocantins', 10, '123', 18.510000000000002);


--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 183
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produto_id_seq', 11, true);


--
-- TOC entry 2138 (class 0 OID 16465)
-- Dependencies: 188
-- Data for Name: tblcontato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblcontato (id, idtipocontato, contato, idusuario) VALUES (4, 5, 'anderson.guedes@gmail.com', 81);
INSERT INTO tblcontato (id, idtipocontato, contato, idusuario) VALUES (5, 2, '34595048', 78);
INSERT INTO tblcontato (id, idtipocontato, contato, idusuario) VALUES (6, 4, 'anderson.guedes.br', 85);
INSERT INTO tblcontato (id, idtipocontato, contato, idusuario) VALUES (7, 2, '61 34595048', 85);
INSERT INTO tblcontato (id, idtipocontato, contato, idusuario) VALUES (11, 5, 'email@.com', 84);
INSERT INTO tblcontato (id, idtipocontato, contato, idusuario) VALUES (12, 2, '34444', 84);
INSERT INTO tblcontato (id, idtipocontato, contato, idusuario) VALUES (3, 3, '61991261177', 85);


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 187
-- Name: tblcontato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblcontato_id_seq', 12, true);


--
-- TOC entry 2136 (class 0 OID 16456)
-- Dependencies: 186
-- Data for Name: tbltipocontato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbltipocontato (id, tipocontato) VALUES (1, 'Celular');
INSERT INTO tbltipocontato (id, tipocontato) VALUES (2, 'Fixo');
INSERT INTO tbltipocontato (id, tipocontato) VALUES (3, 'Whatsapp');
INSERT INTO tbltipocontato (id, tipocontato) VALUES (4, 'Skype');
INSERT INTO tbltipocontato (id, tipocontato) VALUES (5, 'E-mail');


--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 185
-- Name: tbltipocontato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbltipocontato_id_seq', 5, true);


--
-- TOC entry 2132 (class 0 OID 16401)
-- Dependencies: 182
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "user" (id, nome, senha, situacao, login, telefone, cep, logradouro, bairro, municipio, uf, ibge) VALUES (80, 'Teste', 'teste', true, 'teste', '123', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "user" (id, nome, senha, situacao, login, telefone, cep, logradouro, bairro, municipio, uf, ibge) VALUES (81, 'teste1', 'teste', false, 'teste2', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "user" (id, nome, senha, situacao, login, telefone, cep, logradouro, bairro, municipio, uf, ibge) VALUES (82, '123', '123', true, '123', '123', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "user" (id, nome, senha, situacao, login, telefone, cep, logradouro, bairro, municipio, uf, ibge) VALUES (83, '122', '122', false, '122', '122', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "user" (id, nome, senha, situacao, login, telefone, cep, logradouro, bairro, municipio, uf, ibge) VALUES (84, '121', '121', false, '121', '121', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "user" (id, nome, senha, situacao, login, telefone, cep, logradouro, bairro, municipio, uf, ibge) VALUES (85, 'Anderson Guedes', '123', false, 'anderson.guedes', '123', '72321530', 'QS 409', 'Samambaia Norte (Samambaia)', 'Brasília', 'DF', '5300108');
INSERT INTO "user" (id, nome, senha, situacao, login, telefone, cep, logradouro, bairro, municipio, uf, ibge) VALUES (78, 'admin', 'admin', true, 'admin', '123', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 181
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 85, true);


--
-- TOC entry 2010 (class 2606 OID 16432)
-- Name: pk_produto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT pk_produto PRIMARY KEY (id);


--
-- TOC entry 2014 (class 2606 OID 16470)
-- Name: pk_tblcontato; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblcontato
    ADD CONSTRAINT pk_tblcontato PRIMARY KEY (id);


--
-- TOC entry 2012 (class 2606 OID 16461)
-- Name: pk_tipcontato; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbltipocontato
    ADD CONSTRAINT pk_tipcontato PRIMARY KEY (id);


--
-- TOC entry 2006 (class 2606 OID 16406)
-- Name: pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT pk_user PRIMARY KEY (id);


--
-- TOC entry 2008 (class 2606 OID 16408)
-- Name: user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_id_key UNIQUE (id);


--
-- TOC entry 2015 (class 2606 OID 16476)
-- Name: fk_tblcontato_tbltipocontato; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblcontato
    ADD CONSTRAINT fk_tblcontato_tbltipocontato FOREIGN KEY (idtipocontato) REFERENCES tbltipocontato(id);


--
-- TOC entry 2016 (class 2606 OID 16481)
-- Name: fk_tblcontato_tbluser; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblcontato
    ADD CONSTRAINT fk_tblcontato_tbluser FOREIGN KEY (idusuario) REFERENCES "user"(id);


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-10-31 00:03:41

--
-- PostgreSQL database dump complete
--

