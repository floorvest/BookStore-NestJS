--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg110+2)
-- Dumped by pg_dump version 16.1

-- Started on 2024-03-28 07:27:22 UTC

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
-- TOC entry 216 (class 1259 OID 20170)
-- Name: book_tags; Type: TABLE; Schema: public; Owner: pdamgisuser
--

CREATE TABLE public.book_tags (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.book_tags OWNER TO pdamgisuser;

--
-- TOC entry 215 (class 1259 OID 20169)
-- Name: book_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: pdamgisuser
--

CREATE SEQUENCE public.book_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.book_tags_id_seq OWNER TO pdamgisuser;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 215
-- Name: book_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdamgisuser
--

ALTER SEQUENCE public.book_tags_id_seq OWNED BY public.book_tags.id;


--
-- TOC entry 218 (class 1259 OID 20179)
-- Name: books; Type: TABLE; Schema: public; Owner: pdamgisuser
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title character varying NOT NULL,
    writer character varying NOT NULL,
    "coverImage" character varying NOT NULL,
    point integer NOT NULL
);


ALTER TABLE public.books OWNER TO pdamgisuser;

--
-- TOC entry 217 (class 1259 OID 20178)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: pdamgisuser
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_id_seq OWNER TO pdamgisuser;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 217
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdamgisuser
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 219 (class 1259 OID 20187)
-- Name: books_tags_book_tags; Type: TABLE; Schema: public; Owner: pdamgisuser
--

CREATE TABLE public.books_tags_book_tags (
    "booksId" integer NOT NULL,
    "bookTagsId" integer NOT NULL
);


ALTER TABLE public.books_tags_book_tags OWNER TO pdamgisuser;

--
-- TOC entry 223 (class 1259 OID 20215)
-- Name: orders; Type: TABLE; Schema: public; Owner: pdamgisuser
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    "orderId" character varying NOT NULL,
    "pointUsed" integer NOT NULL,
    "orderedAt" timestamp without time zone NOT NULL,
    "bookId" integer,
    "userId" integer
);


ALTER TABLE public.orders OWNER TO pdamgisuser;

--
-- TOC entry 222 (class 1259 OID 20214)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: pdamgisuser
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO pdamgisuser;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdamgisuser
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 221 (class 1259 OID 20206)
-- Name: users; Type: TABLE; Schema: public; Owner: pdamgisuser
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    "registeredAt" timestamp without time zone NOT NULL,
    point integer NOT NULL
);


ALTER TABLE public.users OWNER TO pdamgisuser;

