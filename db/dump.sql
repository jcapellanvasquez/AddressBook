--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-03 01:39:10 UTC

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
-- TOC entry 209 (class 1259 OID 16385)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer DEFAULT nextval(('public.addresses_id_seq'::text)::regclass) NOT NULL,
    state character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    address1 character varying(255) NOT NULL,
    zip character varying(255) NOT NULL,
    client_id integer NOT NULL,
    active boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16391)
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16392)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer DEFAULT nextval(('public.clients_id_seq'::text)::regclass) NOT NULL,
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16398)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16399)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer DEFAULT nextval(('public.users_id_seq'::text)::regclass) NOT NULL,
    username character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16405)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3328 (class 0 OID 16385)
-- Dependencies: 209
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, state, city, address, address1, zip, client_id, active, user_id) FROM stdin;
1	Virginia	Virginia Beach	5 Bunting Parkway	104 Heffernan Court	23471	33	f	1
2	Pennsylvania	Reading	696 Petterle Crossing	343 Barby Park	19605	5	t	1
3	Missouri	Independence	2247 Brickson Park Crossing	5818 Dayton Parkway	64054	24	f	1
4	Massachusetts	Springfield	2948 Brentwood Junction	09 Meadow Ridge Lane	01129	6	t	1
5	Hawaii	Honolulu	74883 Bultman Street	12 Springs Court	96825	92	f	1
6	Kansas	Wichita	901 Brown Circle	67 Southridge Avenue	67205	56	t	1
7	Ohio	Mansfield	51 Moland Park	7006 Annamark Circle	44905	14	f	1
8	New York	Buffalo	7 Vera Avenue	79304 Butterfield Alley	14269	76	f	1
9	Wisconsin	Milwaukee	7007 Hauk Avenue	29 Atwood Street	53263	57	t	1
10	Missouri	Saint Louis	6 Fisk Park	1 West Trail	63116	47	t	1
11	California	San Diego	61719 Eastlawn Parkway	2473 Red Cloud Crossing	92191	71	f	1
12	Illinois	Chicago	57970 Mandrake Avenue	6705 Northwestern Point	60674	11	t	1
13	Indiana	Indianapolis	57504 Havey Court	27 Buell Road	46231	98	f	1
14	Texas	Houston	8 Loftsgordon Circle	0 Hudson Pass	77090	57	f	1
15	Idaho	Boise	5433 1st Park	6 Dahle Terrace	83757	60	t	1
16	Delaware	Newark	9 Springview Junction	348 Jana Drive	19714	46	t	1
17	Utah	Salt Lake City	0 Toban Alley	25 Coolidge Alley	84130	67	t	1
18	Tennessee	Johnson City	3 Lake View Alley	844 Shasta Alley	37605	56	t	1
19	Washington	Tacoma	1848 Nelson Parkway	97889 Eastlawn Alley	98405	53	t	1
20	District of Columbia	Washington	57616 Bellgrove Circle	855 Claremont Pass	20508	32	f	1
21	Colorado	Colorado Springs	3176 Summerview Center	05565 Talisman Lane	80995	68	t	1
22	Wisconsin	Milwaukee	1922 3rd Lane	0021 Roxbury Road	53215	47	f	1
23	Kentucky	Lexington	11 Sycamore Avenue	964 2nd Drive	40586	51	t	1
24	South Carolina	Columbia	66 Shasta Crossing	109 Grim Circle	29240	87	t	1
25	California	San Diego	275 Mcbride Crossing	62809 Lillian Circle	92110	45	t	1
26	Massachusetts	Boston	04 Logan Trail	55 Hintze Road	02109	6	f	1
27	South Carolina	Charleston	99 Dakota Circle	8716 6th Street	29411	66	t	1
28	Wisconsin	Milwaukee	8 Maryland Way	372 Washington Crossing	53285	27	t	1
29	Texas	San Antonio	03990 Westridge Center	72 Amoth Junction	78230	66	t	1
30	Texas	San Antonio	9278 Pepper Wood Pass	42 Oak Pass	78245	51	t	1
31	Missouri	Kansas City	4207 Maple Crossing	1 Melvin Junction	64142	82	t	1
32	Texas	Dallas	202 Oak Valley Plaza	04 Bayside Circle	75241	56	f	1
33	Texas	Wichita Falls	320 Farragut Parkway	856 Roth Point	76310	19	t	1
34	Virginia	Reston	09491 Scoville Junction	72214 Hoepker Road	20195	74	t	1
35	Florida	Brooksville	25411 Acker Parkway	4775 Iowa Hill	34605	27	f	1
36	Kansas	Shawnee Mission	6906 Bashford Terrace	9075 Grasskamp Street	66276	97	t	1
37	Texas	Katy	037 Elka Parkway	50 Red Cloud Way	77493	100	t	1
38	Nevada	Reno	97 Farmco Plaza	9857 Mandrake Center	89550	46	f	1
39	Pennsylvania	Philadelphia	37 Ridgeview Park	0 Brickson Park Parkway	19120	7	f	1
40	Virginia	Alexandria	56 Kingsford Point	84 Anniversary Center	22301	6	t	1
41	District of Columbia	Washington	00945 Forest Plaza	60 High Crossing Crossing	20036	45	f	1
42	Iowa	Des Moines	5 Sherman Plaza	15 Miller Court	50320	72	f	1
43	District of Columbia	Washington	88956 Kim Avenue	6243 Michigan Terrace	20535	5	t	1
44	Maryland	Silver Spring	7885 Gulseth Circle	68482 Chinook Point	20918	63	t	1
45	North Carolina	Fayetteville	85 Forest Run Point	99809 Fieldstone Court	28305	82	t	1
46	Florida	Jacksonville	94 Westridge Junction	7568 Division Trail	32244	95	f	1
47	California	Sacramento	81 Village Parkway	2 Rigney Terrace	94207	55	t	1
48	Florida	Orlando	32785 Butterfield Pass	60592 Independence Way	32808	54	f	1
49	Virginia	Norfolk	535 West Alley	6980 Cody Parkway	23551	25	f	1
50	New York	New York City	47508 Memorial Street	69947 Crowley Lane	10090	94	t	1
51	Texas	Houston	4 Coolidge Drive	25 Mayer Place	77260	71	t	1
52	Massachusetts	Boston	8 Buena Vista Hill	79 Stoughton Terrace	02114	44	t	1
53	Louisiana	Shreveport	56229 Forest Dale Place	02 Grasskamp Crossing	71161	75	t	1
54	North Carolina	Fayetteville	0057 Toban Drive	3 Autumn Leaf Trail	28305	22	t	1
55	Florida	Miami	8322 Ridgeview Junction	59945 6th Alley	33180	47	f	1
56	New York	New York City	91611 Bellgrove Junction	331 Saint Paul Hill	10004	85	f	1
57	Maryland	Baltimore	32325 Morrow Trail	034 Dixon Trail	21290	64	f	1
58	Oregon	Portland	350 Comanche Junction	3 Lyons Street	97232	93	f	1
59	Maryland	Bethesda	51399 Bashford Center	9 Commercial Lane	20892	3	t	1
60	Nevada	Las Vegas	54917 Aberg Lane	888 Katie Avenue	89150	13	t	1
61	District of Columbia	Washington	21621 Almo Way	8 Holmberg Circle	20503	91	f	1
62	Florida	Pompano Beach	2 Milwaukee Way	57 Harbort Avenue	33064	53	t	1
63	California	San Luis Obispo	76 Hintze Court	99572 Maywood Lane	93407	83	f	1
64	Florida	Pensacola	4027 Comanche Pass	16729 Grasskamp Terrace	32511	8	t	1
65	Louisiana	New Orleans	985 Roth Point	66925 Vera Avenue	70183	96	t	1
66	Colorado	Englewood	8129 Killdeer Point	4 Thompson Point	80150	91	f	1
67	Wisconsin	Madison	01933 Swallow Junction	83727 Atwood Alley	53710	45	f	1
68	Texas	Amarillo	5 Bashford Pass	509 Jana Alley	79116	85	t	1
69	Nevada	Henderson	138 Toban Way	61 Hermina Point	89012	92	t	1
70	Kansas	Topeka	1 Pearson Street	18539 Roth Alley	66642	58	t	1
71	Illinois	Chicago	70879 International Parkway	1 Melrose Pass	60614	14	t	1
72	Texas	Fort Worth	3 Hollow Ridge Parkway	696 Grayhawk Court	76162	24	t	1
73	Alabama	Birmingham	769 Johnson Avenue	609 Westend Parkway	35225	97	f	1
74	Minnesota	Minneapolis	289 High Crossing Street	26 Larry Trail	55412	22	f	1
75	Texas	El Paso	25 Grim Park	851 Elka Point	79934	23	t	1
76	New Mexico	Albuquerque	0 Fallview Road	3729 Truax Crossing	87110	21	f	1
77	West Virginia	Charleston	52128 Heffernan Plaza	4165 Sundown Way	25389	72	f	1
78	Pennsylvania	Bethlehem	8 Fairview Plaza	37 Summer Ridge Road	18018	72	t	1
79	Arkansas	North Little Rock	7103 Portage Road	6879 Thackeray Way	72199	46	t	1
80	Missouri	Kansas City	023 Rigney Trail	871 Lakeland Hill	64144	14	t	1
81	Pennsylvania	Johnstown	373 Nelson Trail	05178 Clove Crossing	15906	19	f	1
82	Massachusetts	Worcester	8 Lakewood Way	55 Oneill Center	01605	70	f	1
83	Missouri	Saint Louis	309 Daystar Way	0346 Express Road	63110	62	t	1
84	Oregon	Portland	6 Cody Way	40 Grim Drive	97240	41	t	1
85	Florida	Miami	75 Brown Point	169 Holmberg Parkway	33164	73	t	1
86	Missouri	Saint Louis	9998 Melody Court	7078 Elgar Lane	63121	17	t	1
87	Oregon	Portland	02 Schmedeman Junction	9911 Orin Trail	97229	12	t	1
88	Michigan	Detroit	19373 Jenifer Pass	11 Pleasure Center	48206	50	f	1
89	Illinois	Springfield	42 Goodland Park	333 Oriole Junction	62776	2	f	1
90	Florida	Pensacola	5223 Northwestern Center	74 Trailsway Avenue	32505	77	f	1
91	Illinois	Chicago	15746 Hoard Pass	4 Shoshone Trail	60641	41	f	1
92	Florida	Panama City	77851 Katie Trail	0137 Hazelcrest Crossing	32405	13	f	1
93	Texas	Houston	8 Acker Road	215 Pepper Wood Drive	77218	27	f	1
94	Virginia	Roanoke	077 Sherman Park	2271 Kings Pass	24014	12	t	1
95	Massachusetts	Worcester	86833 Pleasure Place	3 Upham Hill	01654	33	f	1
96	Connecticut	Fairfield	5 Dakota Alley	26 Pierstorff Alley	06825	22	f	1
97	Idaho	Boise	37 Eagle Crest Circle	14737 School Street	83716	61	t	1
98	Oklahoma	Oklahoma City	9656 Washington Point	08537 Lindbergh Center	73152	51	f	1
99	Michigan	Ann Arbor	617 Elgar Point	689 Clarendon Pass	48107	89	t	1
100	Texas	Temple	81780 Village Green Lane	26 Butternut Terrace	76505	6	f	1
101	Texas	Houston	5 Bayside Drive	782 Kipling Avenue	77293	43	t	1
102	Texas	Dallas	721 Debs Plaza	026 Novick Court	75216	79	t	1
103	California	San Diego	6 Shopko Junction	2604 Reinke Place	92110	69	t	1
104	Washington	Bellevue	7926 Cordelia Junction	10916 Columbus Center	98008	10	f	1
105	Texas	Houston	0734 Thompson Hill	354 Onsgard Hill	77245	86	f	1
106	North Carolina	Charlotte	76 Springs Pass	97904 Green Pass	28220	92	t	1
107	Iowa	Des Moines	650 Canary Alley	1119 Pleasure Avenue	50936	59	f	1
108	Georgia	Atlanta	6935 Rusk Alley	010 Straubel Parkway	30351	3	t	1
109	New Jersey	Trenton	126 Arizona Trail	9618 Nova Terrace	08603	56	t	1
110	Indiana	Terre Haute	414 Autumn Leaf Drive	44 Forest Dale Avenue	47812	44	t	1
111	Florida	Pensacola	01343 Mitchell Way	40852 Ilene Place	32520	89	t	1
112	Florida	Orlando	38116 Ramsey Drive	715 Northport Hill	32891	52	t	1
113	Florida	Jacksonville	29492 Ridge Oak Way	29341 Maple Wood Park	32230	96	f	1
114	Ohio	Canton	93 5th Pass	7060 Sugar Junction	44720	39	t	1
115	Kansas	Topeka	9 Crowley Place	15869 Northwestern Hill	66699	69	t	1
116	California	Bakersfield	3 Grim Alley	33 Roxbury Lane	93399	100	t	1
117	California	Oakland	37 Maryland Crossing	45 Buhler Parkway	94611	43	t	1
118	Illinois	Chicago	6 Hauk Point	32 Gulseth Pass	60614	42	t	1
119	Maryland	Baltimore	44 Park Meadow Center	93 Service Street	21211	22	t	1
120	Ohio	Dayton	12 Surrey Parkway	3083 Killdeer Alley	45408	81	f	1
121	Connecticut	Hartford	249 Commercial Trail	88818 Linden Point	06120	39	f	1
122	North Carolina	Charlotte	9 Golf View Junction	1 Atwood Trail	28230	93	t	1
123	Connecticut	Hartford	4849 Jana Point	1 South Trail	06152	51	f	1
124	Wisconsin	Milwaukee	3 Heath Drive	0932 Dayton Center	53225	55	f	1
125	Florida	Naples	697 Bayside Alley	777 Park Meadow Road	33963	33	f	1
126	Michigan	Grand Rapids	4120 Ridge Oak Lane	6 Red Cloud Plaza	49505	59	f	1
127	Virginia	Arlington	2856 Superior Street	859 Mariners Cove Lane	22217	71	t	1
128	California	Santa Ana	98827 Forster Parkway	781 Golden Leaf Park	92725	58	t	1
129	Arizona	Gilbert	99 Eastwood Avenue	8361 Drewry Drive	85297	58	t	1
130	Alaska	Anchorage	6 Bunting Point	16813 Village Green Pass	99507	98	f	1
131	Oregon	Salem	3 Summit Lane	20534 Northview Point	97312	21	f	1
132	Massachusetts	Worcester	0 Charing Cross Point	1763 Glacier Hill Center	01654	41	f	1
133	Arizona	Tucson	7190 Little Fleur Parkway	8561 Sherman Junction	85710	45	f	1
134	Utah	Salt Lake City	65503 Bonner Center	83 Manufacturers Lane	84152	99	f	1
135	California	Orange	1 Dakota Alley	949 Lindbergh Place	92668	76	t	1
136	Pennsylvania	Pittsburgh	70 Stone Corner Court	0 Steensland Court	15230	24	t	1
137	Virginia	Charlottesville	15859 Burrows Pass	6 Luster Lane	22908	7	t	1
138	Texas	Killeen	397 Russell Circle	1530 Ridgeview Trail	76544	8	f	1
139	California	San Diego	366 Grim Terrace	17 Susan Terrace	92105	36	t	1
140	California	San Bernardino	3 Independence Alley	1 Randy Point	92424	13	t	1
141	Florida	Pompano Beach	00772 Oakridge Circle	0 Old Gate Street	33069	56	t	1
142	Delaware	Wilmington	511 Crownhardt Pass	86 Lukken Crossing	19892	39	t	1
143	Texas	Dallas	23 Paget Street	39591 Loftsgordon Alley	75287	14	f	1
144	Florida	Homestead	2709 Oak Valley Hill	47 Continental Circle	33034	30	t	1
145	North Dakota	Fargo	31 Dorton Park	57080 Magdeline Lane	58122	1	t	1
146	California	Richmond	7432 Carey Place	97060 Becker Alley	94807	59	f	1
147	Nevada	Las Vegas	2 Mallory Terrace	9678 Warner Park	89178	21	t	1
148	New York	Flushing	649 Roth Circle	23 Hintze Way	11388	1	f	1
149	Ohio	Cincinnati	0 Hauk Point	40 Coolidge Place	45243	63	t	1
150	Illinois	Chicago	614 David Terrace	8 Forest Way	60697	78	t	1
151	Alabama	Birmingham	758 Portage Court	81 Prairie Rose Point	35220	59	t	1
152	Oklahoma	Oklahoma City	994 Kipling Park	878 Crowley Hill	73135	67	t	1
153	Texas	Austin	5128 Rutledge Way	020 Spohn Terrace	78764	86	t	1
154	North Carolina	Greensboro	7109 Merchant Park	765 Truax Place	27425	81	t	1
155	Texas	Katy	6 Nobel Hill	802 Sutteridge Circle	77493	40	f	1
156	Pennsylvania	Wilkes Barre	83 Rutledge Park	0 Harper Center	18768	22	f	1
157	Virginia	Roanoke	65304 Loeprich Place	57562 Esker Way	24004	28	f	1
158	Virginia	Ashburn	82 Golf Trail	11882 Pleasure Junction	22093	10	f	1
159	Idaho	Pocatello	41 Redwing Park	63587 Hooker Road	83206	73	f	1
160	Pennsylvania	Philadelphia	32061 Hanson Place	9 Kings Center	19125	77	f	1
161	Kansas	Wichita	568 Huxley Lane	03215 Carioca Junction	67220	91	f	1
162	California	San Diego	76118 Nevada Center	55 Stuart Pass	92153	28	f	1
163	New York	New York City	3190 Basil Crossing	91 Wayridge Point	10115	38	f	1
164	Texas	Dallas	4683 Shoshone Point	55036 Killdeer Lane	75226	25	t	1
165	North Carolina	Charlotte	57389 Park Meadow Terrace	7 Portage Center	28299	69	f	1
166	Maine	Portland	77 Bay Center	8279 Anzinger Plaza	04109	57	t	1
167	Florida	Orlando	58 Myrtle Parkway	7 Hovde Pass	32813	30	t	1
168	Virginia	Fredericksburg	30919 Almo Circle	46 Novick Pass	22405	65	t	1
169	Maryland	Baltimore	519 Forest Court	4 Center Park	21282	20	t	1
170	California	Santa Monica	45 Pine View Alley	658 Donald Pass	90410	52	f	1
171	Wisconsin	Madison	26 Merrick Pass	957 Porter Place	53779	35	t	1
172	California	Irvine	46192 Manufacturers Plaza	595 Swallow Plaza	92612	71	f	1
173	Texas	Dallas	9099 Atwood Terrace	03861 Forest Dale Point	75353	50	f	1
174	Oklahoma	Oklahoma City	5 La Follette Road	6 Killdeer Plaza	73135	34	t	1
175	Georgia	Macon	3897 Summer Ridge Way	5 Warbler Lane	31205	50	f	1
176	New Hampshire	Manchester	86223 Charing Cross Junction	1 Clemons Circle	03105	84	f	1
177	Texas	Dallas	7 Vidon Road	180 Hovde Point	75397	76	f	1
178	Georgia	Atlanta	8566 Birchwood Terrace	2 Rigney Avenue	30358	24	f	1
179	California	Oakland	11792 Lawn Junction	60461 Fisk Court	94616	39	f	1
180	Florida	Tampa	2 Dryden Center	303 Delaware Hill	33620	87	t	1
181	Kentucky	Louisville	4 Independence Parkway	8 Tomscot Avenue	40280	36	f	1
182	Texas	Houston	50195 Waubesa Road	633 Ruskin Crossing	77281	82	f	1
183	Ohio	Dayton	967 Lighthouse Bay Court	59806 Rigney Road	45403	99	f	1
184	Texas	El Paso	407 Fairview Center	370 Welch Road	79984	67	t	1
185	Texas	Dallas	3 Melrose Hill	9 Quincy Avenue	75241	17	t	1
186	California	Fresno	31311 Commercial Hill	71680 Troy Circle	93721	53	f	1
187	Florida	West Palm Beach	369 Kenwood Junction	10 Merchant Point	33411	26	t	1
188	Virginia	Alexandria	6 Hollow Ridge Park	5 Lawn Plaza	22333	5	t	1
189	South Carolina	Columbia	677 Stone Corner Parkway	1614 Norway Maple Drive	29220	12	f	1
190	Iowa	Des Moines	318 Macpherson Point	7 Barnett Junction	50320	71	t	1
191	Louisiana	Lake Charles	778 Porter Avenue	4170 Redwing Place	70607	86	t	1
192	Virginia	Virginia Beach	54 Fulton Place	17139 Del Mar Plaza	23454	51	t	1
193	Florida	Vero Beach	3475 Chinook Drive	0700 Sutteridge Alley	32969	55	f	1
194	Texas	Houston	9 Fieldstone Court	43091 Hagan Road	77095	82	t	1
195	New York	Bronx	3161 Maywood Place	9367 Kinsman Lane	10474	86	f	1
196	Virginia	Richmond	94646 Fuller Alley	5 Di Loreto Place	23225	97	t	1
197	Ohio	Cincinnati	5015 Jenna Parkway	34 Sherman Court	45249	45	f	1
198	California	San Diego	8892 Dunning Crossing	98778 Badeau Lane	92115	80	f	1
199	Louisiana	Shreveport	347 Spenser Lane	06992 Service Park	71137	86	t	1
200	Virginia	Merrifield	47 Ridgeview Junction	4848 Everett Park	22119	3	f	1
201	Minnesota	Monticello	45567 Donald Crossing	41 Little Fleur Trail	55590	5	t	1
202	Virginia	Manassas	283 Waubesa Plaza	95 Union Place	22111	61	t	1
203	Texas	Gatesville	848 Carey Circle	17 Sauthoff Drive	76598	6	t	1
204	Oklahoma	Oklahoma City	36 Dayton Pass	54661 Cody Way	73179	18	f	1
205	District of Columbia	Washington	0680 Boyd Alley	127 Grim Court	20442	91	t	1
206	Alabama	Birmingham	4074 Moland Court	38592 Corry Parkway	35225	30	f	1
207	Indiana	Indianapolis	68 Lukken Crossing	5450 Cottonwood Parkway	46216	48	f	1
208	New Mexico	Albuquerque	313 Lindbergh Circle	086 Anzinger Point	87195	67	t	1
209	Georgia	Augusta	2 West Court	5 Upham Parkway	30905	5	f	1
210	Oregon	Salem	2 Nova Way	1826 Glendale Parkway	97312	41	f	1
211	Louisiana	New Orleans	9922 Colorado Point	3479 Dorton Circle	70142	79	f	1
212	Texas	El Paso	8682 Forest Dale Point	14895 Waywood Street	79916	36	f	1
213	Connecticut	New Haven	369 Express Drive	073 Manufacturers Junction	06505	92	t	1
214	Iowa	Sioux City	46238 Lakewood Crossing	2 Everett Drive	51110	56	t	1
215	Ohio	Columbus	96 Corry Junction	606 Loomis Lane	43268	58	t	1
216	California	Mountain View	489 Truax Drive	983 Kedzie Alley	94042	54	f	1
217	Kentucky	Migrate	25 High Crossing Pass	392 Mitchell Court	41905	65	t	1
218	Wisconsin	Madison	908 Emmet Court	8 Buena Vista Terrace	53726	30	f	1
219	West Virginia	Huntington	850 Schurz Court	060 Bartillon Avenue	25726	24	f	1
220	Ohio	Dayton	143 Nobel Point	28 Dayton Hill	45403	8	f	1
221	Washington	Seattle	4 Logan Terrace	6 Oak Valley Drive	98133	38	f	1
222	Tennessee	Memphis	3 Center Alley	45092 Hansons Way	38143	18	t	1
223	Illinois	Peoria	688 Namekagon Circle	1 Buena Vista Parkway	61640	54	t	1
224	Washington	Seattle	5 Carpenter Way	7953 Toban Center	98158	48	t	1
225	Nevada	Las Vegas	723 Clemons Way	0 Thompson Trail	89135	57	t	1
226	Nevada	Sparks	29959 Birchwood Point	2 Charing Cross Trail	89436	64	t	1
227	Nevada	Las Vegas	30 Golf View Terrace	57 Farragut Way	89125	24	f	1
228	New York	Mount Vernon	56 Anhalt Trail	15027 Mayer Court	10557	82	t	1
229	New Mexico	Albuquerque	1 Hoard Place	1 Ridge Oak Lane	87201	44	t	1
230	Georgia	Atlanta	9619 Basil Avenue	0356 Beilfuss Junction	31119	50	f	1
231	Florida	Miami	95088 American Ash Plaza	140 Buena Vista Trail	33233	73	t	1
232	Florida	Saint Petersburg	73 Crest Line Hill	370 Main Parkway	33715	44	f	1
233	Tennessee	Chattanooga	5 Burning Wood Trail	28 Portage Circle	37416	97	f	1
234	Florida	Saint Augustine	5508 Armistice Trail	15 Jackson Alley	32092	19	t	1
235	Tennessee	Nashville	21 Hallows Trail	103 Maywood Street	37210	21	t	1
236	Wisconsin	Madison	3 Holy Cross Pass	2087 2nd Circle	53716	24	f	1
237	Connecticut	Waterbury	76501 Northfield Street	05940 Elmside Road	06721	16	f	1
238	District of Columbia	Washington	6457 Village Way	84 Fremont Junction	20268	73	t	1
239	California	Ventura	49468 Meadow Vale Avenue	89108 American Trail	93005	19	t	1
240	Tennessee	Memphis	55713 Rowland Court	9 Monument Street	38168	12	f	1
241	Florida	Fort Lauderdale	825 Bultman Crossing	0 Blackbird Drive	33320	51	t	1
242	North Carolina	Winston Salem	6922 Leroy Circle	1 Calypso Court	27157	81	f	1
243	Florida	Pompano Beach	6420 Vera Circle	3 Mccormick Avenue	33069	23	f	1
244	Florida	Tampa	5 Susan Junction	04 Mcbride Point	33673	95	f	1
245	Pennsylvania	Philadelphia	62118 Sloan Alley	7410 Corscot Circle	19136	1	t	1
246	Florida	Orlando	10 Claremont Hill	43 Hooker Junction	32808	56	t	1
247	Ohio	Springfield	00 Sloan Pass	5 Coleman Parkway	45505	16	t	1
248	New York	Brooklyn	57613 Golf View Hill	5 Bay Parkway	11247	91	t	1
249	Illinois	Springfield	45438 Hansons Lane	698 Melvin Terrace	62718	21	f	1
250	Nebraska	Omaha	85744 Morning Center	925 Monterey Junction	68117	94	t	1
251	Nevada	Las Vegas	45 3rd Crossing	475 Autumn Leaf Court	89166	33	t	1
252	Wisconsin	Madison	05 Village Hill	5205 Columbus Junction	53790	86	f	1
253	Iowa	Des Moines	1696 Mifflin Alley	09 Dunning Road	50330	70	t	1
254	Indiana	Anderson	92 John Wall Place	4183 Huxley Park	46015	56	t	1
255	Ohio	Akron	9 Magdeline Circle	20009 Bay Junction	44315	49	f	1
256	Louisiana	Baton Rouge	1 Old Shore Drive	4 Southridge Pass	70883	28	f	1
257	Virginia	Virginia Beach	64 Dorton Trail	63 Lotheville Lane	23454	89	t	1
258	Pennsylvania	Philadelphia	08 Express Street	9006 Kenwood Junction	19125	2	t	1
259	California	San Francisco	20746 Ruskin Court	1 Dapin Junction	94159	83	f	1
260	New York	Buffalo	5483 Transport Place	411 Fisk Plaza	14269	26	t	1
261	Florida	Jacksonville	88651 Glacier Hill Pass	48152 Tomscot Parkway	32277	52	f	1
262	New Jersey	Trenton	78984 Mayer Center	59 Sycamore Junction	08603	61	f	1
263	Texas	Spring	02 Welch Plaza	703 Fulton Street	77388	54	t	1
264	Texas	Austin	6122 Green Ridge Hill	14 Gulseth Avenue	78715	69	t	1
265	Tennessee	Jackson	11378 Melby Way	230 Buell Plaza	38308	60	t	1
266	Kentucky	Lexington	1529 Fremont Court	0 Melvin Place	40505	91	f	1
267	Nebraska	Omaha	5 Hanson Way	227 Coleman Court	68124	61	f	1
268	California	Whittier	38 Mendota Avenue	36 Pond Junction	90610	91	t	1
269	New York	Albany	45691 Bartelt Junction	29101 Union Parkway	12227	91	f	1
270	District of Columbia	Washington	912 Waywood Point	59 Dryden Road	20530	90	f	1
271	Hawaii	Honolulu	54 Lindbergh Drive	25413 Atwood Way	96835	40	f	1
272	New York	New York City	1 Towne Way	016 Nancy Crossing	10260	60	f	1
273	California	San Diego	7 Artisan Avenue	582 Mallory Street	92170	15	f	1
274	Florida	Jacksonville	88 Bashford Alley	64361 Declaration Hill	32244	33	f	1
275	New Mexico	Albuquerque	2 Eagle Crest Park	95 Loomis Court	87105	46	f	1
276	New York	Schenectady	47 Hermina Trail	11 Hagan Hill	12325	35	t	1
277	Texas	San Antonio	57944 Oneill Pass	7 Muir Terrace	78230	92	f	1
278	California	Los Angeles	500 Grover Lane	5 Reindahl Hill	90010	47	t	1
279	California	Los Angeles	08802 Namekagon Trail	67 Anderson Terrace	90101	4	t	1
280	Florida	Miami	111 Dottie Street	072 Quincy Road	33129	74	f	1
281	Texas	Austin	5082 Warbler Way	57011 Shopko Junction	78721	38	f	1
282	Florida	Lake Worth	29125 Marquette Street	029 Schiller Pass	33462	5	t	1
283	Tennessee	Nashville	8 Farragut Court	22073 Little Fleur Lane	37228	22	f	1
284	California	Los Angeles	678 Clarendon Place	498 Transport Junction	90087	18	t	1
285	California	Fresno	4 Fuller Point	063 Scofield Avenue	93786	46	f	1
286	Iowa	Des Moines	052 Rusk Plaza	5430 Briar Crest Hill	50335	92	f	1
287	Iowa	Des Moines	97969 Division Trail	0605 Marcy Junction	50347	61	t	1
288	Georgia	Atlanta	5479 Messerschmidt Center	8 Talmadge Lane	30328	77	t	1
289	Florida	Naples	53661 Donald Circle	304 Cordelia Parkway	34114	2	f	1
290	Iowa	Des Moines	6 Washington Road	6278 Katie Place	50320	38	t	1
291	Utah	Ogden	98 Northport Point	8 Linden Trail	84409	61	f	1
292	Tennessee	Knoxville	62968 Weeping Birch Drive	678 Leroy Alley	37914	81	f	1
293	California	San Luis Obispo	576 Melby Place	04411 Manufacturers Street	93407	63	f	1
294	California	Los Angeles	80 Scoville Court	6982 Nancy Terrace	90015	99	f	1
295	Louisiana	New Orleans	4 Meadow Vale Circle	09 Westend Road	70116	48	t	1
296	Indiana	South Bend	730 Ronald Regan Plaza	031 Mesta Lane	46699	95	t	1
297	Texas	Dallas	408 Elmside Place	895 Ohio Terrace	75265	63	f	1
298	Indiana	Evansville	530 West Way	27172 Stone Corner Road	47719	86	t	1
299	Georgia	Savannah	135 Hermina Way	476 Shasta Road	31422	59	t	1
300	North Carolina	Charlotte	51579 Kinsman Parkway	1 Elka Plaza	28225	96	t	1
\.


