--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: crm_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crm_client (
    id bigint NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    mobile character varying(20) NOT NULL,
    company_name character varying(250) NOT NULL,
    existing boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    sales_contact_id integer NOT NULL
);


ALTER TABLE public.crm_client OWNER TO postgres;

--
-- Name: crm_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crm_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crm_client_id_seq OWNER TO postgres;

--
-- Name: crm_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crm_client_id_seq OWNED BY public.crm_client.id;


--
-- Name: crm_contract; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crm_contract (
    id bigint NOT NULL,
    status boolean NOT NULL,
    amount double precision NOT NULL,
    payment_due timestamp with time zone NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    client_id bigint NOT NULL,
    sales_contact_id integer NOT NULL
);


ALTER TABLE public.crm_contract OWNER TO postgres;

--
-- Name: crm_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crm_contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crm_contract_id_seq OWNER TO postgres;

--
-- Name: crm_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crm_contract_id_seq OWNED BY public.crm_contract.id;


--
-- Name: crm_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crm_event (
    id bigint NOT NULL,
    attendees integer NOT NULL,
    event_date timestamp with time zone NOT NULL,
    notes text NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    client_id bigint NOT NULL,
    support_contact_id integer NOT NULL,
    event_completed boolean NOT NULL
);


ALTER TABLE public.crm_event OWNER TO postgres;

--
-- Name: crm_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crm_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crm_event_id_seq OWNER TO postgres;

--
-- Name: crm_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crm_event_id_seq OWNED BY public.crm_event.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: crm_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crm_client ALTER COLUMN id SET DEFAULT nextval('public.crm_client_id_seq'::regclass);


--
-- Name: crm_contract id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crm_contract ALTER COLUMN id SET DEFAULT nextval('public.crm_contract_id_seq'::regclass);