--
-- TOC entry 220 (class 1259 OID 20205)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: pdamgisuser
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO pdamgisuser;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdamgisuser
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3199 (class 2604 OID 20173)
-- Name: book_tags id; Type: DEFAULT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.book_tags ALTER COLUMN id SET DEFAULT nextval('public.book_tags_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 20182)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 20218)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 20209)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3363 (class 0 OID 20170)
-- Dependencies: 216
-- Data for Name: book_tags; Type: TABLE DATA; Schema: public; Owner: pdamgisuser
--

COPY public.book_tags (id, name) FROM stdin;
1	Fiction
2	Horror
3	DIY
4	Education
5	Biography
6	Physic
7	Medical
8	Parenting
9	Textbook
10	Art
11	Business
\.


--
-- TOC entry 3365 (class 0 OID 20179)
-- Dependencies: 218
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: pdamgisuser
--

COPY public.books (id, title, writer, "coverImage", point) FROM stdin;
5	Awesome Frozen Tuna	Enid Oberbrunner-Brown	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	18
7	Incredible Plastic Cheese	Dillan Hansen	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	60
14	Gorgeous Plastic Soap	Tracy Turner	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	40
15	Oriental Wooden Computer	Sylvia Romaguera	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	14
16	Incredible Plastic Keyboard	June Mayert	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	40
17	Small Cotton Chair	Derrick Thompson	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	97
18	Practical Rubber Keyboard	Eulalia Fahey	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	41
19	Ergonomic Bronze Gloves	Keeley Ferry	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	53
20	Unbranded Plastic Hat	Drake Abbott	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	65
21	Intelligent Bronze Table	Karley O'Conner	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	9
22	Handmade Rubber Hat	Ralph Krajcik	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	4
23	Unbranded Soft Mouse	Kaycee Mosciski	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	14
24	Luxurious Cotton Ball	Kattie Corwin	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	95
25	Ergonomic Steel Chair	Paige Dibbert	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	93
26	Modern Soft Car	Korey Effertz	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	60
27	Intelligent Cotton Fish	Brooke Erdman	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	73
28	Modern Steel Ball	Elinore Osinski-Von	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	22
29	Unbranded Fresh Tuna	Taya Collier	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	63
30	Tasty Steel Keyboard	Russell Effertz	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	47
31	Recycled Cotton Bike	Emile Schoen	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	67
32	Licensed Plastic Pizza	Annie Thiel	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	62
33	Luxurious Granite Car	Samara Rutherford	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	17
34	Gorgeous Rubber Tuna	Myrl Osinski-Schmeler	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	38
35	Handmade Rubber Tuna	Gracie Gibson	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	21
36	Ergonomic Concrete Ball	Enrique Reichel	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	68
37	Modern Soft Table	Melisa MacGyver-Glover	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	62
38	Elegant Concrete Shirt	Ryann Bradtke	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	54
39	Electronic Cotton Soap	Kassandra Hettinger	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	60
40	Sleek Fresh Tuna	Gwendolyn Ledner	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	41
41	Ergonomic Granite Keyboard	Kaia Kerluke-Lehner	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	55
42	Ergonomic Granite Chicken	Mittie Murazik	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	87
43	Fantastic Soft Computer	Meredith Schuppe	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	47
44	Elegant Steel Tuna	Natalie Champlin	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	78
45	Incredible Bronze Tuna	Myriam Pfannerstill	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	31
46	Luxurious Fresh Mouse	Wilfredo Ritchie	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	28
47	Tasty Concrete Keyboard	Florence Schultz	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	38
48	Generic Bronze Towels	Austen Harber	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	70
49	Gorgeous Wooden Tuna	Floyd Predovic	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	7
50	Small Steel Pants	Lysanne Legros	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	84
51	Sleek Bronze Bacon	Fidel Cole	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	84
52	Luxurious Soft Soap	Tiara Bernhard	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	23
53	Awesome Rubber Chair	Johnson Daniel	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	18
54	Intelligent Metal Shirt	Onie Upton	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	24
55	Sleek Wooden Hat	Mckenzie Beier	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	46
56	Refined Frozen Chips	Keagan Buckridge	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	28
57	Intelligent Wooden Chair	Saul Pagac	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	51
58	Electronic Rubber Fish	Alexandrine Mante	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	46
59	Handmade Plastic Keyboard	Eliane Lebsack	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	77
60	Oriental Cotton Pants	Destini Smitham	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	16
61	Bespoke Plastic Towels	Jalen Fisher	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	29
62	Ergonomic Steel Hat	Isaias Miller	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	70
63	Rustic Concrete Gloves	Laisha Ruecker	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	22
64	Sleek Bronze Salad	Clarabelle Ruecker	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	63
65	Intelligent Steel Chair	Kellen Kerluke	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	87
66	Generic Steel Soap	Camryn Johns	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	91
67	Intelligent Plastic Chair	Vance Gusikowski	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	29
68	Unbranded Frozen Hat	Tanner Wisozk	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	49
69	Practical Steel Soap	Kasey Toy-Terry	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	35
70	Handmade Granite Mouse	Shane Wiza	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	34
71	Awesome Bronze Gloves	Kevon Stark	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	43
72	Licensed Metal Bacon	Dereck Casper	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	91
73	Fantastic Rubber Towels	Sammy Murazik	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	22
74	Sleek Granite Ball	Ava Sauer	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	5
75	Practical Fresh Bike	Dillon Lockman	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	0
76	Handcrafted Bronze Gloves	Darion Halvorson	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	74
77	Unbranded Granite Pants	Taylor Gottlieb	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	24
78	Small Metal Pants	Branson Kautzer	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	49
79	Oriental Wooden Fish	Jeromy Kassulke	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	42
80	Incredible Plastic Fish	Jerald Doyle	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	31
81	Modern Frozen Pizza	Max Murazik	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	3
82	Intelligent Plastic Tuna	Joy Windler	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	4
83	Unbranded Plastic Mouse	Myles Brown-Johns	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	35
84	Sleek Cotton Bike	Sally Tillman	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	45
85	Modern Frozen Salad	Damion Ullrich	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	99
86	Recycled Bronze Gloves	Josefina Ratke	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	16
87	Modern Granite Fish	Sydnee Kuhn	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	15
88	Luxurious Plastic Keyboard	Omari DuBuque	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	44
89	Recycled Granite Salad	Rudy Balistreri	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	19
90	Ergonomic Metal Chicken	Willard Collier	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	46
91	Licensed Frozen Gloves	Harley Gottlieb	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	67
92	Modern Plastic Soap	Maegan Bartell	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	37
93	Luxurious Steel Chips	Macy Hilll	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	6
94	Ergonomic Granite Soap	Terrell Boyer	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	79
95	Licensed Steel Towels	Randy Bosco	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	96
96	Fantastic Frozen Cheese	Dewitt Bashirian	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	21
97	Handcrafted Soft Hat	Trace Schmidt	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	22
98	Incredible Soft Chair	Berniece Jacobs	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	10
99	Sleek Steel Computer	Holly Feeney	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	86
100	Handcrafted Wooden Tuna	Florian Pouros	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	93
101	Incredible Soft Computer	Eleonore Bailey	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	31
102	Bespoke Concrete Shirt	Amparo Ruecker	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	31
103	Modern Metal Bike	Veda Moore	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	39
104	Refined Frozen Sausages	Icie Greenfelder	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	97
105	Refined Fresh Car	Amelie Medhurst	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	11
106	Unbranded Wooden Gloves	Marianne Bartell	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	63
107	Unbranded Cotton Tuna	Estefania Schumm	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	89
108	Licensed Plastic Soap	Martine Larson	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	50
109	Practical Bronze Tuna	Sallie Rippin	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	69
110	Small Steel Keyboard	Lou Heathcote	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	88
111	Oriental Steel Computer	Cheyenne Yundt	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	80
112	Rustic Cotton Bacon	Xzavier Fisher	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	13
113	Licensed Granite Pants	Rodrick Goldner	https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg	18
\.


--
-- TOC entry 3366 (class 0 OID 20187)
-- Dependencies: 219
-- Data for Name: books_tags_book_tags; Type: TABLE DATA; Schema: public; Owner: pdamgisuser
--

COPY public.books_tags_book_tags ("booksId", "bookTagsId") FROM stdin;
5	4
7	10
7	5
7	2
7	7
14	4
14	3
14	10
14	2
15	10
15	9
15	3
15	2
15	1
15	11
15	5
16	8
16	6
16	1
17	4
17	8
17	1
17	9
17	3
18	10
18	2
19	3
19	8
19	2
19	4
19	9
19	1
20	7
20	5
20	3
20	6
20	1
21	2
21	8
21	4
21	11
21	6
21	7
21	3
22	11
22	6
22	5
22	2
23	9
23	1
23	2
24	11
24	9
24	7
24	5
24	3
24	1
24	6
25	9
25	6
25	2
25	1
25	5
26	3
26	2
26	4
26	7
26	8
26	5
26	11
27	11
27	3
27	10
27	7
28	3
28	11
28	9
28	5
28	2
29	4
29	11
29	8
29	9
30	3
30	8
30	5
30	11
30	4
30	7
30	1
31	6
31	11
32	2
32	5
32	8
32	1
32	11
32	6
32	3
33	1
33	4
34	11
34	3
34	5
34	4
34	7
34	8
34	2
35	7
35	10
35	2
35	4
36	1
36	8
36	7
36	10
37	5
37	4
37	10
37	9
37	6
37	1
38	4
39	7
39	3
39	4
39	10
39	5
39	9
39	6
40	10
40	4
40	3
40	8
40	2
41	3
41	7
41	8
41	6
41	9
42	2
42	8
42	9
42	6
43	2
43	1
43	9
43	11
43	8
43	4
44	2
44	11
44	3
44	9
44	7
44	1
44	10
45	11
45	8
45	7
46	9
46	10
46	2
46	4
47	9
47	2
47	11
47	6
48	4
48	10
48	6
49	5
49	11
49	6
49	7
49	4
50	9
51	9
51	11
51	10
51	5
51	8
51	1
52	4
52	9
52	1
54	4
54	2
54	3
54	5
54	7
57	5
57	3
57	6
57	8
58	7
58	8
58	2
58	10
58	5
58	6
59	7
59	8
59	1
59	10
59	2
59	9
59	5
60	6
60	11
60	9
60	10
60	2
60	5
61	8
61	1
61	4
61	2
61	11
61	5
62	9
62	5
62	3
62	10
63	2
63	6
63	9
63	1
63	8
63	11
63	4
64	9
64	5
64	11
64	1
65	8
66	2
66	11
66	5
67	1
67	10
67	3
67	2
67	5
67	7
68	3
68	10
68	5
68	2
69	9
69	3
70	2
70	5
70	11
71	9
72	8
72	6
72	7
72	10
72	3
72	9
72	2
73	8
74	8
75	9
75	8
75	5
75	2
75	1
75	11
75	10
76	2
76	11
76	5
76	10
76	8
76	3
76	7
76	6
77	8
77	6
77	3
77	9
77	4
77	7
78	6
78	3
78	1
78	2
79	8
79	10
80	9
80	4
80	1
80	10
80	11
81	3
81	4
81	11
82	3
83	5
83	1
84	8
84	10
84	6
84	1
85	6
85	2
85	5
85	10
85	11
85	7
87	5
89	5
89	6
90	6
90	3
90	2
91	1
91	4
91	5
91	6
91	11
92	8
92	2
92	9
92	4
92	11
92	3
93	9
93	2
93	1
93	6
94	10
95	3
95	11
95	7
95	10
95	5
95	8
97	9
97	1
97	8
97	3
98	6
98	8
98	9
98	1
100	3
100	4
100	5
100	2
100	9
100	1
101	7
101	8
101	10
101	4
101	3
101	6
102	5
102	9
102	6
102	8
103	6
103	5
103	2
103	7
103	4
103	11
103	3
104	11
104	3
104	2
104	1
104	8
104	10
105	3
105	4
105	1
105	6
105	10
105	11
106	8
107	8
107	7
107	6
108	7
108	4
108	2
109	6
109	11
110	5
110	8
110	4
110	1
110	3
110	7
110	11
111	2
112	8
112	11
112	5
112	4
112	3
112	6
113	4
113	8
113	1
113	10
113	9
113	5
113	11
\.


--
-- TOC entry 3370 (class 0 OID 20215)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: pdamgisuser
--

COPY public.orders (id, "orderId", "pointUsed", "orderedAt", "bookId", "userId") FROM stdin;
8	66852772-6118-49fa-817d-4ab9b3d962d7	60	2024-03-28 13:11:23.082	\N	\N
10	e9f952ee-be9c-4cab-8f33-c193c665da10	60	2024-03-28 13:12:55.356	7	10
11	76f78637-0d5d-46f8-9daf-d18bd2c84019	60	2024-03-28 13:13:06.35	7	10
12	0e7a089a-13d0-414e-9945-5455297791f5	60	2024-03-28 13:13:23.301	7	10
13	db306f3e-2e63-433a-bece-6bc209551f6b	60	2024-03-28 13:13:53.013	7	10
14	41ed4754-4d43-4de9-91af-a2a69cada5f3	60	2024-03-28 13:13:55.281	7	10
\.


--
-- TOC entry 3368 (class 0 OID 20206)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pdamgisuser
--

COPY public.users (id, name, email, password, "registeredAt", point) FROM stdin;
10	Bowo	patranto.prabowo@gmail.com	Asdqwe12345	2024-03-28 12:57:30.136	-80
\.


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 215
-- Name: book_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdamgisuser
--

SELECT pg_catalog.setval('public.book_tags_id_seq', 11, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 217
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdamgisuser
--

SELECT pg_catalog.setval('public.books_id_seq', 113, true);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdamgisuser
--

SELECT pg_catalog.setval('public.orders_id_seq', 14, true);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdamgisuser
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- TOC entry 3210 (class 2606 OID 20191)
-- Name: books_tags_book_tags PK_4b731daedfb48f4555c33c63826; Type: CONSTRAINT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.books_tags_book_tags
    ADD CONSTRAINT "PK_4b731daedfb48f4555c33c63826" PRIMARY KEY ("booksId", "bookTagsId");


--
-- TOC entry 3214 (class 2606 OID 20222)
-- Name: orders PK_710e2d4957aa5878dfe94e4ac2f; Type: CONSTRAINT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "PK_710e2d4957aa5878dfe94e4ac2f" PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 20177)
-- Name: book_tags PK_8609713cdc27cfa8d6fa5cf80d3; Type: CONSTRAINT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.book_tags
    ADD CONSTRAINT "PK_8609713cdc27cfa8d6fa5cf80d3" PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 20211)
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 20186)
-- Name: books PK_f3f2f25a099d24e12545b70b022; Type: CONSTRAINT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT "PK_f3f2f25a099d24e12545b70b022" PRIMARY KEY (id);