--
-- TOC entry 3330 (class 0 OID 16392)
-- Dependencies: 211
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, user_id, name, email, active) FROM stdin;
1	1	Thoughtworks	qangelo0@mail.ru	f
2	1	Zoomlounge	nmcnaughton1@tumblr.com	f
3	1	Teklist	twinsbury2@surveymonkey.com	f
4	1	Topiczoom	jmulhall3@mac.com	f
5	1	Lajo	jstronach4@umn.edu	f
6	1	Ailane	brapper5@msu.edu	f
7	1	Jaxbean	kgedney6@mysql.com	f
8	1	Thoughtbridge	amattek7@theatlantic.com	f
9	1	Thoughtworks	laustwick8@zimbio.com	f
10	1	Buzzshare	esambiedge9@rambler.ru	t
11	1	Devify	mmomforda@dell.com	f
12	1	Mudo	tdulsonb@wordpress.com	t
13	1	Babblestorm	adanitc@nature.com	t
14	1	BlogXS	ahansed@alibaba.com	t
15	1	Meevee	gseckere@ted.com	t
16	1	Ainyx	dzoanef@washingtonpost.com	t
17	1	Wikido	dstarcksg@mit.edu	f
18	1	Meeveo	kettritchh@house.gov	t
19	1	Flashspan	dgarhami@google.co.uk	f
20	1	Omba	haggettj@alexa.com	f
21	1	Cogilith	ainchboardk@gravatar.com	f
22	1	Yoveo	dfulstowl@blog.com	f
23	1	Digitube	tovesenm@wisc.edu	t
24	1	Skyba	apoynorn@typepad.com	t
25	1	Talane	fhabbeshawo@dot.gov	t
26	1	Edgetag	uevasonp@wiley.com	f
27	1	Oyoyo	kwimburyq@paypal.com	t
28	1	Blogspan	tfillanr@sbwire.com	t
29	1	Browseblab	zruburys@si.edu	t
30	1	Gigabox	cleggist@uiuc.edu	f
31	1	Divavu	hdaynteru@google.co.uk	t
32	1	Thoughtbeat	bclyantv@aboutads.info	f
33	1	Janyx	bkondratovichw@webmd.com	t
34	1	Plambee	missakovx@wsj.com	f
35	1	Skyndu	afearony@ehow.com	f
36	1	Bluejam	stesimonz@xing.com	t
37	1	Skyba	chuddart10@netscape.com	f
38	1	Chatterbridge	cfeatenby11@icq.com	t
39	1	Skyba	oedrich12@webs.com	t
40	1	Vinder	alahrs13@mayoclinic.com	t
41	1	Browsecat	kkettley14@stanford.edu	f
42	1	Eidel	alangton15@berkeley.edu	f
43	1	Blogspan	mkohlert16@odnoklassniki.ru	t
44	1	Viva	ssorrel17@apple.com	t
45	1	Latz	crominov18@pcworld.com	t
46	1	Avavee	ekirkbride19@free.fr	t
47	1	Devify	lrauprich1a@tamu.edu	f
48	1	Tazz	mmatushevich1b@miibeian.gov.cn	f
49	1	Bluezoom	cpatesel1c@oracle.com	t
50	1	Chatterbridge	gstrathearn1d@aboutads.info	t
51	1	Topdrive	tbrinsford1e@japanpost.jp	t
52	1	Browsetype	wcours1f@smugmug.com	f
53	1	Jaxnation	gsale1g@cnet.com	f
54	1	Brainbox	bladlow1h@linkedin.com	t
55	1	Riffpedia	jdyshart1i@mapy.cz	f
56	1	Realbuzz	woneil1j@posterous.com	f
57	1	Voomm	twanden1k@pagesperso-orange.fr	f
58	1	Jaloo	cfluit1l@ycombinator.com	t
59	1	Devcast	wjuett1m@apache.org	f
60	1	Kimia	dfratczak1n@about.me	f
61	1	Mydeo	bmatuska1o@indiegogo.com	f
62	1	Leenti	obourdel1p@furl.net	f
63	1	Skipfire	gwinspare1q@nhs.uk	t
64	1	Babblestorm	dmacneilley1r@ihg.com	f
65	1	Zoomzone	vsiaskowski1s@loc.gov	t
66	1	Photobean	mmacrury1t@wiley.com	t
67	1	Babbleblab	tclaworth1u@cafepress.com	f
68	1	Zazio	clinham1v@goodreads.com	f
69	1	Youtags	jedgars1w@plala.or.jp	f
70	1	Devpulse	bkohlerman1x@histats.com	t
71	1	Voonte	lhead1y@is.gd	t
72	1	Kwimbee	dfargher1z@howstuffworks.com	f
73	1	Realpoint	vstilly20@chron.com	f
74	1	Quinu	fgieves21@stanford.edu	t
75	1	Feedspan	lswatton22@sbwire.com	f
76	1	Dynazzy	bponsford23@google.co.jp	t
77	1	Talane	cmilmo24@dailymotion.com	f
78	1	Quimba	hbuchett25@newyorker.com	f
79	1	Edgewire	ablucher26@yellowbook.com	t
80	1	Jabbersphere	rgilyatt27@webnode.com	t
81	1	Browsedrive	rmiebes28@tiny.cc	f
82	1	Mita	vhansford29@soup.io	t
83	1	Meetz	bisaaksohn2a@paginegialle.it	f
84	1	Fatz	bmollindinia2b@uol.com.br	f
85	1	Avamm	lbritten2c@ebay.co.uk	t
86	1	Quatz	alarrington2d@people.com.cn	t
87	1	Trilia	dfolkard2e@phoca.cz	f
88	1	Quinu	gfulstow2f@tuttocitta.it	t
89	1	Jabbercube	smcpartlin2g@fc2.com	t
90	1	Skilith	mgabey2h@blogs.com	t
91	1	Riffpedia	gstrodder2i@dedecms.com	f
92	1	Wikivu	klowis2j@bloomberg.com	f
93	1	Twitterworks	tkenneford2k@netvibes.com	f
94	1	Fivespan	ejackett2l@drupal.org	t
95	1	Wordpedia	kwhyte2m@mozilla.org	f
96	1	Skidoo	adales2n@dagondesign.com	f
97	1	Twinte	gglendza2o@spiegel.de	f
98	1	Linktype	jmarjot2p@simplemachines.org	t
99	1	Tagtune	weverist2q@nba.com	t
100	1	Fiveclub	avannoort2r@usgs.gov	f
\.


--
-- TOC entry 3332 (class 0 OID 16399)
-- Dependencies: 213
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, name, password) FROM stdin;
1	admin	admin	$2a$10$l7WSU87NolFkjas/e5DQye3ImIi.VKGAwWXATOYKP/2J8tZ/suBDG
\.


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 210
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 300, true);


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 212
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 100, true);


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 3181 (class 2606 OID 16407)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3184 (class 2606 OID 16409)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 16411)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3179 (class 1259 OID 16412)
-- Name: addresses_client_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX addresses_client_id_index ON public.addresses USING btree (client_id);


--
-- TOC entry 3182 (class 1259 OID 16413)
-- Name: addresses_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX addresses_user_id_index ON public.addresses USING btree (user_id);


--
-- TOC entry 3185 (class 1259 OID 16414)
-- Name: clients_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX clients_user_id_index ON public.clients USING btree (user_id);


--
-- TOC entry 3188 (class 2606 OID 16415)
-- Name: clients clients_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2022-04-03 01:39:10 UTC

--
-- PostgreSQL database dump complete
--

