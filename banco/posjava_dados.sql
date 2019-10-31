--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2019-10-31 00:14:20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2134 (class 0 OID 16424)
-- Dependencies: 184
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO produto VALUES (5, 'Areia Lavada - Fina', 10000, 'M3', 151.58000000000001);
INSERT INTO produto VALUES (9, 'Cimento Tocantins 2', 10, 'Saco - 50KG', 10);
INSERT INTO produto VALUES (8, 'Cimento Tocantins 3', 10, 'Saco - 50KG', 10);
INSERT INTO produto VALUES (10, '122', 122, '122', 151.50999999999999);
INSERT INTO produto VALUES (11, 'Cimento Tocantins', 10, '123', 18.510000000000002);


--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 183
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produto_id_seq', 11, true);


--
-- TOC entry 2136 (class 0 OID 16456)
-- Dependencies: 186
-- Data for Name: tbltipocontato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbltipocontato VALUES (1, 'Celular');
INSERT INTO tbltipocontato VALUES (2, 'Fixo');
INSERT INTO tbltipocontato VALUES (3, 'Whatsapp');
INSERT INTO tbltipocontato VALUES (4, 'Skype');
INSERT INTO tbltipocontato VALUES (5, 'E-mail');


--
-- TOC entry 2132 (class 0 OID 16401)
-- Dependencies: 182
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "user" VALUES (80, 'Teste', 'teste', true, 'teste', '123', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "user" VALUES (81, 'teste1', 'teste', false, 'teste2', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "user" VALUES (82, '123', '123', true, '123', '123', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "user" VALUES (83, '122', '122', false, '122', '122', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "user" VALUES (84, '121', '121', false, '121', '121', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "user" VALUES (85, 'Anderson Guedes', '123', false, 'anderson.guedes', '123', '72321530', 'QS 409', 'Samambaia Norte (Samambaia)', 'Brasília', 'DF', '5300108');
INSERT INTO "user" VALUES (78, 'admin', 'admin', true, 'admin', '123', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2138 (class 0 OID 16465)
-- Dependencies: 188
-- Data for Name: tblcontato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblcontato VALUES (4, 5, 'anderson.guedes@gmail.com', 81);
INSERT INTO tblcontato VALUES (5, 2, '34595048', 78);
INSERT INTO tblcontato VALUES (6, 4, 'anderson.guedes.br', 85);
INSERT INTO tblcontato VALUES (7, 2, '61 34595048', 85);
INSERT INTO tblcontato VALUES (11, 5, 'email@.com', 84);
INSERT INTO tblcontato VALUES (12, 2, '34444', 84);
INSERT INTO tblcontato VALUES (3, 3, '61991261177', 85);


--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 187
-- Name: tblcontato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblcontato_id_seq', 12, true);


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 185
-- Name: tbltipocontato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbltipocontato_id_seq', 5, true);


--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 181
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 85, true);


-- Completed on 2019-10-31 00:14:21

--
-- PostgreSQL database dump complete
--