--
-- Name: crm_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crm_event ALTER COLUMN id SET DEFAULT nextval('public.crm_event_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
2	sales_team
1	support_team
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
7	2	32
8	2	28
9	2	36
10	1	32
11	1	28
12	1	36
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add client	7	add_client
26	Can change client	7	change_client
27	Can delete client	7	delete_client
28	Can view client	7	view_client
29	Can add event	8	add_event
30	Can change event	8	change_event
31	Can delete event	8	delete_event
32	Can view event	8	view_event
33	Can add contract	9	add_contract
34	Can change contract	9	change_contract
35	Can delete contract	9	delete_contract
36	Can view contract	9	view_contract
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
9	pbkdf2_sha256$260000$ROUPYr5j7d1zGbXrfwlCPz$lCoXkX5Tg2HUOoSi68loJ67NNiASJuoxB48mUspjOBU=	2021-08-11 13:53:17.578579+02	f	test2				t	t	2021-08-11 13:51:52+02
3	pbkdf2_sha256$260000$brEC6vmrkQQnxKw9LyP95u$igDQDJ+ZcdZBfWxkICePOk8RaB/L7qUGO1B5lFOa2Vw=	2021-08-11 13:58:41.378508+02	f	luc	luc	hochard	luc.hochard@gmail.com	t	t	2021-08-10 16:03:27+02
1	pbkdf2_sha256$260000$Y7zZMogx8As5qFm23HsAdK$IiANSILWp+rclw6b3NDnKWi+yyfSzpjxD/9hgm0XRCU=	2021-08-11 14:04:30.281569+02	t	admin				t	t	2021-08-09 17:54:48.081419+02
2	pbkdf2_sha256$260000$H2RNSa4E5ndSkHhjqeCjOD$D4ahFJRP5Pvk6vmQSqzLJi6f5VDjpHm5z0h6bCiZ9Z8=	2021-08-11 13:17:58.068594+02	f	yoan	yoan	borger	yoan.borger@gmail.com	t	t	2021-08-09 20:04:23+02
8	pbkdf2_sha256$260000$Ebn3tgNihKcp1IoYZ2Jwp6$uZEynbheEbf4MeXVbFYTWxVTR09TaZnyA45JODz8e40=	2021-08-11 13:52:22.813132+02	f	test				t	t	2021-08-11 13:51:06+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	2
2	3	1
4	8	2
5	9	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: crm_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crm_client (id, first_name, last_name, email, phone, mobile, company_name, existing, date_created, date_updated, sales_contact_id) FROM stdin;
16	Test	Test	Test.Test@gmail.com	0768123456	0768123456	Test Industries	t	2021-08-11 14:42:33.174+02	2021-08-11 14:42:33.174+02	2
5	Test1	Test1	Test.Test@gmail.com	0768123456	0768123456	Test1 Industries	t	2021-08-10 16:57:16.546224+02	2021-08-11 14:47:43.69127+02	2
\.


--
-- Data for Name: crm_contract; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crm_contract (id, status, amount, payment_due, date_created, date_updated, client_id, sales_contact_id) FROM stdin;
2	t	5000	2022-05-05 20:00:00+02	2021-08-10 20:40:26.120339+02	2021-08-10 20:40:26.120339+02	5	2
\.


--
-- Data for Name: crm_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crm_event (id, attendees, event_date, notes, date_created, date_updated, client_id, support_contact_id, event_completed) FROM stdin;
3	1000	2022-04-02 14:00:00+02	C'est un grand événement !	2021-08-10 21:16:34.401577+02	2021-08-10 21:16:34.401577+02	5	3	f
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-08-09 18:43:18.053101+02	1	support_team	1	[{"added": {}}]	3	1
2	2021-08-09 18:43:52.665818+02	2	sales_team	1	[{"added": {}}]	3	1
3	2021-08-09 20:04:23.61633+02	2	yoan	1	[{"added": {}}]	4	1
4	2021-08-09 20:05:20.154496+02	2	yoan	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]	4	1
5	2021-08-10 16:02:43.301923+02	2	yoan	2	[]	4	1
6	2021-08-10 16:03:27.682999+02	3	luc	1	[{"added": {}}]	4	1
7	2021-08-10 16:04:10.638183+02	3	luc	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]	4	1
8	2021-08-10 16:43:34.742333+02	1	Client object (1)	3		7	1
9	2021-08-10 17:34:17.059692+02	6	Client object (6)	2	[{"changed": {"fields": ["First name"]}}]	7	1
10	2021-08-10 17:34:27.905349+02	6	Client object (6)	3		7	1
11	2021-08-10 17:41:40.40206+02	7	Client object (7)	3		7	1
12	2021-08-10 17:46:53.767936+02	8	Client object (8)	3		7	1
13	2021-08-10 18:07:19.760484+02	5	Client object (5)	2	[]	7	1
14	2021-08-10 18:07:26.834172+02	5	Client object (5)	2	[]	7	1
15	2021-08-10 18:09:09.927424+02	5	Client object (5)	2	[]	7	1
16	2021-08-10 18:14:20.400274+02	9	Client object (9)	3		7	1
17	2021-08-10 18:20:47.310423+02	10	Client object (10)	3		7	1
18	2021-08-10 19:22:50.033047+02	4	Marc	1	[{"added": {}}]	4	1
19	2021-08-10 19:23:00.531397+02	4	Marc	2	[{"changed": {"fields": ["Groups"]}}]	4	1
20	2021-08-10 19:23:24.229774+02	4	Marc	3		4	1
21	2021-08-10 20:26:30.450755+02	14	Client object (14)	3		7	1
22	2021-08-10 20:26:30.463626+02	13	Client object (13)	3		7	1
23	2021-08-10 20:26:30.465059+02	12	Client object (12)	3		7	1
24	2021-08-10 20:26:30.466241+02	11	Client object (11)	3		7	1
25	2021-08-10 21:09:08.418517+02	2	Event object (2)	3		8	1
26	2021-08-10 21:29:08.816764+02	5	test	3		4	1
27	2021-08-10 21:36:56.480621+02	7	test	3		4	1
28	2021-08-10 21:36:56.482622+02	6	toto	3		4	1
29	2021-08-11 13:05:34.723994+02	2	yoan	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
30	2021-08-11 13:06:35.83333+02	3	luc	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
31	2021-08-11 13:17:20.794239+02	2	sales_team	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
32	2021-08-11 13:17:40.181933+02	1	support_team	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
33	2021-08-11 13:21:46.967916+02	2	sales_team	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
34	2021-08-11 13:21:56.088805+02	1	support_team	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
35	2021-08-11 13:25:24.045897+02	2	sales_team	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
36	2021-08-11 13:25:40.638102+02	1	support_team	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
37	2021-08-11 13:51:07.030056+02	8	test	1	[{"added": {}}]	4	1
38	2021-08-11 13:51:18.856432+02	8	test	2	[{"changed": {"fields": ["Staff status", "Groups"]}}]	4	1
39	2021-08-11 13:51:52.384126+02	9	test2	1	[{"added": {}}]	4	1
40	2021-08-11 13:52:01.831512+02	9	test2	2	[{"changed": {"fields": ["Staff status", "Groups"]}}]	4	1
41	2021-08-11 13:54:55.011044+02	3	luc	2	[{"changed": {"fields": ["password"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	crm	client
8	crm	event
9	crm	contract
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-08-07 22:22:27.82641+02
2	auth	0001_initial	2021-08-07 22:22:27.941515+02
3	admin	0001_initial	2021-08-07 22:22:27.973543+02
4	admin	0002_logentry_remove_auto_add	2021-08-07 22:22:27.982551+02
5	admin	0003_logentry_add_action_flag_choices	2021-08-07 22:22:27.992561+02
6	contenttypes	0002_remove_content_type_name	2021-08-07 22:22:28.018584+02
7	auth	0002_alter_permission_name_max_length	2021-08-07 22:22:28.028595+02
8	auth	0003_alter_user_email_max_length	2021-08-07 22:22:28.038604+02
9	auth	0004_alter_user_username_opts	2021-08-07 22:22:28.047612+02
10	auth	0005_alter_user_last_login_null	2021-08-07 22:22:28.058621+02
11	auth	0006_require_contenttypes_0002	2021-08-07 22:22:28.061624+02
12	auth	0007_alter_validators_add_error_messages	2021-08-07 22:22:28.070632+02
13	auth	0008_alter_user_username_max_length	2021-08-07 22:22:28.092653+02
14	auth	0009_alter_user_last_name_max_length	2021-08-07 22:22:28.102662+02
15	auth	0010_alter_group_name_max_length	2021-08-07 22:22:28.113671+02
16	auth	0011_update_proxy_permissions	2021-08-07 22:22:28.12368+02
17	auth	0012_alter_user_first_name_max_length	2021-08-07 22:22:28.132688+02
18	sessions	0001_initial	2021-08-07 22:22:28.149705+02
19	crm	0001_initial	2021-08-09 18:45:51.503352+02
20	crm	0002_alter_client_email	2021-08-10 16:45:46.770797+02
21	crm	0003_alter_client_first_name	2021-08-10 17:39:34.300535+02
22	crm	0004_alter_client_first_name	2021-08-10 17:55:21.235549+02
23	crm	0005_alter_client_sales_contact	2021-08-10 18:05:18.787282+02
24	crm	0006_auto_20210810_1819	2021-08-10 18:19:38.56945+02
25	crm	0007_auto_20210810_2115	2021-08-10 21:16:03.4837+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
abfoxfd4yek40arrxqxe8m356wyf4z3i	.eJxVjDsOwjAQBe_iGlneZP1ZSnrOYK1_OIAcKU4qxN0hUgpo38y8l_C8rdVvPS9-SuIsQJx-t8DxkdsO0p3bbZZxbusyBbkr8qBdXueUn5fD_Tuo3Ou3NpY1ARFAicBaURqKGq1GJAcIIdkSYkE0ZlRkCQce2ZWgDBRUjkC8P7TlNo0:1mDmox:JvPqRPi-DVUXQ4izc4Y8hEVKiZSFfTESwFdmgHqmB_8	2021-08-25 13:54:55.020939+02
zbguakvaqdcsteysjakbrbhtuu7i8tjj	.eJxVjLsOwjAMAP8lM4ri2m1iRna-IXIekAJKpKadEP-OKnWA9e50b-VlW4vfel78nNRZoTr9siDxmesu0kPqvenY6rrMQe-JPmzX15by63K0f4MivezbPAIChoBjYmAmJAc2RcMAKIMYw-42jYIuopmAaQg2k7OJHFsiVp8vps42AA:1mDmsb:yRZn4wdlk2UCMTBLfVfYlKbO7Plcr7Nb15VteFmHjbg	2021-08-25 13:58:41.38051+02
rq22dypb909nz64wu96ilyiny99czrhw	.eJxVjDsOwjAQBe_iGlneZP1ZSnrOYK1_OIAcKU4qxN0hUgpo38y8l_C8rdVvPS9-SuIsQJx-t8DxkdsO0p3bbZZxbusyBbkr8qBdXueUn5fD_Tuo3Ou3NpY1ARFAicBaURqKGq1GJAcIIdkSYkE0ZlRkCQce2ZWgDBRUjkC8P7TlNo0:1mDmyE:GpMcgv68LwPtAO1NTVzOitg0Q2ohezxWtOKAz53QTuA	2021-08-25 14:04:30.283572+02
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 12, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 5, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 9, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: crm_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.crm_client_id_seq', 16, true);


--
-- Name: crm_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.crm_contract_id_seq', 2, true);


--
-- Name: crm_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.crm_event_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 41, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: crm_client crm_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crm_client
    ADD CONSTRAINT crm_client_pkey PRIMARY KEY (id);


--
-- Name: crm_contract crm_contract_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crm_contract
    ADD CONSTRAINT crm_contract_pkey PRIMARY KEY (id);


--
-- Name: crm_event crm_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crm_event
    ADD CONSTRAINT crm_event_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: crm_client_sales_contact_id_e9672697; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX crm_client_sales_contact_id_e9672697 ON public.crm_client USING btree (sales_contact_id);


--
-- Name: crm_contract_client_id_a6b28105; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX crm_contract_client_id_a6b28105 ON public.crm_contract USING btree (client_id);


--
-- Name: crm_contract_sales_contact_id_0305b5fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX crm_contract_sales_contact_id_0305b5fb ON public.crm_contract USING btree (sales_contact_id);


--
-- Name: crm_event_client_id_279d9e47; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX crm_event_client_id_279d9e47 ON public.crm_event USING btree (client_id);


--
-- Name: crm_event_support_contact_id_b18d124d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX crm_event_support_contact_id_b18d124d ON public.crm_event USING btree (support_contact_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_client crm_client_sales_contact_id_e9672697_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crm_client
    ADD CONSTRAINT crm_client_sales_contact_id_e9672697_fk_auth_user_id FOREIGN KEY (sales_contact_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_contract crm_contract_client_id_a6b28105_fk_crm_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crm_contract
    ADD CONSTRAINT crm_contract_client_id_a6b28105_fk_crm_client_id FOREIGN KEY (client_id) REFERENCES public.crm_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_contract crm_contract_sales_contact_id_0305b5fb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crm_contract
    ADD CONSTRAINT crm_contract_sales_contact_id_0305b5fb_fk_auth_user_id FOREIGN KEY (sales_contact_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_event crm_event_client_id_279d9e47_fk_crm_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crm_event
    ADD CONSTRAINT crm_event_client_id_279d9e47_fk_crm_client_id FOREIGN KEY (client_id) REFERENCES public.crm_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_event crm_event_support_contact_id_b18d124d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crm_event
    ADD CONSTRAINT crm_event_support_contact_id_b18d124d_fk_auth_user_id FOREIGN KEY (support_contact_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