--
-- TOC entry 3207 (class 1259 OID 20192)
-- Name: IDX_44ee7df6cdc18f03523e01f95f; Type: INDEX; Schema: public; Owner: pdamgisuser
--

CREATE INDEX "IDX_44ee7df6cdc18f03523e01f95f" ON public.books_tags_book_tags USING btree ("booksId");


--
-- TOC entry 3208 (class 1259 OID 20193)
-- Name: IDX_5a3c2e3b7258313edd1bb3b9c1; Type: INDEX; Schema: public; Owner: pdamgisuser
--

CREATE INDEX "IDX_5a3c2e3b7258313edd1bb3b9c1" ON public.books_tags_book_tags USING btree ("bookTagsId");


--
-- TOC entry 3217 (class 2606 OID 20242)
-- Name: orders FK_151b79a83ba240b0cb31b2302d1; Type: FK CONSTRAINT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_151b79a83ba240b0cb31b2302d1" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- TOC entry 3215 (class 2606 OID 20194)
-- Name: books_tags_book_tags FK_44ee7df6cdc18f03523e01f95f7; Type: FK CONSTRAINT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.books_tags_book_tags
    ADD CONSTRAINT "FK_44ee7df6cdc18f03523e01f95f7" FOREIGN KEY ("booksId") REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3218 (class 2606 OID 20237)
-- Name: orders FK_44fba34a7052127480dde32f290; Type: FK CONSTRAINT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_44fba34a7052127480dde32f290" FOREIGN KEY ("bookId") REFERENCES public.books(id);


--
-- TOC entry 3216 (class 2606 OID 20199)
-- Name: books_tags_book_tags FK_5a3c2e3b7258313edd1bb3b9c1f; Type: FK CONSTRAINT; Schema: public; Owner: pdamgisuser
--

ALTER TABLE ONLY public.books_tags_book_tags
    ADD CONSTRAINT "FK_5a3c2e3b7258313edd1bb3b9c1f" FOREIGN KEY ("bookTagsId") REFERENCES public.book_tags(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2024-03-28 07:27:22 UTC

--
-- PostgreSQL database dump complete
--

