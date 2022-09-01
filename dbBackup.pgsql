--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-1.pgdg20.04+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO logikaadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO logikaadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO logikaadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO logikaadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO logikaadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO logikaadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: logikaadmin
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


ALTER TABLE public.auth_user OWNER TO logikaadmin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO logikaadmin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO logikaadmin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO logikaadmin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO logikaadmin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO logikaadmin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: logikaadmin
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


ALTER TABLE public.django_admin_log OWNER TO logikaadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO logikaadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO logikaadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO logikaadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO logikaadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO logikaadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO logikaadmin;

--
-- Name: home_globalgroup; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.home_globalgroup (
    id integer NOT NULL,
    group_id character varying(20) NOT NULL,
    group_name character varying(256) NOT NULL,
    group_location character varying(256) NOT NULL,
    group_teacher character varying(256) NOT NULL,
    group_manager character varying(256) NOT NULL,
    group_region character varying(256)
);


ALTER TABLE public.home_globalgroup OWNER TO logikaadmin;

--
-- Name: home_globalgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.home_globalgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_globalgroup_id_seq OWNER TO logikaadmin;

--
-- Name: home_globalgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.home_globalgroup_id_seq OWNED BY public.home_globalgroup.id;


--
-- Name: home_group; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.home_group (
    id integer NOT NULL,
    group_id character varying(20) NOT NULL,
    group_name character varying(256) NOT NULL,
    group_location character varying(256) NOT NULL,
    group_teacher character varying(256) NOT NULL,
    group_manager character varying(256) NOT NULL,
    group_course character varying(256) NOT NULL,
    report_date_start character varying(256) NOT NULL,
    report_date_end character varying(256) NOT NULL,
    total integer,
    attended integer
);


ALTER TABLE public.home_group OWNER TO logikaadmin;

--
-- Name: home_group_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.home_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_group_id_seq OWNER TO logikaadmin;

--
-- Name: home_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.home_group_id_seq OWNED BY public.home_group.id;


--
-- Name: home_location; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.home_location (
    id integer NOT NULL,
    standart_name character varying(256),
    lms_location_name character varying(256) NOT NULL,
    region character varying(200),
    client_manager character varying(256),
    territorial_manager character varying(256),
    regional_manager character varying(256),
    tutor character varying(256)
);


ALTER TABLE public.home_location OWNER TO logikaadmin;

--
-- Name: home_location_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.home_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_location_id_seq OWNER TO logikaadmin;

--
-- Name: home_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.home_location_id_seq OWNED BY public.home_location.id;


--
-- Name: home_payment; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.home_payment (
    id integer NOT NULL,
    group_manager character varying(256) NOT NULL,
    client_name character varying(256) NOT NULL,
    client_lms_id character varying(256) NOT NULL,
    group_course character varying(256) NOT NULL,
    bussiness character varying(256) NOT NULL,
    report_date_start character varying(256) NOT NULL,
    report_date_end character varying(256) NOT NULL
);


ALTER TABLE public.home_payment OWNER TO logikaadmin;

--
-- Name: home_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.home_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_payment_id_seq OWNER TO logikaadmin;

--
-- Name: home_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.home_payment_id_seq OWNED BY public.home_payment.id;


--
-- Name: home_report; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.home_report (
    id integer NOT NULL,
    location_name character varying(256) NOT NULL,
    region character varying(256) NOT NULL,
    total integer NOT NULL,
    attended integer NOT NULL,
    payments integer NOT NULL,
    conversion double precision NOT NULL,
    start_date date,
    end_date date,
    students_without_amo character varying(1024),
    territorial_manager character varying(256) NOT NULL,
    business character varying(128),
    regional_manager character varying(256),
    client_manager character varying(256)
);


ALTER TABLE public.home_report OWNER TO logikaadmin;

--
-- Name: home_report_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.home_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_report_id_seq OWNER TO logikaadmin;

--
-- Name: home_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.home_report_id_seq OWNED BY public.home_report.id;


--
-- Name: home_student; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.home_student (
    id integer NOT NULL,
    lms_id character varying(256) NOT NULL,
    student_name character varying(256) NOT NULL,
    group_id character varying(256) NOT NULL,
    group_location character varying(256),
    amo_id character varying(100),
    region character varying(256)
);


ALTER TABLE public.home_student OWNER TO logikaadmin;

--
-- Name: home_student_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.home_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_student_id_seq OWNER TO logikaadmin;

--
-- Name: home_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.home_student_id_seq OWNED BY public.home_student.id;


--
-- Name: home_studentamoref; Type: TABLE; Schema: public; Owner: logikaadmin
--

CREATE TABLE public.home_studentamoref (
    id integer NOT NULL,
    lms_id character varying(20) NOT NULL,
    amo_id character varying(20) NOT NULL,
    attended character varying(10) NOT NULL,
    group_id character varying(20) NOT NULL,
    report_end character varying(64) NOT NULL,
    report_start character varying(64) NOT NULL
);


ALTER TABLE public.home_studentamoref OWNER TO logikaadmin;

--
-- Name: home_studentamoref_id_seq; Type: SEQUENCE; Schema: public; Owner: logikaadmin
--

CREATE SEQUENCE public.home_studentamoref_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_studentamoref_id_seq OWNER TO logikaadmin;

--
-- Name: home_studentamoref_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: logikaadmin
--

ALTER SEQUENCE public.home_studentamoref_id_seq OWNED BY public.home_studentamoref.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: home_globalgroup id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_globalgroup ALTER COLUMN id SET DEFAULT nextval('public.home_globalgroup_id_seq'::regclass);


--
-- Name: home_group id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_group ALTER COLUMN id SET DEFAULT nextval('public.home_group_id_seq'::regclass);


--
-- Name: home_location id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_location ALTER COLUMN id SET DEFAULT nextval('public.home_location_id_seq'::regclass);


--
-- Name: home_payment id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_payment ALTER COLUMN id SET DEFAULT nextval('public.home_payment_id_seq'::regclass);


--
-- Name: home_report id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_report ALTER COLUMN id SET DEFAULT nextval('public.home_report_id_seq'::regclass);


--
-- Name: home_student id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_student ALTER COLUMN id SET DEFAULT nextval('public.home_student_id_seq'::regclass);


--
-- Name: home_studentamoref id; Type: DEFAULT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_studentamoref ALTER COLUMN id SET DEFAULT nextval('public.home_studentamoref_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.auth_group (id, name) FROM stdin;
1	admin
3	territorial_manager
2	regional
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
37	1	37
38	1	38
39	1	39
40	1	40
41	1	41
42	1	42
43	1	43
44	1	44
45	1	45
46	1	46
47	1	47
48	1	48
49	1	49
50	1	50
51	1	51
52	1	52
53	2	33
54	2	34
55	2	35
56	2	36
57	2	42
58	2	44
59	2	13
60	2	14
61	2	15
62	2	16
63	3	33
64	3	34
65	3	35
66	3	36
67	3	40
68	3	44
69	3	48
70	3	52
71	2	32
72	2	40
73	2	48
74	2	52
75	2	28
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: logikaadmin
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
25	Can add global group	7	add_globalgroup
26	Can change global group	7	change_globalgroup
27	Can delete global group	7	delete_globalgroup
28	Can view global group	7	view_globalgroup
29	Can add group	8	add_group
30	Can change group	8	change_group
31	Can delete group	8	delete_group
32	Can view group	8	view_group
33	Can add location	9	add_location
34	Can change location	9	change_location
35	Can delete location	9	delete_location
36	Can view location	9	view_location
37	Can add payment	10	add_payment
38	Can change payment	10	change_payment
39	Can delete payment	10	delete_payment
40	Can view payment	10	view_payment
41	Can add report	11	add_report
42	Can change report	11	change_report
43	Can delete report	11	delete_report
44	Can view report	11	view_report
45	Can add student	12	add_student
46	Can change student	12	change_student
47	Can delete student	12	delete_student
48	Can view student	12	view_student
49	Can add student amo ref	13	add_studentamoref
50	Can change student amo ref	13	change_studentamoref
51	Can delete student amo ref	13	delete_studentamoref
52	Can view student amo ref	13	view_studentamoref
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
12	pbkdf2_sha256$260000$45CWC24Ld2vaxd4I86jmRH$3SYz4ODVwskxssvia9JegZTqb8DDyQRcU3MXbRXFiFY=	2022-08-22 09:11:07.704996+00	f	hranovska_ira	Іра	Грановська		t	t	2022-08-22 09:06:06+00
13	pbkdf2_sha256$260000$moHHOZ7eqcWp3Q0UxZQuLP$8chzUAptsKgpnbapeHb1goepARoyQsFRYJf3JN7DA/8=	2022-08-22 09:11:28.885497+00	f	zhmur_nadia	Надя	Жмур		t	t	2022-08-22 09:06:27+00
14	pbkdf2_sha256$260000$R1BvmAhJo6YT17okbMNdfq$Ca+k859KIrz+/FZ0P31ailqnd0IU0wk1g9d/nxvVs/s=	2022-08-22 09:11:49.222261+00	f	isaryk_liuba	Люба	Ісарик		t	t	2022-08-22 09:06:58+00
6	pbkdf2_sha256$260000$VTGe8zSBRcC4wj8Ygh2cvs$JrNkGBclkWTYOm1u3pawzFGOLiEIRDAaFG5PpteTbd0=	2022-08-22 10:44:22.019817+00	f	shcherban_oleksandr	Олександр	Щербань		t	t	2022-08-22 08:41:10+00
15	pbkdf2_sha256$260000$I3EWcoZ8b9dkPvBLQQ2Wp1$JiuIaXvSbI0dk6K+XfV8ap30n0T6c8hIVJDO7tdZels=	2022-08-22 09:12:07.344196+00	f	krasnik_olha	Ольга	Краснік		t	t	2022-08-22 09:07:20+00
16	pbkdf2_sha256$260000$1UfikNCV282xRrTn9JDDxf$2LxQ1HnnNk9AhEUC3g5Vaz+6NgBHatymsOHrSHkLuE0=	2022-08-22 09:12:42.732625+00	f	nikolayenko_dina	Діна	Ніколаєнко		t	t	2022-08-22 09:07:38+00
4	pbkdf2_sha256$260000$zjx7FolPI0sZ83ZM8Jfo8T$8pqxSO3//j7r7Fvp7UEUPxlc0kjl86KeJRAtEzYu2Hg=	2022-08-22 10:55:39.732896+00	f	oleksii_matiushenko	Олексій	Матюшенко		t	t	2022-08-19 19:35:20+00
11	pbkdf2_sha256$260000$s9DdkdgBTcD5tIJ9873GZp$P5aECNBrAw6/89MXTgVFn3Gwpu6xKZjqbFP9LIOS230=	2022-08-22 11:04:45.483605+00	f	hladyshko_vitalina	Віталіна	Гладишко		t	t	2022-08-22 09:05:45+00
9	pbkdf2_sha256$260000$5FTOc0sR2CD2JGGlOz00Iw$XueiUqSxRYJF4Hg7akfkgwxjwY67Pvn5uFYPEZ46jzo=	2022-08-22 11:18:28.639956+00	f	smidonova_olha_tm	Ольга	Смідонова		t	t	2022-08-22 08:58:17+00
2	pbkdf2_sha256$260000$QcVGRkpUKSlrwQ0uSdWZsI$MbEranURePTo8/zN9QxNK8NkKZm5IwGavl6biWaMTc0=	2022-08-22 11:18:53.038634+00	f	olha_smidonova	Ольга	Смідонова		t	t	2022-08-19 19:33:16+00
3	pbkdf2_sha256$260000$35ewn5wS58R5PpY2tHbbM2$5s8Fdufmwk/V9dLxneA0uD3uQSFK5HgU6FqJkHO+sUs=	2022-08-22 08:43:14.760717+00	f	mariia_roshchina	Марія	Рощина		t	t	2022-08-19 19:34:29+00
17	pbkdf2_sha256$260000$qPa9F1zAj244vc9Mk5AZIY$QLXyZzEvbOaT75rtGYV2IFmQvvlRrFhUzd4DVry+pzA=	2022-08-22 09:12:56.880952+00	f	pikalova_karina	Карина	Пикалова		t	t	2022-08-22 09:08:01+00
7	pbkdf2_sha256$260000$Oa7XusIxM4pJHO6H9bGyOQ$efdD2/62fwyTbriquMDQfzPqV6i6F2ZQifGUkFub1to=	2022-08-22 08:44:54.95972+00	f	kravchenko_olesia	Олеся	Кравченко		t	t	2022-08-22 08:41:42+00
8	pbkdf2_sha256$260000$P3b5pJcLuYAdEVuVkaipmP$tUVSLNczTU4M5e+HnrUJnm9BTjBawjkF7tiCaGGRH38=	2022-08-22 08:45:16.661032+00	f	lasota_yurii	Юрій	Ласота		t	t	2022-08-22 08:42:21+00
18	pbkdf2_sha256$260000$1GswpqWb62WRzqOkvx1bky$LHrURz1x1Au4Z9hfopYO5O3AGyPxsrm+8XX2GnF5UO4=	2022-08-22 09:13:14.944647+00	f	serheeva_viktoria	Вікторія	Сергєєва		t	t	2022-08-22 09:08:24+00
5	pbkdf2_sha256$260000$1qQxyUt2ZT2wfGVI0Ntfzg$3hxUiEThdQlCu3kJy9NSNm1YOIa0y0N5GaC0SZIt538=	2022-08-22 14:01:41.824802+00	f	shchapkova_kateryna	Катерина	Щапкова		t	t	2022-08-22 08:36:41+00
1	pbkdf2_sha256$260000$OMa164APH4wdfwROitYHPR$hGgGfEPVhufk/UNNKkYURXBvmPJQcvWd+zDO3pGwOcY=	2022-08-22 14:04:02.63617+00	t	logikaadmin				t	t	2022-08-19 11:38:22+00
19	pbkdf2_sha256$260000$W0rX3qoWYAFjwQFNQF5V5H$rMoUUj02Mltx06EfqWbtBk08LahpPjrvm8kHh5cbowY=	2022-08-22 09:13:36.080584+00	f	taran_svitlana	Светлана	Таран		t	t	2022-08-22 09:08:47+00
20	pbkdf2_sha256$260000$Xew9EcWENQqANFGnuHJTOC$iARZ9V6g19cCz6VXcHmqiEfmq7HCJ+BWOzIK56jfusQ=	2022-08-22 09:13:50.713557+00	f	shtepa_marina	Марина	Штепа		t	t	2022-08-22 09:09:10+00
21	pbkdf2_sha256$260000$LvNyOsDOh2r39dYPiHK3GM$V8qVtJ89339IRcGcP2xf0/5pYKy5640ApsEH0Hccaqw=	2022-08-22 09:14:07.633396+00	f	shcherbatiuk_artem	Артем	Щербатюк		t	t	2022-08-22 09:09:30+00
10	pbkdf2_sha256$260000$e0TatZQKoRQ7kd6z7Xq9xh$Q4dHz4zZBe8HDL+5RGVnp88V0kGR9uuEG6k0N/U2aYE=	2022-08-22 09:16:53.256235+00	f	vakhnii_viktoria	Вікторія	Вахній		t	t	2022-08-22 09:05:22+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	2
2	3	2
3	4	2
4	1	1
6	6	2
7	7	2
8	8	2
9	5	2
10	9	3
11	10	3
12	11	3
13	12	3
14	13	3
15	14	3
16	15	3
17	16	3
18	17	3
19	18	3
20	19	3
21	20	3
22	21	3
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-08-19 13:19:25.394865+00	1	asdas - asdasd - asdasdas	1	[{"added": {}}]	9	1
2	2022-08-19 13:19:35.659218+00	1	asdas - asdasd - asdasdas	3		9	1
3	2022-08-19 14:08:40.115759+00	1	admin	1	[{"added": {}}]	3	1
4	2022-08-19 19:29:08.411415+00	2	regional	1	[{"added": {}}]	3	1
5	2022-08-19 19:29:39.917473+00	3	territorial_manager	1	[{"added": {}}]	3	1
6	2022-08-19 19:29:58.838772+00	2	regional	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
7	2022-08-19 19:33:16.564856+00	2	olha_smidonova	1	[{"added": {}}]	4	1
8	2022-08-19 19:33:35.08622+00	2	olha_smidonova	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
9	2022-08-19 19:34:29.96342+00	3	mariia_roshchina	1	[{"added": {}}]	4	1
10	2022-08-19 19:34:52.167054+00	3	mariia_roshchina	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
11	2022-08-19 19:35:21.000862+00	4	oleksii_matiushenko	1	[{"added": {}}]	4	1
12	2022-08-19 19:35:34.520358+00	4	oleksii_matiushenko	2	[{"changed": {"fields": ["First name", "Last name", "Groups"]}}]	4	1
13	2022-08-19 19:35:50.216724+00	4	oleksii_matiushenko	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
14	2022-08-19 19:36:11.373632+00	1	logikaadmin	2	[{"changed": {"fields": ["Groups"]}}]	4	1
15	2022-08-19 19:52:06.041055+00	278	Горишние Плавни - ТМ 1 - Рощина Марія	2	[{"changed": {"fields": ["Territorial manager"]}}]	9	3
16	2022-08-19 19:52:11.161176+00	277	Кременчуг - ТМ 1 - Рощина Марія	2	[{"changed": {"fields": ["Territorial manager"]}}]	9	3
17	2022-08-19 19:52:18.551981+00	276	Миргород - ТМ 2 - Рощина Марія	2	[{"changed": {"fields": ["Territorial manager"]}}]	9	3
18	2022-08-19 19:52:26.359382+00	275	Полтава, Центр - ТМ 3 - Рощина Марія	2	[{"changed": {"fields": ["Territorial manager"]}}]	9	3
19	2022-08-19 19:52:32.499638+00	274	Онлайн Харьков - ТМ 1 - Рощина Марія	2	[{"changed": {"fields": ["Territorial manager"]}}]	9	3
20	2022-08-19 19:55:39.489654+00	278	Горишние Плавни - ТМ1 - Рощина Марія	2	[{"changed": {"fields": ["Territorial manager"]}}]	9	3
21	2022-08-19 19:57:10.220103+00	278	Горишние Плавни - ТМ 1 - Рощина Марія	2	[{"changed": {"fields": ["Territorial manager"]}}]	9	3
22	2022-08-19 19:59:29.480287+00	277	Кременчуг - ТМ1 - Рощина Марія	2	[{"changed": {"fields": ["Territorial manager"]}}]	9	3
23	2022-08-19 20:00:36.894278+00	277	Кременчуг - ТМ 1 - Рощина Марія	2	[{"changed": {"fields": ["Territorial manager"]}}]	9	3
24	2022-08-19 20:02:51.006298+00	277	Кременчуг - ТМ 1 - Рощина Марія	2	[]	9	3
25	2022-08-19 20:02:56.492041+00	276	Миргород - ТМ 2 - Рощина Марія	2	[]	9	3
26	2022-08-19 20:03:00.249858+00	275	Полтава, Центр - ТМ 3 - Рощина Марія	2	[]	9	3
27	2022-08-19 20:03:03.823505+00	274	Онлайн Харьков - ТМ 1 - Рощина Марія	2	[]	9	3
28	2022-08-19 20:04:38.075323+00	278	Горишние Плавни - ТМ 1 - Рощина Марія	2	[]	9	3
29	2022-08-19 20:04:56.236924+00	277	Кременчуг - ТМ1 - Рощина Марія	2	[{"changed": {"fields": ["Territorial manager"]}}]	9	3
30	2022-08-19 20:32:35.606952+00	308	Онлайн_Пікалова_Півден-Схід - Пикалова Карина - Щапкова Катерина	1	[{"added": {}}]	9	1
31	2022-08-22 08:36:42.134728+00	5	shchapkova_kateryna	1	[{"added": {}}]	4	1
32	2022-08-22 08:37:00.159952+00	5	shchapkova_kateryna	2	[{"changed": {"fields": ["First name", "Last name", "Groups"]}}]	4	1
33	2022-08-22 08:37:29.757513+00	5	shchapkova_kateryna	2	[{"changed": {"fields": ["password"]}}]	4	1
34	2022-08-22 08:41:10.856019+00	6	shcherban_oleksandr	1	[{"added": {}}]	4	1
35	2022-08-22 08:41:29.523478+00	6	shcherban_oleksandr	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
36	2022-08-22 08:41:42.803166+00	7	kravchenko_olesia	1	[{"added": {}}]	4	1
37	2022-08-22 08:42:04.115483+00	7	kravchenko_olesia	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
38	2022-08-22 08:42:21.344824+00	8	lasota_yurii	1	[{"added": {}}]	4	1
39	2022-08-22 08:42:37.57079+00	8	lasota_yurii	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
40	2022-08-22 08:46:31.798315+00	5	shchapkova_kateryna	2	[{"changed": {"fields": ["Groups"]}}]	4	1
41	2022-08-22 08:58:17.854728+00	9	smidonova_olha_tm	1	[{"added": {}}]	4	1
42	2022-08-22 08:58:29.06644+00	9	smidonova_olha_tm	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
43	2022-08-22 09:05:22.8972+00	10	vakhnii_viktoria	1	[{"added": {}}]	4	1
44	2022-08-22 09:05:35.772358+00	10	vakhnii_viktoria	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
45	2022-08-22 09:05:46.087367+00	11	hladyshko_vitalina	1	[{"added": {}}]	4	1
46	2022-08-22 09:05:57.547941+00	11	hladyshko_vitalina	2	[{"changed": {"fields": ["First name", "Last name", "Groups"]}}]	4	1
47	2022-08-22 09:06:06.52624+00	12	hranovska_ira	1	[{"added": {}}]	4	1
48	2022-08-22 09:06:18.689308+00	12	hranovska_ira	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
49	2022-08-22 09:06:27.290458+00	13	zhmur_nadia	1	[{"added": {}}]	4	1
50	2022-08-22 09:06:40.548539+00	13	zhmur_nadia	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
51	2022-08-22 09:06:58.534961+00	14	isaryk_liuba	1	[{"added": {}}]	4	1
52	2022-08-22 09:07:11.896229+00	14	isaryk_liuba	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
53	2022-08-22 09:07:20.157484+00	15	krasnik_olha	1	[{"added": {}}]	4	1
54	2022-08-22 09:07:31.639107+00	15	krasnik_olha	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
55	2022-08-22 09:07:39.034129+00	16	nikolayenko_dina	1	[{"added": {}}]	4	1
56	2022-08-22 09:07:50.596288+00	16	nikolayenko_dina	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
57	2022-08-22 09:08:02.12589+00	17	pikalova_karina	1	[{"added": {}}]	4	1
58	2022-08-22 09:08:15.355324+00	17	pikalova_karina	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
59	2022-08-22 09:08:25.058098+00	18	serheeva_viktoria	1	[{"added": {}}]	4	1
60	2022-08-22 09:08:38.922191+00	18	serheeva_viktoria	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
61	2022-08-22 09:08:47.196543+00	19	taran_svitlana	1	[{"added": {}}]	4	1
62	2022-08-22 09:08:57.56037+00	19	taran_svitlana	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
63	2022-08-22 09:09:10.817209+00	20	shtepa_marina	1	[{"added": {}}]	4	1
64	2022-08-22 09:09:21.538082+00	20	shtepa_marina	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
65	2022-08-22 09:09:30.293848+00	21	shcherbatiuk_artem	1	[{"added": {}}]	4	1
66	2022-08-22 09:09:40.484814+00	21	shcherbatiuk_artem	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
67	2022-08-22 09:52:47.164252+00	9	smidonova_olha_tm	2	[{"changed": {"fields": ["password"]}}]	4	1
68	2022-08-22 10:19:47.337029+00	11	hladyshko_vitalina	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
69	2022-08-22 10:19:57.89766+00	5	shchapkova_kateryna	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	home	globalgroup
8	home	group
9	home	location
10	home	payment
11	home	report
12	home	student
13	home	studentamoref
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-08-19 11:37:13.382697+00
2	auth	0001_initial	2022-08-19 11:37:14.766047+00
3	admin	0001_initial	2022-08-19 11:37:15.167+00
4	admin	0002_logentry_remove_auto_add	2022-08-19 11:37:15.299007+00
5	admin	0003_logentry_add_action_flag_choices	2022-08-19 11:37:15.47833+00
6	contenttypes	0002_remove_content_type_name	2022-08-19 11:37:15.7495+00
7	auth	0002_alter_permission_name_max_length	2022-08-19 11:37:15.965768+00
8	auth	0003_alter_user_email_max_length	2022-08-19 11:37:16.177662+00
9	auth	0004_alter_user_username_opts	2022-08-19 11:37:16.356064+00
10	auth	0005_alter_user_last_login_null	2022-08-19 11:37:16.571226+00
11	auth	0006_require_contenttypes_0002	2022-08-19 11:37:16.733813+00
12	auth	0007_alter_validators_add_error_messages	2022-08-19 11:37:16.901086+00
13	auth	0008_alter_user_username_max_length	2022-08-19 11:37:17.118767+00
14	auth	0009_alter_user_last_name_max_length	2022-08-19 11:37:17.335928+00
15	auth	0010_alter_group_name_max_length	2022-08-19 11:37:17.554637+00
16	auth	0011_update_proxy_permissions	2022-08-19 11:37:17.730733+00
17	auth	0012_alter_user_first_name_max_length	2022-08-19 11:37:17.946359+00
18	home	0001_initial	2022-08-19 11:37:18.420541+00
19	home	0002_location_client_manager	2022-08-19 11:37:18.629396+00
20	home	0003_alter_location_client_manager	2022-08-19 11:37:18.835997+00
21	home	0004_remove_payment_group_location	2022-08-19 11:37:19.04289+00
22	home	0005_location_territorial_manager	2022-08-19 11:37:19.252834+00
23	home	0006_report_students_without_payments	2022-08-19 11:37:19.462711+00
24	home	0007_rename_students_without_payments_report_students_without_amo	2022-08-19 11:37:19.672091+00
25	home	0008_studentamoref	2022-08-19 11:37:19.884824+00
26	home	0009_auto_20220731_2043	2022-08-19 11:37:20.215456+00
27	home	0010_report_territorial_manager	2022-08-19 11:37:20.470848+00
28	home	0011_alter_report_territorial_manager	2022-08-19 11:37:20.638422+00
29	home	0012_auto_20220807_0815	2022-08-19 11:37:20.975302+00
30	home	0013_auto_20220807_1922	2022-08-19 11:37:21.239442+00
31	home	0014_auto_20220819_1006	2022-08-19 11:37:21.494989+00
32	sessions	0001_initial	2022-08-19 11:37:21.839269+00
33	home	0015_report_business	2022-08-19 13:51:22.904944+00
34	home	0016_report_regional_manager	2022-08-19 13:59:07.367009+00
35	home	0017_report_client_manager	2022-08-22 09:23:01.308935+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
c25m3te1m45bazdfmpi3qoquuc3gc9q8	.eJxVjM0OwiAQhN-FsyH8VAoevfcZyC67StVAUtqT8d2lSQ96m8z3zbxFhG3NcWu8xJnERWhx-u0Q0pPLDugB5V5lqmVdZpS7Ig_a5FSJX9fD_TvI0HJfB3SMOoAfjQtnHgcckMD3hDcLyirLbJzH4MiiMh0M3jqTyCBQQi0-X-g_ODI:1oP1n1:VRv8F-MB3e5cTreQPfvHI_k-OFtNI6Om1xoijzsWCro	2022-09-02 13:11:55.662212+00
8yz227plqsr6brzwlw57givb3gz045tg	.eJxVjM0OwiAQhN-FsyH8VAoevfcZyC67StVAUtqT8d2lSQ96m8z3zbxFhG3NcWu8xJnERWhx-u0Q0pPLDugB5V5lqmVdZpS7Ig_a5FSJX9fD_TvI0HJfB3SMOoAfjQtnHgcckMD3hDcLyirLbJzH4MiiMh0M3jqTyCBQQi0-X-g_ODI:1oP5GL:5xKAYiocfxZEoSkGxKgpBb-3yOd6qu-p5gvod0QCMP4	2022-09-02 16:54:25.491296+00
b4cq2qzlxoly78maqlb3w3mxm38i91eg	.eJxVjM0OwiAQhN-FsyH8VAoevfcZyC67StVAUtqT8d2lSQ96m8z3zbxFhG3NcWu8xJnERWhx-u0Q0pPLDugB5V5lqmVdZpS7Ig_a5FSJX9fD_TvI0HJfB3SMOoAfjQtnHgcckMD3hDcLyirLbJzH4MiiMh0M3jqTyCBQQi0-X-g_ODI:1oPJgS:wT5d4eVA5xnS1sgZljAHSaZUc2EB6Jz5Qnrjays1BKg	2022-09-03 08:18:20.964436+00
zak87ri5r1m7oe0h1k020e4d8x236v7g	.eJxVjM0OwiAQhN-FsyH8VAoevfcZyC67StVAUtqT8d2lSQ96m8z3zbxFhG3NcWu8xJnERWhx-u0Q0pPLDugB5V5lqmVdZpS7Ig_a5FSJX9fD_TvI0HJfB3SMOoAfjQtnHgcckMD3hDcLyirLbJzH4MiiMh0M3jqTyCBQQi0-X-g_ODI:1oQ4AE:ur663GmvpvtGETjDOhQlLQpCX-pXuPMniefZ1jI9Z3U	2022-09-05 09:56:10.672494+00
tsj1mwbcje4lztntqsyzvugz41dx6zsb	.eJxVjM0OwiAQhN-FsyH8VAoevfcZyC67StVAUtqT8d2lSQ96m8z3zbxFhG3NcWu8xJnERWhx-u0Q0pPLDugB5V5lqmVdZpS7Ig_a5FSJX9fD_TvI0HJfB3SMOoAfjQtnHgcckMD3hDcLyirLbJzH4MiiMh0M3jqTyCBQQi0-X-g_ODI:1oQ5lV:wArzeaBtxwxgtApUEQMpGIORnF0D0wsrARxwGT0i88s	2022-09-05 11:38:45.104175+00
6jihtwugg8mj9e2hiwsz0gmih96bk3uj	.eJxVjDsOwjAQBe_iGllZB39CSZ8zROvdNQ4gW4qTCnF3iJQC2jcz76Um3NY8bU2WaWZ1UVadfreI9JCyA75juVVNtazLHPWu6IM2PVaW5_Vw_w4ytvytAc4o0SHYDkIED2jBC9vARH1gZzxS6phM7NMgBjghsXWGksSBE6j3B_HpOQ4:1oQ65l:BWB4_hOz3TDR2EVKxOurw8nmncEKhXcP8xfk4rnxXHE	2022-09-05 11:59:41.771773+00
2gbtv8nbch6lfstzyna42wikfybvx1g6	.eJxVjM0OwiAQhN-FsyH8VAoevfcZyC67StVAUtqT8d2lSQ96m8z3zbxFhG3NcWu8xJnERWhx-u0Q0pPLDugB5V5lqmVdZpS7Ig_a5FSJX9fD_TvI0HJfB3SMOoAfjQtnHgcckMD3hDcLyirLbJzH4MiiMh0M3jqTyCBQQi0-X-g_ODI:1oQ826:yLmMs-Mg9vWkurkIcrWkT5l8LaxOyn29NuzJ501LSdQ	2022-09-05 14:04:02.668173+00
\.


--
-- Data for Name: home_globalgroup; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.home_globalgroup (id, group_id, group_name, group_location, group_teacher, group_manager, group_region) FROM stdin;
\.


--
-- Data for Name: home_group; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.home_group (id, group_id, group_name, group_location, group_teacher, group_manager, group_course, report_date_start, report_date_end, total, attended) FROM stdin;
1895	253465	МК_Онлайн_Скретч_Старші_16.08_ВТ_18:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-15	2022-08-21	\N	\N
1896	253449	МК_Онлайн_Пайтон Старт_16.08_ВТ_18:00	Онлайн	Иванова Марьяна	Чередниченко Светлана	python start	2022-08-15	2022-08-21	\N	\N
1897	253443	МК_Онлайн_ГрафДиз_16.08_ВТ_18:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-15	2022-08-21	\N	\N
1898	253428	МК_Онлайн_Скретч_Молодші_16.08_ВТ_18:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-15	2022-08-21	\N	\N
1899	253792	МК_Онлайн_Скретч_Старші_16.08_ВТ_19:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-15	2022-08-21	\N	\N
1900	253494	МК_Онлайн_Англ А1_16.08_ВТ_19:00	Онлайн	Проноза Катерина	Зыгарь Валентина	english	2022-08-15	2022-08-21	\N	\N
1901	253452	МК_Онлайн_Пайтон Старт_16.08_ВТ_19:00	Онлайн	Иванова Марьяна	Чередниченко Светлана	python start	2022-08-15	2022-08-21	\N	\N
1902	253444	МК_Онлайн_ГрафДиз_16.08_ВТ_19:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-15	2022-08-21	\N	\N
1903	253429	МК_Онлайн_Скретч_Молодші_16.08_ВТ_19:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-15	2022-08-21	\N	\N
1904	253283	МК_Онлайн_Пайтон Про_16.08_ВТ_19:00	Онлайн	Егорова Вероника	Гурджиян Виктория	python start	2022-08-15	2022-08-21	\N	\N
1905	253793	МК_Онлайн_Скретч_Старші_16.08_ВТ_20:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-15	2022-08-21	\N	\N
1906	253430	МК_Онлайн_Скретч_Молодші_16.08_ВТ_20:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-15	2022-08-21	\N	\N
1907	253492	МК_Онлайн_Веб-сайти_17.06_СР_16:00	Онлайн Чернівці 1	Спіжавка Станіслав	Ружанська Анна	websites	2022-08-15	2022-08-21	\N	\N
1908	249621	МК_Онлайн_Пайтон_17.08_СР_16:00	Онлайн_Фастов_Лобанова		Лобанова Наталия	python start	2022-08-15	2022-08-21	\N	\N
1909	253612	МК_Онлайн_Винница_Пайтон_17.08_СР_17:00	Онлайн Вінниця	Стиренко Андрiй	Діана Бречко	python start	2022-08-15	2022-08-21	\N	\N
1910	249619	МК_Онлайн_Геймдизайн_17.08_СР_17:00	Буча_Онлайн_Гулейкова	Павлюченко Анастасия	Гулейкова Яна	gamedesign	2022-08-15	2022-08-21	\N	\N
1911	249618	МК_Онлайн_Скретч_17.08_СР_18:00	Буча_Онлайн_Гулейкова	Мерзлов Егор	Гулейкова Яна	scratch	2022-08-15	2022-08-21	\N	\N
1912	253610	МК_Онлайн_Винница_Геймдизайн_17.08_СР_19:00 | Робити запис до вівторка 16:00, щоб я встигла зв'язатись зі всіма клієнтами та перевірити чи встановлений роблокс	Онлайн Вінниця	Грицюк Оксана	Діана Бречко	gamedesign	2022-08-15	2022-08-21	\N	\N
1913	253719	МК_ОнлайнЛьвів_ Скретч_ЧТ_18.08_12:00	Онлайн_Львівський регіон_2022	Джаган Ангеліна	Даць Уляна	scratch	2022-08-15	2022-08-21	\N	\N
1914	253490	МК_ОнлайнЛьвів_Пайтон_18.08_ЧТ_15:00	Онлайн_Львівський регіон_2022	Тишко Микола	Даць Уляна	python start	2022-08-15	2022-08-21	\N	\N
1915	253174	МК_Стрий_КГ_ЧТ_18.08_15:00	Стрий	Гомза Руслан	Диба Рома	comp_gram	2022-08-15	2022-08-21	\N	\N
1916	249841	МК_English А1_Онлайн_Чт_18/08_15:00	Александрия		Центилевич Александрия Светлана	english	2022-08-15	2022-08-21	\N	\N
1917	253699	МК_Онлайн_English_А1_Чт_18.08_16:00		Дворніченко Олександра	Волк Наталья	english	2022-08-15	2022-08-21	\N	\N
1918	253172	МК_Стрий_ВЕБ_ЧТ_18.08_16:00	Стрий	Гомза Руслан	Диба Рома	websites	2022-08-15	2022-08-21	\N	\N
1919	250776	МК_English А1_Онлайн_Чт_18/08_16:00	Онлайн_Півден-Схід Таран		Соколова Марина	english	2022-08-15	2022-08-21	\N	\N
1920	249844	МК_English А1_Онлайн_Чт_18/08_16:30	Александрия		Центилевич Александрия Светлана	english	2022-08-15	2022-08-21	\N	\N
1921	253613	МК_Онлайн_Винница_Скретч_18.08_ЧТ_17:00	Онлайн Вінниця	Грицюк Оксана	Діана Бречко	scratch	2022-08-15	2022-08-21	\N	\N
1922	253272	МК_ ЧО_Онлайн_Пайтон_18.08_Чт_17:00	Онлайн ЧО	Харечко Олександр	Гурчина Яна	python start	2022-08-15	2022-08-21	\N	\N
1923	252219	МК_Київ_онлайн_Пайтон_Чт_17:00_18.08	Онлайн Киев	Камков Валерий	Некрашевич София	python start	2022-08-15	2022-08-21	\N	\N
1924	253703	МК_Онлайн_English_А2_Чт_18.08_17:30		Дворніченко Олександра	Волк Наталья	english	2022-08-15	2022-08-21	\N	\N
1925	250777	МК_English А2_Онлайн_Чт_18/08_17:30	Онлайн_Півден-Схід Таран		Соколова Марина	english	2022-08-15	2022-08-21	\N	\N
1926	253876	МК_Геймдизайн_ЧТ_18:00		Шульга Данил Запорожье	Котова Запорожье тел.0666883467 Оксана	gamedesign	2022-08-15	2022-08-21	\N	\N
1927	253473	МК_Онлайн_Скретч_Старші_18.08_ЧТ_18:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-15	2022-08-21	\N	\N
1928	253461	МК_Онлайн_Пайтон Старт_18.08_ЧТ_18:00	Онлайн	Иванова Марьяна	Чередниченко Светлана	python start	2022-08-15	2022-08-21	\N	\N
1929	253447	МК_Онлайн_ГрафДиз_18.08_ЧТ_18:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-15	2022-08-21	\N	\N
1930	253431	МК_Онлайн_Скретч_Молодші_18.08_ЧТ_18:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-15	2022-08-21	\N	\N
1931	252344	МК_онлайн_Пайтон Про_18.08_ЧТ_18:00	Онлайн_Фастов_Постолюк	Мачулко Тимур	Постолюк Александра	python pro	2022-08-15	2022-08-21	\N	\N
1932	253270	МК_ ЧО_Онлайн_Скретч_18.08_Чт_18:30	Онлайн ЧО	Гах Дар'я	Гурчина Яна	scratch	2022-08-15	2022-08-21	\N	\N
1933	253794	МК_Онлайн_Скретч_Старші_18.08_ЧТ_19:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-15	2022-08-21	\N	\N
1934	253462	МК_Онлайн_Пайтон Старт_18.08_ЧТ_19:00	Онлайн	Иванова Марьяна	Чередниченко Светлана	python start	2022-08-15	2022-08-21	\N	\N
1935	253448	МК_Онлайн_ГрафДиз_18.08_ЧТ_19:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-15	2022-08-21	\N	\N
1936	253433	МК_Онлайн_Скретч_Молодші_18.08_ЧТ_19:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-15	2022-08-21	\N	\N
1937	253295	МК_Онлайн_Пайтон Про_18.08_ЧТ_19:00	Онлайн	Егорова Вероника	Гурджиян Виктория	python start	2022-08-15	2022-08-21	\N	\N
1938	252223	МК_Київ_онлайн_Скретч_Чт_19:00_18.08	Онлайн Киев	Пелипенко Аміна	Некрашевич София	scratch	2022-08-15	2022-08-21	\N	\N
1939	253795	МК_Онлайн_Скретч_Старші_18.08_ЧТ_20:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-15	2022-08-21	\N	\N
1940	253467	МК_Онлайн_Пайтон Старт_18.08_ЧТ_20:00	Онлайн	Иванова Марьяна	Чередниченко Светлана	python start	2022-08-15	2022-08-21	\N	\N
1941	253434	МК_Онлайн_Скретч_Молодші_18.08_ЧТ_20:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-15	2022-08-21	\N	\N
1942	251851	МК Онлайн Скреч ПТ 19.08. 12-00	Одесса _ ОНЛАЙН	Савченко София	Малярчук Яна	scratch	2022-08-15	2022-08-21	\N	\N
1943	252760	МК Онлайн Веб Диз ПТ 19.08 13 -00	Одесса _ ОНЛАЙН	Ференчук Роман	Малярчук Яна	websites	2022-08-15	2022-08-21	\N	\N
1944	255104	МК Онлайн Пайтон ПТ 19.08 14-00	Одесса _ ОНЛАЙН	Чех Алексей	Малярчук Яна	python start	2022-08-15	2022-08-21	\N	\N
1945	251852	МК Онлайн Пайтон ПТ 19.08 14-00	Одесса _ ОНЛАЙН	Исайко Светлана	Малярчук Яна	python start	2022-08-15	2022-08-21	\N	\N
1946	252782	МК Онлайн Графич Диз   ПТ 19.08 15 -00	Одесса _ ОНЛАЙН	Савченко София	Малярчук Яна	graphdesign	2022-08-15	2022-08-21	\N	\N
1947	252444	МК_Дрогобич_Скретч_ПТ_19.08.15:00	Дрогобич	Зілінкевич Ростислав	Возняк Вероніка	scratch	2022-08-15	2022-08-21	\N	\N
1948	251807	English_ МК _А1 Одесса 19/08 15-00	Одесса_Англ.яз	Маличенко Юлія	Малярчук Яна	english	2022-08-15	2022-08-21	\N	\N
1949	249846	МК_English А1_Онлайн_Чт_19/08_15:00	Александрия		Центилевич Александрия Светлана	english	2022-08-15	2022-08-21	\N	\N
1950	255071	МК_Николаев.Онлайн_Скретч_19/08_ПТ_16:00	Николаевская Обл. ОНЛАЙН	Толстошеина Катерина	Обертун Настя	scratch	2022-08-15	2022-08-21	\N	\N
1951	253933	МК_Онлайн_Скретч_ПТ_19/08_16:00	Онлайн Харьков	Захлистун Діана	Головко Валентина	scratch	2022-08-15	2022-08-21	\N	\N
1952	252451	МК_Дрогобич_Геймдизайн_ПТ_19.08_16:00	Дрогобич	Зілінкевич Ростислав	Возняк Вероніка	gamedesign	2022-08-15	2022-08-21	\N	\N
1953	250979	МК_Фастів_КГ_19.08_ПТ_16:00	Фастов	Семенюк Евгений	Постолюк Александра	comp_gram	2022-08-15	2022-08-21	\N	\N
1954	249592	МК_КП_Скретч_19.08_ПТ_16:00	КП Розмарин	Думанська Дарина	Юрчак Світлана	scratch	2022-08-15	2022-08-21	\N	\N
1955	249845	МК_English А2_Онлайн_Чт_19/08_16:30	Александрия		Центилевич Александрия Светлана	english	2022-08-15	2022-08-21	\N	\N
1956	255072	МК_Николаев.Онлайн_Python_19/08_ПТ_17:00	Николаевская Обл. ОНЛАЙН	Дердяк Александр	Обертун Настя	python start	2022-08-15	2022-08-21	\N	\N
1957	252469	МК_Дрогобич_Пайтон_ПТ_19.08.22_17:00	Дрогобич	Зілінкевич Ростислав	Возняк Вероніка	python start	2022-08-15	2022-08-21	\N	\N
1958	250981	МК_Фастів_Скретч_19.08_ПТ_17:00	Фастов	Семенюк Евгений	Постолюк Александра	scratch	2022-08-15	2022-08-21	\N	\N
1959	249593	МК_КП_Пайтон_19.08_ПТ_17.00	КП Розмарин	Близно Дмитро	Юрчак Світлана	python start	2022-08-15	2022-08-21	\N	\N
1960	254597	МК_Онлайн_Пайтон_ПТ_19/08_18:00	Онлайн Харьков	Артур Хоботков	Головко Валентина	python start	2022-08-15	2022-08-21	\N	\N
1961	250983	МК_Фастів_Пайтон_19.08_ПТ_18:00	Фастов	Семенюк Евгений	Постолюк Александра	python start	2022-08-15	2022-08-21	\N	\N
1962	249893	МК_Кам'янське_Скретч_СБ_20/08_9:30	Каменское	Волков Вадим Каменское	Асанова Каменское Софія	scratch	2022-08-15	2022-08-21	\N	\N
1963	253934	МК_Онлайн_Пайтон_Сб_20/08_10:00	Онлайн Харьков	Артур Хоботков	Николаева Елена	python start	2022-08-15	2022-08-21	\N	\N
1964	253615	МК_Онлайн_Геймдизайн_СБ_20.08_10:00		Солодка Світлана	Ситник Катерина	gamedesign	2022-08-15	2022-08-21	\N	\N
1965	252612	МК_Ірпінь_Комп'ютерна грамотність на 20.08 о 10:00 Сб	Ирпень	Олексієнко Ярослава	Вероніка Лінтур	comp_gram	2022-08-15	2022-08-21	\N	\N
1966	252579	МК_Славута_Скретч_20.08_Сб_10:00	Славута	Рибчинська Дарина	Янчук Ольга	scratch	2022-08-15	2022-08-21	\N	\N
1967	252572	МК_БЦ_КГ_20.08_Сб_10:00	БЦ	Проценко Наталія	Семенюк Катя	comp_gram	2022-08-15	2022-08-21	\N	\N
1968	252525	МК_Хуст_Скретч_20.08_СБ_10:00	Хуст офіс	Попадинець Наталія	Олексюк Наталія	scratch	2022-08-15	2022-08-21	\N	\N
1969	252153	МК_Бровары_КГ_20.08_сб_10-00	Бровары	Горецька Юлія	Анна Неділько	comp_gram	2022-08-15	2022-08-21	\N	\N
1970	251446	Одесса_МК _Скреч_Черемушки_СБ_20/08_10-00	Черемушки.Одесса	Лареев Роман	Костенко Виктория	scratch	2022-08-15	2022-08-21	\N	\N
1971	251157	МК_Львів_Чорновола_Скреч_Сб_20.08_10:00	Чорновола	Андрухович Таїсія	Дорошенко Анна	scratch	2022-08-15	2022-08-21	\N	\N
1972	250765	МК_Киев_Троещина_КГ_СБ_20.08_10:00	Киев, Троещина	Андрей Авраменко	Некрашевич София	comp_gram	2022-08-15	2022-08-21	\N	\N
1973	249943	МК_Дніпро_Центр_КГ_СБ_20/08_10:00	Днепр.Центр	Ємец Микола	Соколова Марина	comp_gram	2022-08-15	2022-08-21	\N	\N
1974	249901	МК_Александрия_КГ_Сб_20/08_10:00	Александрия	Третяк Виктория Александрия	Центилевич Александрия Светлана	comp_gram	2022-08-15	2022-08-21	\N	\N
1975	249549	МК_Коломия_Скретч_20.08_СБ_10:00	Коломия	Гарвасюк Вікторія	Ружанська Анна	scratch	2022-08-15	2022-08-21	\N	\N
1976	254800	МК_ІФ_Сайти_20.08_СБ_11:00	ІФ офіс	Бровін Андрій	Шеленко Наталя	websites	2022-08-15	2022-08-21	\N	\N
1977	253509	МК_Онлайн_Днепр_Скретч_20.08_11:00	Онлайн_Півден-Схід Таран	Багрий Татьяна Курахово	Зданевич Евгения	scratch	2022-08-15	2022-08-21	\N	\N
1978	252663	МК_Боярка_КГ_20.08_СБ_11:00	Боярка	Кашапова Лія	Лілія Барабаш	comp_gram	2022-08-15	2022-08-21	\N	\N
1979	252611	МК_Скретч_Ірпінь 20.08 на 11:00 Сб	Ирпень	Мачулко Тимур	Вероніка Лінтур	scratch	2022-08-15	2022-08-21	\N	\N
1980	252584	МК_Славута_Пайтон_20.08_Сб_11:00	Славута	Пархомчук Вадим	Янчук Ольга	python start	2022-08-15	2022-08-21	\N	\N
1981	252573	МК_БЦ_Скреч_20.08_Сб_11:00	БЦ	Проценко Наталія	Семенюк Катя	scratch	2022-08-15	2022-08-21	\N	\N
1982	252550	МК_Борисполь_Скреч_20.08_СБ_11:00	Борисполь	Раус Кирилл	Чиколовець Вікторія	scratch	2022-08-15	2022-08-21	\N	\N
1983	252365	МК_Подгороднє_Геймдизайн_СБ_20/08_11:00	Подгородное	Сидоров Владислав	Литвин Александра	gamedesign	2022-08-15	2022-08-21	\N	\N
1984	252147	МК_Бровары_Скреч_20.08_сб_11-00	Бровары	Горецька Юлія	Анна Неділько	scratch	2022-08-15	2022-08-21	\N	\N
1985	251831	МК_Луцьк-Центр_КГ_20.08_Сб_11:00	Луцьк-Центр	Тишко Микола	Літкевич Вікторія	comp_gram	2022-08-15	2022-08-21	\N	\N
1986	251448	Одесса_МК Веб Диз_Черемушки_СБ_20/08_11-00	Черемушки.Одесса	Лареев Роман	Костенко Виктория	websites	2022-08-15	2022-08-21	\N	\N
1987	251198	МК_Львів_Чорновола_КГ_Сб_20.08_11:00	Чорновола	Андрухович Таїсія	Дорошенко Анна	comp_gram	2022-08-15	2022-08-21	\N	\N
1988	250921	МК_Запорожье_Вознесеновский_Скретч_СБ_20/08_11:00	Запорожье.Вознесеновский	Дурницкая Надежда Запорожье	Котова Запорожье тел.0666883467 Оксана	scratch	2022-08-15	2022-08-21	\N	\N
1989	250120	МК_Жовті Води_КГ_СБ_20/08_11:00	Желтые Воды	Кагожкіна Ксенія	Решетило Желтые Воды Марина	comp_gram	2022-08-15	2022-08-21	\N	\N
1990	249970	МК_Вільногірськ_КГ_СБ_20/08_11:00	Вольногорск	Тунік Лілія Вільногірськ	Василенко Екатерина Вольногорск	comp_gram	2022-08-15	2022-08-21	\N	\N
1991	249950	МК_Дніпро_Центр_Скретч_СБ_20/08_11:00	Днепр.Центр	Ємец Микола	Соколова Марина	scratch	2022-08-15	2022-08-21	\N	\N
1992	249925	МК_Бердичів_Пайтон_СБ_20/08_11:00	Бердичів	Рудницький Станіслав	Тетяна Ніколайчук	python start	2022-08-15	2022-08-21	\N	\N
1993	249890	МК_Кам'янське_Скретч_СБ_20/08_11:00	Каменское	Волков Вадим Каменское	Асанова Каменское Софія	scratch	2022-08-15	2022-08-21	\N	\N
1994	249814	МК_Рівне_ КГ_СБ_20.08_11:00	Рівне-Центр	Федусь Ярослав	Варійчук Інна	comp_gram	2022-08-15	2022-08-21	\N	\N
1995	249565	МК_Чернівці_Скретч_20.08_СБ_11:00	Чернівці офіс	Мікульська Ірина	Дячук Анна	scratch	2022-08-15	2022-08-21	\N	\N
1996	249550	МК_Коломия_КГ_20.08_СБ_11:00	Коломия	Гарвасюк Вікторія	Ружанська Анна	comp_gram	2022-08-15	2022-08-21	\N	\N
1997	252529	МК_Хуст_Пайтон_20.08_СБ_11:10	Хуст офіс	Алексій Олександр	Олексюк Наталія	python start	2022-08-15	2022-08-21	\N	\N
1998	250766	МК_Киев_Троещина_Скретч_СБ_20.08_11:30	Киев, Троещина	Андрей Авраменко	Некрашевич София	scratch	2022-08-15	2022-08-21	\N	\N
1999	250170	МК_Кривий_Ріг_КГ_СБ_20/08_11:00	Заречный		Недільчук Кривий Ріг Дарина	comp_gram	2022-08-15	2022-08-21	\N	\N
2000	249904	МК_Александрия_Скретч_Сб_20/08_11:30	Александрия	Третяк Виктория Александрия	Центилевич Александрия Светлана	scratch	2022-08-15	2022-08-21	\N	\N
2001	253912	МК_Коростень_Скретч_СБ_20.08_12:00	Коростень	Яценко Андрей	Вознюк Світлана	scratch	2022-08-15	2022-08-21	\N	\N
2002	253524	МК_ІФ_Пайтон_20.08_СБ_12:00	ІФ офіс	Бровін Андрій	Шеленко Наталя	python start	2022-08-15	2022-08-21	\N	\N
2003	253368	МК_Скреч_Подольск_СБ_20/08_12-00	Подольск.Квинта	Карпова Валерия	Маковеева Светлана	scratch	2022-08-15	2022-08-21	\N	\N
2004	253345	МК_Раздельная_Scratch_СБ_20.08_12:00	Раздельная.Приват	Лесняк Мария	Дмитриева Наталья	scratch	2022-08-15	2022-08-21	\N	\N
2005	253253	МК_БЦ_Графічний дизайн_20.08_Сб_12:00	БЦ	Проценко Наталія	Семенюк Катя	graphdesign	2022-08-15	2022-08-21	\N	\N
2006	253133	МК_Бровары_Графічний дизайн_20.08_сб_12-00	Бровары	Горецька Юлія	Анна Неділько	graphdesign	2022-08-15	2022-08-21	\N	\N
2007	252614	МК_Ірпінь_Пайтон на 12:00 20.08	Ирпень	Мачулко Тимур	Вероніка Лінтур	python start	2022-08-15	2022-08-21	\N	\N
2008	251602	МК_Дніпровський_Онлайн_Графдизайн_СБ_20.08_12:00		Багрий Татьяна Курахово	Щасливець Марганец Алина	graphdesign	2022-08-15	2022-08-21	\N	\N
2009	251450	Одесса_МК _Пайтон Черемушки_СБ_20/08_12-00	Черемушки.Одесса	Лареев Роман	Костенко Виктория	python start	2022-08-15	2022-08-21	\N	\N
2010	251190	МК_Львів_Чорновола_Геймдизайн_Сб_20.08_12:00	Чорновола	Андрухович Таїсія	Дорошенко Анна	gamedesign	2022-08-15	2022-08-21	\N	\N
2011	250967	МК_Киев_ВДНХ_Скретч_СБ_20.08_12:00	Киев, ВДНХ	Уманець Сергій	Естонська Інна	scratch	2022-08-15	2022-08-21	\N	\N
2012	250932	МК_Запорожье_Вознесеновский_Пайтон_СБ_20/08_12:00	Запорожье.Вознесеновский	Горобець Владислав	Котова Запорожье тел.0666883467 Оксана	python start	2022-08-15	2022-08-21	\N	\N
2013	250171	МК_Кривий_Ріг_Скретч_Сб_20/08_12:00	Заречный	Гаврилюк Євген	Недільчук Кривий Ріг Дарина	scratch	2022-08-15	2022-08-21	\N	\N
2014	250035	МК_Винники_Скретч_20.08_12.00	Львів-Винники	Костерева Софія	Почтарук Зоряна	scratch	2022-08-15	2022-08-21	\N	\N
2015	250032	МК_Хмільник_Скретч_СБ_20.08_12:00	Хмільник	Гончар Олена	Гураль Надія	scratch	2022-08-15	2022-08-21	\N	\N
2016	249923	МК_Бердичів_Скретч_СБ_20/08_12:00	Бердичів	Іванова Анастасія	Тетяна Ніколайчук	scratch	2022-08-15	2022-08-21	\N	\N
2017	249908	МК_Могилів-Подільський_Скретч_СБ_20.08_12:00	Могилів-Подільський	Марія Пантелейчук	Людмила Коваленко	scratch	2022-08-15	2022-08-21	\N	\N
2018	249815	МК_Рівне_ Скретч_СБ_20.08_12:00	Рівне-Центр	Федусь Ярослав	Варійчук Інна	scratch	2022-08-15	2022-08-21	\N	\N
2019	249807	МК_Луцьк-Центр_Скретч_20.08_Сб_12:00	Луцьк-Центр	Левчук Тарас	Літкевич Вікторія	scratch	2022-08-15	2022-08-21	\N	\N
2020	249566	МК_Чернівці_Пайтон_20.08_СБ_12:00	Чернівці офіс	Климчук Артур	Дячук Анна	python start	2022-08-15	2022-08-21	\N	\N
2021	249551	МК_Коломия_Пайтон_20.08_СБ_12:00	Коломия		Ружанська Анна	python start	2022-08-15	2022-08-21	\N	\N
2022	252277	МК_КП_Гейм_20.08_СБ_12:30	КП Розмарин	Гончарук Андрій	Юрчак Світлана	gamedesign	2022-08-15	2022-08-21	\N	\N
2023	252232	МК_Подгороднє_Скретч_СБ_20/08_12:30	Подгородное	Сидоров Владислав	Литвин Александра	scratch	2022-08-15	2022-08-21	\N	\N
2024	250121	МК_Жовті Води_Скретч_СБ_20/08_12:30	Желтые Воды	Жемлиханов Дамир Желтые Воды	Решетило Желтые Воды Марина	scratch	2022-08-15	2022-08-21	\N	\N
2025	249968	МК_Вільногірськ_Скретч_СБ_20/08_12:30	Вольногорск	Кавецкий Андрей	Василенко Екатерина Вольногорск	scratch	2022-08-15	2022-08-21	\N	\N
2026	249954	МК_Дніпро_Центр_Скретч_СБ_20/08_12:30	Днепр.Центр	Ємец Микола	Соколова Марина	scratch	2022-08-15	2022-08-21	\N	\N
2027	249897	МК_Кам'янське_Пайтон_СБ_20/08_12:30	Каменское	Волков Вадим Каменское	Асанова Каменское Софія	python start	2022-08-15	2022-08-21	\N	\N
2028	255235	МК_Александрия_Скретч_Сб_20/08_13:00	Александрия	Третяк Виктория Александрия	Центилевич Александрия Светлана	scratch	2022-08-15	2022-08-21	\N	\N
2029	253511	МК_ІФ_Граф.Дизайн_20.08_СБ_13:00	ІФ офіс	Бровін Андрій	Шеленко Наталя	graphdesign	2022-08-15	2022-08-21	\N	\N
2030	253369	МК_Подольск_Граф.дизайн_СБ_20/08_13-00	Подольск.Квинта	Карпова Валерия	Маковеева Светлана	graphdesign	2022-08-15	2022-08-21	\N	\N
2031	253347	МК_Раздельная_Веб-диз_СБ_20.08_13:00	Раздельная.Приват	Лесняк Мария	Дмитриева Наталья	websites	2022-08-15	2022-08-21	\N	\N
2032	252673	МК_БЦ_Пайтон_20.08_Сб_13:00	БЦ		Семенюк Катя	python start	2022-08-15	2022-08-21	\N	\N
2033	252667	МК_Боярка_Геймдиз_20.08_СБ_13:00	Боярка	Кашапова Лія	Лілія Барабаш	gamedesign	2022-08-15	2022-08-21	\N	\N
2034	252640	МК_Ірпінь_Графічний_дизайн на 13:00 20.08 Сб	Ирпень	Мачулко Тимур	Вероніка Лінтур	graphdesign	2022-08-15	2022-08-21	\N	\N
2035	252272	МК_Прилуки_КГ_Сб_13:00_20.08	Прилуки	Миколенко Світлана	Гурчина Яна	comp_gram	2022-08-15	2022-08-21	\N	\N
2036	252170	МК_Бровары_Геймдизайн_20.08_сб_13-00	Бровары	Корень Олена	Анна Неділько	gamedesign	2022-08-15	2022-08-21	\N	\N
2037	251193	МК_Львів_Чорновола_Пайтон_Сб_20.08_13:00	Чорновола	Суховеева Світлана	Дорошенко Анна	python start	2022-08-15	2022-08-21	\N	\N
2038	250768	МК_Киев_Троещина_Питон_СБ_20.08_13:00	Киев, Троещина	Андрей Авраменко	Некрашевич София	python start	2022-08-15	2022-08-21	\N	\N
2039	250201	МК_Александрия_Веб_Сб_20/08_13:00	Александрия	Третяк Виктория Александрия	Центилевич Александрия Светлана	websites	2022-08-15	2022-08-21	\N	\N
2040	250172	МК_Кривий_Ріг_Пайтон_СБ_20/08_13:00	Заречный	Гаврилюк Євген	Недільчук Кривий Ріг Дарина	python start	2022-08-15	2022-08-21	\N	\N
2041	249945	МК_Могилів-Подільський_Пайтон_СБ_20.08_13:00	Могилів-Подільський	Марія Пантелейчук	Людмила Коваленко	python start	2022-08-15	2022-08-21	\N	\N
2042	249817	МК_Рівне_ ВЕБдизайн_СБ_20.08_13:00	Рівне-Центр	Мельничук Ірина	Варійчук Інна	websites	2022-08-15	2022-08-21	\N	\N
2043	249812	МК_Луцьк-Центр_Скретч_20.08_Сб_13:00	Луцьк-Центр	Левчук Тарас	Літкевич Вікторія	scratch	2022-08-15	2022-08-21	\N	\N
2044	249567	МК_Чернівці_КГ_20.08_СБ_13:00	Чернівці офіс	Мікульська Ірина	Дячук Анна	comp_gram	2022-08-15	2022-08-21	\N	\N
2045	249552	МК_Коломия_Гейм_20.08_СБ_13:00	Коломия	Витвицький Роман	Ружанська Анна	gamedesign	2022-08-15	2022-08-21	\N	\N
2046	253913	МК_Коростень_Геймдизайн_СБ_20.08_13:30	Коростень	Яценко Андрей	Вознюк Світлана	gamedesign	2022-08-15	2022-08-21	\N	\N
2047	253517	МК_Онлайн_Днепр_Граф.дизайн_20.08_13:30	Онлайн_Півден-Схід Таран	Багрий Татьяна Курахово	Зданевич Евгения	graphdesign	2022-08-15	2022-08-21	\N	\N
2048	250966	МК_Киев_ВДНХ_Питон_СБ_20.08_13:30	Киев, ВДНХ	Биланов Иван	Естонська Інна	python start	2022-08-15	2022-08-21	\N	\N
2049	249582	МК_Хмельницький_Пайтон_20.08_СБ_13:30	Хмельницький офіс	Кухарук Ірина	Норчук Альона	python start	2022-08-15	2022-08-21	\N	\N
2050	249588	МК_Долина_Скретч_20.08_СБ_13:40	Долина	Яремич Христина	Пристая Олеся	scratch	2022-08-15	2022-08-21	\N	\N
2051	253350	МК_Раздельная_Python__СБ_20.08_14:00	Раздельная.Приват	Лесняк Мария	Дмитриева Наталья	python start	2022-08-15	2022-08-21	\N	\N
2052	252670	МК_Боярка_Скреч_20.08_СБ_14:00	Боярка	Кашапова Лія	Лілія Барабаш	scratch	2022-08-15	2022-08-21	\N	\N
2053	252626	МК_Бровары_Пайтон_20.08_сб_14-00	Бровары	Корень Олена	Анна Неділько	python start	2022-08-15	2022-08-21	\N	\N
2054	252366	МК_Подгороднє_Пайтон_СБ_20/08_14:00	Подгородное	Сидоров Владислав	Литвин Александра	python start	2022-08-15	2022-08-21	\N	\N
2055	252278	МК_КП_Сайти_20.08_СБ_14:00	КП Розмарин	Гончарук Андрій	Юрчак Світлана	websites	2022-08-15	2022-08-21	\N	\N
2056	252275	МК_Прилуки_Скретч_Сб_14:00_20.08	Прилуки	Миколенко Світлана	Гурчина Яна	scratch	2022-08-15	2022-08-21	\N	\N
2057	252138	МК_Дніпровський_Онлайн_Скретч_СБ_МЛ_20.08_14:00	Онлайн_Пікалова_Півден-Схід	Семенова Александра Доброполье	Борисенко Синельниково Диана	scratch	2022-08-15	2022-08-21	\N	\N
2058	251806	МК_Львів_Скретч_20.08_Сб_14:00	Рубчака	Барна Мар'яна	Аквінська Вікторія	scratch	2022-08-15	2022-08-21	\N	\N
2059	251578	МК_Червоноград_Python_СБ_20.08_14:00	Червоноград	Паньчак Софія	Федина Наталья	python start	2022-08-15	2022-08-21	\N	\N
2060	250123	МК_Жовті Води_Пайтон_СБ_20/08_14:00	Желтые Воды	Жемлиханов Дамир Желтые Воды	Решетило Желтые Воды Марина	python start	2022-08-15	2022-08-21	\N	\N
2061	250037	МК_Хмільник_Пайтон_СБ_20.08_14:00	Хмільник	Попенко Дмитро	Гураль Надія	python start	2022-08-15	2022-08-21	\N	\N
2062	249966	МК_Вільногірськ_Пайтон_СБ_20/08_14:00	Вольногорск	Тунік Станіслав	Василенко Екатерина Вольногорск	python start	2022-08-15	2022-08-21	\N	\N
2063	249957	МК_Дніпро_Центр_Пайтон_СБ_20/08_14:00	Днепр.Центр	Ємец Микола	Соколова Марина	python start	2022-08-15	2022-08-21	\N	\N
2064	249900	МК_Кам'янське_Пайтон_СБ_20/08_14:00	Каменское	Волков Вадим Каменское	Асанова Каменское Софія	python start	2022-08-15	2022-08-21	\N	\N
2065	249819	МК_Рівне_ Пайтон_СБ_20.08_14:00	Рівне-Центр	Божок Віктор	Варійчук Інна	python start	2022-08-15	2022-08-21	\N	\N
2066	249816	МК_Луцьк-Центр_ВЕБдизайн_20.08_Сб_14:00	Луцьк-Центр	Левчук Тарас	Літкевич Вікторія	websites	2022-08-15	2022-08-21	\N	\N
2067	249622	МК_Онлайн_Скретч_20.08_сб_14:00	Буча_Онлайн_Гулейкова	Мерзлов Егор	Гулейкова Яна	scratch	2022-08-15	2022-08-21	\N	\N
2068	250451	МК_Чернівці_Пайтон_20.08_СБ_14:30	Чернівці офіс	Климчук Артур	Дячук Анна	python start	2022-08-15	2022-08-21	\N	\N
2069	250202	МК_Александрия_Пайтон_Сб_20/08_14:30	Александрия	Катерина Копецкая	Центилевич Александрия Светлана	python start	2022-08-15	2022-08-21	\N	\N
2070	249589	МК_Долина_Пайтон_20.08_СБ_14:50	Долина	Квецко Марія	Пристая Олеся	python start	2022-08-15	2022-08-21	\N	\N
2071	253914	МК_Коростень_Пайтон_СБ_20.08_15:00	Коростень	Яценко Андрей	Вознюк Світлана	python start	2022-08-15	2022-08-21	\N	\N
2072	252672	МК_Боярка_Пайтон_20.08_СБ_15:00	Боярка	Кашапова Лія	Лілія Барабаш	python start	2022-08-15	2022-08-21	\N	\N
2073	252279	МК_Прилуки_Пайтон_Сб_15:00_20.08	Прилуки	Харечко Олександр	Гурчина Яна	python start	2022-08-15	2022-08-21	\N	\N
2074	251808	МК_Львів_Геймдизайн_20.08_Сб_15:00	Рубчака	Лисогор Таісія	Аквінська Вікторія	gamedesign	2022-08-15	2022-08-21	\N	\N
2075	251583	МК_Червоноград_КГ_СБ_20.08_15:00	Червоноград	Паньчак Софія	Федина Наталья	comp_gram	2022-08-15	2022-08-21	\N	\N
2076	251453	Одесса_МК _Веб Диз_ОФИС_СБ_20/08_15-00	Центр.Одесса	Чех Алексей	Фараонова Настя	websites	2022-08-15	2022-08-21	\N	\N
2077	251451	Одесса_МК _Скреч_ОФИС_СБ_20/08_15-00	Центр.Одесса	Савченко София	Фараонова Настя	scratch	2022-08-15	2022-08-21	\N	\N
2078	249930	МК_Житомир_Пайтон_20/08_СБ_15:00	Житомир	Загривий Артур	Виговська Катерина	python start	2022-08-15	2022-08-21	\N	\N
2079	249818	МК_Луцьк-Центр_Пайтон_20.08_Сб_15:00	Луцьк-Центр	Тишко Микола	Літкевич Вікторія	python start	2022-08-15	2022-08-21	\N	\N
2080	249623	МК_Онлайн_Геймдизайн_20.08_сб_15:00	Буча_Онлайн_Гулейкова	Павлюченко Анастасия	Гулейкова Яна	gamedesign	2022-08-15	2022-08-21	\N	\N
2081	253848	МК_Дніпровський_Онлайн_КГ_СБ_20.08_15:30	Онлайн_Пікалова_Півден-Схід	Семенова Александра Доброполье	Борисенко Синельниково Диана	comp_gram	2022-08-15	2022-08-21	\N	\N
2082	251809	МК_Львів_Пайтон_20.08_Сб_16:00	Рубчака	Лисогор Таісія	Аквінська Вікторія	python start	2022-08-15	2022-08-21	\N	\N
2083	251585	МК_Червоноград_Скрейч_СБ_20.08_16:00	Червоноград	Підгайна Наталя	Федина Наталья	scratch	2022-08-15	2022-08-21	\N	\N
2084	251458	Одесса_МК _Пайтон _ОФИС_СБ_20/08_16-00	Центр.Одесса	Савченко София	Фараонова Настя	python start	2022-08-15	2022-08-21	\N	\N
2085	251136	МК_Дніпро_Караван_Веб_СБ_20/08_16:00	Днепр.Караван	Скрипник Николай Днепр	Крупина Екатерина	websites	2022-08-15	2022-08-21	\N	\N
2086	249956	МК_Дніпро_Центр_Пайтон_СБ_20/08_16:00	Днепр.Центр	Ємец Микола	Соколова Марина	python start	2022-08-15	2022-08-21	\N	\N
2087	249928	МК_Житомир_Скретч_20/08_СБ_16:00	Житомир	Іванова Анастасія	Виговська Катерина	scratch	2022-08-15	2022-08-21	\N	\N
2088	249820	МК_Луцьк-Центр_Пайтон_20.08_Сб_16:00	Луцьк-Центр	Тєльной Данил	Літкевич Вікторія	python start	2022-08-15	2022-08-21	\N	\N
2089	249616	МК_Полонне_Скретч_20.08._СБ_16.00	Полонне	Нагорна Тетяна	Дуброва Мирослава	scratch	2022-08-15	2022-08-21	\N	\N
2090	249581	МК_Хмельницький_скретч_20.08_СБ_15.00	Хмельницький офіс	Кухарук Ірина	Норчук Альона	scratch	2022-08-15	2022-08-21	\N	\N
2091	251589	МК_Червоноград_ГеймДиз_СБ_20.08_17:00	Червоноград	Грабова Андріана	Федина Наталья	gamedesign	2022-08-15	2022-08-21	\N	\N
2092	251134	МК_Дніпро_Караван_Пайтон_СБ_20/08_17:15	Днепр.Караван	Скрипник Николай Днепр	Крупина Екатерина	python start	2022-08-15	2022-08-21	\N	\N
2093	249613	МК_Полонне_Пайтон_20.08._СБ_17.00	Полонне	Ваколюк Владислав	Дуброва Мирослава	python start	2022-08-15	2022-08-21	\N	\N
2094	253487	МК_Онлайн_Пайтон_20.08_СБ_18:00	Онлайн Чернівці 1	Длубік Владислав	Ружанська Анна	python start	2022-08-15	2022-08-21	\N	\N
2095	253614	МК_Онлайн_Скретч_Вс_21.08_10:00		Волощенко Ірина	Ситник Катерина	scratch	2022-08-15	2022-08-21	\N	\N
2096	253599	МК_Онлайн_Гейм_21.08._НД_10.00	Онлайн Чернівці 1	Длубік Владислав	Дячук Анна	gamedesign	2022-08-15	2022-08-21	\N	\N
2097	253586	Одесса_МК _Скреч_Говорова_ВС_21/08_10-00	Говорова.Одесса	Исайко Светлана	Фараонова Настя	scratch	2022-08-15	2022-08-21	\N	\N
2098	253028	МК Южний GD СБ 21.08 10-00	Южный	Вероника Каганец	Снигур Елена	gamedesign	2022-08-15	2022-08-21	\N	\N
2099	252684	МК_Васильков_КГ_21.08-НД_10:00	Васильков	Раус Кирилл	Лілія Барабаш	comp_gram	2022-08-15	2022-08-21	\N	\N
2100	252643	МК_Бровары_Скреч_21.08_нд_10-00	Бровары	Корень Олена	Анна Неділько	scratch	2022-08-15	2022-08-21	\N	\N
2101	252630	МК_Буча_Комп'ютерна грамотність 10:00 21.08 Нд	Буча	Олексієнко Ярослава	Вероніка Лінтур	comp_gram	2022-08-15	2022-08-21	\N	\N
2102	252603	МК_Ужгород_Скретч_21.08_НД_10:00	Ужгород	Ганус Ольга	Перевузник Тетяна	scratch	2022-08-15	2022-08-21	\N	\N
2103	252561	МК_Борисполь_КГ_21.08_НД_10:00	Борисполь	Рижик Аліна	Чиколовець Вікторія	comp_gram	2022-08-15	2022-08-21	\N	\N
2104	252343	МК_онлайн_Граф.дизайн_21.08_НД_10:00	Онлайн_Фастов_Постолюк	Кашапова Лія	Постолюк Александра	graphdesign	2022-08-15	2022-08-21	\N	\N
2105	252032	МК_Дніпровський_Онлайн_Пайтон_НД_21.08_10:00	Онлайн_Пікалова_Півден-Схід	Каширин Богдан Северодонецк	Василенко Екатерина Вольногорск	python start	2022-08-15	2022-08-21	\N	\N
2106	250945	МК_Павлоград_Скретч_ВС_21/08_10:00	Павлоград Цум	Наталия Бабич	Шаповал Павлоград Ксения	scratch	2022-08-15	2022-08-21	\N	\N
2107	250380	МК_Ніжин_КГ_Нд_10:00_21.08	Нежин	Гах Дар'я	Гурчина Яна	comp_gram	2022-08-15	2022-08-21	\N	\N
2108	250246	МК_Пятихатки_КГ_Сб_21/08_10:00	Пятихатки	Бушуєв Станіслав	Центилевич Александрия Светлана	comp_gram	2022-08-15	2022-08-21	\N	\N
2109	250047	МК_Тернівка_КГ_ВС_21/08_10:00	Терновка	Потапова Оля Терновка	Потапова Оля Терновка	comp_gram	2022-08-15	2022-08-21	\N	\N
2110	249993	МК_Павлоград_Пайтон_ВС_21/08_10:00	Павлоград Цум	Поминчук Анастасия Павлоград	Шаповал Павлоград Ксения	python start	2022-08-15	2022-08-21	\N	\N
2111	249603	МК_Старкон_Скретч_21.08._НД_10.00	Старокостянтинів	Антонюк Марія	Галка Тетяна	scratch	2022-08-15	2022-08-21	\N	\N
2112	253618	МК_Поділля_Скретч_НД_21.08_11:00	Поділля	Іванова Анастасія	Жупанова Анастасія	scratch	2022-08-15	2022-08-21	\N	\N
2113	253587	Одесса_МК _Пайтон _Говорова_ВС_21/08_11-00	Говорова.Одесса	Исайко Светлана	Фараонова Настя	python start	2022-08-15	2022-08-21	\N	\N
2114	252697	МК_Васильков_Геймдиз_21.08_НД_11:00	Васильков	Раус Кирилл	Лілія Барабаш	gamedesign	2022-08-15	2022-08-21	\N	\N
2115	252652	МК_Бровары_КГ_21.08_нд_11-00	Бровары	Корень Олена	Анна Неділько	comp_gram	2022-08-15	2022-08-21	\N	\N
2116	252632	МК_Буча_Скреч 11:00 21.08 Нд	Буча	Андрей Домащенко	Вероніка Лінтур	scratch	2022-08-15	2022-08-21	\N	\N
2117	251810	МК_Львів_КГ_21.08_Нд_11:00	Сихів	Горбова Марія	Аквінська Вікторія	comp_gram	2022-08-15	2022-08-21	\N	\N
2118	251683	МК_Марганец_Скретч_ВС_21/08_11:00	Марганец	Тройно Сергей Марганец	Щасливець Марганец Алина	scratch	2022-08-15	2022-08-21	\N	\N
2119	251140	МК_Дніпро_Караван_Скретч_НД_21/08_11:00	Днепр.Караван	Скрипник Николай Днепр	Крупина Екатерина	scratch	2022-08-15	2022-08-21	\N	\N
2120	250155	МК_Черноморск_Скретч_Вс_21/08_11:00	Черноморск	Караульный Даниил	Константинова Мила	scratch	2022-08-15	2022-08-21	\N	\N
2121	249834	МК_Чернівці_Гейм_дизайн_21.08_НД_11:00	Чернівці офіс	Климчук Артур	Дячук Анна	gamedesign	2022-08-15	2022-08-21	\N	\N
2122	249605	МК_Старкон_Пайтон_21.08._НД_11.00	Старокостянтинів	Звада Іван	Галка Тетяна	python start	2022-08-15	2022-08-21	\N	\N
2123	254816	МК_Ужгород_Скретч_21.08_НД_11:10	Ужгород	Ганус Ольга	Перевузник Тетяна	scratch	2022-08-15	2022-08-21	\N	\N
2124	252434	МК_Павлоград_Скретч_ВС_21/08_11:30	Павлоград Цум	Поминчук Анастасия Павлоград	Шаповал Павлоград Ксения	scratch	2022-08-15	2022-08-21	\N	\N
2125	250381	МК_Ніжин_Скретч_Нд_11:30_21.08	Нежин	Гах Дар'я	Гурчина Яна	scratch	2022-08-15	2022-08-21	\N	\N
2126	250253	МК_Пятихатки_Скретч_Сб_21/08_11:30	Пятихатки	Бушуєв Станіслав	Центилевич Александрия Светлана	scratch	2022-08-15	2022-08-21	\N	\N
2127	250048	МК_Тернівка_Скретч_ВС_21/08_11:30	Терновка	Потапова Оля Терновка	Потапова Оля Терновка	scratch	2022-08-15	2022-08-21	\N	\N
2128	253514	МК_Онлайн_Днепр_Пайтон Старт_21.08_12.00	Онлайн_Півден-Схід Таран	Айзятов Олег Мирноград	Зданевич Евгения	python start	2022-08-15	2022-08-21	\N	\N
2129	252698	МК_Васильков_Скреч_21.08_НД_12:00	Васильков	Кузьмич Анна	Лілія Барабаш	scratch	2022-08-15	2022-08-21	\N	\N
2130	252633	МК_Буча_Пайтон 12:00 21.08 Нд	Буча	Андрей Домащенко	Вероніка Лінтур	python start	2022-08-15	2022-08-21	\N	\N
2131	252269	МК_Нетішин_Скретч_21.08._НД_12:00	Нетішин	Гаврилюк Наталія	Ковтунович Оксана	scratch	2022-08-15	2022-08-21	\N	\N
2132	252139	МК_Дніпровський_Онлайн_Скретч_СТ_НД_21.08_12:00	Онлайн_Пікалова_Півден-Схід	Тушева Анастасия Краматорск	Борисенко Синельниково Диана	scratch	2022-08-15	2022-08-21	\N	\N
2133	252034	МК_Дніпровський_Онлайн_Пайтон_НД_21.08_12:00	Онлайн_Пікалова_Півден-Схід	Жабко Александр Мирноград	Василенко Екатерина Вольногорск	python start	2022-08-15	2022-08-21	\N	\N
2134	251812	МК_Львів_Скретч_21.08_Нд_12:00	Сихів	Горбова Марія	Аквінська Вікторія	scratch	2022-08-15	2022-08-21	\N	\N
2135	251143	МК_Дніпро_Караван_Веб_НД_21/08_12:15	Днепр.Караван	Скрипник Николай Днепр	Крупина Екатерина	websites	2022-08-15	2022-08-21	\N	\N
2136	250971	МК_Киев_Оболонь_Скретч_ВС_21.08_12:00	Киев, Оболонь	Кириченко Ольга	Ярмак Анна	scratch	2022-08-15	2022-08-21	\N	\N
2137	250156	МК_Черноморск_Пайтон_Вс_21/08_12:00	Черноморск	Мищенко Михаил	Константинова Мила	python start	2022-08-15	2022-08-21	\N	\N
2138	249909	МК_Могилів-Подільський_Скретч_НД_21.08_12:00	Могилів-Подільський	Марія Пантелейчук	Людмила Коваленко	scratch	2022-08-15	2022-08-21	\N	\N
2139	249822	МК_Ковель_ Скретч_НД_21.08_12:00	Ковель	Лехняк Роман	Даць Уляна	scratch	2022-08-15	2022-08-21	\N	\N
2140	249761	МК_Дубно_ КГ_НД_21.08_12:00	Дубно	Джаган Ангеліна	Велічко Софія	comp_gram	2022-08-15	2022-08-21	\N	\N
2141	249590	МК_Калуш_Скретч_21.08_НД_12:00	Калуш	Фрицька Олександра	Вовчак Анастасія	scratch	2022-08-15	2022-08-21	\N	\N
2142	249560	МК_Болград_Скретч_Вс_21/08_12:00	Болград	Пашкевич Ольга		scratch	2022-08-15	2022-08-21	\N	\N
2143	252605	МК_Ужгород_Пайтон_21.08_НД_12:20	Ужгород	Брацун Світлана	Перевузник Тетяна	python start	2022-08-15	2022-08-21	\N	\N
2144	253619	МК_Поділля_Пайтон_НД_21.08_12:30	Поділля		Гладишко Віталіна	python start	2022-08-15	2022-08-21	\N	\N
2145	252967	МК_ІФ_Скретч_21.08_НД_12:30	ІФ офіс	Данилів Іванна	Шеленко Наталя	scratch	2022-08-15	2022-08-21	\N	\N
2146	251685	МК_Марганец_Геймдизайн _ВС_21/08_12:30	Марганец	Тройно Сергей Марганец	Щасливець Марганец Алина	gamedesign	2022-08-15	2022-08-21	\N	\N
2147	249836	МК_Чернівці_Веб-сайти_21.08_НД_12:30	Чернівці офіс	Климчук Артур	Дячук Анна	websites	2022-08-15	2022-08-21	\N	\N
2148	253176	МК_Стрий_Скретч_НД_21.08_13:00	Стрий	Смуток Василь	Диба Рома	scratch	2022-08-15	2022-08-21	\N	\N
2149	253041	МК Южний Веб Диз ВС 21.08 13 -00	Южный	Татьяна Пашенко	Снигур Елена	websites	2022-08-15	2022-08-21	\N	\N
2150	252699	МК_Васильков_Пайтон_21.08_НД_13:00	Васильков	Кузьмич Анна	Лілія Барабаш	python start	2022-08-15	2022-08-21	\N	\N
2151	252636	МК_Буча_Гейм-дизайн 13:00 21.08 Нд	Буча	Андрей Домащенко	Вероніка Лінтур	gamedesign	2022-08-15	2022-08-21	\N	\N
2152	252342	МК_Жовква_Скретч_НД_21.08_13.00	Жовква	Кващишин Наталія	Антроп Ірина	scratch	2022-08-15	2022-08-21	\N	\N
2153	252271	МК_Нетішин_КГ_21.08._НД_13:00	Нетішин	Гаврилюк Наталія	Ковтунович Оксана	comp_gram	2022-08-15	2022-08-21	\N	\N
2154	251813	МК_Львів_Геймдизайн_21.08_Нд_13:00	Сихів	Горбова Марія	Аквінська Вікторія	gamedesign	2022-08-15	2022-08-21	\N	\N
2155	250382	МК_Ніжин_Пайтон_Нд_13:00_21.08	Нежин	Гурчин Александр	Гурчина Яна	python start	2022-08-15	2022-08-21	\N	\N
2156	250273	МК_Пятихатки_Пайтон_Сб_21/08_13:00	Пятихатки	Пицык Иван Пятихатки	Центилевич Александрия Светлана	python start	2022-08-15	2022-08-21	\N	\N
2157	249990	МК_Павлоград_КГ_ВС_21/08_13:00	Павлоград Цум	Кравченко Альона Павлоград	Шаповал Павлоград Ксения	comp_gram	2022-08-15	2022-08-21	\N	\N
2158	249946	МК_Могилів-Подільський_Пайтон_НД_21.08_13:00	Могилів-Подільський	Марія Пантелейчук	Людмила Коваленко	python start	2022-08-15	2022-08-21	\N	\N
2159	249823	МК_Ковель_ Скретч_НД_21.08_13:00 |  |  | 	Ковель	Лехняк Роман	Даць Уляна	scratch	2022-08-15	2022-08-21	\N	\N
2160	249763	МК_Дубно_ СКРЕТЧ_НД_21.08_13:00	Дубно	Джаган Ангеліна	Велічко Софія	scratch	2022-08-15	2022-08-21	\N	\N
2161	249610	МК_Красилів_Скретч_21.08._НД_13.00	Красилів	Якубець Анастасія	Якубець Анастасія	scratch	2022-08-15	2022-08-21	\N	\N
2162	249562	МК_Болград_Пайтон_Вс_21/08_13:00	Болград	Пашкевич Ольга		python start	2022-08-15	2022-08-21	\N	\N
2163	249591	МК_Калуш_Пайтон_21.08_НД_13:15	Калуш	Підлісний Михайло	Вовчак Анастасія	python start	2022-08-15	2022-08-21	\N	\N
2164	253850	МК_Дніпровський_Онлайн_Скретч_СТ_НД_21.08_13:30	Онлайн_Пікалова_Півден-Схід	Тушева Анастасия Краматорск	Борисенко Синельниково Диана	scratch	2022-08-15	2022-08-21	\N	\N
2165	252966	МК_ІФ_КГ_21.08_НД_13:30	ІФ офіс	Данилів Іванна	Шеленко Наталя	comp_gram	2022-08-15	2022-08-21	\N	\N
2166	251148	МК_Дніпро_Караван_Пайтон_НД_21/08_13:30	Днепр.Караван	Скрипник Николай Днепр	Крупина Екатерина	python start	2022-08-15	2022-08-21	\N	\N
2167	250968	МК_Киев_Оболонь_Питон_ВС_21.08_13:30	Киев, Оболонь	Ляшук Андрій	Ярмак Анна	python start	2022-08-15	2022-08-21	\N	\N
2168	253178	МК_Стрий_Пайтон_НД_21.08_14:00	Стрий	Смуток Василь	Диба Рома	python start	2022-08-15	2022-08-21	\N	\N
2169	253042	МК Южний Пайтон ВС 21.08 14 -00	Южный	Татьяна Пашенко	Снигур Елена	python start	2022-08-15	2022-08-21	\N	\N
2170	252969	МК_Мукачево_ Скретч_21.08_НД_14:00	Мукачево	Бойог Сергій	Фабрицій Софія	scratch	2022-08-15	2022-08-21	\N	\N
2171	251814	МК_Львів_Пайтон_21.08_Нд_14:00	Сихів	Горбова Марія	Аквінська Вікторія	python start	2022-08-15	2022-08-21	\N	\N
2172	251687	МК_Марганец_Пайтон _ВС_21/08_14:00	Марганец	Тройно Сергей Марганец	Щасливець Марганец Алина	python start	2022-08-15	2022-08-21	\N	\N
2173	250720	МК_Жовква_Скретч_НД_21.08_14.00	Жовква	Кващишин Наталія	Антроп Ірина	scratch	2022-08-15	2022-08-21	\N	\N
2174	249825	МК_Ковель_ Вебдизайн_НД_21.08_14:00	Ковель	Лехняк Роман	Даць Уляна	websites	2022-08-15	2022-08-21	\N	\N
2175	249799	МК_Дубно_ ВЕБдизайн_НД_21.08_14:00	Дубно	Джаган Ангеліна	Велічко Софія	websites	2022-08-15	2022-08-21	\N	\N
2176	256473	МК_Пятихатки_Пайтон_Сб_21/08_14:30	Пятихатки	Пицык Иван Пятихатки	Центилевич Александрия Светлана	python start	2022-08-15	2022-08-21	\N	\N
2177	250963	МК_Павлоград_Пайтон_ВС_21/08_14:30	Павлоград Цум	Самсоненко Роман Павлоград	Шаповал Павлоград Ксения	python start	2022-08-15	2022-08-21	\N	\N
2178	250960	МК_Павлоград_КГ_ВС_21/08_14:30	Павлоград Цум	Кравченко Альона Павлоград	Шаповал Павлоград Ксения	comp_gram	2022-08-15	2022-08-21	\N	\N
2179	249995	МК_Павлоград_Гейм_ВС_21/08_14:30	Павлоград Цум	Кравченко Альона Павлоград	Шаповал Павлоград Ксения	gamedesign	2022-08-15	2022-08-21	\N	\N
2180	249609	МК_Красилів_Пайтон_21.08._НД_14.30	Красилів	Якубець Анастасія	Якубець Анастасія	python start	2022-08-15	2022-08-21	\N	\N
2181	252988	МК_ІФ_Скретч_21.08_НД_15:00	ІФ Університет	Данилів Іванна	Шеленко Наталя	scratch	2022-08-15	2022-08-21	\N	\N
2182	252565	МК_Борисполь_Пайтон_21.08_НД_15:00	Борисполь	Марк Гордиенко	Чиколовець Вікторія	python start	2022-08-15	2022-08-21	\N	\N
2183	250715	МК_Жовква_Пайтон_НД_21.08_15.00	Жовква	Кожушко Михайло	Антроп Ірина	python start	2022-08-15	2022-08-21	\N	\N
2184	249828	МК_Ковель_ Пайтон_НД_21.08_15:00	Ковель	Шимчук Сергій	Даць Уляна	python start	2022-08-15	2022-08-21	\N	\N
2185	249804	МК_Дубно_ Пайтон_НД_21.08_15:00	Дубно	Подворна Ольга	Велічко Софія	python start	2022-08-15	2022-08-21	\N	\N
2186	252970	МК_Мукачево_ Скретч_21.08_НД_15:10	Мукачево	Бойог Сергій		scratch	2022-08-15	2022-08-21	\N	\N
2187	253623	МК_Вишенька_Скретч_НД_21.08_15:30	Вишенька	Іванова Анастасія	Петренко Тетяна	scratch	2022-08-15	2022-08-21	\N	\N
2188	252285	МК_Сторожинець_Скретч_21.08_НД_15:30	Сторожинець	Родімкіна Надія	Цугуй Анастасія	scratch	2022-08-15	2022-08-21	\N	\N
2189	252942	МК_Борисполь_Граф.диз_21.08_НД_16:00	Борисполь	Марк Гордиенко	Чиколовець Вікторія	graphdesign	2022-08-15	2022-08-21	\N	\N
2190	252426	МК_Старкон_Гейм_21.08._НД_16:00	Старокостянтинів	Звада Іван	Галка Тетяна	gamedesign	2022-08-15	2022-08-21	\N	\N
2191	250965	МК_Павлоград_Пайтон_ВС_21/08_16:00	Павлоград Цум	Самсоненко Роман Павлоград	Шаповал Павлоград Ксения	python start	2022-08-15	2022-08-21	\N	\N
2192	250961	МК_Павлоград_Гейм_ВС_21/08_16:00	Павлоград Цум	Кравченко Альона Павлоград	Шаповал Павлоград Ксения	gamedesign	2022-08-15	2022-08-21	\N	\N
2193	250934	МК_Запорожье_Александровский_Пайтон_ВС_21/08_16:00	Запорожье.Александровский	Роговенко Данііл	Котова Запорожье тел.0666883467 Оксана	python start	2022-08-15	2022-08-21	\N	\N
2194	249831	МК_Ковель_ Пайтон_НД_21.08_16:00	Ковель	Шимчук Сергій	Даць Уляна	python start	2022-08-15	2022-08-21	\N	\N
2195	249624	МК_Онлайн_Пайтон_21.08_вс_16:00	Онлайн_Фастов_Лобанова	Семенюк Евгений	Лобанова Наталия	python start	2022-08-15	2022-08-21	\N	\N
2196	252287	МК_Сторожинець_Пайтон_21.08_НД_16:30	Сторожинець	Родімкіна Надія	Цугуй Анастасія	python start	2022-08-15	2022-08-21	\N	\N
2197	253620	МК_Вишенька_Пайтон_НД_21.08_17:00	Вишенька	Дущак Володимир	Петренко Тетяна	python start	2022-08-15	2022-08-21	\N	\N
2198	250926	МК_Запорожье_Александровский_КГ_ВС_21/08_17:00	Запорожье.Александровский	Шульга Данил Запорожье	Котова Запорожье тел.0666883467 Оксана	comp_gram	2022-08-15	2022-08-21	\N	\N
2199	256031	МК_Онлайн_Скретч_Старші_21.08_ВС_18:00	Онлайн	Романюк Олег	Екатерина Воробьёва	scratch	2022-08-15	2022-08-21	\N	\N
2200	256004	МК_Онлайн_Скретч_Молодші_21.08_ВС_18:00	Онлайн	Крылова Виктория	Тельчарова Диана	scratch	2022-08-15	2022-08-21	\N	\N
2201	253474	МК_Онлайн_Скретч_Старші_21.08_ВС_18:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-15	2022-08-21	\N	\N
2202	253468	МК_Онлайн_Пайтон Старт_21.08_НД_18:00	Онлайн	Иванова Марьяна	Чередниченко Светлана	python start	2022-08-15	2022-08-21	\N	\N
2203	253453	МК_Онлайн_ГрафДиз_21.08_ВС_18:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-15	2022-08-21	\N	\N
2204	253435	МК_Онлайн_Скретч_Молодші_21.08_ВС_18:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-15	2022-08-21	\N	\N
2205	251676	МК_Онлайн_Пайтон_Вс_21.08_18:00		Кнідзе Міша	Ситник Катерина	python start	2022-08-15	2022-08-21	\N	\N
2206	250925	МК_Запорожье_Александровский_Скретч_ВС_21/08_18:00	Запорожье.Александровский	Шульга Данил Запорожье	Котова Запорожье тел.0666883467 Оксана	scratch	2022-08-15	2022-08-21	\N	\N
2207	256569	МК_Онлайн_Скретч_Молодші_21.08_ВС_19:00	Онлайн	Крылова Виктория	Тельчарова Диана	scratch	2022-08-15	2022-08-21	\N	\N
2208	253796	МК_Онлайн_Скретч_Старші_21.08_ВС_19:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-15	2022-08-21	\N	\N
2209	253488	МК_Онлайн_Англ А1_21.08_ВС_19:00	Онлайн	Проноза Катерина	Зыгарь Валентина	english	2022-08-15	2022-08-21	\N	\N
2210	253470	МК_Онлайн_Пайтон Старт_21.08_НД_19:00	Онлайн	Иванова Марьяна	Чередниченко Светлана	python start	2022-08-15	2022-08-21	\N	\N
2211	253454	МК_Онлайн_ГрафДиз_21.08_ВС_19:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-15	2022-08-21	\N	\N
2212	253436	МК_Онлайн_Скретч_Молодші_21.08_ВС_19:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-15	2022-08-21	\N	\N
1720	250096	English Test (Dnipro-Donetsk)	Александрия		Центилевич Александрия Светлана	english	2022-08-01	2022-08-07	\N	\N
1721	249982	Тест_Одес. обл_Англ_			Ольга Красник	english	2022-08-01	2022-08-07	\N	\N
1722	250050	МК_Онлайн_Скретч_2.08_ВТ_9:30	Онлайн	Вероника Каганец	Екатерина Воробьёва	scratch	2022-08-01	2022-08-07	\N	\N
1723	249997	English_ Тест_Южный регион Сергеева	Одесса_Англ.яз	Чех Алексей	Фараонова Настя	english	2022-08-01	2022-08-07	\N	\N
1724	249476	МК_Онлайн_Скретч_Молодші_2.08_ВТ_18:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-01	2022-08-07	\N	\N
1725	249462	МК_Онлайн_Пайтон Старт_2.08_ВТ_18:00	Онлайн	Дудка Анатолий	Чередниченко Светлана	python start	2022-08-01	2022-08-07	\N	\N
1726	249453	МК_Онлайн_Скретч_Старші_2.08_ВТ_18:00	Онлайн	Солодка Світлана	Екатерина Воробьёва	scratch	2022-08-01	2022-08-07	\N	\N
1727	249449	МК_Онлайн_ГрафДиз_02.08_ВТ_18:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-01	2022-08-07	\N	\N
1728	249445	МК_Онлайн_Питон Про_2.08_ВТ_18:00	Онлайн	Лиза Бондаренко	Гурджиян Виктория	python pro	2022-08-01	2022-08-07	\N	\N
1729	249851	МК_Онлайн_Англ А1_02.08_ВТ_19:00	Онлайн	Проноза Катерина	Зыгарь Валентина	english	2022-08-01	2022-08-07	\N	\N
1730	249486	МК_Онлайн_Пайтон Про_2.08_ВТ_19:00	Онлайн	Лиза Бондаренко	Гурджиян Виктория	python pro	2022-08-01	2022-08-07	\N	\N
1731	249475	МК_Онлайн_Скретч_Молодші_2.08_ВТ_19:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-01	2022-08-07	\N	\N
1732	249463	МК_Онлайн_Пайтон Старт_2.08_ВТ_19:00	Онлайн	Дудка Анатолий	Чередниченко Светлана	python start	2022-08-01	2022-08-07	\N	\N
1733	249418	МК_Онлайн_ГрафДиз_02.08_ВТ_19:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-01	2022-08-07	\N	\N
1734	248963	МК_Онлайн_Скретч_2.08_ВТ_19:00	Онлайн	Вероника Каганец	Екатерина Воробьёва	scratch	2022-08-01	2022-08-07	\N	\N
1735	249487	МК_Онлайн_Пайтон Про_2.08_ВТ_20:00	Онлайн	Лиза Бондаренко	Гурджиян Виктория	python pro	2022-08-01	2022-08-07	\N	\N
1736	249474	МК_Онлайн_Скретч_Молодші_2.08_ВТ_20:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-01	2022-08-07	\N	\N
1737	249464	МК_Онлайн_Пайтон Старт_2.08_ВТ_20:00	Онлайн	Дудка Анатолий	Чередниченко Светлана	python start	2022-08-01	2022-08-07	\N	\N
1738	249454	МК_Онлайн_Скретч_Старші_2.08_ВТ_20:00	Онлайн	Вероника Каганец	Екатерина Воробьёва	scratch	2022-08-01	2022-08-07	\N	\N
1739	249446	МК_Онлайн_ГрафДиз_02.08_ВТ_20:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-01	2022-08-07	\N	\N
1740	250799	English Test_Dnipro | ТЕСТ НА ОПРЕДЕЛЕНИЕ УРОВНЯ АНГЛИЙСКОГО ЯЗЫКА А1/А2	Днепр.Центр		Соколова Марина	english	2022-08-01	2022-08-07	\N	\N
1741	249998	ЦУ_тест_английский			Вахний Виктория	english	2022-08-01	2022-08-07	\N	\N
1742	249488	МК_Онлайн_Пайтон Про_4.08_ЧТ_18:00	Онлайн	Сапонов Андрій	Гурджиян Виктория	python start	2022-08-01	2022-08-07	\N	\N
1743	249477	МК_Онлайн_Скретч_Молодші_4.08_ЧТ_18:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-01	2022-08-07	\N	\N
1744	249465	МК_Онлайн_Пайтон Старт_4.08_ЧТ_18:00	Онлайн	Дудка Анатолий	Чередниченко Светлана	python start	2022-08-01	2022-08-07	\N	\N
1745	249456	МК_Онлайн_Скретч_Старші_4.08_ЧТ_18:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-01	2022-08-07	\N	\N
1746	249450	МК_Онлайн_ГрафДиз_04.08_ЧТ_18:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-01	2022-08-07	\N	\N
1747	249489	МК_Онлайн_Пайтон Про_4.08_ЧТ_19:00	Онлайн	Сапонов Андрій	Гурджиян Виктория	python pro	2022-08-01	2022-08-07	\N	\N
1748	249478	МК_Онлайн_Скретч_Молодші_4.08_ЧТ_19:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-01	2022-08-07	\N	\N
1749	249467	МК_Онлайн_Пайтон Старт_4.08_ЧТ_19:00	Онлайн	Дудка Анатолий	Чередниченко Светлана	python start	2022-08-01	2022-08-07	\N	\N
1750	249457	МК_Онлайн_Скретч_Старші_4.08_ЧТ_19:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-01	2022-08-07	\N	\N
1751	249419	МК_Онлайн_ГрафДиз_04.08_ЧТ_19:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-01	2022-08-07	\N	\N
1752	249490	МК_Онлайн_Пайтон Про_4.08_ЧТ_20:00	Онлайн	Сапонов Андрій	Гурджиян Виктория	python pro	2022-08-01	2022-08-07	\N	\N
1753	249479	МК_Онлайн_Скретч_Молодші_4.08_ЧТ_20:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-01	2022-08-07	\N	\N
1754	249468	МК_Онлайн_Пайтон Старт_4.08_ЧТ_20:00	Онлайн	Дудка Анатолий	Чередниченко Светлана	python start	2022-08-01	2022-08-07	\N	\N
1755	249458	МК_Онлайн_Скретч_Старші_4.08_ЧТ_20:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-01	2022-08-07	\N	\N
1756	249447	МК_Онлайн_ГрафДиз_04.08_ЧТ_20:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-01	2022-08-07	\N	\N
1757	251547	Луцьк-Центр_Тест_English	Львівська Область_Англ		Літкевич Вікторія	english	2022-08-01	2022-08-07	\N	\N
1758	249790	МК_Онлайн_Пайтон_ПТ_05/08_12:00	Онлайн Харьков	Артур Хоботков	Николаева Елена	python start	2022-08-01	2022-08-07	\N	\N
1759	250128	МК Онлайн Скретч ПТ 15-00	Одесса _ ОНЛАЙН	Савченко София	Малярчук Яна	scratch	2022-08-01	2022-08-07	\N	\N
1760	249809	МК Онлайн Веб Диз ПТ 16-00	Одесса _ ОНЛАЙН	Урбанович Маргарита	Маковеева Светлана	websites	2022-08-01	2022-08-07	\N	\N
1761	249791	МК_Онлайн_Скретч_ПТ_05/08_16:00	Онлайн Харьков	Хаустова Виктория	Николаева Елена	scratch	2022-08-01	2022-08-07	\N	\N
1762	249599	МК_Онлайн_Геймдизайн_5.08_ПТ_16:00	Буча_Онлайн_Гулейкова	Давыдовская Лилиана	Гулейкова Яна	gamedesign	2022-08-01	2022-08-07	\N	\N
1763	249466	МК_Онлайн_Скретч_05/08_ПТ_16:00		Петров Андрей	Обертун Настя	scratch	2022-08-01	2022-08-07	\N	\N
1764	249811	МК Онлайн_Графич Диз ПТ 17-00	Одесса _ ОНЛАЙН	Савченко София	Снигур Елена	graphdesign	2022-08-01	2022-08-07	\N	\N
1765	249601	МК_Онлайн_Пайтон_5.08_ПТ_17:00	Онлайн_Фастов_Лобанова	Мерзлов Егор	Лобанова Наталия	python start	2022-08-01	2022-08-07	\N	\N
1766	249469	МК_Онлайн_ Python_ПТ_05/08_17-00		Петров Андрей	Обертун Настя	python start	2022-08-01	2022-08-07	\N	\N
1767	249813	МК Онлайн_Python__ПТ _18.00	Одесса _ ОНЛАЙН	Лукьянов Виктор	Дмитриева Наталья	python start	2022-08-01	2022-08-07	\N	\N
1768	249765	МК_Онлайн_ГрафДизайн_ПТ_05/08_18:00	Полтава, Центр	Педан Инна	Калієнко Даша	graphdesign	2022-08-01	2022-08-07	\N	\N
1769	249597	МК_Онлайн_Скретч_5.08_ПТ_18:00	Буча_Онлайн_Гулейкова	Мерзлов Егор	Гулейкова Яна	scratch	2022-08-01	2022-08-07	\N	\N
1770	249839	МК_Онлайн_Винница_Пайтон_06.08_СБ_10:00	Онлайн Вінниця	Стиренко Андрiй	Діана Бречко	python start	2022-08-01	2022-08-07	\N	\N
1771	249792	МК_Онлайн_Пайтон_Сб_06/08_10:00	Онлайн Харьков	Артур Хоботков	Николаева Елена	python start	2022-08-01	2022-08-07	\N	\N
1772	249494	МК_Дніпровський_Онлайн_Пайтон_СБ_06.08_10:00	Онлайн_Пікалова_Півден-Схід	Каширин Богдан Северодонецк	Василенко Екатерина Вольногорск	python start	2022-08-01	2022-08-07	\N	\N
1773	249862	МК_Онлайн_Пайтон_СБ_06.08_11:00	Кропивницкий	Кнідзе Міша	Иванова Анна	python start	2022-08-01	2022-08-07	\N	\N
1774	249496	МК_Дніпровський_Онлайн_Скретч_СБ_06.08_11:00	Онлайн_Пікалова_Півден-Схід	Тушева Анастасия Краматорск	Борисенко Синельниково Диана	scratch	2022-08-01	2022-08-07	\N	\N
1775	249766	МК_Онлайн_Скретч_СБ_06/08_12:00	Полтава, Центр	Педан Инна	Калієнко Даша	scratch	2022-08-01	2022-08-07	\N	\N
1776	249596	МК_Онлайн_Пайтон_06.08._СБ_12.00	Онлайн Чернівці 1	Длубік Владислав	Ружанська Анна	python start	2022-08-01	2022-08-07	\N	\N
1777	249887	МК_Онлайн_Геймдизайн_СБ_06.08_12:30		Солодка Світлана	Толюпа Татьяна	gamedesign	2022-08-01	2022-08-07	\N	\N
1778	249789	МК_Онлайн_ГрафДизайн_СБ_06/08_14:00	Полтава, Центр	Педан Инна	Калієнко Даша	graphdesign	2022-08-01	2022-08-07	\N	\N
1779	249575	Онлайн_Львів_тест_англійська	Львівська Область_Англ		Даць Уляна	english	2022-08-01	2022-08-07	\N	\N
1780	249830	МК_Онлайн_Винница_Пайтон_07.08_НД_11:00	Онлайн Вінниця	Стиренко Андрiй	Діана Бречко	python start	2022-08-01	2022-08-07	\N	\N
1781	251116	МК_Онлайн_Винница_Скретч_07.08_НД_12:00	Онлайн Вінниця	Грицюк Оксана	Діана Бречко	scratch	2022-08-01	2022-08-07	\N	\N
1782	251042	МК_Дніпро_Онлайн_Скретч_ВС_07/08_12:00	Днепр.Центр		Соколова Марина	scratch	2022-08-01	2022-08-07	\N	\N
1783	249497	МК_Дніпровський_Онлайн_Пайтон_НД_07.08_12:00	Онлайн_Пікалова_Півден-Схід	Жабко Александр Мирноград	Василенко Екатерина Вольногорск	python start	2022-08-01	2022-08-07	\N	\N
1784	251044	МК_Дніпро_Онлайн_Пайтон_ВС_07/08_13:00	Днепр.Центр		Соколова Марина	python start	2022-08-01	2022-08-07	\N	\N
1785	251022	МК_Дніпро_Онлайн_Пайтон_НД_07/08_13:00	Днепр.Победа	Нугуманов Максим	Марченко Валерия	python start	2022-08-01	2022-08-07	\N	\N
1786	251046	МК_Дніпро_Онлайн_Граф.дизайн_ВС_07/08_14:00	Днепр.Центр		Соколова Марина	graphdesign	2022-08-01	2022-08-07	\N	\N
1787	251023	МК_Дніпро_Онлайн_Граф.дизайн_НД_07/08_14:00	Днепр.Победа	Кафтан Никита Днепр	Марченко Валерия	graphdesign	2022-08-01	2022-08-07	\N	\N
1788	249498	МК_Дніпровський_Онлайн_Скретч_НД_07.08_14:00	Онлайн_Пікалова_Півден-Схід	Тушева Анастасия Краматорск	Борисенко Синельниково Диана	scratch	2022-08-01	2022-08-07	\N	\N
1789	249491	МК_Онлайн_Пайтон Про_7.08_ВС_18:00	Онлайн	Сапонов Андрій	Гурджиян Виктория	python pro	2022-08-01	2022-08-07	\N	\N
1790	249480	МК_Онлайн_Скретч_Молодші_7.08_ВС_18:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-01	2022-08-07	\N	\N
1791	249470	МК_Онлайн_Пайтон Старт_7.08_НД_18:00	Онлайн	Дудка Анатолий	Чередниченко Светлана	python start	2022-08-01	2022-08-07	\N	\N
1792	249459	МК_Онлайн_Скретч_Старші_7.08_ВС_18:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-01	2022-08-07	\N	\N
1793	249451	МК_Онлайн_ГрафДиз_07.08_НД_18:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-01	2022-08-07	\N	\N
1794	249854	МК_Онлайн_Англ А1_07.08_ВС_19:00	Онлайн	Проноза Катерина	Зыгарь Валентина	english	2022-08-01	2022-08-07	\N	\N
1795	249492	МК_Онлайн_Пайтон Про_7.08_ВС_19:00	Онлайн	Сапонов Андрій	Гурджиян Виктория	python pro	2022-08-01	2022-08-07	\N	\N
1796	249481	МК_Онлайн_Скретч_Молодші_7.08_ВС_19:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-01	2022-08-07	\N	\N
1797	249472	МК_Онлайн_Пайтон Старт_7.08_НД_19:00	Онлайн	Дудка Анатолий	Чередниченко Светлана	python start	2022-08-01	2022-08-07	\N	\N
1798	249460	МК_Онлайн_Скретч_Старші_7.08_ВС_19:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-01	2022-08-07	\N	\N
1799	249420	МК_Онлайн_ГрафДиз_07.08_НД_19:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-01	2022-08-07	\N	\N
1800	249493	МК_Онлайн_Пайтон Про_7.08_ВС_20:00	Онлайн	Сапонов Андрій	Гурджиян Виктория	python pro	2022-08-01	2022-08-07	\N	\N
1801	249473	МК_Онлайн_Пайтон Старт_7.08_НД_20:00	Онлайн	Дудка Анатолий	Чередниченко Светлана	python start	2022-08-01	2022-08-07	\N	\N
1802	249461	МК_Онлайн_Скретч_Старші_7.08_ВС_20:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-01	2022-08-07	\N	\N
1803	250982	Онлайн_МК_English_А1_16:00			Марюха Карина	english	2022-08-08	2022-08-14	\N	\N
1804	249606	МК_Онлайн_Геймдизайн_9.08_ВТ_16:00	Буча_Онлайн_Гулейкова	Павлюченко Анастасия	Гулейкова Яна	gamedesign	2022-08-08	2022-08-14	\N	\N
1805	251240	МК_Онлайн_Пайтон Про_9.08_ВТ_18:00	Онлайн	Сапонов Андрій	Гурджиян Виктория	python start	2022-08-08	2022-08-14	\N	\N
1806	251239	МК_Онлайн_Пайтон Старт_9.08_ВТ_18:00	Онлайн	Мигрин Артем	Чередниченко Светлана	python start	2022-08-08	2022-08-14	\N	\N
1807	251238	МК_Онлайн_Скретч_Старші_9.08_ВТ_18:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-08	2022-08-14	\N	\N
1808	251225	МК_Онлайн_ГрафДиз_09.08_ВТ_18:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-08	2022-08-14	\N	\N
1809	251221	МК_Онлайн_Скретч_Молодші_9.08_ВТ_18:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-08	2022-08-14	\N	\N
1810	250984	Онлайн_МК_English_А2_18:00			Марюха Карина	english	2022-08-08	2022-08-14	\N	\N
1811	249602	МК_Онлайн_Скретч_09.08_ВТ_18:00	Буча_Онлайн_Гулейкова	Мерзлов Егор	Гулейкова Яна	scratch	2022-08-08	2022-08-14	\N	\N
1812	251431	МК_Онлайн_Англ А1_09.08_ВТ_19:00	Онлайн	Проноза Катерина	Зыгарь Валентина	english	2022-08-08	2022-08-14	\N	\N
1813	251278	МК_Онлайн_Пайтон Старт_9.08_ВТ_19:00	Онлайн	Мигрин Артем	Чередниченко Светлана	python start	2022-08-08	2022-08-14	\N	\N
1814	251272	МК_Онлайн_Пайтон Про_9.08_ВТ_19:00	Онлайн	Сапонов Андрій	Гурджиян Виктория	python start	2022-08-08	2022-08-14	\N	\N
1815	251271	МК_Онлайн_Скретч_Старші_9.08_ВТ_19:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-08	2022-08-14	\N	\N
1816	251229	МК_Онлайн_ГрафДиз_09.08_ВТ_19:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-08	2022-08-14	\N	\N
1817	251222	МК_Онлайн_Скретч_Молодші_9.08_ВТ_19:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-08	2022-08-14	\N	\N
1818	249608	МК_Онлайн_Пайтон_9.08_ВТ_19:00	Онлайн_Фастов_Лобанова	Мерзлов Егор	Лобанова Наталия	python start	2022-08-08	2022-08-14	\N	\N
1819	251282	МК_Онлайн_Пайтон Старт_9.08_ВТ_20:00	Онлайн	Мигрин Артем	Чередниченко Светлана	python start	2022-08-08	2022-08-14	\N	\N
1820	251275	МК_Онлайн_Скретч_Старші_9.08_ВТ_20:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-08	2022-08-14	\N	\N
1821	251477	МК_Онлайн_Англ А1_11/08_Чт_16:00		Коржук Дарʼя	Обертун Настя	english	2022-08-08	2022-08-14	\N	\N
1822	250771	МК_English А1_Онлайн_Чт_11/08_16:00	Днепр.Центр		Соколова Марина	english	2022-08-08	2022-08-14	\N	\N
1823	251483	МК_Онлайн_Англ А2_11/08_Чт_17:00		Коржук Дарʼя	Обертун Настя	english	2022-08-08	2022-08-14	\N	\N
1824	250175	МК_Київ_онлайн_Пайтон_Чт_17:00_11.08	Онлайн Киев	Камков Валерий	Некрашевич София	python start	2022-08-08	2022-08-14	\N	\N
1825	251357	МК_Онлайн_Пайтон Старт_11.08_ЧТ_18:00	Онлайн	Мигрин Артем	Чередниченко Светлана	python start	2022-08-08	2022-08-14	\N	\N
1826	251284	МК_Онлайн_Скретч_Старші_11.08_ЧТ_18:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-08	2022-08-14	\N	\N
1827	251277	МК_Онлайн_Пайтон Про_11.08_ЧТ_18:00	Онлайн	Сапонов Андрій	Гурджиян Виктория	python start	2022-08-08	2022-08-14	\N	\N
1828	251234	МК_Онлайн_ГрафДиз_11.08_ЧТ_18:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-08	2022-08-14	\N	\N
1829	251224	МК_Онлайн_Скретч_Молодші_11.08_ЧТ_18:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-08	2022-08-14	\N	\N
1830	250774	МК_English А2_Онлайн_Чт_11/08_18:00	Днепр.Центр		Соколова Марина	english	2022-08-08	2022-08-14	\N	\N
1831	249620	МК_Онлайн_Сайти_11.08._ЧТ_18.00	Онлайн Чернівці 1	Спіжавка Станіслав	Ружанська Анна	websites	2022-08-08	2022-08-14	\N	\N
1832	251359	МК_Онлайн_Пайтон Старт_11.08_ЧТ_19:00	Онлайн	Мигрин Артем	Чередниченко Светлана	python start	2022-08-08	2022-08-14	\N	\N
1833	251287	МК_Онлайн_Скретч_Старші_11.08_ЧТ_19:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-08	2022-08-14	\N	\N
1834	251279	МК_Онлайн_Пайтон Про_11.08_ЧТ_19:00	Онлайн	Сапонов Андрій	Гурджиян Виктория	python start	2022-08-08	2022-08-14	\N	\N
1835	251236	МК_Онлайн_ГрафДиз_11.08_ЧТ_19:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-08	2022-08-14	\N	\N
1836	251227	МК_Онлайн_Скретч_Молодші_11.08_ЧТ_19:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-08	2022-08-14	\N	\N
1837	250173	Мк_Киев_онлайн_Скретч_Чт_19:00_11.08	Онлайн Киев	Таран София	Некрашевич София	scratch	2022-08-08	2022-08-14	\N	\N
1838	251362	МК_Онлайн_Пайтон Старт_11.08_ЧТ_20:00	Онлайн	Мигрин Артем	Чередниченко Светлана	python start	2022-08-08	2022-08-14	\N	\N
1839	251228	МК_Онлайн_Скретч_Молодші_11.08_ЧТ_20:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-08	2022-08-14	\N	\N
1840	253195	МК Онлайн Скреч ПТ 12.08. 12-00	Одесса _ ОНЛАЙН	Зелинская Марина	Малярчук Яна	scratch	2022-08-08	2022-08-14	\N	\N
1841	251673	МК_Онлайн_Пайтон_ПТ_12/08_12:00	Онлайн Харьков	Артур Хоботков	Николаева Елена	python start	2022-08-08	2022-08-14	\N	\N
1842	249840	МК Онлайн Скреч  ПТ 12.08. 12-00	Одесса _ ОНЛАЙН	Исайко Светлана	Малярчук Яна	scratch	2022-08-08	2022-08-14	\N	\N
1843	251564	Рівне_Тест_English	Львівська Область_Англ		Літкевич Вікторія	english	2022-08-08	2022-08-14	\N	\N
1844	249842	МК Онлайн Веб Диз ПТ 12.08   13 -00	Одесса _ ОНЛАЙН	Ференчук Роман	Малярчук Яна	websites	2022-08-08	2022-08-14	\N	\N
1845	253033	МК Онлайн Пайтон ПТ 12.08 14-00	Одесса _ ОНЛАЙН	Исайко Светлана	Малярчук Яна	python start	2022-08-08	2022-08-14	\N	\N
1846	251562	Дубно_Тест_English	Львівська Область_Англ		Літкевич Вікторія	english	2022-08-08	2022-08-14	\N	\N
1847	249843	МК Онлайн Пайтон  ПТ  12.08  14-00	Одесса _ ОНЛАЙН	Лареев Роман	Малярчук Яна	python start	2022-08-08	2022-08-14	\N	\N
1848	251565	Ковель_Тест_English	Львівська Область_Англ		Літкевич Вікторія	english	2022-08-08	2022-08-14	\N	\N
1849	251668	МК_Онлайн_Скретч_ПТ_12/08_16:00	Онлайн Харьков	Хаустова Виктория	Николаева Елена	scratch	2022-08-08	2022-08-14	\N	\N
1850	251640	МК_Онлайн_Скретч_12/08_ПТ_16:00		Петров Андрей	Обертун Настя	scratch	2022-08-08	2022-08-14	\N	\N
1851	251641	МК_Онлайн_ Python_ПТ_12/08_17-00		Петров Андрей	Обертун Настя	python start	2022-08-08	2022-08-14	\N	\N
1852	252341	МК_онлайн_Пайтон Про_12.08_ПТ_18:00	Онлайн_Фастов_Постолюк	Андрей Домащенко	Постолюк Александра	python pro	2022-08-08	2022-08-14	\N	\N
1853	251799	МК_Онлайн_ГрафДизайн_ПТ_12/08_18:00	Онлайн Харьков	Педан Инна	Калієнко Даша	graphdesign	2022-08-08	2022-08-14	\N	\N
1854	251800	МК_Онлайн_Скретч_СБ_13/08_10:00	Онлайн Харьков	Хаустова Виктория	Калієнко Даша	scratch	2022-08-08	2022-08-14	\N	\N
1855	251672	МК_Онлайн_Пайтон_Сб_13/08_10:00	Онлайн Харьков	Артур Хоботков	Николаева Елена	python start	2022-08-08	2022-08-14	\N	\N
1856	249658	МК_Дніпровський_Онлайн_Пайтон_СБ_13.08_10:00	Онлайн_Пікалова_Півден-Схід	Каширин Богдан Северодонецк	Василенко Екатерина Вольногорск	python start	2022-08-08	2022-08-14	\N	\N
1857	253389	МК_ онлайн_Пайтон _інд_13.08 Сб_11:00	Буча_Онлайн_Гулейкова	Мерзлов Егор	Гулейкова Яна	python start	2022-08-08	2022-08-14	\N	\N
1858	251675	МК_Онлайн_Пайтон_СБ_13.08_11:00	Кропивницкий	Кнідзе Міша	Иванова Анна	python start	2022-08-08	2022-08-14	\N	\N
1859	249594	МК_Онлайн_Гейм_13.08._СБ_11.00	Онлайн Чернівці 1	Длубік Владислав	Дячук Анна	gamedesign	2022-08-08	2022-08-14	\N	\N
1860	251582	МК_Дніпровський_Онлайн_Графдизайн_СБ_13.08_12:00	Онлайн_Пікалова_Півден-Схід	Багрий Татьяна Курахово	Щасливець Марганец Алина	graphdesign	2022-08-08	2022-08-14	\N	\N
1861	251494	МК_Онлайн_Пайтон_13.08_СБ_12:00	Онлайн Чернівці 1	Длубік Владислав	Ружанська Анна	python start	2022-08-08	2022-08-14	\N	\N
1862	251460	МК_ОнлайнЛьвів_Скретч_13.08_СБ_12:00	Онлайн_Львівський регіон_2022	Джаган Ангеліна	Даць Уляна	scratch	2022-08-08	2022-08-14	\N	\N
1863	249611	МК_Онлайн_Скретч_13.08_сб_12:00	Буча_Онлайн_Гулейкова	Андрей Домащенко	Гулейкова Яна	scratch	2022-08-08	2022-08-14	\N	\N
1864	251674	МК_Онлайн_Геймдизайн_СБ_13.08_12:30		Солодка Світлана	Волк Наталья	gamedesign	2022-08-08	2022-08-14	\N	\N
1865	249614	МК_Онлайн_Геймдизайн_13.08_СБ_13:00	Буча_Онлайн_Гулейкова	Павлюченко Анастасия	Гулейкова Яна	gamedesign	2022-08-08	2022-08-14	\N	\N
1866	251801	МК_Онлайн_ГрафДизайн_СБ_13/08_14:00	Онлайн Харьков	Педан Инна	Калієнко Даша	graphdesign	2022-08-08	2022-08-14	\N	\N
1867	249661	МК_Дніпровський_Онлайн_Скретч_МЛ_СБ_13.08_14:00	Онлайн_Пікалова_Півден-Схід	Семенова Александра Доброполье	Борисенко Синельниково Диана	scratch	2022-08-08	2022-08-14	\N	\N
1868	249617	МК_Онлайн_пайтон_13.08_СБ_14:00	Онлайн_Фастов_Лобанова	Кашапова Лія	Лобанова Наталия	python start	2022-08-08	2022-08-14	\N	\N
1869	252340	МК_онлайн_Граф.дизайн_14.08_НД_10:00	Онлайн_Фастов_Постолюк	Дворник Катерина	Постолюк Александра	graphdesign	2022-08-08	2022-08-14	\N	\N
1870	251043	МК_Дніпро_Онлайн_Скретч_ВС_14/08_10:00	Онлайн_Півден-Схід Таран	Денисенко Евгений	Зданевич Евгения	scratch	2022-08-08	2022-08-14	\N	\N
1871	250739	МК_Дніпро_Онлайн_Скретч_СБ_13/08_10:00	Днепр.Победа	Денисенко Евгений	Марченко Валерия	scratch	2022-08-08	2022-08-14	\N	\N
1872	251761	МК_Онлайн_Винница_Пайтон_14.08_НД_11:00	Онлайн Вінниця	Стиренко Андрiй	Діана Бречко	python start	2022-08-08	2022-08-14	\N	\N
1873	250748	МК_Дніпро_Онлайн_Пайтон_НД_14/08_11:00	Онлайн_Півден-Схід Таран	Денисенко Евгений	Зданевич Евгения	python start	2022-08-08	2022-08-14	\N	\N
1874	251762	МК_Онлайн_Винница_Скретч_14.08_НД_12:00	Онлайн Вінниця	Грицюк Оксана	Діана Бречко	scratch	2022-08-08	2022-08-14	\N	\N
1875	250750	МК_Дніпро_Онлайн_Граф.дизайн_НД_14/08_12:00	Онлайн_Півден-Схід Таран	Кафтан Никита Днепр	Зданевич Евгения	graphdesign	2022-08-08	2022-08-14	\N	\N
1876	249660	МК_Дніпровський_Онлайн_Пайтон_НД_14.08_12:00	Онлайн_Пікалова_Півден-Схід	Жабко Александр Мирноград	Василенко Екатерина Вольногорск	python start	2022-08-08	2022-08-14	\N	\N
1877	251045	МК_Дніпро_Онлайн_Пайтон_ВС_14/08_13:00	Днепр.Центр		Соколова Марина	python start	2022-08-08	2022-08-14	\N	\N
1878	251047	МК_Дніпро_Онлайн_Граф.дизайн_ВС_14/08_14:00	Днепр.Центр		Соколова Марина	graphdesign	2022-08-08	2022-08-14	\N	\N
1879	249662	МК_Дніпровський_Онлайн_Скретч_СТ_НД_14.08_14:00	Онлайн_Пікалова_Півден-Схід	Тушева Анастасия Краматорск	Борисенко Синельниково Диана	scratch	2022-08-08	2022-08-14	\N	\N
1880	251366	МК_Онлайн_Пайтон Старт_14.08_НД_18:00	Онлайн	Иванова Марьяна	Чередниченко Светлана	python start	2022-08-08	2022-08-14	\N	\N
1881	251360	МК_Онлайн_Скретч_Старші_14.08_ВС_18:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-08	2022-08-14	\N	\N
1882	251283	МК_Онлайн_Пайтон Про_14.08_ВС_18:00	Онлайн	Егорова Вероника	Гурджиян Виктория	python start	2022-08-08	2022-08-14	\N	\N
1883	251273	МК_Онлайн_ГрафДиз_14.08_ВС_18:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-08	2022-08-14	\N	\N
1884	251230	МК_Онлайн_Скретч_Молодші_14.08_ВС_18:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-08	2022-08-14	\N	\N
1885	251428	МК_Онлайн_Англ А1_14.08_ВС_19:00	Онлайн	Проноза Катерина	Зыгарь Валентина	english	2022-08-08	2022-08-14	\N	\N
1886	251426	МК_Онлайн_Пайтон Старт_14.08_НД_19:00	Онлайн	Иванова Марьяна	Чередниченко Светлана	python start	2022-08-08	2022-08-14	\N	\N
1887	251363	МК_Онлайн_Скретч_Старші_14.08_ВС_19:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-08	2022-08-14	\N	\N
1888	251285	МК_Онлайн_Пайтон Про_14.08_ВС_19:00	Онлайн	Егорова Вероника	Гурджиян Виктория	python start	2022-08-08	2022-08-14	\N	\N
1889	251276	МК_Онлайн_ГрафДиз_14.08_ВС_19:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-08	2022-08-14	\N	\N
1890	251231	МК_Онлайн_Скретч_Молодші_14.08_ВС_19:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-08	2022-08-14	\N	\N
1891	251429	МК_Онлайн_Пайтон Старт_14.08_НД_20:00	Онлайн	Иванова Марьяна	Чередниченко Светлана	python start	2022-08-08	2022-08-14	\N	\N
1892	251364	МК_Онлайн_Скретч_Старші_14.08_ВС_20:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-08	2022-08-14	\N	\N
1893	251280	МК_Онлайн_ГрафДиз_14.08_ВС_20:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-08	2022-08-14	\N	\N
1894	251233	МК_Онлайн_Скретч_Молодші_14.08_ВС_20:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-08	2022-08-14	\N	\N
2213	253299	МК_Онлайн_Пайтон Про_21.08_ВС_19:00	Онлайн	Егорова Вероника	Гурджиян Виктория	python start	2022-08-15	2022-08-21	\N	\N
2214	254618	МК_Онлайн_Англ А2_21.08_ВС_20:00	Онлайн	Єгорихина Олена	Зыгарь Валентина	english	2022-08-15	2022-08-21	\N	\N
2215	253797	МК_Онлайн_Скретч_Старші_21.08_ВС_20:00	Онлайн	Иноземец Анна	Екатерина Воробьёва	scratch	2022-08-15	2022-08-21	\N	\N
2216	253472	МК_Онлайн_Пайтон Старт_21.08_НД_20:00	Онлайн	Иванова Марьяна	Чередниченко Светлана	python start	2022-08-15	2022-08-21	\N	\N
2217	253455	МК_Онлайн_ГрафДиз_21.08_ВС_20:00	Онлайн	Пискова Юля	Пономарёва Алена	graphdesign	2022-08-15	2022-08-21	\N	\N
2218	253437	МК_Онлайн_Скретч_Молодші_21.08_ВС_20:00	Онлайн	Киблицкая Ольга	Тельчарова Диана	scratch	2022-08-15	2022-08-21	\N	\N
\.


--
-- Data for Name: home_location; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.home_location (id, standart_name, lms_location_name, region, client_manager, territorial_manager, regional_manager, tutor) FROM stdin;
618	онлайн	Онлайн	UA_SaaS	КМ ще не знайдено	Смідонова Ольга	Смідонова Ольга	
619	киев_оболонь	Киев, Оболонь	UA_Kiev	КМ ще не знайдено	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
620	киев_вднх	Киев, ВДНХ	UA_Kiev	Естонська Інна	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
621	киев_академ	Киев, Академ	UA_Kiev	Морозова Алла	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
622	киев_осокорки	Киев, Осокорки	UA_Kiev	КМ ще не знайдено	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
623	киев_позняки	Киев, Позняки	UA_Kiev	КМ ще не знайдено	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
624	киев_лукьяновка	Киев, Лукьяновка	UA_Kiev	Естонська Інна	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
625	киев_левобережная	Киев, Левобережная	UA_Kiev	Морозова Алла	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
626	киев_троещина	Киев, Троещина	UA_Kiev	Некрашевич Софія	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
627	нежин	Нежин	UA_Chernigov_obl	Гурчина Яна	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
628	прилуки	Прилуки	UA_Chernigov_obl	Гурчина Яна	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
629	бахмач	Бахмач	UA_Chernigov_obl	КМ ще не знайдено	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
630	онлайн_киев	Онлайн Киев	UA_Kiev	Некрашевич Софія	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
631	онлайн_чо	Онлайн ЧО	UA_Chernigov_obl	Гурчина Яна	Щербатюк Артем	Матюшенко Олексій	Кириченко Ольга
632	украинка	Украинка	UA_Kievskaya oblast	КМ ще не знайдено	Штепа Марина	Матюшенко Олексій	Раус Кирило
633	ирпень	Ирпень	UA_Kievskaya oblast	Лінтур Вероніка	Штепа Марина	Матюшенко Олексій	Раус Кирило
634	буча	Буча	UA_Kievskaya oblast	Лінтур Вероніка	Штепа Марина	Матюшенко Олексій	Раус Кирило
635	вишневое	Вишневое	UA_Kievskaya oblast	КМ ще не знайдено	Штепа Марина	Матюшенко Олексій	Раус Кирило
636	васильков	Васильков	UA_Kievskaya oblast	Барабаш Лілія	Штепа Марина	Матюшенко Олексій	Раус Кирило
637	боярка	Боярка	UA_Kievskaya oblast	Барабаш Лілія	Штепа Марина	Матюшенко Олексій	Раус Кирило
638	борисполь	Борисполь	UA_Kievskaya oblast	Чиколовець Вікторія 	Штепа Марина	Матюшенко Олексій	Раус Кирило
639	бровары	Бровары	UA_Kievskaya oblast	Неділько Анна	Штепа Марина	Матюшенко Олексій	Раус Кирило
640	бц	БЦ	UA_Kievskaya oblast	Семенюк Катерина	Штепа Марина	Матюшенко Олексій	Раус Кирило
641	фастов	Фастов	UA_Kievskaya oblast	Постолюк Олександра	Штепа Марина	Матюшенко Олексій	Раус Кирило
642	онлайн_фастов_постолюк	Онлайн_Фастов_Постолюк	UA_Kievskaya oblast	Постолюк Олександра	Штепа Марина	Матюшенко Олексій	Раус Кирило
643	буча_онлайн_гулейкова	Буча_Онлайн_Гулейкова	UA_Kievskaya oblast	Гулейкова Яна	Штепа Марина	Матюшенко Олексій	Раус Кирило
644	онлайн_фастов_лобанова	Онлайн_Фастов_Лобанова	UA_Kievskaya oblast	Лобанова Наталія	Штепа Марина	Матюшенко Олексій	Раус Кирило
645	онлайн_ирпень_линтур	Онлайн_Ирпень_Линтур	UA_Kievskaya oblast	Лінтур Вероніка	Штепа Марина	Матюшенко Олексій	Раус Кирило
646	онлайн_бц	Онлайн_БЦ	UA_Kievskaya oblast	Семенюк Катерина	Штепа Марина	Матюшенко Олексій	Раус Кирило
647	онлайн_боярка	Онлайн_Боярка	UA_Kievskaya oblast	Барабаш Лілія	Штепа Марина	Матюшенко Олексій	Раус Кирило
648	черкассы	Черкассы	UA_Center	Волк Наталя	Вахній Вікторія	Матюшенко Олексій	Олександрович Анна
649	смела	Смела	UA_Center	Волк Наталя	Вахній Вікторія	Матюшенко Олексій	Олександрович Анна
650	знаменка	Знаменка	UA_Center	КМ ще не знайдено	Вахній Вікторія	Матюшенко Олексій	Олександрович Анна
651	умань	Умань	UA_Center	Ситник Катерина	Вахній Вікторія	Матюшенко Олексій	Олександрович Анна
652	канев	Канев	UA_Center	Толюпа Тетяна	Вахній Вікторія	Матюшенко Олексій	Олександрович Анна
653	корсунь_шевченковский	Корсунь-Шевченковский	UA_Center	Толюпа Тетяна	Вахній Вікторія	Матюшенко Олексій	Олександрович Анна
654	кропивницкий	Кропивницкий	UA_Center	Дарій Інна	Вахній Вікторія	Матюшенко Олексій	Олександрович Анна
655	светловодск	Светловодск	UA_Center	Іванова Анна	Вахній Вікторія	Матюшенко Олексій	Олександрович Анна
656	цу_онлайн	ЦУ_ОНЛАЙН	UA_Center	Ситник Катерина	Вахній Вікторія	Матюшенко Олексій	Олександрович Анна
657	говороваодесса	Говорова.Одесса	UA_Odessa	Фараонова Анастасія	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
658	черемушкиодесса	Черемушки.Одесса	UA_Odessa	Костенко Викторія	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
659	вузовскийодесса	Вузовский.Одесса	UA_Odessa	КМ ще не знайдено	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
660	центродесса	Центр.Одесса	UA_Odessa	Фараонова Анастасія	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
661	мечниковаодесса	Мечникова.Одесса	UA_Odessa	КМ ще не знайдено	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
662	авангардодесса	Авангард.Одесса	UA_Odessa	КМ ще не знайдено	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
663	поселокодесса	Поселок.Одесса	UA_Odessa	Снігур Олена	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
664	беляевкаодесса	Беляевка.Одесса	UA_Odesskaya oblast	КМ ще не знайдено	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
665	южный	Южный	UA_Odesskaya oblast	Снігур Олена	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
666	подольскквинта	Подольск.Квинта	UA_Odesskaya oblast	Маковєєва Світлана	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
667	балталадушки	Балта.Ладушки	UA_Odesskaya oblast	Маковєєва Світлана	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
668	овидиопольдетский_клуб	Овидиополь.Детский клуб	UA_Odesskaya oblast	КМ ще не знайдено	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
669	раздельнаяприват	Раздельная.Приват	UA_Odesskaya oblast	Дмитрова Наталя	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
670	одесса___онлайн	Одесса _ ОНЛАЙН	UA_Odessa	Малярчук Яна	Сергєєва Вікторія	Матюшенко Олексій	Чех Алексей
671	одесса_кадор	Одесса Кадор	UA_Odesskaya oblast	Гажук Ольга	Краснік Ольга	Матюшенко Олексій	Егорова Анастасія
672	черноморск	Черноморск	UA_Odesskaya oblast	Константинова Мила	Краснік Ольга	Матюшенко Олексій	Егорова Анастасія
673	белгород_днестровский	Белгород-Днестровский	UA_Odesskaya oblast	КМ ще не знайдено	Краснік Ольга	Матюшенко Олексій	Егорова Анастасія
674	измаил	Измаил	UA_Odesskaya oblast	Головко Юля	Краснік Ольга	Матюшенко Олексій	Егорова Анастасія
675	рени	Рени	UA_Odesskaya oblast	КМ ще не знайдено	Краснік Ольга	Матюшенко Олексій	Егорова Анастасія
676	болград	Болград	UA_Odesskaya oblast	КМ ще не знайдено	Краснік Ольга	Матюшенко Олексій	Егорова Анастасія
677	южноукраинск	Южноукраинск	UA_Nikolaevskaya obl	Обертун Настя	Краснік Ольга	Матюшенко Олексій	Егорова Анастасія
678	вознесенск	Вознесенск	UA_Nikolaevskaya obl	Обертун Настя	Краснік Ольга	Матюшенко Олексій	Егорова Анастасія
679	первомайск	Первомайск	UA_Nikolaevskaya obl	Обертун Настя	Краснік Ольга	Матюшенко Олексій	Егорова Анастасія
680	николаевская_обл_онлайн	Николаевская обл. ОНЛАЙН	UA_Odesskaya oblast	Обертун Настя	Краснік Ольга	Матюшенко Олексій	Егорова Анастасія
681	замостя	Замостя	UA_Vynnytsya	Жупанова Анастасія	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
682	поділля	Поділля	UA_Vynnytsya	Жупанова Анастасія	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
683	вишенька	Вишенька	UA_Vynnytsya	Жупанова Анастасія	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
684	жмеринка	Жмеринка	UA_VynnytsyaOblast	КМ ще не знайдено	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
685	могилів_подільський	Могилів-Подільський	UA_VynnytsyaOblast	Коваленко Людмила	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
686	житомир	Житомир	UA_VynnytsyaOblast	Виговська Катерина	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
687	бердичів	Бердичів	UA_VynnytsyaOblast	Ніколайчук Тетяна	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
688	коростень	Коростень	UA_VynnytsyaOblast	Вознюк Світлана	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
689	хмільник	Хмільник	UA_VynnytsyaOblast	Гураль Надія	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
690	новоград_волинський	Новоград-Волинський	UA_VynnytsyaOblast	КМ ще не знайдено	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
691	малин	Малин	UA_VynnytsyaOblast	КМ ще не знайдено	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
692	онлайн_вінниця	Онлайн Вінниця	UA_VynnytsyaOblast	Бречко Діана	Гладишко Віталіна	Щербань Олександр	Іванова Анастасія
693	львів_центр_петрушевича	Львів-Центр-Петрушевича	UA_Lviv	Дорошенко Анна	Жмур Надя	Кравченко Олеся	Цібеленко Святослава
694	чорновола	Чорновола	UA_Lviv	Дорошенко Анна	Жмур Надя	Кравченко Олеся	Цібеленко Святослава
695	сихів	Сихів	UA_Lviv	Аквінська Вікторія	Жмур Надя	Кравченко Олеся	Цібеленко Святослава
696	рубчака	Рубчака	UA_Lviv	Аквінська Вікторія	Жмур Надя	Кравченко Олеся	Цібеленко Святослава
697	брюховичі	Брюховичі	UA_Lviv	КМ ще не знайдено	Жмур Надя	Кравченко Олеся	Цібеленко Святослава
698	пустомити	Пустомити	UA_Lviv	КМ ще не знайдено	Жмур Надя	Кравченко Олеся	Цібеленко Святослава
699	львів_винники	Львів-Винники	UA_Lviv	Почтарук Зоряна	Жмур Надя	Кравченко Олеся	Хомин Ірина
700	онлайн_львів	Онлайн Львів	UA_Lviv	Даць Уляна	Жмур Надя	Кравченко Олеся	Хомин Ірина
701	дрогобич	Дрогобич	UA_LvivOblast	Возняк Вероніка	Жмур Надя	Кравченко Олеся	Хомин Ірина
702	стрий	Стрий	UA_LvivOblast	Диба Рома	Жмур Надя	Кравченко Олеся	Хомин Ірина
703	червоноград	Червоноград	UA_LvivOblast	Федина Наталя	Жмур Надя	Кравченко Олеся	Хомин Ірина
704	борислав	Борислав	UA_LvivOblast	Возняк Вероніка	Жмур Надя	Кравченко Олеся	Хомин Ірина
705	броди	Броди	UA_LvivOblast	Почтарук Зоряна	Жмур Надя	Кравченко Олеся	Хомин Ірина
706	новояворівськ	Новояворівськ	UA_LvivOblast	КМ ще не знайдено	Жмур Надя	Кравченко Олеся	Хомин Ірина
707	жовква	Жовква	UA_LvivOblast	Людвіковська Надія	Жмур Надя	Кравченко Олеся	Хомин Ірина
708	тернопіль_центр	Тернопіль-Центр	UA_Lviv	Людвіковська Надія	Жмур Надя	Кравченко Олеся	Хомин Ірина
709	тернопіль_бам	Тернопіль-БАМ	UA_Lviv	Людвіковська Надія	Жмур Надя	Кравченко Олеся	удалить
710	кременець	Кременець	UA_LvivOblast	КМ ще не знайдено	Жмур Надя	Кравченко Олеся	Хомин Ірина
711	рівне_центр	Рівне-Центр	UA_Lviv	Варійчук Інна	Грановська Іра	Кравченко Олеся	Мельничук Ірина
712	дубно	Дубно	UA_LvivOblast	Велічко Софія	Грановська Іра	Кравченко Олеся	Терлецька Діана
713	луцьк_центр	Луцьк-Центр	UA_Lviv	Літкевич Вікторія	Грановська Іра	Кравченко Олеся	Терлецька Діана
714	ковель	Ковель	UA_LvivOblast	Даць Уляна	Грановська Іра	Кравченко Олеся	Терлецька Діана
715	нововолинськ	Нововолинськ	UA_LvivOblast	КМ ще не знайдено	Грановська Іра	Кравченко Олеся	
716	вараш	Вараш	UA_LvivOblast	КМ ще не знайдено	Грановська Іра	Кравченко Олеся	
717	костопіль	Костопіль	UA_LvivOblast	КМ ще не знайдено	Грановська Іра	Кравченко Олеся	Терлецька Діана
718	онлайн_льівський_регіон_2022	Онлайн_Льівський регіон_2022	UA_Lviv	Даць Уляна	Грановська Іра	Кравченко Олеся	Терлецька Діана
719	чернівці_офіс	Чернівці офіс	UA_Chernivtsi	Дячук Анна	Ніколаєнко Діна	Ласота Юрій	Горох Богдан
720	кп_розмарин	КП Розмарин	UA_ChernivtsiOblast	Юрчак Світлана	Ніколаєнко Діна	Ласота Юрій	Горох Богдан
721	хмельницький_офіс	Хмельницький офіс	UA_Chernivtsi	Норчук Альона	Ніколаєнко Діна	Ласота Юрій	Горох Богдан
722	іф_офіс	ІФ офіс	UA_Chernivtsi	Шеленко Наталія	Ісарик Люба	Ласота Юрій	Спіжавка Станіслав
723	іф_університет	ІФ Університет	UA_Chernivtsi	Шеленко Наталія	Ісарик Люба	Ласота Юрій	удалить
724	долина	Долина	UA_ChernivtsiOblast	Пристая Олеся	Ісарик Люба	Ласота Юрій	Спіжавка Станіслав
725	коломия	Коломия	UA_ChernivtsiOblast	Ружанська Анна	Ісарик Люба	Ласота Юрій	Спіжавка Станіслав
726	калуш	Калуш	UA_ChernivtsiOblast	Вовчак Анастасія	Ісарик Люба	Ласота Юрій	Спіжавка Станіслав
727	мукачево	Мукачево	UA_ChernivtsiOblast	Фабрицій Софія	Ісарик Люба	Ласота Юрій	Спіжавка Станіслав
728	ужгород	Ужгород	UA_Chernivtsi	КМ ще не знайдено	Ісарик Люба	Ласота Юрій	Спіжавка Станіслав
729	шепетівка	Шепетівка	UA_ChernivtsiOblast	Денещук Катерина	Ніколаєнко Діна	Ласота Юрій	Горох Богдан
730	славута	Славута	UA_ChernivtsiOblast	Янчук Ольга	Ніколаєнко Діна	Ласота Юрій	Горох Богдан
731	старокостянтинів	Старокостянтинів	UA_ChernivtsiOblast	Галка Тетяна	Ніколаєнко Діна	Ласота Юрій	Горох Богдан
732	нетішин	Нетішин	UA_ChernivtsiOblast	Ковтунович Оксана	Ніколаєнко Діна	Ласота Юрій	Горох Богдан
733	красилів	Красилів	UA_ChernivtsiOblast	Якубець Анастасія	Ніколаєнко Діна	Ласота Юрій	Горох Богдан
734	сторожинець	Сторожинець	UA_ChernivtsiOblast	Цугуй Анастасія	Ніколаєнко Діна	Ласота Юрій	Горох Богдан
735	полонне	Полонне	UA_ChernivtsiOblast	Дуброва Мирослава	Ніколаєнко Діна	Ласота Юрій	Горох Богдан
736	хуст_	Хуст 	UA_ChernivtsiOblast	Олексюк Наталія	Ісарик Люба	Ласота Юрій	Спіжавка Станіслав
737	онлайн_чернівці_1	Онлайн Чернівці 1	UA_Chernivtsi	Дячук Анна	Ніколаєнко Діна	Ласота Юрій	Горох Богдан
738	онлайн_чернівці_2	Онлайн Чернівці 2	UA_Chernivtsi	Ружанська Анна	Ісарик Люба	Ласота Юрій	Спіжавка Станіслав
739	полтава_центр	Полтава, Центр	UA_Poltava	Калієнко Дарина	ТМ ще не знайдено	Рощина Марія	Педан Інна
740	полтава_онлайн	Полтава Онлайн	UA_Poltava	Калієнко Дар'я	ТМ ще не знайдено	Рощина Марія	Педан Інна
741	миргород	Миргород	UA_Poltava	Калієнко Дарина	ТМ ще не знайдено	Рощина Марія	Педан Інна
742	кременчуг	Кременчуг	UA_Poltava	КМ ще не знайдено	ТМ ще не знайдено	Рощина Марія	Педан Інна
743	горишние_плавни	Горишние Плавни	UA_Poltava	КМ ще не знайдено	ТМ ще не знайдено	Рощина Марія	Педан Інна
744	онлайн_харьков	Онлайн Харьков	UA_Kharkov	Головко Валентина	ТМ ще не знайдено	Рощина Марія	Педан Інна
745	днепрслобожанский	Днепр.Слобожанский	UA_Dnepr	КМ ще не знайдено	Таран Светлана	Щапкова Катерина	
746	днепрподстанция	Днепр.Подстанция	UA_Dnepr	Зданевич Евгения	Таран Светлана	Щапкова Катерина	Марченко Валерія
747	днепрпобеда	Днепр.Победа	UA_Dnepr	Лупульчук Наталія	Таран Светлана	Щапкова Катерина	Марченко Валерія
748	днепркрасный_камень	Днепр.Красный Камень	UA_Dnepr	Лутаєва Галина	Таран Светлана	Щапкова Катерина	Марченко Валерія
749	днепркараван	Днепр.Караван	UA_Dnepr	Крупіна Катерина	Таран Светлана	Щапкова Катерина	Марченко Валерія
750	днепрцентр	Днепр.Центр	UA_Dnepr	Соколова Марина	Таран Светлана	Щапкова Катерина	Марченко Валерія
751	покров(орджо)	Покров(Орджо)	UA_Dnepropetrovskaya oblast2	КМ ще не знайдено	Таран Светлана	Щапкова Катерина	Гусева Олександра
752	запоріжжяплоща_фестівальна	Запоріжжя.Площа Фестівальна	UA_Dnepropetrovskaya oblast2	Марюха Каріна	Таран Светлана	Щапкова Катерина	Марченко Валерія
753	запорожьеалександровский	Запорожье.Александровский	UA_Dnepropetrovskaya oblast2	Котова Оксана	Таран Светлана	Щапкова Катерина	Марченко Валерія
754	запорожьевознесеновский	Запорожье.Вознесеновский	UA_Dnepropetrovskaya oblast2	Котова Оксана	Таран Светлана	Щапкова Катерина	Марченко Валерія
755	гвольнянск_переулок_торговый	г.Вольнянск Переулок Торговый	UA_Dnepropetrovskaya oblast2	КМ ще не знайдено	Таран Светлана	Щапкова Катерина	Гусева Олександра
756	токмак	Токмак	UA_Dnepropetrovskaya oblast2	КМ ще не знайдено	Таран Светлана	Щапкова Катерина	Гусева Олександра
757	гпологи	г.Пологи	UA_Dnepropetrovskaya oblast2	КМ ще не знайдено	Таран Светлана	Щапкова Катерина	Гусева Олександра
758	павлоград_цум	Павлоград Цум	UA_Donetskobl	Шаповал Ксенія	Пикалова Карина	Щапкова Катерина	Гусева Олександра
759	павлоград_орбита	Павлоград Орбита	UA_Donetskobl	Шаповал Ксенія	Пикалова Карина	Щапкова Катерина	Гусева Олександра
760	терновка	Терновка	UA_Donetskobl	Потапова Ольга	Пикалова Карина	Щапкова Катерина	Жилкин Анатолій
761	першотравенск	Першотравенск	UA_Donetskobl	КМ ще не знайдено	Пикалова Карина	Щапкова Катерина	Гусева Олександра
762	заречный	Заречный	UA_Dnepr_region	Недільчук Дарина	Пикалова Карина	Щапкова Катерина	Жилкин Анатолій
763	соцгород	Соцгород	UA_Dnepr_region	Недільчук Дарина	Пикалова Карина	Щапкова Катерина	Жилкин Анатолій
764	никополь	Никополь	UA_Dnepropetrovskaya oblast	Василенко Катерина	Пикалова Карина	Щапкова Катерина	Гусева Олександра
765	александрия	Александрия	UA_Dnepr_region	Центелевич Светлана 	Пикалова Карина	Щапкова Катерина	Жилкин Анатолій
766	каменское	Каменское	UA_Dnepr_region	Асанова Софія	Пикалова Карина	Щапкова Катерина	Жилкин Анатолій
767	пятихатки	Пятихатки	UA_Dnepropetrovskaya oblast	Центелевич Светлана 	Пикалова Карина	Щапкова Катерина	Жилкин Анатолій
768	желтые_воды	Желтые Воды	UA_Dnepropetrovskaya oblast	Решетило Марина	Пикалова Карина	Щапкова Катерина	Жилкин Анатолій
769	вольногорск	Вольногорск	UA_Dnepropetrovskaya oblast	Василенко Катерина	Пикалова Карина	Щапкова Катерина	Жилкин Анатолій
770	марганец	Марганец	UA_Dnepropetrovskaya oblast	Щасливець Аліна	Пикалова Карина	Щапкова Катерина	Гусева Олександра
771	синельниково	Синельниково	UA_Dnepropetrovskaya oblast	Борисенко Діана	Пикалова Карина	Щапкова Катерина	Жилкин Анатолій
772	верхнеднепровск	Верхнеднепровск	UA_Dnepropetrovskaya oblast	Сергєєва Поліна	Пикалова Карина	Щапкова Катерина	Жилкин Анатолій
773	подгородное	Подгородное	UA_Dnepropetrovskaya oblast	Литвин Саша	Пикалова Карина	Щапкова Катерина	Жилкин Анатолій
\.


--
-- Data for Name: home_payment; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.home_payment (id, group_manager, client_name, client_lms_id, group_course, bussiness, report_date_start, report_date_end) FROM stdin;
910	Ковтунович Оксана Онлайн	Алєксєєва Юля	1682211	Scratch	Школы программирования	2022-08-01	2022-08-07
911	Воробьева Екатерина Онлайн	Гандабару Михайло	1703017	Scratch	Школы программирования	2022-08-01	2022-08-07
912	Иванова Анна Онлайн	Хандоха Ярослав	1705898	Python.Start	Школы программирования	2022-08-01	2022-08-07
913	Зыгарь Валентина Онлайн	Дуванова Ілона	1703415	ENG A1	English	2022-08-01	2022-08-07
914	Иванова Анна Онлайн	Осіпов Максим	1707979	Python.Start	Школы программирования	2022-08-01	2022-08-07
915	Иванова Анна Онлайн	Боровик Ростислав	1708451	Python.Start	Школы программирования	2022-08-01	2022-08-07
916	Иванова Анна Онлайн	Вольський Нікіта	1707123	Python.Start	Школы программирования	2022-08-01	2022-08-07
917	Чередниченко Светлана Онлайн	Піхун Олександр	1707945	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
918	Воробьева Екатерина Онлайн	Беккер Ярослав	1706734	Scratch	Школы программирования	2022-08-01	2022-08-07
919	Воробьева Екатерина Онлайн	Маслей Дмитро	1707741	Scratch	Школы программирования	2022-08-01	2022-08-07
920	Воробьева Екатерина Онлайн	Аршава Максим	1707299	Scratch	Школы программирования	2022-08-01	2022-08-07
921	Воробьева Екатерина Онлайн	Байдак Денис	1708130	Scratch	Школы программирования	2022-08-01	2022-08-07
922	Воробьева Екатерина Онлайн	Пасічник Нікіта	1702126	Scratch	Школы программирования	2022-08-01	2022-08-07
923	Воробьева Екатерина Онлайн	Ясенеко Даніл	1706396	Scratch	Школы программирования	2022-08-01	2022-08-07
924	Пономарева Алена Онлайн	Захарда Іоанна	1709504	Графический дизайн	Школы программирования	2022-08-01	2022-08-07
925	Гуцалюк Галина 	Махов Арсеній	1712106	Python.Start	Школы программирования	2022-08-01	2022-08-07
926	Пономарева Алена Онлайн	Сідей Юрій 	1708909	Графический дизайн	Школы программирования	2022-08-01	2022-08-07
927	Иванова Анна Онлайн	Маркович Владислав	1432297	Python.Start	Школы программирования	2022-08-01	2022-08-07
928	Иванова Анна Онлайн	Масленніков Єгор	1710610	Python.Start	Школы программирования	2022-08-01	2022-08-07
929	Воробьева Екатерина Онлайн	Савков Нікіта	1708952	Scratch	Школы программирования	2022-08-01	2022-08-07
930	Воробьева Екатерина Онлайн	Сотніченко Анастасія	1710731	Scratch	Школы программирования	2022-08-01	2022-08-07
931	Воробьева Екатерина Онлайн	Осіпов Артем	1707980	Scratch	Школы программирования	2022-08-01	2022-08-07
932	Воробьева Екатерина Онлайн	Івах Артем	1710313	Scratch	Школы программирования	2022-08-01	2022-08-07
933	Воробьева Екатерина Онлайн	Грицай Віктор	1710234	Scratch	Школы программирования	2022-08-01	2022-08-07
934	Воробьева Екатерина Онлайн	Горша Дмитро	1709192	Scratch	Школы программирования	2022-08-01	2022-08-07
935	Воробьева Екатерина Онлайн	Волкотруб Демян	1710340	Scratch	Школы программирования	2022-08-01	2022-08-07
936	Воробьева Екатерина Онлайн	Бурлак Владислав	1708918	Scratch	Школы программирования	2022-08-01	2022-08-07
937	Воробьева Екатерина Онлайн	Брикун Іван	1707840	Scratch	Школы программирования	2022-08-01	2022-08-07
938	Воробьева Екатерина Онлайн	Чоплюк Максим	1709834	Scratch	Школы программирования	2022-08-01	2022-08-07
939	Воробьева Екатерина Онлайн	Оніщук Максим	1707011	Scratch	Школы программирования	2022-08-01	2022-08-07
940	Воробьева Екатерина Онлайн	Нікітчук Дмитро	1710878	Scratch	Школы программирования	2022-08-01	2022-08-07
941	Воробьева Екатерина Онлайн	Куреляк Катерина	1710229	Scratch	Школы программирования	2022-08-01	2022-08-07
943	Воробьева Екатерина Онлайн	Васюк Злата	1707078	Scratch	Школы программирования	2022-08-01	2022-08-07
942	Воробьева Екатерина Онлайн	Корчовий Михайло	1710067	Scratch	Школы программирования	2022-08-01	2022-08-07
947	Воробьева Екатерина Онлайн	Мельник Аліса	1706484	Scratch	Школы программирования	2022-08-01	2022-08-07
952	Тельчарова Диана Онлайн	Жук Лук"ян	1708180	Scratch	Школы программирования	2022-08-01	2022-08-07
957	Тельчарова Диана Онлайн	Сінькевич Марк	1709838	Scratch	Школы программирования	2022-08-01	2022-08-07
962	Тельчарова Диана Онлайн	Юстимчук Руслан	1711014	Scratch	Школы программирования	2022-08-01	2022-08-07
967	Чередниченко Светлана Онлайн	Пігуляк Максим	1708459	Python.Start	Школы программирования	2022-08-01	2022-08-07
972	Воробьева Екатерина Онлайн	Куренкова Маргарита	1708617	Scratch	Школы программирования	2022-08-01	2022-08-07
977	Чередниченко Светлана Онлайн	Лазарєва Аріна	1711461	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
982	Гурджиян Виктория Онлайн	Здойма Вадим	1713816	Python.Pro	Школы программирования	2022-08-01	2022-08-07
987	Чередниченко Светлана Онлайн	Поліщук Максим	1712231	Python.Start	Школы программирования	2022-08-01	2022-08-07
992	Чередниченко Светлана Онлайн	Муц Артем	532138	Python.Start	Школы программирования	2022-08-01	2022-08-07
997	Чередниченко Светлана Онлайн	Чорний Дмитро Питон	1710322	Python.Start	Школы программирования	2022-08-01	2022-08-07
1002	Гурджиян Виктория Онлайн	Токарчук Артем	1711983	Python.Pro	Школы программирования	2022-08-01	2022-08-07
1007	Тельчарова Диана Онлайн	Шухлін Дмитро	1711294	Scratch	Школы программирования	2022-08-01	2022-08-07
1012	Чередниченко Светлана Онлайн	Манчук Савелій	1711291	Python.Start	Школы программирования	2022-08-01	2022-08-07
1017	Пономарева Алена Онлайн	Лелет Софія	1712907	Графический дизайн	Школы программирования	2022-08-01	2022-08-07
1022	Чередниченко Светлана Онлайн	Гулковський Євген	1712908	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
1027	Чередниченко Светлана Онлайн	Мельник Олександр	1711481	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
944	Воробьева Екатерина Онлайн	Бирчак Костянтин	1708337	Scratch	Школы программирования	2022-08-01	2022-08-07
949	Тельчарова Диана Онлайн	Кондратєнко Георгій	1710332	Scratch	Школы программирования	2022-08-01	2022-08-07
954	Тельчарова Диана Онлайн	Лобода Даніл	1706434	Scratch	Школы программирования	2022-08-01	2022-08-07
959	Тельчарова Диана Онлайн	Жук Маркіян	1708167	Scratch	Школы программирования	2022-08-01	2022-08-07
964	Чередниченко Светлана Онлайн	Богатир Євген	1710689	Python.Start	Школы программирования	2022-08-01	2022-08-07
969	Воробьева Екатерина Онлайн	Борзинкова Валерія	1711666	Scratch	Школы программирования	2022-08-01	2022-08-07
974	Чередниченко Светлана Онлайн	Лаврук Марко	1704494	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
979	Чередниченко Светлана Онлайн	Швець Юрій	1706102	Python.Start	Школы программирования	2022-08-01	2022-08-07
984	Чередниченко Светлана Онлайн	Соін Денис	1701300	Python.Start	Школы программирования	2022-08-01	2022-08-07
989	Чередниченко Светлана Онлайн	Тюльпан Максим	1710696	Python.Start	Школы программирования	2022-08-01	2022-08-07
994	Чередниченко Светлана Онлайн	Бежевець Максим	1712235	Python.Start	Школы программирования	2022-08-01	2022-08-07
999	Чередниченко Светлана Онлайн	Маткурбанова Вікторія	1710752	Python.Start	Школы программирования	2022-08-01	2022-08-07
1004	Воробьева Екатерина Онлайн	Вербовий В'ячеслав	1712223	Scratch	Школы программирования	2022-08-01	2022-08-07
1009	Гурджиян Виктория Онлайн	Гілецький Андрій	1712686	Python.Pro	Школы программирования	2022-08-01	2022-08-07
1014	Воробьева Екатерина Онлайн	Фисун Олексій	1711258	Scratch	Школы программирования	2022-08-01	2022-08-07
1019	Гурджиян Виктория Онлайн	Макарова Юля	1708341	Python.Pro	Школы программирования	2022-08-01	2022-08-07
1024	Чередниченко Светлана Онлайн	Вербіцький Роман	1712587	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
945	Воробьева Екатерина Онлайн	Авраменко Мирослава	1712084	Scratch	Школы программирования	2022-08-01	2022-08-07
950	Тельчарова Диана Онлайн	Мельник Ілля	1706483	Scratch	Школы программирования	2022-08-01	2022-08-07
955	Тельчарова Диана Онлайн	Мишустина Арина	1704508	Scratch	Школы программирования	2022-08-01	2022-08-07
960	Гурджиян Виктория Онлайн	Холодецкий Захар	1711465	Python.Pro	Школы программирования	2022-08-01	2022-08-07
965	Чередниченко Светлана Онлайн	Крицький Денис	1709671	Python.Start	Школы программирования	2022-08-01	2022-08-07
970	Воробьева Екатерина Онлайн	Маткурбанов Віталій	1710751	Scratch	Школы программирования	2022-08-01	2022-08-07
975	Тельчарова Диана Онлайн	Логінов Всеволод	1713511	Scratch	Школы программирования	2022-08-01	2022-08-07
980	Гурджиян Виктория Онлайн	Головатий Дмитро	1708933	Python.Pro	Школы программирования	2022-08-01	2022-08-07
985	Чередниченко Светлана Онлайн	Опанасюк Ілля	1704988	Python.Start	Школы программирования	2022-08-01	2022-08-07
990	Чередниченко Светлана Онлайн	Мазур Володимир	1711099	Python.Start	Школы программирования	2022-08-01	2022-08-07
995	Чередниченко Светлана Онлайн	Музика Марія	1708958	Python.Start	Школы программирования	2022-08-01	2022-08-07
1000	Чередниченко Светлана Онлайн	Боровський Нікіта	1706421	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
1005	Тельчарова Диана Онлайн	Бублик Андрій	1712846	Scratch	Школы программирования	2022-08-01	2022-08-07
1010	Гурджиян Виктория Онлайн	Кузуб Поліна	1714587	Python.Pro	Школы программирования	2022-08-01	2022-08-07
1015	Воробьева Екатерина Онлайн	Фернос Андрій	1711227	Scratch	Школы программирования	2022-08-01	2022-08-07
1020	Чередниченко Светлана Онлайн	Гуска Олександр	1711164	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
1025	Чередниченко Светлана Онлайн	Федорчук Владислав	1709466	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
946	Воробьева Екатерина Онлайн	Довбаш Андрій	1710710	Scratch	Школы программирования	2022-08-01	2022-08-07
951	Тельчарова Диана Онлайн	Валявська Єва	1709828	Scratch	Школы программирования	2022-08-01	2022-08-07
956	Тельчарова Диана Онлайн	Путишина Варвара	1707895	Scratch	Школы программирования	2022-08-01	2022-08-07
961	Гурджиян Виктория Онлайн	Шевцов Богдан	1710056	Python.Pro	Школы программирования	2022-08-01	2022-08-07
966	Чередниченко Светлана Онлайн	Маршевський Даніїл	1707050	Python.Start	Школы программирования	2022-08-01	2022-08-07
971	Чередниченко Светлана Онлайн	Гроза Вікторія	1709825	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
976	Тельчарова Диана Онлайн	Стаднік Владислав	1713852	Scratch	Школы программирования	2022-08-01	2022-08-07
981	Чередниченко Светлана Онлайн	Жало Володимир	1706454	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
986	Чередниченко Светлана Онлайн	Трохимчук Ярослав	1708582	Python.Start	Школы программирования	2022-08-01	2022-08-07
991	Чередниченко Светлана Онлайн	Тарнагродський Марк	1710346	Python.Start	Школы программирования	2022-08-01	2022-08-07
996	Чередниченко Светлана Онлайн	Доктор Олександр	1706262	Python.Start	Школы программирования	2022-08-01	2022-08-07
1001	Чередниченко Светлана Онлайн	Мачульська Маргарита	1709820	Python.Start	Школы программирования	2022-08-01	2022-08-07
1006	Тельчарова Диана Онлайн	Фисун Ілля	1711221	Scratch	Школы программирования	2022-08-01	2022-08-07
1011	Чередниченко Светлана Онлайн	Тимченко Владислав	1708136	Python.Start	Школы программирования	2022-08-01	2022-08-07
1016	Воробьева Екатерина Онлайн	Нестеренко Марія	1711020	Scratch	Школы программирования	2022-08-01	2022-08-07
1021	Чередниченко Светлана Онлайн	Лахтін Арсеній	1714320	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
1026	Чередниченко Светлана Онлайн	Тимо Максим	1711296	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
948	Тельчарова Диана Онлайн	Ковблик Сюзанна	1711785	Scratch	Школы программирования	2022-08-01	2022-08-07
953	Тельчарова Диана Онлайн	Крюков Артем	1707783	Scratch	Школы программирования	2022-08-01	2022-08-07
958	Тельчарова Диана Онлайн	Явір Катерина	1711506	Scratch	Школы программирования	2022-08-01	2022-08-07
963	Чередниченко Светлана Онлайн	Бєліков Арсен	1708959	Python.Start	Школы программирования	2022-08-01	2022-08-07
968	Чередниченко Светлана Онлайн	Шматко Діана	1708190	Python.Start	Школы программирования	2022-08-01	2022-08-07
973	Чередниченко Светлана Онлайн	Васько Олександр	1710378	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
978	Чередниченко Светлана Онлайн	Шевченко Олександра	1711251	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
983	Чередниченко Светлана Онлайн	Кремир Денис	1704789	Python.Start	Школы программирования	2022-08-01	2022-08-07
988	Чередниченко Светлана Онлайн	Драгун Ярослав	1712237	Python.Start	Школы программирования	2022-08-01	2022-08-07
993	Чередниченко Светлана Онлайн	Монастирецький Владислав	1711369	Python.Start	Школы программирования	2022-08-01	2022-08-07
998	Чередниченко Светлана Онлайн	Кулінич Андрій	1710717	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
1003	Гурджиян Виктория Онлайн	Вовк Артем	1712675	Python.Pro	Школы программирования	2022-08-01	2022-08-07
1008	Тельчарова Диана Онлайн	Шелковніков Артем	1712325	Scratch	Школы программирования	2022-08-01	2022-08-07
1013	Воробьева Екатерина Онлайн	Мельничук Олександр	1711798	Scratch	Школы программирования	2022-08-01	2022-08-07
1018	Воробьева Екатерина Онлайн	Перев'язко Володимир	1713645	Scratch	Школы программирования	2022-08-01	2022-08-07
1023	Чередниченко Светлана Онлайн	Комаров Юрій	1711382	Онлайн Python.Start	Школы программирования	2022-08-01	2022-08-07
1028	Зыгарь Валентина Онлайн	Білинська Катерина	1712845	ENG A1	English	2022-08-01	2022-08-07
1029	Гонтова Анна 	Кравець Даня	1713166	Python.Start	Школы программирования	2022-08-08	2022-08-14
1030	Воробьева Екатерина Онлайн	Патрієв Семен	1710343	Scratch	Школы программирования	2022-08-08	2022-08-14
1031	Пономарева Алена Онлайн	Верницька Дарина	1713040	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1032	Тельчарова Диана Онлайн	Довгань Тимофей	1712515	Scratch	Школы программирования	2022-08-08	2022-08-14
1033	Гурджиян Виктория Онлайн	Макарова Ольга	1708345	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1034	Соколова Марина	Перцовый Роман	1714702	Создание сайтов	Школы программирования	2022-08-08	2022-08-14
1035	Пономарева Алена Онлайн	Гарбуз Антон	1712833	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1036	Чередниченко Светлана Онлайн	Олексієвець Андрій	1708961	Python.Start	Школы программирования	2022-08-08	2022-08-14
1037	Воробьева Екатерина Онлайн	Манзик Олексій	1709462	Scratch	Школы программирования	2022-08-08	2022-08-14
1038	Пономарева Алена Онлайн	Журавльов Ілля	1712321	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1039	Пономарева Алена Онлайн	Чабан Анна	1694318	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1040	Неділько Анна	Грицула Михайло	1715341	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1041	Гурджиян Виктория Онлайн	Олексів Максим	1714542	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1042	Гурджиян Виктория Онлайн	Ковальчук Давид	1714672	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1043	Чередниченко Светлана Онлайн	Григоренко Олександр	1712761	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1044	Чередниченко Светлана Онлайн	Гльоза Миколай	1712941	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1045	Чередниченко Светлана Онлайн	Рудик Андрей	1713506	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1046	Чередниченко Светлана Онлайн	Миронова Ніколь	1711449	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1047	Пономарева Алена Онлайн	Чорний Дмитро 	1706482	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1048	Николаева Елена	Семенов Константин	1712790		Школы программирования	2022-08-08	2022-08-14
1049	Зыгарь Валентина Онлайн	Дричик Вероніка	1711738	ENG A1	English	2022-08-08	2022-08-14
1050	Тельчарова Диана Онлайн	Тонкевич Олексій	1714683	Scratch	Школы программирования	2022-08-08	2022-08-14
1055	Чередниченко Светлана Онлайн	Левицька Крістіна	1714284	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1060	Тельчарова Диана Онлайн	Черный Назар	1438865	Scratch	Школы программирования	2022-08-08	2022-08-14
1065	Борисенко Диана	Дейнега Никита	1711178		Школы программирования	2022-08-08	2022-08-14
1070	Тельчарова Диана Онлайн	Турбал Дмитро	1716244	Scratch	Школы программирования	2022-08-08	2022-08-14
1075	Чередниченко Светлана Онлайн	Мунтян Лев	1717068	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1080	Чередниченко Светлана Онлайн	Ващевський Михайло	1715301	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1085	Чередниченко Светлана Онлайн	Селюкова Альона	1712300	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1090	Воробьева Екатерина Онлайн	Тодорюк Ілля	1714540	Scratch	Школы программирования	2022-08-08	2022-08-14
1095	Воробьева Екатерина Онлайн	Пеструїл Кирило	1717191	Scratch	Школы программирования	2022-08-08	2022-08-14
1100	Пономарева Алена Онлайн	Снітко Софія	1713822	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1105	Тельчарова Диана Онлайн	Донскова Катерина	1714528	Scratch	Школы программирования	2022-08-08	2022-08-14
1110	Чередниченко Светлана Онлайн	Нікітенко Софія	1713718	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1115	Зыгарь Валентина Онлайн	Люльчук Вікторія	1715600	ENG A1	English	2022-08-08	2022-08-14
1120	Некрашевич София (Киев)	Ятел Константин	1719969		Школы программирования	2022-08-08	2022-08-14
1125	Чередниченко Светлана Онлайн	Лещук Анна	1714421	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1130	Гурджиян Виктория Онлайн	Кищук Денис	1718111	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1135	Воробьева Екатерина Онлайн	Цинюк Микола	1720154	Scratch	Школы программирования	2022-08-08	2022-08-14
1140	Тельчарова Диана Онлайн	Клочков Богдан	1022946	Scratch	Школы программирования	2022-08-08	2022-08-14
1051	Чередниченко Светлана Онлайн	Ладус Роман	1714881	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1056	Чередниченко Светлана Онлайн	Попов Юрій	1712350	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1061	Чередниченко Светлана Онлайн	Курсик Ярослав	1702443	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1066	Зыгарь Валентина Онлайн	Бондар Макарів	1710541	ENG A1	English	2022-08-08	2022-08-14
1071	Николаева Елена	Пронин Борис	1303603		Школы программирования	2022-08-08	2022-08-14
1076	Воробьева Екатерина Онлайн	Кривошея Нікіта	1710088	Scratch	Школы программирования	2022-08-08	2022-08-14
1081	Чередниченко Светлана Онлайн	Дацько Тетяна	1713843	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1086	Гурджиян Виктория Онлайн	Савенок Микола	1714913	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1091	Воробьева Екатерина Онлайн	Задорожній Гліб	1714343	Scratch	Школы программирования	2022-08-08	2022-08-14
1096	Воробьева Екатерина Онлайн	Коваленко Артем Онлайн	1715283	Scratch	Школы программирования	2022-08-08	2022-08-14
1101	Чередниченко Светлана Онлайн	Качанов Володимир	1714681	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1106	Воробьева Екатерина Онлайн	Савченко Владислав	1713668	Scratch	Школы программирования	2022-08-08	2022-08-14
1111	Чередниченко Светлана Онлайн	Сусяк Вадим	1714978	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1116	Тельчарова Диана Онлайн	Кожуховський Максим	1716297	Scratch	Школы программирования	2022-08-08	2022-08-14
1121	Пономарева Алена Онлайн	Пестич Анна	1717898	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1126	Чередниченко Светлана Онлайн	Стащенко Герман	1715976	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1131	Тельчарова Диана Онлайн	Ковтун Поліна	1716147	Scratch	Школы программирования	2022-08-08	2022-08-14
1136	Дячук Анна	Лозовінський Владислав	1374229		Школы программирования	2022-08-08	2022-08-14
1141	Гурджиян Виктория Онлайн	Балала Андрій	1717650	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1052	Чередниченко Светлана Онлайн	Волощук Володимир	1713730	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1057	Чередниченко Светлана Онлайн	Пріхно Максим	1712954	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1062	Пономарева Алена Онлайн	Куліш Глєб	1713759	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1067	Борисенко Диана	Горб Кирилл	1468089		Школы программирования	2022-08-08	2022-08-14
1072	Чередниченко Светлана Онлайн	Малець Тарас	1711141	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1077	Тельчарова Диана Онлайн	Вереденко Богдан	1711274	Scratch	Школы программирования	2022-08-08	2022-08-14
1082	Чередниченко Светлана Онлайн	Королевич Владислава	1718091	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1087	Зыгарь Валентина Онлайн	Штефуряк Давид	1711676	ENG A1	English	2022-08-08	2022-08-14
1092	Воробьева Екатерина Онлайн	Чепелюк Юрій	1716587	Scratch	Школы программирования	2022-08-08	2022-08-14
1097	Воробьева Екатерина Онлайн	Станкевич Мария	1712516	Scratch	Школы программирования	2022-08-08	2022-08-14
1102	Чередниченко Светлана Онлайн	Лаврущак Матвій	1701389	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1107	Воробьева Екатерина Онлайн	Справник Андрій	1715775	Scratch	Школы программирования	2022-08-08	2022-08-14
1112	Тельчарова Диана Онлайн	Левків Владислав	1718687	Scratch	Школы программирования	2022-08-08	2022-08-14
1117	Гурджиян Виктория Онлайн	Дубенський Андрій	1718860	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1122	Пономарева Алена Онлайн	Рузаєва Валерія	1716367	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1127	Чередниченко Светлана Онлайн	Нерубальський Максим	1717290	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1132	Чередниченко Светлана Онлайн	Ковтун Егор	1716154	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1137	Тельчарова Диана Онлайн	Фостаківський Михайло	1716572	Scratch	Школы программирования	2022-08-08	2022-08-14
1053	Чередниченко Светлана Онлайн	Ігонькін Олександр	1710187	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1058	Чередниченко Светлана Онлайн	Руденко Сергій	1713642	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1063	Зыгарь Валентина Онлайн	Семченко Ілля	1713762	ENG A1	English	2022-08-08	2022-08-14
1068	Николаева Елена	Ткаченко Антон	1310777		Школы программирования	2022-08-08	2022-08-14
1073	Гурджиян Виктория Онлайн	Ясінська Марія	1714950	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1078	Борисенко Диана	Приходько Максим	1038434		Школы программирования	2022-08-08	2022-08-14
1083	Чередниченко Светлана Онлайн	Магльована Олександра	1717810	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1088	Зыгарь Валентина Онлайн	Стефурак Матвій	1716302	ENG A1	English	2022-08-08	2022-08-14
1093	Воробьева Екатерина Онлайн	Ковтун Олександр	1714968	Scratch	Школы программирования	2022-08-08	2022-08-14
1098	Гурджиян Виктория Онлайн	Ткач Максим	1711770	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1103	Чередниченко Светлана Онлайн	Супрун Владислав	1714864	Python.Start	Школы программирования	2022-08-08	2022-08-14
1108	Пономарева Алена Онлайн	Ковальчук Максим	1712419	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1113	Гурджиян Виктория Онлайн	Шифер Дмитро	1714690	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1118	Гурджиян Виктория Онлайн	Макуха Костя	1717222	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1123	Тельчарова Диана Онлайн	Наконечний Володимир	1717410	Scratch	Школы программирования	2022-08-08	2022-08-14
1128	Пономарева Алена Онлайн	Колесник Денис	1717473	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1133	Гурджиян Виктория Онлайн	Гешко Сергій	1717292	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1138	Чередниченко Светлана Онлайн	Харитонов Іван	1695419	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1054	Чередниченко Светлана Онлайн	Кулагін Владіслав	1714472	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1059	Калиенко Дарья	Юрченков Егор	1392079		Школы программирования	2022-08-08	2022-08-14
1064	Тельчарова Диана Онлайн	Міхлевський Назарій	1714500	Scratch	Школы программирования	2022-08-08	2022-08-14
1069	Воробьева Екатерина Онлайн	Бочаров Андрій	1706646	Scratch	Школы программирования	2022-08-08	2022-08-14
1074	Чередниченко Светлана Онлайн	Сідей Юрій Питон	1712956	Python.Start	Школы программирования	2022-08-08	2022-08-14
1079	Гурджиян Виктория Онлайн	Дяченко Денис	1714312	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1084	Чередниченко Светлана Онлайн	Пеструїл Максим	1717169	Онлайн Python.Start	Школы программирования	2022-08-08	2022-08-14
1089	Зыгарь Валентина Онлайн	Волкова Руслана	1714526	ENG A1	English	2022-08-08	2022-08-14
1094	Воробьева Екатерина Онлайн	Гніздовська Ліза	1716186	Scratch	Школы программирования	2022-08-08	2022-08-14
1099	Гурджиян Виктория Онлайн	Глущенко Ілья	1712262	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1104	Центелевич-Курдюкова Свет	Жуков Алексей	1705008	ENG A1	English	2022-08-08	2022-08-14
1109	Пасниченко Лариса	Бондаренко Тимур	1719107		Школы программирования	2022-08-08	2022-08-14
1114	Гурджиян Виктория Онлайн	Бокій Давид	1715271	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1119	Калиенко Дарья	Магерамов Роман	1709966		Школы программирования	2022-08-08	2022-08-14
1124	Воробьева Екатерина Онлайн	Коробко Марк	1031161	Scratch	Школы программирования	2022-08-08	2022-08-14
1129	Гурджиян Виктория Онлайн	Глімбоцький Влад	738040	Python.Pro	Школы программирования	2022-08-08	2022-08-14
1134	Воробьева Екатерина Онлайн	Наконечна Євгенія	1717761	Scratch	Школы программирования	2022-08-08	2022-08-14
1139	Пономарева Алена Онлайн	Антонюк Влада	1715089	Графический дизайн	Школы программирования	2022-08-08	2022-08-14
1142	Чередниченко Светлана Онлайн	Нестеренко Андрій	1713297	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1143	Василенко Екатерина	Долженко Богдан	1458104		Школы программирования	2022-08-15	2022-08-21
1144	Гурджиян Виктория Онлайн	Моргун Сергій	1715300	Python.Pro	Школы программирования	2022-08-15	2022-08-21
1145	Тельчарова Диана Онлайн	Лисогор Роман	1718058	Scratch	Школы программирования	2022-08-15	2022-08-21
1146	Тельчарова Диана Онлайн	Чередниченко Єлізавета	1717844	Scratch	Школы программирования	2022-08-15	2022-08-21
1147	Чередниченко Светлана Онлайн	Мисик Василь	1717315	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1148	Чередниченко Светлана Онлайн	Сімон Денис	1715193	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1149	Чередниченко Светлана Онлайн	Гребень Олексій	1716737	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1150	Чередниченко Светлана Онлайн	Микитка Анастасія	1714685	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1151	Пономарева Алена Онлайн	Лазебна Наталія	1716922	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1152	Пономарева Алена Онлайн	Макало Вадим	1713611	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1153	Воробьева Екатерина Онлайн	Бровець Євгеній	1716464	Scratch	Школы программирования	2022-08-15	2022-08-21
1154	Воробьева Екатерина Онлайн	Тянькіна Анастасія	1718053	Scratch	Школы программирования	2022-08-15	2022-08-21
1155	Тельчарова Диана Онлайн	Ковнір Микола	1718932	Scratch	Школы программирования	2022-08-15	2022-08-21
1156	Тельчарова Диана Онлайн	Олефіров Тімур	1717447	Scratch	Школы программирования	2022-08-15	2022-08-21
1157	Тельчарова Диана Онлайн	Філюк Артемій	1715003	Scratch	Школы программирования	2022-08-15	2022-08-21
1158	Тельчарова Диана Онлайн	Опанасенко Анна	1717228	Scratch	Школы программирования	2022-08-15	2022-08-21
1159	Малярчук Яна 	Танасиенко Ева	1714375	Python.Start	Школы программирования	2022-08-15	2022-08-21
1160	Некрашевич София (Киев)	Титаренко Михаил	1723110	Комп. Грамотность	Школы программирования	2022-08-15	2022-08-21
1161	Постолюк Олександра	Кадацька Катерина	1719913		Школы программирования	2022-08-15	2022-08-21
1162	Чередниченко Светлана Онлайн	Цицик Максим	1715652	Python.Start	Школы программирования	2022-08-15	2022-08-21
1163	Чередниченко Светлана Онлайн	Чорба Микола	1720813	Python.Start	Школы программирования	2022-08-15	2022-08-21
1168	Обертун Настя 	Дорошенко Даниил	1711479		Школы программирования	2022-08-15	2022-08-21
1173	Чередниченко Светлана Онлайн	Савчук Артур	1711468	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1178	Тельчарова Диана Онлайн	Балега Макар	1719855	Scratch	Школы программирования	2022-08-15	2022-08-21
1183	Чередниченко Светлана Онлайн	Дмитренко Ілля	1714293	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1188	Тельчарова Диана Онлайн	Мессмер Мішель	1718224	Scratch	Школы программирования	2022-08-15	2022-08-21
1193	Тельчарова Диана Онлайн	Шкода Поліна	1721543	Scratch	Школы программирования	2022-08-15	2022-08-21
1198	Воробьева Екатерина Онлайн	Гайцук Дмитро	1720995	Scratch	Школы программирования	2022-08-15	2022-08-21
1203	Чередниченко Светлана Онлайн	Нех Артем	1721534	Python.Start	Школы программирования	2022-08-15	2022-08-21
1164	Чередниченко Светлана Онлайн	Галюк Олександр	1707684	Python.Start	Школы программирования	2022-08-15	2022-08-21
1169	Гурджиян Виктория Онлайн	Тернецький Артем	1714547	Python.Pro	Школы программирования	2022-08-15	2022-08-21
1174	Тельчарова Диана Онлайн	Зубко Олександра	1719482	Scratch	Школы программирования	2022-08-15	2022-08-21
1179	Пономарева Алена Онлайн	Пасічник Вікторія	1717868	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1184	Чередниченко Светлана Онлайн	Лущак Лаврентій	1718706	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1189	Тельчарова Диана Онлайн	Бліннік Нікіта	1723357	Scratch	Школы программирования	2022-08-15	2022-08-21
1194	Гурджиян Виктория Онлайн	Пенкальський Руслан	1724212	Python.Pro	Школы программирования	2022-08-15	2022-08-21
1199	Воробьева Екатерина Онлайн	Ємець Олександр	1716018	Scratch	Школы программирования	2022-08-15	2022-08-21
1204	Тельчарова Диана Онлайн	Склярук Ілля	1721136	Scratch	Школы программирования	2022-08-15	2022-08-21
1165	Тельчарова Диана Онлайн	Андреєв Андрій	1718346	Scratch	Школы программирования	2022-08-15	2022-08-21
1170	Тельчарова Диана Онлайн	Бекіров Аміран	1715340	Scratch	Школы программирования	2022-08-15	2022-08-21
1175	Тельчарова Диана Онлайн	Можарівська Анна	1720034	Scratch	Школы программирования	2022-08-15	2022-08-21
1180	Воробьева Екатерина Онлайн	Патько Артем	632915	Scratch	Школы программирования	2022-08-15	2022-08-21
1185	Чередниченко Светлана Онлайн	Сукноваленко Нікіта	1717697	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1190	Пономарева Алена Онлайн	Драган Каміла	1714982	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1195	Чередниченко Светлана Онлайн	Соломай Андрій	1716271	Python.Start	Школы программирования	2022-08-15	2022-08-21
1200	Воробьева Екатерина Онлайн	Рух Марія	1717326	Scratch	Школы программирования	2022-08-15	2022-08-21
1166	Воробьева Екатерина Онлайн	Михайловський Денис	1718739	Scratch	Школы программирования	2022-08-15	2022-08-21
1171	Тельчарова Диана Онлайн	Тутла Іван	1408168	Scratch	Школы программирования	2022-08-15	2022-08-21
1176	Тельчарова Диана Онлайн	Ланецький Назар	1720230	Scratch	Школы программирования	2022-08-15	2022-08-21
1181	Воробьева Екатерина Онлайн	Поп Станіслав	1715262	Scratch	Школы программирования	2022-08-15	2022-08-21
1186	Тельчарова Диана Онлайн	Тарасюк Катерина	1704606	Scratch	Школы программирования	2022-08-15	2022-08-21
1191	Чередниченко Светлана Онлайн	Єкибаєв Влад	1713678	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1196	Пономарева Алена Онлайн	Нагнибіда Олександра	1723600	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1201	Воробьева Екатерина Онлайн	Ярошенко Марія	1717839	Scratch	Школы программирования	2022-08-15	2022-08-21
1167	Воробьева Екатерина Онлайн	Філюк Арсеній	1715000	Scratch	Школы программирования	2022-08-15	2022-08-21
1172	Чередниченко Светлана Онлайн	Гончаров Андрій	1717318	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1177	Тельчарова Диана Онлайн	Швидюк Вікторія	1718176	Scratch	Школы программирования	2022-08-15	2022-08-21
1182	Зыгарь Валентина Онлайн	Чира Тетяна	1716840	ENG A1	English	2022-08-15	2022-08-21
1187	Тельчарова Диана Онлайн	Устименко Оксана	1718511	Scratch	Школы программирования	2022-08-15	2022-08-21
1192	Чередниченко Светлана Онлайн	Стоєв Ігор	1725988	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1197	Воробьева Екатерина Онлайн	Груздюк Богдан	1721005	Scratch	Школы программирования	2022-08-15	2022-08-21
1202	Чередниченко Светлана Онлайн	Івчук Дмитро	1711265	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1205	Зыгарь Валентина Онлайн	Гришук Надія	1718418	ENG A1	English	2022-08-15	2022-08-21
1206	Зыгарь Валентина Онлайн	Арончикова Оксана	1720148	ENG A1	English	2022-08-15	2022-08-21
1207	Пономарева Алена Онлайн	Зімовіна Маргарита	1722847	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1208	Пономарева Алена Онлайн	Степова Ліза	1722931	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1209	Тельчарова Диана Онлайн	Сапа Христина	1720786	Scratch	Школы программирования	2022-08-15	2022-08-21
1210	Тельчарова Диана Онлайн	Чебан Мирослава	1721530	Scratch	Школы программирования	2022-08-15	2022-08-21
1211	Пономарева Алена Онлайн	Мельник Віктор	1693210	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1212	Гурджиян Виктория Онлайн	Кучеренко Даша	1727778	Python.Pro	Школы программирования	2022-08-15	2022-08-21
1213	Тельчарова Диана Онлайн	Піцур Єлізавета	1719608	Scratch	Школы программирования	2022-08-15	2022-08-21
1214	Чередниченко Светлана Онлайн	Пліхтяк Ігор	1719142	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1215	Чередниченко Светлана Онлайн	Миколаєнко Владислав	1720761	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1216	Чередниченко Светлана Онлайн	Палій Кирил	1722877	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1217	Лобанова Наталия	Березанський Дмитро	1728784	Python.Pro	Школы программирования	2022-08-15	2022-08-21
1218	Николаева Елена	Мироненко Максим	1448257		Школы программирования	2022-08-15	2022-08-21
1219	Калиенко Дарья	Каменський Ростислав	1441698	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1220	Гурджиян Виктория Онлайн	Химич Роман	1723252	Python.Pro	Школы программирования	2022-08-15	2022-08-21
1221	Чередниченко Светлана Онлайн	Матушевський Станіслав	1722861	Python.Start	Школы программирования	2022-08-15	2022-08-21
1222	Тельчарова Диана Онлайн	Токар Олександра	1724691	Scratch	Школы программирования	2022-08-15	2022-08-21
1223	Тельчарова Диана Онлайн	Трофимчук Мілана	1723134	Scratch	Школы программирования	2022-08-15	2022-08-21
1224	Чередниченко Светлана Онлайн	Картун Назар	1716666	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1225	Гурджиян Виктория Онлайн	Проніна Марія	1724885	Python.Pro	Школы программирования	2022-08-15	2022-08-21
1226	Некрашевич София (Киев)	Шевчук-Костицький Дмитро	1727455		Школы программирования	2022-08-15	2022-08-21
1227	Диба Рома	Гаїв Тетьяна	1724247	Создание сайтов	Школы программирования	2022-08-15	2022-08-21
1228	Чередниченко Светлана Онлайн	Войтюк Ілля	1710880	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1229	Чередниченко Светлана Онлайн	Ступак Сергій	1724780	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1230	Гурджиян Виктория Онлайн	Дядик Максим	1725613	Python.Pro	Школы программирования	2022-08-15	2022-08-21
1231	Диба Рома	Андранович Іван	1304466	Комп. Грамотность	Школы программирования	2022-08-15	2022-08-21
1232	Диба Рома	Гречин Максим	1724579	Создание сайтов	Школы программирования	2022-08-15	2022-08-21
1233	Постолюк Олександра	Кабаков Влад	1724707		Школы программирования	2022-08-15	2022-08-21
1234	Гурджиян Виктория Онлайн	Шаповал Ксения	1727208	Python.Pro	Школы программирования	2022-08-15	2022-08-21
1235	Тельчарова Диана Онлайн	Храмова Злата	1448076	Scratch	Школы программирования	2022-08-15	2022-08-21
1236	Зыгарь Валентина Онлайн	Лучко Ярослав	1722740	ENG A1	English	2022-08-15	2022-08-21
1237	Чередниченко Светлана Онлайн	Прокін Максим	1721429	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1242	Постолюк Олександра	Ципящук Олег	1726699		Школы программирования	2022-08-15	2022-08-21
1247	Некрашевич София (Троя)	Музыка Миша	1724341		Школы программирования	2022-08-15	2022-08-21
1252	Чередниченко Светлана Онлайн	Нікітенко Єгор	1724144	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1257	Літкевич Вікторія	Борбич Злата	1725594	Комп. Грамотность	Школы программирования	2022-08-15	2022-08-21
1238	Чередниченко Светлана Онлайн	Собурь Іван	1725814	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1243	Пономарева Алена Онлайн	Допенюк Олександра	1724291	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1248	Почтарук Зоряна Володимирівна	Жилюк Владислав	1718535	Scratch	Школы программирования	2022-08-15	2022-08-21
1253	Чередниченко Светлана Онлайн	Мельник Олена	1724760	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1258	Почтарук Зоряна Володимирівна	Шеттер Денис	1729368	Scratch	Школы программирования	2022-08-15	2022-08-21
1239	Чередниченко Светлана Онлайн	Громич Ева	1723483	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1244	Пономарева Алена Онлайн	Біланюк Антоніна	1468316	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1249	Юзвак Анна	Чучвара Юстина	1718924		Школы программирования	2022-08-15	2022-08-21
1254	Постолюк Олександра	Грицай Денис	1726976		Школы программирования	2022-08-15	2022-08-21
1240	Пономарева Алена Онлайн	Герасименко Еріка	1724404	Графический дизайн	Школы программирования	2022-08-15	2022-08-21
1245	Постолюк Олександра	Моспаненко Іван	1724237		Школы программирования	2022-08-15	2022-08-21
1250	Чередниченко Светлана Онлайн	Антонишин Антон	1725724	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1255	Постолюк Олександра	Бертошик Василь	1723426		Школы программирования	2022-08-15	2022-08-21
1241	Постолюк Олександра	Заплава Олександр	1725652		Школы программирования	2022-08-15	2022-08-21
1246	Гурджиян Виктория Онлайн	Шевчук Назарій	1717501	Python.Pro	Школы программирования	2022-08-15	2022-08-21
1251	Чередниченко Светлана Онлайн	Легкобит Данило	1725503	Онлайн Python.Start	Школы программирования	2022-08-15	2022-08-21
1256	Некрашевич София (Троя)	Якушин Андрей	1725534		Школы программирования	2022-08-15	2022-08-21
\.


--
-- Data for Name: home_report; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.home_report (id, location_name, region, total, attended, payments, conversion, start_date, end_date, students_without_amo, territorial_manager, business, regional_manager, client_manager) FROM stdin;
4911	Червоноград	UA_LvivOblast	45	27	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Федина Наталя
4791	Буча_Онлайн_Гулейкова	UA_Kievskaya oblast	27	13	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Гулейкова Яна
4748	Киев, Академ	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	Морозова Алла
4761	Прилуки	UA_Chernigov_obl	26	19	0	0	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	Гурчина Яна
4781	Борисполь	UA_Kievskaya oblast	23	12	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Чиколовець Вікторія 
4821	Черемушки.Одесса	UA_Odessa	24	16	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	Костенко Викторія
4871	Вишенька	UA_Vynnytsya	16	7	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	Жупанова Анастасія
4881	Коростень	UA_VynnytsyaOblast	19	6	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	Вознюк Світлана
4771	Ирпень	UA_Kievskaya oblast	18	9	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Лінтур Вероніка
4751	Киев, Позняки	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4758	Киев, Троещина	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	Некрашевич Софія
4768	Онлайн ЧО	UA_Chernigov_obl	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	Гурчина Яна
4778	Васильков	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Барабаш Лілія
4788	Фастов	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Постолюк Олександра
4798	Онлайн_БЦ	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Семенюк Катерина
4801	Черкассы	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	programming	Матюшенко Олексій	Волк Наталя
4808	Умань	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	english	Матюшенко Олексій	Ситник Катерина
4811	Корсунь-Шевченковский	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	programming	Матюшенко Олексій	Толюпа Тетяна
4818	ЦУ_ОНЛАЙН	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	english	Матюшенко Олексій	Ситник Катерина
4828	Мечникова.Одесса	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4831	Поселок.Одесса	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	Снігур Олена
4838	Подольск.Квинта	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	Маковєєва Світлана
4841	Овидиополь.Детский клуб	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4848	Одесса Кадор	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	english	Матюшенко Олексій	Гажук Ольга
4851	Белгород-Днестровский	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	programming	Матюшенко Олексій	КМ ще не знайдено
4858	Болград	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	english	Матюшенко Олексій	КМ ще не знайдено
4861	Вознесенск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4868	Замостя	UA_Vynnytsya	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	Жупанова Анастасія
4878	Житомир	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	Виговська Катерина
4888	Малин	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	КМ ще не знайдено
4891	Львів-Центр-Петрушевича	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Дорошенко Анна
4898	Рубчака	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Аквінська Вікторія
4901	Пустомити	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4908	Дрогобич	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Возняк Вероніка
4918	Новояворівськ	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4921	Тернопіль-Центр	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Людвіковська Надія
4928	Рівне-Центр	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	english	Кравченко Олеся	Варійчук Інна
4765	Онлайн Киев	UA_Kiev	14	9	2	22.22222222222222	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	Некрашевич Софія
4742	Онлайн	UA_SaaS	33	27	4	14.814814814814813	2022-08-15	2022-08-21		Смідонова Ольга	english	Смідонова Ольга	КМ ще не знайдено
4835	Южный	UA_Odesskaya oblast	14	6	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	Снігур Олена
4825	Центр.Одесса	UA_Odessa	22	10	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	Фараонова Анастасія
4895	Сихів	UA_Lviv	26	12	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Аквінська Вікторія
4785	БЦ	UA_Kievskaya oblast	31	10	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Семенюк Катерина
4745	Киев, ВДНХ	UA_Kiev	19	6	0	0	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	Естонська Інна
4752	Киев, Позняки	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4755	Киев, Левобережная	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	Морозова Алла
4762	Прилуки	UA_Chernigov_obl	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	Гурчина Яна
4772	Ирпень	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Лінтур Вероніка
4775	Вишневое	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	КМ ще не знайдено
4782	Борисполь	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Чиколовець Вікторія 
4792	Буча_Онлайн_Гулейкова	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Гулейкова Яна
4795	Онлайн_Ирпень_Линтур	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Лінтур Вероніка
4802	Черкассы	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	english	Матюшенко Олексій	Волк Наталя
4805	Знаменка	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4812	Корсунь-Шевченковский	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	english	Матюшенко Олексій	Толюпа Тетяна
4815	Светловодск	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	programming	Матюшенко Олексій	Іванова Анна
4822	Черемушки.Одесса	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	Костенко Викторія
4832	Поселок.Одесса	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	Снігур Олена
4842	Овидиополь.Детский клуб	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4852	Белгород-Днестровский	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	english	Матюшенко Олексій	КМ ще не знайдено
4855	Рени	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	programming	Матюшенко Олексій	КМ ще не знайдено
4862	Вознесенск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4865	Николаевская обл. ОНЛАЙН	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4872	Вишенька	UA_Vynnytsya	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	Жупанова Анастасія
4882	Коростень	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	Вознюк Світлана
4885	Новоград-Волинський	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	КМ ще не знайдено
4892	Львів-Центр-Петрушевича	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Дорошенко Анна
4902	Пустомити	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4905	Онлайн Львів	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Даць Уляна
4912	Червоноград	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Федина Наталя
4915	Броди	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Почтарук Зоряна
4922	Тернопіль-Центр	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Людвіковська Надія
4925	Кременець	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4875	Могилів-Подільський	UA_VynnytsyaOblast	5	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	Коваленко Людмила
4893	Чорновола	UA_Lviv	34	10	1	10	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Дорошенко Анна
4783	Бровары	UA_Kievskaya oblast	85	34	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Неділько Анна
4933	Ковель	UA_LvivOblast	41	26	0	0	2022-08-15	2022-08-21		Грановська Іра	programming	Кравченко Олеся	Даць Уляна
4743	Киев, Оболонь	UA_Kiev	15	6	0	0	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4773	Буча	UA_Kievskaya oblast	22	16	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Лінтур Вероніка
4903	Львів-Винники	UA_Lviv	11	5	2	40	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Почтарук Зоряна
4883	Хмільник	UA_VynnytsyaOblast	14	8	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	Гураль Надія
4750	Киев, Осокорки	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4753	Киев, Лукьяновка	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	Естонська Інна
4760	Нежин	UA_Chernigov_obl	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	Гурчина Яна
4763	Бахмач	UA_Chernigov_obl	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4770	Украинка	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	КМ ще не знайдено
4780	Боярка	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Барабаш Лілія
4790	Онлайн_Фастов_Постолюк	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Постолюк Олександра
4800	Онлайн_Боярка	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Барабаш Лілія
4803	Смела	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	programming	Матюшенко Олексій	Волк Наталя
4810	Канев	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	english	Матюшенко Олексій	Толюпа Тетяна
4813	Кропивницкий	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	programming	Матюшенко Олексій	Дарій Інна
4820	Говорова.Одесса	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	Фараонова Анастасія
4823	Вузовский.Одесса	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4830	Авангард.Одесса	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4833	Беляевка.Одесса	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4840	Балта.Ладушки	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	Маковєєва Світлана
4850	Черноморск	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	english	Матюшенко Олексій	Константинова Мила
4853	Измаил	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	programming	Матюшенко Олексій	Головко Юля
4860	Южноукраинск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4863	Первомайск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4870	Поділля	UA_Vynnytsya	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	Жупанова Анастасія
4873	Жмеринка	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	КМ ще не знайдено
4880	Бердичів	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	Ніколайчук Тетяна
4890	Онлайн Вінниця	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	Бречко Діана
4900	Брюховичі	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4910	Стрий	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Диба Рома
4913	Борислав	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Возняк Вероніка
4920	Жовква	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Людвіковська Надія
4923	Тернопіль-БАМ	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Людвіковська Надія
4930	Дубно	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	english	Кравченко Олеся	Велічко Софія
4757	Киев, Троещина	UA_Kiev	36	16	2	12.5	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	Некрашевич Софія
4927	Рівне-Центр	UA_Lviv	40	16	0	0	2022-08-15	2022-08-21		Грановська Іра	programming	Кравченко Олеся	Варійчук Інна
4907	Дрогобич	UA_LvivOblast	12	1	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Возняк Вероніка
4777	Васильков	UA_Kievskaya oblast	22	13	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Барабаш Лілія
4857	Болград	UA_Odesskaya oblast	4	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	programming	Матюшенко Олексій	КМ ще не знайдено
4837	Подольск.Квинта	UA_Odesskaya oblast	7	3	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	Маковєєва Світлана
4877	Житомир	UA_VynnytsyaOblast	26	9	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	Виговська Катерина
4897	Рубчака	UA_Lviv	10	6	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Аквінська Вікторія
4744	Киев, Оболонь	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4747	Киев, Академ	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	Морозова Алла
4754	Киев, Лукьяновка	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	Естонська Інна
4764	Бахмач	UA_Chernigov_obl	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4767	Онлайн ЧО	UA_Chernigov_obl	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	Гурчина Яна
4774	Буча	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Лінтур Вероніка
4784	Бровары	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Неділько Анна
4794	Онлайн_Фастов_Лобанова	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Лобанова Наталія
4797	Онлайн_БЦ	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Семенюк Катерина
4804	Смела	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	english	Матюшенко Олексій	Волк Наталя
4807	Умань	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	programming	Матюшенко Олексій	Ситник Катерина
4814	Кропивницкий	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	english	Матюшенко Олексій	Дарій Інна
4817	ЦУ_ОНЛАЙН	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	programming	Матюшенко Олексій	Ситник Катерина
4824	Вузовский.Одесса	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4827	Мечникова.Одесса	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4834	Беляевка.Одесса	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4844	Раздельная.Приват	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	Дмитрова Наталя
4847	Одесса Кадор	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	programming	Матюшенко Олексій	Гажук Ольга
4854	Измаил	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	english	Матюшенко Олексій	Головко Юля
4864	Первомайск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4867	Замостя	UA_Vynnytsya	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	Жупанова Анастасія
4874	Жмеринка	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	КМ ще не знайдено
4884	Хмільник	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	Гураль Надія
4887	Малин	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	КМ ще не знайдено
4894	Чорновола	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Дорошенко Анна
4904	Львів-Винники	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Почтарук Зоряна
4914	Борислав	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Возняк Вероніка
4917	Новояворівськ	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4924	Тернопіль-БАМ	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Людвіковська Надія
4934	Ковель	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	english	Кравченко Олеся	Даць Уляна
4746	Киев, ВДНХ	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	Естонська Інна
4909	Стрий	UA_LvivOblast	31	13	3	23.076923076923077	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Диба Рома
4749	Киев, Осокорки	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4779	Боярка	UA_Kievskaya oblast	31	17	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Барабаш Лілія
4759	Нежин	UA_Chernigov_obl	38	26	0	0	2022-08-15	2022-08-21		Щербатюк Артем	programming	Матюшенко Олексій	Гурчина Яна
4849	Черноморск	UA_Odesskaya oblast	27	17	0	0	2022-08-15	2022-08-21		Краснік Ольга	programming	Матюшенко Олексій	Константинова Мила
4889	Онлайн Вінниця	UA_VynnytsyaOblast	9	4	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	Бречко Діана
4756	Киев, Левобережная	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	Морозова Алла
4919	Жовква	UA_LvivOblast	33	21	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	Людвіковська Надія
4819	Говорова.Одесса	UA_Odessa	12	8	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	Фараонова Анастасія
4929	Дубно	UA_LvivOblast	29	15	0	0	2022-08-15	2022-08-21		Грановська Іра	programming	Кравченко Олеся	Велічко Софія
4869	Поділля	UA_Vynnytsya	9	7	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	Жупанова Анастасія
4766	Онлайн Киев	UA_Kiev	0	0	0	0	2022-08-15	2022-08-21		Щербатюк Артем	english	Матюшенко Олексій	Некрашевич Софія
4769	Украинка	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	КМ ще не знайдено
4776	Вишневое	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	КМ ще не знайдено
4786	БЦ	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Семенюк Катерина
4796	Онлайн_Ирпень_Линтур	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	english	Матюшенко Олексій	Лінтур Вероніка
4799	Онлайн_Боярка	UA_Kievskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Барабаш Лілія
4806	Знаменка	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4809	Канев	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	programming	Матюшенко Олексій	Толюпа Тетяна
4816	Светловодск	UA_Center	0	0	0	0	2022-08-15	2022-08-21		Вахній Вікторія	english	Матюшенко Олексій	Іванова Анна
4826	Центр.Одесса	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	Фараонова Анастасія
4829	Авангард.Одесса	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4836	Южный	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	Снігур Олена
4839	Балта.Ладушки	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	Маковєєва Світлана
4846	Одесса _ ОНЛАЙН	UA_Odessa	0	0	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	english	Матюшенко Олексій	Малярчук Яна
4856	Рени	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	english	Матюшенко Олексій	КМ ще не знайдено
4859	Южноукраинск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4866	Николаевская обл. ОНЛАЙН	UA_Odesskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4876	Могилів-Подільський	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	Коваленко Людмила
4886	Новоград-Волинський	UA_VynnytsyaOblast	0	0	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	english	Щербань Олександр	КМ ще не знайдено
4896	Сихів	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Аквінська Вікторія
4899	Брюховичі	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4906	Онлайн Львів	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Даць Уляна
4916	Броди	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	Почтарук Зоряна
4926	Кременець	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4936	Нововолинськ	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	english	Кравченко Олеся	КМ ще не знайдено
4879	Бердичів	UA_VynnytsyaOblast	16	4	0	0	2022-08-15	2022-08-21		Гладишко Віталіна	programming	Щербань Олександр	Ніколайчук Тетяна
4938	Вараш	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	english	Кравченко Олеся	КМ ще не знайдено
4941	Онлайн_Льівський регіон_2022	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	programming	Кравченко Олеся	Даць Уляна
4948	Хмельницький офіс	UA_Chernivtsi	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	english	Ласота Юрій	Норчук Альона
4958	Калуш	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	english	Ласота Юрій	Вовчак Анастасія
4951	ІФ Університет	UA_Chernivtsi	5	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	programming	Ласота Юрій	Шеленко Наталія
4931	Луцьк-Центр	UA_Lviv	88	32	1	3.125	2022-08-15	2022-08-21		Грановська Іра	programming	Кравченко Олеся	Літкевич Вікторія
4961	Ужгород	UA_Chernivtsi	37	18	0	0	2022-08-15	2022-08-21		Ісарик Люба	programming	Ласота Юрій	КМ ще не знайдено
4932	Луцьк-Центр	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	english	Кравченко Олеся	Літкевич Вікторія
4935	Нововолинськ	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	programming	Кравченко Олеся	КМ ще не знайдено
4942	Онлайн_Льівський регіон_2022	UA_Lviv	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	english	Кравченко Олеся	Даць Уляна
4952	ІФ Університет	UA_Chernivtsi	0	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	english	Ласота Юрій	Шеленко Наталія
4955	Коломия	UA_ChernivtsiOblast	28	12	0	0	2022-08-15	2022-08-21		Ісарик Люба	programming	Ласота Юрій	Ружанська Анна
4945	КП Розмарин	UA_ChernivtsiOblast	35	18	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	programming	Ласота Юрій	Юрчак Світлана
4937	Вараш	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	programming	Кравченко Олеся	КМ ще не знайдено
4944	Чернівці офіс	UA_Chernivtsi	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	english	Ласота Юрій	Дячук Анна
4954	Долина	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	english	Ласота Юрій	Пристая Олеся
4957	Калуш	UA_ChernivtsiOblast	17	9	0	0	2022-08-15	2022-08-21		Ісарик Люба	programming	Ласота Юрій	Вовчак Анастасія
4947	Хмельницький офіс	UA_Chernivtsi	28	13	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	programming	Ласота Юрій	Норчук Альона
4939	Костопіль	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	programming	Кравченко Олеся	КМ ще не знайдено
4135	Нежин	UA_Chernigov_obl	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	Гурчина Яна
4946	КП Розмарин	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	english	Ласота Юрій	Юрчак Світлана
4136	Нежин	UA_Chernigov_obl	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	Гурчина Яна
4137	Прилуки	UA_Chernigov_obl	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	Гурчина Яна
4956	Коломия	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	english	Ласота Юрій	Ружанська Анна
4949	ІФ офіс	UA_Chernivtsi	51	31	0	0	2022-08-15	2022-08-21		Ісарик Люба	programming	Ласота Юрій	Шеленко Наталія
4959	Мукачево	UA_ChernivtsiOblast	25	15	0	0	2022-08-15	2022-08-21		Ісарик Люба	programming	Ласота Юрій	Фабрицій Софія
4119	Киев, Оболонь	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4120	Киев, Оболонь	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4138	Прилуки	UA_Chernigov_obl	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	Гурчина Яна
4121	Киев, ВДНХ	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	Естонська Інна
4122	Киев, ВДНХ	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	Естонська Інна
4123	Киев, Академ	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	Морозова Алла
4139	Бахмач	UA_Chernigov_obl	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4140	Бахмач	UA_Chernigov_obl	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4124	Киев, Академ	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	Морозова Алла
4125	Киев, Осокорки	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4126	Киев, Осокорки	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4127	Киев, Позняки	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4128	Киев, Позняки	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4129	Киев, Лукьяновка	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	Естонська Інна
4130	Киев, Лукьяновка	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	Естонська Інна
4141	Онлайн Киев	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	Некрашевич Софія
4131	Киев, Левобережная	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	Морозова Алла
4132	Киев, Левобережная	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	Морозова Алла
4133	Киев, Троещина	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	Некрашевич Софія
4142	Онлайн Киев	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	Некрашевич Софія
4134	Киев, Троещина	UA_Kiev	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	Некрашевич Софія
4143	Онлайн ЧО	UA_Chernigov_obl	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	programming	Матюшенко Олексій	Гурчина Яна
4144	Онлайн ЧО	UA_Chernigov_obl	0	0	0	0	2022-08-01	2022-08-07		Щербатюк Артем	english	Матюшенко Олексій	Гурчина Яна
4145	Украинка	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	КМ ще не знайдено
4118	Онлайн	UA_SaaS	15	13	2	15.384615384615385	2022-08-01	2022-08-07		Смідонова Ольга	english	Смідонова Ольга	КМ ще не знайдено
4146	Украинка	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	КМ ще не знайдено
4149	Буча	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Лінтур Вероніка
4156	Боярка	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Барабаш Лілія
4159	Бровары	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Неділько Анна
4166	Онлайн_Фастов_Постолюк	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Постолюк Олександра
4176	Онлайн_Боярка	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Барабаш Лілія
4179	Смела	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	programming	Матюшенко Олексій	Волк Наталя
4940	Костопіль	UA_LvivOblast	0	0	0	0	2022-08-15	2022-08-21		Грановська Іра	english	Кравченко Олеся	КМ ще не знайдено
4169	Онлайн_Фастов_Лобанова	UA_Kievskaya oblast	5	2	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Лобанова Наталія
4950	ІФ офіс	UA_Chernivtsi	0	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	english	Ласота Юрій	Шеленко Наталія
4960	Мукачево	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	english	Ласота Юрій	Фабрицій Софія
4953	Долина	UA_ChernivtsiOblast	11	5	0	0	2022-08-15	2022-08-21		Ісарик Люба	programming	Ласота Юрій	Пристая Олеся
4943	Чернівці офіс	UA_Chernivtsi	67	39	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	programming	Ласота Юрій	Дячук Анна
4147	Ирпень	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Лінтур Вероніка
4154	Васильков	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Барабаш Лілія
4157	Борисполь	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Чиколовець Вікторія 
4164	Фастов	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Постолюк Олександра
4174	Онлайн_БЦ	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Семенюк Катерина
4177	Черкассы	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	programming	Матюшенко Олексій	Волк Наталя
4962	Ужгород	UA_Chernivtsi	0	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	english	Ласота Юрій	КМ ще не знайдено
4972	Красилів	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	english	Ласота Юрій	Якубець Анастасія
4167	Буча_Онлайн_Гулейкова	UA_Kievskaya oblast	5	3	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Гулейкова Яна
4982	Онлайн Чернівці 2	UA_Chernivtsi	0	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	english	Ласота Юрій	Ружанська Анна
4992	Горишние Плавни	UA_Poltava	0	0	0	0	2022-08-15	2022-08-21		ТМ ще не знайдено	english	Рощина Марія	КМ ще не знайдено
4995	Днепр.Слобожанский	UA_Dnepr	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
5002	Днепр.Красный Камень	UA_Dnepr	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	Лутаєва Галина
5012	Запорожье.Александровский	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	Котова Оксана
5015	г.Вольнянск Переулок Торговый	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
5022	Павлоград Цум	UA_Donetskobl	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Шаповал Ксенія
5032	Соцгород	UA_Dnepr_region	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Недільчук Дарина
5042	Желтые Воды	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Решетило Марина
5052	Подгородное	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Литвин Саша
4789	Онлайн_Фастов_Постолюк	UA_Kievskaya oblast	24	14	2	14.285714285714285	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Постолюк Олександра
5025	Терновка	UA_Donetskobl	13	9	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Потапова Ольга
4793	Онлайн_Фастов_Лобанова	UA_Kievskaya oblast	9	4	1	25	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Лобанова Наталія
5005	Днепр.Центр	UA_Dnepr	50	22	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	Соколова Марина
5045	Марганец	UA_Dnepropetrovskaya oblast	3	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Щасливець Аліна
4965	Славута	UA_ChernivtsiOblast	14	10	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	programming	Ласота Юрій	Янчук Ольга
4975	Полонне	UA_ChernivtsiOblast	15	11	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	programming	Ласота Юрій	Дуброва Мирослава
5035	Александрия	UA_Dnepr_region	40	21	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Центелевич Светлана 
4985	Полтава Онлайн	UA_Poltava	0	0	1	100	2022-08-15	2022-08-21		ТМ ще не знайдено	programming	Рощина Марія	Калієнко Дар'я
4148	Ирпень	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Лінтур Вероніка
4151	Вишневое	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	КМ ще не знайдено
4158	Борисполь	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Чиколовець Вікторія 
4161	БЦ	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Семенюк Катерина
4168	Буча_Онлайн_Гулейкова	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Гулейкова Яна
4171	Онлайн_Ирпень_Линтур	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Лінтур Вероніка
4178	Черкассы	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	english	Матюшенко Олексій	Волк Наталя
4181	Знаменка	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4963	Шепетівка	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	programming	Ласота Юрій	Денещук Катерина
4970	Нетішин	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	english	Ласота Юрій	Ковтунович Оксана
4980	Онлайн Чернівці 1	UA_Chernivtsi	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	english	Ласота Юрій	Дячук Анна
4983	Полтава, Центр	UA_Poltava	0	0	0	0	2022-08-15	2022-08-21		ТМ ще не знайдено	programming	Рощина Марія	Калієнко Дарина
4990	Кременчуг	UA_Poltava	0	0	0	0	2022-08-15	2022-08-21		ТМ ще не знайдено	english	Рощина Марія	КМ ще не знайдено
5000	Днепр.Победа	UA_Dnepr	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	Лупульчук Наталія
5010	Запоріжжя.Площа Фестівальна	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	Марюха Каріна
5020	г.Пологи	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
5023	Павлоград Орбита	UA_Donetskobl	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Шаповал Ксенія
5030	Заречный	UA_Dnepr_region	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Недільчук Дарина
5033	Никополь	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Василенко Катерина
5040	Пятихатки	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Центелевич Светлана 
5050	Верхнеднепровск	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Сергєєва Поліна
5003	Днепр.Караван	UA_Dnepr	24	13	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	Крупіна Катерина
4973	Сторожинець	UA_ChernivtsiOblast	24	19	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	programming	Ласота Юрій	Цугуй Анастасія
5013	Запорожье.Вознесеновский	UA_Dnepropetrovskaya oblast2	20	11	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	Котова Оксана
5043	Вольногорск	UA_Dnepropetrovskaya oblast	14	7	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Василенко Катерина
4993	Онлайн Харьков	UA_Kharkov	21	8	1	12.5	2022-08-15	2022-08-21		ТМ ще не знайдено	programming	Рощина Марія	Головко Валентина
4150	Буча	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Лінтур Вероніка
4153	Васильков	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Барабаш Лілія
4160	Бровары	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Неділько Анна
4163	Фастов	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Постолюк Олександра
4170	Онлайн_Фастов_Лобанова	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Лобанова Наталія
4173	Онлайн_БЦ	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Семенюк Катерина
4180	Смела	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	english	Матюшенко Олексій	Волк Наталя
4183	Умань	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	programming	Матюшенко Олексій	Ситник Катерина
4964	Шепетівка	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	english	Ласота Юрій	Денещук Катерина
4974	Сторожинець	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	english	Ласота Юрій	Цугуй Анастасія
4977	Хуст 	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	programming	Ласота Юрій	Олексюк Наталія
4984	Полтава, Центр	UA_Poltava	0	0	0	0	2022-08-15	2022-08-21		ТМ ще не знайдено	english	Рощина Марія	Калієнко Дарина
4987	Миргород	UA_Poltava	0	0	0	0	2022-08-15	2022-08-21		ТМ ще не знайдено	programming	Рощина Марія	Калієнко Дарина
4994	Онлайн Харьков	UA_Kharkov	0	0	0	0	2022-08-15	2022-08-21		ТМ ще не знайдено	english	Рощина Марія	Головко Валентина
4997	Днепр.Подстанция	UA_Dnepr	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	Зданевич Евгения
5004	Днепр.Караван	UA_Dnepr	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	Крупіна Катерина
5007	Покров(Орджо)	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
5014	Запорожье.Вознесеновский	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	Котова Оксана
5017	Токмак	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
5024	Павлоград Орбита	UA_Donetskobl	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Шаповал Ксенія
5027	Першотравенск	UA_Donetskobl	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	КМ ще не знайдено
5034	Никополь	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Василенко Катерина
5044	Вольногорск	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Василенко Катерина
5047	Синельниково	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Борисенко Діана
4967	Старокостянтинів	UA_ChernivtsiOblast	38	21	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	programming	Ласота Юрій	Галка Тетяна
5037	Каменское	UA_Dnepr_region	40	14	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Асанова Софія
4741	Онлайн	UA_SaaS	517	343	89	25.94752186588921	2022-08-15	2022-08-21		Смідонова Ольга	programming	Смідонова Ольга	КМ ще не знайдено
4152	Вишневое	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	КМ ще не знайдено
4155	Боярка	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Барабаш Лілія
4162	БЦ	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Семенюк Катерина
4165	Онлайн_Фастов_Постолюк	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Постолюк Олександра
4172	Онлайн_Ирпень_Линтур	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	english	Матюшенко Олексій	Лінтур Вероніка
4175	Онлайн_Боярка	UA_Kievskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Штепа Марина	programming	Матюшенко Олексій	Барабаш Лілія
4182	Знаменка	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4184	Умань	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	english	Матюшенко Олексій	Ситник Катерина
4185	Канев	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	programming	Матюшенко Олексій	Толюпа Тетяна
4186	Канев	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	english	Матюшенко Олексій	Толюпа Тетяна
4187	Корсунь-Шевченковский	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	programming	Матюшенко Олексій	Толюпа Тетяна
4188	Корсунь-Шевченковский	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	english	Матюшенко Олексій	Толюпа Тетяна
4966	Славута	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	english	Ласота Юрій	Янчук Ольга
4190	Кропивницкий	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	english	Матюшенко Олексій	Дарій Інна
4191	Светловодск	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	programming	Матюшенко Олексій	Іванова Анна
4192	Светловодск	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	english	Матюшенко Олексій	Іванова Анна
4193	ЦУ_ОНЛАЙН	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	programming	Матюшенко Олексій	Ситник Катерина
4194	ЦУ_ОНЛАЙН	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	english	Матюшенко Олексій	Ситник Катерина
4195	Говорова.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	Фараонова Анастасія
4196	Говорова.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	Фараонова Анастасія
4197	Черемушки.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	Костенко Викторія
4198	Черемушки.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	Костенко Викторія
4199	Вузовский.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4200	Вузовский.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4201	Центр.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	Фараонова Анастасія
4202	Центр.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	Фараонова Анастасія
4203	Мечникова.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4204	Мечникова.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4205	Авангард.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4206	Авангард.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4207	Поселок.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	Снігур Олена
4208	Поселок.Одесса	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	Снігур Олена
4209	Беляевка.Одесса	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4210	Беляевка.Одесса	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4211	Южный	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	Снігур Олена
4212	Южный	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	Снігур Олена
4213	Подольск.Квинта	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	Маковєєва Світлана
4214	Подольск.Квинта	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	Маковєєва Світлана
4215	Балта.Ладушки	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	Маковєєва Світлана
4222	Одесса _ ОНЛАЙН	UA_Odessa	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	Малярчук Яна
4225	Черноморск	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	programming	Матюшенко Олексій	Константинова Мила
4232	Рени	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	english	Матюшенко Олексій	КМ ще не знайдено
4235	Южноукраинск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4242	Николаевская обл. ОНЛАЙН	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4245	Поділля	UA_Vynnytsya	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	Жупанова Анастасія
4252	Могилів-Подільський	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	Коваленко Людмила
4968	Старокостянтинів	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	english	Ласота Юрій	Галка Тетяна
4262	Новоград-Волинський	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	КМ ще не знайдено
4272	Сихів	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Аквінська Вікторія
4275	Брюховичі	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4282	Онлайн Львів	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Даць Уляна
4285	Стрий	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Диба Рома
4292	Броди	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Почтарук Зоряна
4295	Жовква	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Людвіковська Надія
4302	Кременець	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4305	Дубно	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	programming	Кравченко Олеся	Велічко Софія
4312	Нововолинськ	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	english	Кравченко Олеся	КМ ще не знайдено
4315	Костопіль	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	programming	Кравченко Олеся	КМ ще не знайдено
4322	КП Розмарин	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	english	Ласота Юрій	Юрчак Світлана
4325	ІФ офіс	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	programming	Ласота Юрій	Шеленко Наталія
4332	Коломия	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	english	Ласота Юрій	Ружанська Анна
4335	Мукачево	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	programming	Ласота Юрій	Фабрицій Софія
4342	Славута	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	english	Ласота Юрій	Янчук Ольга
4345	Нетішин	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	programming	Ласота Юрій	Ковтунович Оксана
4352	Полонне	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	english	Ласота Юрій	Дуброва Мирослава
4362	Полтава Онлайн	UA_Poltava	0	0	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	english	Рощина Марія	Калієнко Дар'я
4365	Кременчуг	UA_Poltava	0	0	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	programming	Рощина Марія	КМ ще не знайдено
4372	Днепр.Слобожанский	UA_Dnepr	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
4375	Днепр.Победа	UA_Dnepr	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	Лупульчук Наталія
4385	Запоріжжя.Площа Фестівальна	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	Марюха Каріна
4392	г.Вольнянск Переулок Торговый	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
4395	г.Пологи	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
4402	Терновка	UA_Donetskobl	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Потапова Ольга
4405	Заречный	UA_Dnepr_region	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Недільчук Дарина
4382	Днепр.Центр	UA_Dnepr	12	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	Соколова Марина
4355	Онлайн Чернівці 1	UA_Chernivtsi	3	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	programming	Ласота Юрій	Дячук Анна
4265	Онлайн Вінниця	UA_VynnytsyaOblast	15	5	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	Бречко Діана
4216	Балта.Ладушки	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	Маковєєва Світлана
4219	Раздельная.Приват	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	Дмитрова Наталя
4226	Черноморск	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	english	Матюшенко Олексій	Константинова Мила
4229	Измаил	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	programming	Матюшенко Олексій	Головко Юля
4236	Южноукраинск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4239	Первомайск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4246	Поділля	UA_Vynnytsya	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	Жупанова Анастасія
4249	Жмеринка	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	КМ ще не знайдено
4256	Бердичів	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	Ніколайчук Тетяна
4259	Хмільник	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	Гураль Надія
4266	Онлайн Вінниця	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	Бречко Діана
4269	Чорновола	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Дорошенко Анна
4276	Брюховичі	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4279	Львів-Винники	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Почтарук Зоряна
4286	Стрий	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Диба Рома
4289	Борислав	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Возняк Вероніка
4296	Жовква	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Людвіковська Надія
4299	Тернопіль-БАМ	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Людвіковська Надія
4306	Дубно	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	english	Кравченко Олеся	Велічко Софія
4309	Ковель	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	programming	Кравченко Олеся	Даць Уляна
4316	Костопіль	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	english	Кравченко Олеся	КМ ще не знайдено
4319	Чернівці офіс	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	programming	Ласота Юрій	Дячук Анна
4326	ІФ офіс	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	english	Ласота Юрій	Шеленко Наталія
4329	Долина	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	programming	Ласота Юрій	Пристая Олеся
4336	Мукачево	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	english	Ласота Юрій	Фабрицій Софія
4339	Шепетівка	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	programming	Ласота Юрій	Денещук Катерина
4346	Нетішин	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	english	Ласота Юрій	Ковтунович Оксана
4349	Сторожинець	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	programming	Ласота Юрій	Цугуй Анастасія
4356	Онлайн Чернівці 1	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	english	Ласота Юрій	Дячук Анна
4366	Кременчуг	UA_Poltava	0	0	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	english	Рощина Марія	КМ ще не знайдено
4976	Полонне	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	english	Ласота Юрій	Дуброва Мирослава
4376	Днепр.Победа	UA_Dnepr	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	Лупульчук Наталія
4379	Днепр.Караван	UA_Dnepr	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	Крупіна Катерина
4386	Запоріжжя.Площа Фестівальна	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	Марюха Каріна
4389	Запорожье.Вознесеновский	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	Котова Оксана
4396	г.Пологи	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
4399	Павлоград Орбита	UA_Donetskobl	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Шаповал Ксенія
4406	Заречный	UA_Dnepr_region	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Недільчук Дарина
4409	Никополь	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Василенко Катерина
4217	Овидиополь.Детский клуб	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4224	Одесса Кадор	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	english	Матюшенко Олексій	Гажук Ольга
4227	Белгород-Днестровский	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	programming	Матюшенко Олексій	КМ ще не знайдено
4234	Болград	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	english	Матюшенко Олексій	КМ ще не знайдено
4237	Вознесенск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4244	Замостя	UA_Vynnytsya	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	Жупанова Анастасія
4247	Вишенька	UA_Vynnytsya	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	Жупанова Анастасія
4254	Житомир	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	Виговська Катерина
4257	Коростень	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	Вознюк Світлана
4264	Малин	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	КМ ще не знайдено
4267	Львів-Центр-Петрушевича	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Дорошенко Анна
4274	Рубчака	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Аквінська Вікторія
4277	Пустомити	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4284	Дрогобич	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Возняк Вероніка
4287	Червоноград	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Федина Наталя
4294	Новояворівськ	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4297	Тернопіль-Центр	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Людвіковська Надія
4304	Рівне-Центр	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	english	Кравченко Олеся	Варійчук Інна
4307	Луцьк-Центр	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	programming	Кравченко Олеся	Літкевич Вікторія
4314	Вараш	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	english	Кравченко Олеся	КМ ще не знайдено
4317	Онлайн_Льівський регіон_2022	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	programming	Кравченко Олеся	Даць Уляна
4324	Хмельницький офіс	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	english	Ласота Юрій	Норчук Альона
4327	ІФ Університет	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	programming	Ласота Юрій	Шеленко Наталія
4334	Калуш	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	english	Ласота Юрій	Вовчак Анастасія
4337	Ужгород	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	programming	Ласота Юрій	КМ ще не знайдено
4344	Старокостянтинів	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	english	Ласота Юрій	Галка Тетяна
4347	Красилів	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	programming	Ласота Юрій	Якубець Анастасія
4354	Хуст 	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	english	Ласота Юрій	Олексюк Наталія
4357	Онлайн Чернівці 2	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	programming	Ласота Юрій	Ружанська Анна
4364	Миргород	UA_Poltava	0	0	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	english	Рощина Марія	Калієнко Дарина
4367	Горишние Плавни	UA_Poltava	0	0	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	programming	Рощина Марія	КМ ще не знайдено
4374	Днепр.Подстанция	UA_Dnepr	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	Зданевич Евгения
4377	Днепр.Красный Камень	UA_Dnepr	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	Лутаєва Галина
4384	Покров(Орджо)	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
4387	Запорожье.Александровский	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	Котова Оксана
4394	Токмак	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
4397	Павлоград Цум	UA_Donetskobl	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Шаповал Ксенія
4404	Першотравенск	UA_Donetskobl	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	КМ ще не знайдено
4407	Соцгород	UA_Dnepr_region	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Недільчук Дарина
4218	Овидиополь.Детский клуб	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4228	Белгород-Днестровский	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	english	Матюшенко Олексій	КМ ще не знайдено
4231	Рени	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	programming	Матюшенко Олексій	КМ ще не знайдено
4238	Вознесенск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4241	Николаевская обл. ОНЛАЙН	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4248	Вишенька	UA_Vynnytsya	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	Жупанова Анастасія
4251	Могилів-Подільський	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	Коваленко Людмила
4258	Коростень	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	Вознюк Світлана
4261	Новоград-Волинський	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	КМ ще не знайдено
4268	Львів-Центр-Петрушевича	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Дорошенко Анна
4271	Сихів	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Аквінська Вікторія
4278	Пустомити	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4281	Онлайн Львів	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Даць Уляна
4288	Червоноград	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Федина Наталя
4291	Броди	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Почтарук Зоряна
4298	Тернопіль-Центр	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Людвіковська Надія
4301	Кременець	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4308	Луцьк-Центр	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	english	Кравченко Олеся	Літкевич Вікторія
4311	Нововолинськ	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	programming	Кравченко Олеся	КМ ще не знайдено
4318	Онлайн_Льівський регіон_2022	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	english	Кравченко Олеся	Даць Уляна
4321	КП Розмарин	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	programming	Ласота Юрій	Юрчак Світлана
4328	ІФ Університет	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	english	Ласота Юрій	Шеленко Наталія
4331	Коломия	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	programming	Ласота Юрій	Ружанська Анна
4338	Ужгород	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	english	Ласота Юрій	КМ ще не знайдено
4341	Славута	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	programming	Ласота Юрій	Янчук Ольга
4348	Красилів	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	english	Ласота Юрій	Якубець Анастасія
4351	Полонне	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	programming	Ласота Юрій	Дуброва Мирослава
4358	Онлайн Чернівці 2	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	english	Ласота Юрій	Ружанська Анна
4361	Полтава Онлайн	UA_Poltava	0	0	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	programming	Рощина Марія	Калієнко Дар'я
4368	Горишние Плавни	UA_Poltava	0	0	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	english	Рощина Марія	КМ ще не знайдено
4371	Днепр.Слобожанский	UA_Dnepr	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
4378	Днепр.Красный Камень	UA_Dnepr	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	Лутаєва Галина
4388	Запорожье.Александровский	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	Котова Оксана
4391	г.Вольнянск Переулок Торговый	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
4398	Павлоград Цум	UA_Donetskobl	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Шаповал Ксенія
4401	Терновка	UA_Donetskobl	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Потапова Ольга
4408	Соцгород	UA_Dnepr_region	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Недільчук Дарина
4381	Днепр.Центр	UA_Dnepr	2	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	Соколова Марина
4220	Раздельная.Приват	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	english	Матюшенко Олексій	Дмитрова Наталя
4223	Одесса Кадор	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	programming	Матюшенко Олексій	Гажук Ольга
4230	Измаил	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	english	Матюшенко Олексій	Головко Юля
4233	Болград	UA_Odesskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	programming	Матюшенко Олексій	КМ ще не знайдено
4240	Первомайск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-01	2022-08-07		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4243	Замостя	UA_Vynnytsya	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	Жупанова Анастасія
4250	Жмеринка	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	КМ ще не знайдено
4253	Житомир	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	Виговська Катерина
4260	Хмільник	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	english	Щербань Олександр	Гураль Надія
4263	Малин	UA_VynnytsyaOblast	0	0	0	0	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	КМ ще не знайдено
4270	Чорновола	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Дорошенко Анна
4273	Рубчака	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Аквінська Вікторія
4280	Львів-Винники	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Почтарук Зоряна
4283	Дрогобич	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	Возняк Вероніка
4290	Борислав	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Возняк Вероніка
4293	Новояворівськ	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4300	Тернопіль-БАМ	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Жмур Надя	english	Кравченко Олеся	Людвіковська Надія
4303	Рівне-Центр	UA_Lviv	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	programming	Кравченко Олеся	Варійчук Інна
4310	Ковель	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	english	Кравченко Олеся	Даць Уляна
4313	Вараш	UA_LvivOblast	0	0	0	0	2022-08-01	2022-08-07		Грановська Іра	programming	Кравченко Олеся	КМ ще не знайдено
4320	Чернівці офіс	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	english	Ласота Юрій	Дячук Анна
4323	Хмельницький офіс	UA_Chernivtsi	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	programming	Ласота Юрій	Норчук Альона
4330	Долина	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	english	Ласота Юрій	Пристая Олеся
4333	Калуш	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	programming	Ласота Юрій	Вовчак Анастасія
4340	Шепетівка	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	english	Ласота Юрій	Денещук Катерина
4343	Старокостянтинів	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	programming	Ласота Юрій	Галка Тетяна
4350	Сторожинець	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ніколаєнко Діна	english	Ласота Юрій	Цугуй Анастасія
4353	Хуст 	UA_ChernivtsiOblast	0	0	0	0	2022-08-01	2022-08-07		Ісарик Люба	programming	Ласота Юрій	Олексюк Наталія
4360	Полтава, Центр	UA_Poltava	0	0	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	english	Рощина Марія	Калієнко Дарина
4363	Миргород	UA_Poltava	0	0	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	programming	Рощина Марія	Калієнко Дарина
4370	Онлайн Харьков	UA_Kharkov	0	0	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	english	Рощина Марія	Головко Валентина
4373	Днепр.Подстанция	UA_Dnepr	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	Зданевич Евгения
4380	Днепр.Караван	UA_Dnepr	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	Крупіна Катерина
4383	Покров(Орджо)	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
4390	Запорожье.Вознесеновский	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	english	Щапкова Катерина	Котова Оксана
4393	Токмак	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-01	2022-08-07		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
4400	Павлоград Орбита	UA_Donetskobl	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Шаповал Ксенія
4403	Першотравенск	UA_Donetskobl	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	КМ ще не знайдено
4410	Никополь	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Василенко Катерина
4413	Каменское	UA_Dnepr_region	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Асанова Софія
4411	Александрия	UA_Dnepr_region	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Центелевич Светлана 
4418	Желтые Воды	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Решетило Марина
4421	Марганец	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Щасливець Аліна
4428	Подгородное	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Литвин Саша
4978	Хуст 	UA_ChernivtsiOblast	0	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	english	Ласота Юрій	Олексюк Наталія
4981	Онлайн Чернівці 2	UA_Chernivtsi	0	0	0	0	2022-08-15	2022-08-21		Ісарик Люба	programming	Ласота Юрій	Ружанська Анна
4988	Миргород	UA_Poltava	0	0	0	0	2022-08-15	2022-08-21		ТМ ще не знайдено	english	Рощина Марія	Калієнко Дарина
4991	Горишние Плавни	UA_Poltava	0	0	0	0	2022-08-15	2022-08-21		ТМ ще не знайдено	programming	Рощина Марія	КМ ще не знайдено
4998	Днепр.Подстанция	UA_Dnepr	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	Зданевич Евгения
5001	Днепр.Красный Камень	UA_Dnepr	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	Лутаєва Галина
5008	Покров(Орджо)	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
5018	Токмак	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
5028	Першотравенск	UA_Donetskobl	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	КМ ще не знайдено
5031	Соцгород	UA_Dnepr_region	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Недільчук Дарина
5038	Каменское	UA_Dnepr_region	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Асанова Софія
5048	Синельниково	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Борисенко Діана
5011	Запорожье.Александровский	UA_Dnepropetrovskaya oblast2	33	14	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	Котова Оксана
5021	Павлоград Цум	UA_Donetskobl	45	28	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Шаповал Ксенія
5051	Подгородное	UA_Dnepropetrovskaya oblast	24	13	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Литвин Саша
5041	Желтые Воды	UA_Dnepropetrovskaya oblast	37	22	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Решетило Марина
4415	Пятихатки	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Центелевич Светлана 
4422	Марганец	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Щасливець Аліна
4425	Верхнеднепровск	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Сергєєва Поліна
4412	Александрия	UA_Dnepr_region	41	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Центелевич Светлана 
4986	Полтава Онлайн	UA_Poltava	0	0	0	0	2022-08-15	2022-08-21		ТМ ще не знайдено	english	Рощина Марія	Калієнко Дар'я
4989	Кременчуг	UA_Poltava	0	0	0	0	2022-08-15	2022-08-21		ТМ ще не знайдено	programming	Рощина Марія	КМ ще не знайдено
4996	Днепр.Слобожанский	UA_Dnepr	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
4999	Днепр.Победа	UA_Dnepr	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	Лупульчук Наталія
5006	Днепр.Центр	UA_Dnepr	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	Соколова Марина
5009	Запоріжжя.Площа Фестівальна	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	Марюха Каріна
5016	г.Вольнянск Переулок Торговый	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
5019	г.Пологи	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-15	2022-08-21		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
5026	Терновка	UA_Donetskobl	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Потапова Ольга
5046	Марганец	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Щасливець Аліна
5049	Верхнеднепровск	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Сергєєва Поліна
5029	Заречный	UA_Dnepr_region	35	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Недільчук Дарина
5039	Пятихатки	UA_Dnepropetrovskaya oblast	27	17	0	0	2022-08-15	2022-08-21		Пикалова Карина	programming	Щапкова Катерина	Центелевич Светлана 
4845	Одесса _ ОНЛАЙН	UA_Odessa	71	41	1	2.4390243902439024	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	Малярчук Яна
5036	Александрия	UA_Dnepr_region	2	0	0	0	2022-08-15	2022-08-21		Пикалова Карина	english	Щапкова Катерина	Центелевич Светлана 
4979	Онлайн Чернівці 1	UA_Chernivtsi	16	8	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	programming	Ласота Юрій	Дячук Анна
4414	Каменское	UA_Dnepr_region	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Асанова Софія
4417	Желтые Воды	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Решетило Марина
4424	Синельниково	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Борисенко Діана
4427	Подгородное	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Литвин Саша
4787	Фастов	UA_Kievskaya oblast	32	23	5	21.73913043478261	2022-08-15	2022-08-21		Штепа Марина	programming	Матюшенко Олексій	Постолюк Олександра
4416	Пятихатки	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Центелевич Светлана 
4419	Вольногорск	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Василенко Катерина
4426	Верхнеднепровск	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Сергєєва Поліна
4969	Нетішин	UA_ChernivtsiOblast	27	18	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	programming	Ласота Юрій	Ковтунович Оксана
4843	Раздельная.Приват	UA_Odesskaya oblast	12	5	0	0	2022-08-15	2022-08-21		Сергєєва Вікторія	programming	Матюшенко Олексій	Дмитрова Наталя
4420	Вольногорск	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	english	Щапкова Катерина	Василенко Катерина
4423	Синельниково	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-01	2022-08-07		Пикалова Карина	programming	Щапкова Катерина	Борисенко Діана
4433	Киев, ВДНХ	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	Естонська Інна
4434	Киев, ВДНХ	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	Естонська Інна
4435	Киев, Академ	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	Морозова Алла
4359	Полтава, Центр	UA_Poltava	6	5	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	programming	Рощина Марія	Калієнко Дарина
4436	Киев, Академ	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	Морозова Алла
4437	Киев, Осокорки	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4438	Киев, Осокорки	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4439	Киев, Позняки	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4189	Кропивницкий	UA_Center	0	0	0	0	2022-08-01	2022-08-07		Вахній Вікторія	programming	Матюшенко Олексій	Дарій Інна
4440	Киев, Позняки	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4369	Онлайн Харьков	UA_Kharkov	19	9	0	0	2022-08-01	2022-08-07		ТМ ще не знайдено	programming	Рощина Марія	Головко Валентина
4441	Киев, Лукьяновка	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	Естонська Інна
4221	Одесса _ ОНЛАЙН	UA_Odessa	38	25	0	0	2022-08-01	2022-08-07		Сергєєва Вікторія	programming	Матюшенко Олексій	Малярчук Яна
4442	Киев, Лукьяновка	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	Естонська Інна
4443	Киев, Левобережная	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	Морозова Алла
4444	Киев, Левобережная	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	Морозова Алла
4445	Киев, Троещина	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	Некрашевич Софія
4446	Киев, Троещина	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	Некрашевич Софія
4447	Нежин	UA_Chernigov_obl	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	Гурчина Яна
4448	Нежин	UA_Chernigov_obl	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	Гурчина Яна
4449	Прилуки	UA_Chernigov_obl	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	Гурчина Яна
4450	Прилуки	UA_Chernigov_obl	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	Гурчина Яна
4451	Бахмач	UA_Chernigov_obl	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4452	Бахмач	UA_Chernigov_obl	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4454	Онлайн Киев	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	Некрашевич Софія
4255	Бердичів	UA_VynnytsyaOblast	0	0	1	100	2022-08-01	2022-08-07		Гладишко Віталіна	programming	Щербань Олександр	Ніколайчук Тетяна
4117	Онлайн	UA_SaaS	492	338	116	34.319526627218934	2022-08-01	2022-08-07		Смідонова Ольга	programming	Смідонова Ольга	КМ ще не знайдено
4431	Киев, Оболонь	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	КМ ще не знайдено
4432	Киев, Оболонь	UA_Kiev	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	КМ ще не знайдено
4455	Онлайн ЧО	UA_Chernigov_obl	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	Гурчина Яна
4456	Онлайн ЧО	UA_Chernigov_obl	0	0	0	0	2022-08-08	2022-08-14		Щербатюк Артем	english	Матюшенко Олексій	Гурчина Яна
4457	Украинка	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	КМ ще не знайдено
4458	Украинка	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	КМ ще не знайдено
4459	Ирпень	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Лінтур Вероніка
4460	Ирпень	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Лінтур Вероніка
4430	Онлайн	UA_SaaS	19	17	7	41.17647058823529	2022-08-08	2022-08-14		Смідонова Ольга	english	Смідонова Ольга	КМ ще не знайдено
4461	Буча	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Лінтур Вероніка
4468	Боярка	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Барабаш Лілія
4471	Бровары	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Неділько Анна
4478	Онлайн_Фастов_Постолюк	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Постолюк Олександра
4488	Онлайн_Боярка	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Барабаш Лілія
4491	Смела	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	programming	Матюшенко Олексій	Волк Наталя
4498	Канев	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	english	Матюшенко Олексій	Толюпа Тетяна
4508	Говорова.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	Фараонова Анастасія
4511	Вузовский.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4518	Авангард.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4521	Беляевка.Одесса	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4528	Балта.Ладушки	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	Маковєєва Світлана
4531	Раздельная.Приват	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	Дмитрова Наталя
4538	Черноморск	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	english	Матюшенко Олексій	Константинова Мила
4541	Измаил	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	programming	Матюшенко Олексій	Головко Юля
4548	Южноукраинск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4551	Первомайск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4558	Поділля	UA_Vynnytsya	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	Жупанова Анастасія
4568	Бердичів	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	Ніколайчук Тетяна
4571	Хмільник	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	Гураль Надія
4578	Онлайн Вінниця	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	Бречко Діана
4581	Чорновола	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Дорошенко Анна
4588	Брюховичі	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4591	Львів-Винники	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Почтарук Зоряна
4598	Стрий	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Диба Рома
4601	Борислав	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Возняк Вероніка
4608	Жовква	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Людвіковська Надія
4611	Тернопіль-БАМ	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Людвіковська Надія
4618	Дубно	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	english	Кравченко Олеся	Велічко Софія
4621	Ковель	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	programming	Кравченко Олеся	Даць Уляна
4628	Костопіль	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	english	Кравченко Олеся	КМ ще не знайдено
4638	ІФ офіс	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	english	Ласота Юрій	Шеленко Наталія
4641	Долина	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	programming	Ласота Юрій	Пристая Олеся
4648	Мукачево	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	english	Ласота Юрій	Фабрицій Софія
4651	Шепетівка	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	programming	Ласота Юрій	Денещук Катерина
4658	Нетішин	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	english	Ласота Юрій	Ковтунович Оксана
4971	Красилів	UA_ChernivtsiOblast	11	4	0	0	2022-08-15	2022-08-21		Ніколаєнко Діна	programming	Ласота Юрій	Якубець Анастасія
4631	Чернівці офіс	UA_Chernivtsi	0	0	1	100	2022-08-08	2022-08-14		Ніколаєнко Діна	programming	Ласота Юрій	Дячук Анна
4501	Кропивницкий	UA_Center	6	5	0	0	2022-08-08	2022-08-14		Вахній Вікторія	programming	Матюшенко Олексій	Дарій Інна
4462	Буча	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Лінтур Вероніка
4465	Васильков	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Барабаш Лілія
4472	Бровары	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Неділько Анна
4475	Фастов	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Постолюк Олександра
4482	Онлайн_Фастов_Лобанова	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Лобанова Наталія
4485	Онлайн_БЦ	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Семенюк Катерина
4492	Смела	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	english	Матюшенко Олексій	Волк Наталя
4495	Умань	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	programming	Матюшенко Олексій	Ситник Катерина
4502	Кропивницкий	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	english	Матюшенко Олексій	Дарій Інна
4505	ЦУ_ОНЛАЙН	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	programming	Матюшенко Олексій	Ситник Катерина
4512	Вузовский.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4515	Мечникова.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4522	Беляевка.Одесса	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4525	Подольск.Квинта	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	Маковєєва Світлана
4532	Раздельная.Приват	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	Дмитрова Наталя
4535	Одесса Кадор	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	programming	Матюшенко Олексій	Гажук Ольга
4542	Измаил	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	english	Матюшенко Олексій	Головко Юля
4545	Болград	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	programming	Матюшенко Олексій	КМ ще не знайдено
4552	Первомайск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4555	Замостя	UA_Vynnytsya	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	Жупанова Анастасія
4562	Жмеринка	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	КМ ще не знайдено
4565	Житомир	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	Виговська Катерина
4572	Хмільник	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	Гураль Надія
4575	Малин	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	КМ ще не знайдено
4582	Чорновола	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Дорошенко Анна
4585	Рубчака	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Аквінська Вікторія
4592	Львів-Винники	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Почтарук Зоряна
4595	Дрогобич	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Возняк Вероніка
4602	Борислав	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Возняк Вероніка
4605	Новояворівськ	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4612	Тернопіль-БАМ	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Людвіковська Надія
4615	Рівне-Центр	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	programming	Кравченко Олеся	Варійчук Інна
4622	Ковель	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	english	Кравченко Олеся	Даць Уляна
4625	Вараш	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	programming	Кравченко Олеся	КМ ще не знайдено
4632	Чернівці офіс	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	english	Ласота Юрій	Дячук Анна
4635	Хмельницький офіс	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	programming	Ласота Юрій	Норчук Альона
4642	Долина	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	english	Ласота Юрій	Пристая Олеся
4645	Калуш	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	programming	Ласота Юрій	Вовчак Анастасія
4652	Шепетівка	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	english	Ласота Юрій	Денещук Катерина
4655	Старокостянтинів	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	programming	Ласота Юрій	Галка Тетяна
4463	Вишневое	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	КМ ще не знайдено
4470	Борисполь	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Чиколовець Вікторія 
4473	БЦ	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Семенюк Катерина
4480	Буча_Онлайн_Гулейкова	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Гулейкова Яна
4483	Онлайн_Ирпень_Линтур	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Лінтур Вероніка
4490	Черкассы	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	english	Матюшенко Олексій	Волк Наталя
4493	Знаменка	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4500	Корсунь-Шевченковский	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	english	Матюшенко Олексій	Толюпа Тетяна
4503	Светловодск	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	programming	Матюшенко Олексій	Іванова Анна
4510	Черемушки.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	Костенко Викторія
4513	Центр.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	Фараонова Анастасія
4520	Поселок.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	Снігур Олена
4523	Южный	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	Снігур Олена
4530	Овидиополь.Детский клуб	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4540	Белгород-Днестровский	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	english	Матюшенко Олексій	КМ ще не знайдено
4543	Рени	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	programming	Матюшенко Олексій	КМ ще не знайдено
4550	Вознесенск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4553	Николаевская обл. ОНЛАЙН	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4560	Вишенька	UA_Vynnytsya	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	Жупанова Анастасія
4563	Могилів-Подільський	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	Коваленко Людмила
4570	Коростень	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	Вознюк Світлана
4573	Новоград-Волинський	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	КМ ще не знайдено
4580	Львів-Центр-Петрушевича	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Дорошенко Анна
4583	Сихів	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Аквінська Вікторія
4590	Пустомити	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4593	Онлайн Львів	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Даць Уляна
4600	Червоноград	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Федина Наталя
4603	Броди	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Почтарук Зоряна
4610	Тернопіль-Центр	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Людвіковська Надія
4613	Кременець	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4620	Луцьк-Центр	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	english	Кравченко Олеся	Літкевич Вікторія
4623	Нововолинськ	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	programming	Кравченко Олеся	КМ ще не знайдено
4630	Онлайн_Льівський регіон_2022	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	english	Кравченко Олеся	Даць Уляна
4633	КП Розмарин	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	programming	Ласота Юрій	Юрчак Світлана
4640	ІФ Університет	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	english	Ласота Юрій	Шеленко Наталія
4643	Коломия	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	programming	Ласота Юрій	Ружанська Анна
4650	Ужгород	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	english	Ласота Юрій	КМ ще не знайдено
4653	Славута	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	programming	Ласота Юрій	Янчук Ольга
4464	Вишневое	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	КМ ще не знайдено
4467	Боярка	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Барабаш Лілія
4474	БЦ	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Семенюк Катерина
4484	Онлайн_Ирпень_Линтур	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Лінтур Вероніка
4487	Онлайн_Боярка	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Барабаш Лілія
4494	Знаменка	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4497	Канев	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	programming	Матюшенко Олексій	Толюпа Тетяна
4504	Светловодск	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	english	Матюшенко Олексій	Іванова Анна
4507	Говорова.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	Фараонова Анастасія
4514	Центр.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	Фараонова Анастасія
4517	Авангард.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4524	Южный	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	Снігур Олена
4527	Балта.Ладушки	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	Маковєєва Світлана
4534	Одесса _ ОНЛАЙН	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	Малярчук Яна
4537	Черноморск	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	programming	Матюшенко Олексій	Константинова Мила
4544	Рени	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	english	Матюшенко Олексій	КМ ще не знайдено
4547	Южноукраинск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4554	Николаевская обл. ОНЛАЙН	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	english	Матюшенко Олексій	Обертун Настя
4557	Поділля	UA_Vynnytsya	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	Жупанова Анастасія
4564	Могилів-Подільський	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	Коваленко Людмила
4567	Бердичів	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	Ніколайчук Тетяна
4574	Новоград-Волинський	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	КМ ще не знайдено
4584	Сихів	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Аквінська Вікторія
4587	Брюховичі	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4594	Онлайн Львів	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Даць Уляна
4597	Стрий	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Диба Рома
4604	Броди	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Почтарук Зоряна
4607	Жовква	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Людвіковська Надія
4614	Кременець	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4617	Дубно	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	programming	Кравченко Олеся	Велічко Софія
4624	Нововолинськ	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	english	Кравченко Олеся	КМ ще не знайдено
4627	Костопіль	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	programming	Кравченко Олеся	КМ ще не знайдено
4634	КП Розмарин	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	english	Ласота Юрій	Юрчак Світлана
4637	ІФ офіс	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	programming	Ласота Юрій	Шеленко Наталія
4644	Коломия	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	english	Ласота Юрій	Ружанська Анна
4647	Мукачево	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	programming	Ласота Юрій	Фабрицій Софія
4654	Славута	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	english	Ласота Юрій	Янчук Ольга
4577	Онлайн Вінниця	UA_VynnytsyaOblast	10	3	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	Бречко Діана
4466	Васильков	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Барабаш Лілія
4469	Борисполь	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Чиколовець Вікторія 
4476	Фастов	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Постолюк Олександра
4486	Онлайн_БЦ	UA_Kievskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Штепа Марина	english	Матюшенко Олексій	Семенюк Катерина
4489	Черкассы	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	programming	Матюшенко Олексій	Волк Наталя
4496	Умань	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	english	Матюшенко Олексій	Ситник Катерина
4499	Корсунь-Шевченковский	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	programming	Матюшенко Олексій	Толюпа Тетяна
4506	ЦУ_ОНЛАЙН	UA_Center	0	0	0	0	2022-08-08	2022-08-14		Вахній Вікторія	english	Матюшенко Олексій	Ситник Катерина
4509	Черемушки.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	Костенко Викторія
4516	Мечникова.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	КМ ще не знайдено
4519	Поселок.Одесса	UA_Odessa	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	Снігур Олена
4526	Подольск.Квинта	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	english	Матюшенко Олексій	Маковєєва Світлана
4529	Овидиополь.Детский клуб	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	КМ ще не знайдено
4536	Одесса Кадор	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	english	Матюшенко Олексій	Гажук Ольга
4539	Белгород-Днестровский	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	programming	Матюшенко Олексій	КМ ще не знайдено
4546	Болград	UA_Odesskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	english	Матюшенко Олексій	КМ ще не знайдено
4549	Вознесенск	UA_Nikolaevskaya obl	0	0	0	0	2022-08-08	2022-08-14		Краснік Ольга	programming	Матюшенко Олексій	Обертун Настя
4556	Замостя	UA_Vynnytsya	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	Жупанова Анастасія
4559	Вишенька	UA_Vynnytsya	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	Жупанова Анастасія
4566	Житомир	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	Виговська Катерина
4569	Коростень	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	Вознюк Світлана
4576	Малин	UA_VynnytsyaOblast	0	0	0	0	2022-08-08	2022-08-14		Гладишко Віталіна	english	Щербань Олександр	КМ ще не знайдено
4579	Львів-Центр-Петрушевича	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Дорошенко Анна
4586	Рубчака	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Аквінська Вікторія
4589	Пустомити	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	КМ ще не знайдено
4596	Дрогобич	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	Возняк Вероніка
4599	Червоноград	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Федина Наталя
4606	Новояворівськ	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	english	Кравченко Олеся	КМ ще не знайдено
4609	Тернопіль-Центр	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Жмур Надя	programming	Кравченко Олеся	Людвіковська Надія
4616	Рівне-Центр	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	english	Кравченко Олеся	Варійчук Інна
4619	Луцьк-Центр	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	programming	Кравченко Олеся	Літкевич Вікторія
4626	Вараш	UA_LvivOblast	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	english	Кравченко Олеся	КМ ще не знайдено
4629	Онлайн_Льівський регіон_2022	UA_Lviv	0	0	0	0	2022-08-08	2022-08-14		Грановська Іра	programming	Кравченко Олеся	Даць Уляна
4636	Хмельницький офіс	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	english	Ласота Юрій	Норчук Альона
4639	ІФ Університет	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	programming	Ласота Юрій	Шеленко Наталія
4646	Калуш	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	english	Ласота Юрій	Вовчак Анастасія
4649	Ужгород	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	programming	Ласота Юрій	КМ ще не знайдено
4656	Старокостянтинів	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	english	Ласота Юрій	Галка Тетяна
4657	Нетішин	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	programming	Ласота Юрій	Ковтунович Оксана
4664	Полонне	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	english	Ласота Юрій	Дуброва Мирослава
4674	Полтава Онлайн	UA_Poltava	0	0	0	0	2022-08-08	2022-08-14		ТМ ще не знайдено	english	Рощина Марія	Калієнко Дар'я
4677	Кременчуг	UA_Poltava	0	0	0	0	2022-08-08	2022-08-14		ТМ ще не знайдено	programming	Рощина Марія	КМ ще не знайдено
4684	Днепр.Слобожанский	UA_Dnepr	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
4687	Днепр.Победа	UA_Dnepr	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	Лупульчук Наталія
4694	Днепр.Центр	UA_Dnepr	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	Соколова Марина
4697	Запоріжжя.Площа Фестівальна	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	Марюха Каріна
4704	г.Вольнянск Переулок Торговый	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
4707	г.Пологи	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
4714	Терновка	UA_Donetskobl	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Потапова Ольга
4717	Заречный	UA_Dnepr_region	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Недільчук Дарина
4727	Пятихатки	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Центелевич Светлана 
4734	Марганец	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Щасливець Аліна
4737	Верхнеднепровск	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Сергєєва Поліна
4667	Онлайн Чернівці 1	UA_Chernivtsi	16	10	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	programming	Ласота Юрій	Дячук Анна
4724	Александрия	UA_Dnepr_region	0	0	1	100	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Центелевич Светлана 
4659	Красилів	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	programming	Ласота Юрій	Якубець Анастасія
4666	Хуст 	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	english	Ласота Юрій	Олексюк Наталія
4669	Онлайн Чернівці 2	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	programming	Ласота Юрій	Ружанська Анна
4676	Миргород	UA_Poltava	0	0	0	0	2022-08-08	2022-08-14		ТМ ще не знайдено	english	Рощина Марія	Калієнко Дарина
4679	Горишние Плавни	UA_Poltava	0	0	0	0	2022-08-08	2022-08-14		ТМ ще не знайдено	programming	Рощина Марія	КМ ще не знайдено
4686	Днепр.Подстанция	UA_Dnepr	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	Зданевич Евгения
4689	Днепр.Красный Камень	UA_Dnepr	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	Лутаєва Галина
4696	Покров(Орджо)	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
4699	Запорожье.Александровский	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	Котова Оксана
4706	Токмак	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
4709	Павлоград Цум	UA_Donetskobl	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Шаповал Ксенія
4716	Першотравенск	UA_Donetskobl	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	КМ ще не знайдено
4719	Соцгород	UA_Dnepr_region	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Недільчук Дарина
4726	Каменское	UA_Dnepr_region	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Асанова Софія
4729	Желтые Воды	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Решетило Марина
4736	Синельниково	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Борисенко Діана
4739	Подгородное	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Литвин Саша
4660	Красилів	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	english	Ласота Юрій	Якубець Анастасія
4663	Полонне	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	programming	Ласота Юрій	Дуброва Мирослава
4670	Онлайн Чернівці 2	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	english	Ласота Юрій	Ружанська Анна
4680	Горишние Плавни	UA_Poltava	0	0	0	0	2022-08-08	2022-08-14		ТМ ще не знайдено	english	Рощина Марія	КМ ще не знайдено
4683	Днепр.Слобожанский	UA_Dnepr	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
4690	Днепр.Красный Камень	UA_Dnepr	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	Лутаєва Галина
4700	Запорожье.Александровский	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	Котова Оксана
4703	г.Вольнянск Переулок Торговый	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
4710	Павлоград Цум	UA_Donetskobl	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Шаповал Ксенія
4713	Терновка	UA_Donetskobl	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Потапова Ольга
4720	Соцгород	UA_Dnepr_region	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Недільчук Дарина
4723	Александрия	UA_Dnepr_region	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Центелевич Светлана 
4730	Желтые Воды	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Решетило Марина
4733	Марганец	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Щасливець Аліна
4740	Подгородное	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Литвин Саша
4429	Онлайн	UA_SaaS	471	293	91	31.058020477815703	2022-08-08	2022-08-14		Смідонова Ольга	programming	Смідонова Ольга	КМ ще не знайдено
4673	Полтава Онлайн	UA_Poltava	0	0	2	100	2022-08-08	2022-08-14		ТМ ще не знайдено	programming	Рощина Марія	Калієнко Дар'я
4693	Днепр.Центр	UA_Dnepr	7	0	1	100	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	Соколова Марина
4661	Сторожинець	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	programming	Ласота Юрій	Цугуй Анастасія
4668	Онлайн Чернівці 1	UA_Chernivtsi	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	english	Ласота Юрій	Дячук Анна
4671	Полтава, Центр	UA_Poltava	0	0	0	0	2022-08-08	2022-08-14		ТМ ще не знайдено	programming	Рощина Марія	Калієнко Дарина
4678	Кременчуг	UA_Poltava	0	0	0	0	2022-08-08	2022-08-14		ТМ ще не знайдено	english	Рощина Марія	КМ ще не знайдено
4688	Днепр.Победа	UA_Dnepr	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	Лупульчук Наталія
4691	Днепр.Караван	UA_Dnepr	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	Крупіна Катерина
4698	Запоріжжя.Площа Фестівальна	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	Марюха Каріна
4701	Запорожье.Вознесеновский	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	Котова Оксана
4708	г.Пологи	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	КМ ще не знайдено
4711	Павлоград Орбита	UA_Donetskobl	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Шаповал Ксенія
4718	Заречный	UA_Dnepr_region	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Недільчук Дарина
4721	Никополь	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Василенко Катерина
4728	Пятихатки	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Центелевич Светлана 
4731	Вольногорск	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Василенко Катерина
4738	Верхнеднепровск	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Сергєєва Поліна
4681	Онлайн Харьков	UA_Kharkov	40	14	3	21.428571428571427	2022-08-08	2022-08-14		ТМ ще не знайдено	programming	Рощина Марія	Головко Валентина
4662	Сторожинець	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ніколаєнко Діна	english	Ласота Юрій	Цугуй Анастасія
4665	Хуст 	UA_ChernivtsiOblast	0	0	0	0	2022-08-08	2022-08-14		Ісарик Люба	programming	Ласота Юрій	Олексюк Наталія
4672	Полтава, Центр	UA_Poltava	0	0	0	0	2022-08-08	2022-08-14		ТМ ще не знайдено	english	Рощина Марія	Калієнко Дарина
4675	Миргород	UA_Poltava	0	0	0	0	2022-08-08	2022-08-14		ТМ ще не знайдено	programming	Рощина Марія	Калієнко Дарина
4682	Онлайн Харьков	UA_Kharkov	0	0	0	0	2022-08-08	2022-08-14		ТМ ще не знайдено	english	Рощина Марія	Головко Валентина
4685	Днепр.Подстанция	UA_Dnepr	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	Зданевич Евгения
4692	Днепр.Караван	UA_Dnepr	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	Крупіна Катерина
4695	Покров(Орджо)	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
4702	Запорожье.Вознесеновский	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	english	Щапкова Катерина	Котова Оксана
4705	Токмак	UA_Dnepropetrovskaya oblast2	0	0	0	0	2022-08-08	2022-08-14		Таран Светлана	programming	Щапкова Катерина	КМ ще не знайдено
4712	Павлоград Орбита	UA_Donetskobl	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Шаповал Ксенія
4715	Першотравенск	UA_Donetskobl	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	КМ ще не знайдено
4722	Никополь	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Василенко Катерина
4725	Каменское	UA_Dnepr_region	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Асанова Софія
4732	Вольногорск	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	english	Щапкова Катерина	Василенко Катерина
4735	Синельниково	UA_Dnepropetrovskaya oblast	0	0	0	0	2022-08-08	2022-08-14		Пикалова Карина	programming	Щапкова Катерина	Борисенко Діана
4477	Онлайн_Фастов_Постолюк	UA_Kievskaya oblast	5	4	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Постолюк Олександра
4481	Онлайн_Фастов_Лобанова	UA_Kievskaya oblast	14	6	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Лобанова Наталія
4479	Буча_Онлайн_Гулейкова	UA_Kievskaya oblast	21	8	0	0	2022-08-08	2022-08-14		Штепа Марина	programming	Матюшенко Олексій	Гулейкова Яна
4533	Одесса _ ОНЛАЙН	UA_Odessa	57	23	0	0	2022-08-08	2022-08-14		Сергєєва Вікторія	programming	Матюшенко Олексій	Малярчук Яна
4561	Жмеринка	UA_VynnytsyaOblast	0	0	1	100	2022-08-08	2022-08-14		Гладишко Віталіна	programming	Щербань Олександр	КМ ще не знайдено
4453	Онлайн Киев	UA_Kiev	13	5	1	20	2022-08-08	2022-08-14		Щербатюк Артем	programming	Матюшенко Олексій	Некрашевич Софія
\.


--
-- Data for Name: home_student; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.home_student (id, lms_id, student_name, group_id, group_location, amo_id, region) FROM stdin;
\.


--
-- Data for Name: home_studentamoref; Type: TABLE DATA; Schema: public; Owner: logikaadmin
--

COPY public.home_studentamoref (id, lms_id, amo_id, attended, group_id, report_end, report_start) FROM stdin;
17413	636389	22140135	1	252636	2022-08-21	2022-08-15
17434	1716168	25509284	0	249928	2022-08-21	2022-08-15
17439	1717063	22521401	0	249593	2022-08-21	2022-08-15
17444	1718783	22412133	1	249593	2022-08-21	2022-08-15
17446	759760	23146417	0	250121	2022-08-21	2022-08-15
17449	1724380	57760208	0	249928	2022-08-21	2022-08-15
17451	1724779	57759174	0	252271	2022-08-21	2022-08-15
17454	1725706	57781984	1	249928	2022-08-21	2022-08-15
17456	1725707	57780802	1	252271	2022-08-21	2022-08-15
17459	1725897	57783922	0	249928	2022-08-21	2022-08-15
17463	1721146	57731208	1	253465	2022-08-21	2022-08-15
17468	1721197	57730406	0	253465	2022-08-21	2022-08-15
17471	1728955	57804076	1	252271	2022-08-21	2022-08-15
17474	1729556	57809708	0	249928	2022-08-21	2022-08-15
17476	1729640	57788588	0	252271	2022-08-21	2022-08-15
17479	1724892	57763224	1	249593	2022-08-21	2022-08-15
17482	1711747	57612018	1	250121	2022-08-21	2022-08-15
17484	1725718	57780640	1	249593	2022-08-21	2022-08-15
17494	765289	23044385	1	254597	2022-08-21	2022-08-15
17499	1042485	24793167	0	254597	2022-08-21	2022-08-15
17504	1048057		0	254597	2022-08-21	2022-08-15
17509	1069516	24849851	1	254597	2022-08-21	2022-08-15
17515	1714266	25477882	0	249820	2022-08-21	2022-08-15
17520	1716171	25570472	0	249820	2022-08-21	2022-08-15
17521	1034129	24741001	0	249968	2022-08-21	2022-08-15
17525	1716212	25556450	1	249820	2022-08-21	2022-08-15
17526	1044643	24802841	1	249968	2022-08-21	2022-08-15
17530	1716240	25522776	0	249820	2022-08-21	2022-08-15
17531	1715269	25554296	0	249968	2022-08-21	2022-08-15
17535	1465097	25580958	0	254597	2022-08-21	2022-08-15
17536	1717665	25571540	0	249968	2022-08-21	2022-08-15
17540	1449371	25523140	0	250382	2022-08-21	2022-08-15
17541	1725328	57779392	1	249968	2022-08-21	2022-08-15
17545	1711751	25420030	1	250382	2022-08-21	2022-08-15
17546	1728139	57804572	1	249968	2022-08-21	2022-08-15
17566	1724684		1	254597	2022-08-21	2022-08-15
17571	1725983	57634886	0	254597	2022-08-21	2022-08-15
17576	1724948	57772502	0	250382	2022-08-21	2022-08-15
17579	681664	22608003	1	250983	2022-08-21	2022-08-15
17581	1422452	24366833	1	249954	2022-08-21	2022-08-15
17596	1719676	57700006	0	253428	2022-08-21	2022-08-15
17598	1729957	57797628	1	249616	2022-08-21	2022-08-15
17601	1720227	57726716	1	253428	2022-08-21	2022-08-15
17603	1723746	57761330	1	250273	2022-08-21	2022-08-15
17607	1720389	57713858	0	253428	2022-08-21	2022-08-15
17608	1725118	57762962	0	250273	2022-08-21	2022-08-15
17612	1721136	57701520	1	253428	2022-08-21	2022-08-15
17613	1725296	57778506	0	250273	2022-08-21	2022-08-15
17617	1721210	57728286	1	253428	2022-08-21	2022-08-15
17618	1725507	57781440	0	250273	2022-08-21	2022-08-15
17622	1721530	57734840	1	253428	2022-08-21	2022-08-15
17623	1725757	57785782	1	250273	2022-08-21	2022-08-15
17631	1722512	57729184	0	253428	2022-08-21	2022-08-15
17636	1722542	57627770	0	253428	2022-08-21	2022-08-15
17648	1410537	25412598	0	253934	2022-08-21	2022-08-15
17653	1724796	57759618	1	249581	2022-08-21	2022-08-15
17656	1715312	25529026	1	249897	2022-08-21	2022-08-15
17658	1725572	57783334	1	249581	2022-08-21	2022-08-15
17661	1715362	25505260	0	249897	2022-08-21	2022-08-15
17663	1725984	57784344	0	249581	2022-08-21	2022-08-15
17666	1719829	57666202	1	253792	2022-08-21	2022-08-15
17669	1467256	25542294	0	253934	2022-08-21	2022-08-15
17671	1721226	57730060	1	253792	2022-08-21	2022-08-15
17678	1068438	24895583	1	251589	2022-08-21	2022-08-15
17683	1715210	19684853	0	251589	2022-08-21	2022-08-15
17688	1715317	25567462	0	251589	2022-08-21	2022-08-15
17693	1716171	25570472	0	251589	2022-08-21	2022-08-15
17698	1716212	25556450	0	251589	2022-08-21	2022-08-15
17704	1719842	25148709	0	253511	2022-08-21	2022-08-15
17729	1723642	57759236	1	252612	2022-08-21	2022-08-15
17738	1460827	25424188	1	251134	2022-08-21	2022-08-15
17743	1468200	25592792	1	251134	2022-08-21	2022-08-15
17746	1721086	21635011	1	253511	2022-08-21	2022-08-15
17748	1714684	25423786	1	251134	2022-08-21	2022-08-15
17753	1717330	25518774	0	251134	2022-08-21	2022-08-15
17759	1720089	57698702	1	253494	2022-08-21	2022-08-15
17764	1720148	57725972	1	253494	2022-08-21	2022-08-15
17766	1717004	57664424	1	252579	2022-08-21	2022-08-15
17769	1722740	57746528	1	253494	2022-08-21	2022-08-15
17771	1717499	25442144	1	252579	2022-08-21	2022-08-15
17773	1413953	25422652	0	249613	2022-08-21	2022-08-15
17779	1115890	24947335	1	253347	2022-08-21	2022-08-15
17784	1717692	25316116	1	252579	2022-08-21	2022-08-15
17789	1720975	57731056	1	253452	2022-08-21	2022-08-15
17794	1721063	57728596	1	253452	2022-08-21	2022-08-15
17799	1721192	57732120	0	253452	2022-08-21	2022-08-15
17801	1711765	57607808	0	253487	2022-08-21	2022-08-15
17804	1730062		0	253347	2022-08-21	2022-08-15
17806	1722752	25528378	0	253487	2022-08-21	2022-08-15
17813	1722792	57628066	0	253452	2022-08-21	2022-08-15
17816	1724671	57767792	0	253487	2022-08-21	2022-08-15
17823	1726917	57792752	0	252673	2022-08-21	2022-08-15
17826	1725847	57759504	0	253487	2022-08-21	2022-08-15
19114	1710333	57595468	1	253433	2022-08-21	2022-08-15
19130	1729510	57794628	1	252287	2022-08-21	2022-08-15
19135	1730208	57804210	1	252287	2022-08-21	2022-08-15
19140	1730627	57812118	1	252287	2022-08-21	2022-08-15
17414	1425619	25455078	1	249928	2022-08-21	2022-08-15
17419	1711383	25417830	0	249928	2022-08-21	2022-08-15
17424	1720026	57714860	1	253465	2022-08-21	2022-08-15
17429	1720405	57727012	0	253465	2022-08-21	2022-08-15
17435	1724121	57761564	1	252232	2022-08-21	2022-08-15
17440	1717181	25274135	0	249928	2022-08-21	2022-08-15
17445	1723728	57759228	1	249928	2022-08-21	2022-08-15
17447	1724756	57765344	1	252271	2022-08-21	2022-08-15
17450	1718861	57696328	0	249593	2022-08-21	2022-08-15
17452	768254	23143843	1	250121	2022-08-21	2022-08-15
17455	1719646	57701330	0	249593	2022-08-21	2022-08-15
17457	770389	23286485	1	250121	2022-08-21	2022-08-15
17460	1723158		0	249593	2022-08-21	2022-08-15
17462	1041998	24742927	0	250121	2022-08-21	2022-08-15
17465	1724284	57765838	1	249593	2022-08-21	2022-08-15
17467	1042034	24773491	1	250121	2022-08-21	2022-08-15
17480	1428442	25456946	0	249820	2022-08-21	2022-08-15
17485	1433206	25463716	0	249820	2022-08-21	2022-08-15
17488	1054096	24855677	0	251813	2022-08-21	2022-08-15
17491	1720690	57730240	0	250121	2022-08-21	2022-08-15
17511	1468791	25551410	1	249820	2022-08-21	2022-08-15
17513	1727591	57788528	1	250121	2022-08-21	2022-08-15
17518	1457974	25451610	0	254597	2022-08-21	2022-08-15
17523	1458848	25555718	0	254597	2022-08-21	2022-08-15
17528	1461720	25553916	1	254597	2022-08-21	2022-08-15
17533	1717944	25535030	0	249820	2022-08-21	2022-08-15
17538	1720362	25522982	0	249820	2022-08-21	2022-08-15
17543	1723453	57761664	0	249820	2022-08-21	2022-08-15
17548	1723124	24841663	0	254597	2022-08-21	2022-08-15
17550	1715514	57638092	0	253443	2022-08-21	2022-08-15
17553	1716201	25112073	1	250382	2022-08-21	2022-08-15
17556	1730223		1	249968	2022-08-21	2022-08-15
17558	1719653	25532412	1	250382	2022-08-21	2022-08-15
17561	1730230		1	249968	2022-08-21	2022-08-15
17563	1723633	57762704	1	250382	2022-08-21	2022-08-15
17583	1724836	57765392	1	249616	2022-08-21	2022-08-15
17585	1719482	57698786	1	253428	2022-08-21	2022-08-15
17588	1725438	57781736	1	249616	2022-08-21	2022-08-15
17590	1713596	25559232	0	249954	2022-08-21	2022-08-15
17593	1726298	57780676	1	249616	2022-08-21	2022-08-15
17595	1714536	25559494	1	249954	2022-08-21	2022-08-15
17600	1714854	25421134	0	249954	2022-08-21	2022-08-15
17606	1725533	57779312	0	250983	2022-08-21	2022-08-15
17611	1717601	25407626	0	249954	2022-08-21	2022-08-15
17616	1721151	25533702	0	249954	2022-08-21	2022-08-15
17621	1721649	57727544	1	249954	2022-08-21	2022-08-15
17626	1721543	57731766	1	253428	2022-08-21	2022-08-15
17628	743625	23007537	0	249897	2022-08-21	2022-08-15
17633	1070889	24901007	1	249897	2022-08-21	2022-08-15
17638	1097261	24923069	0	249897	2022-08-21	2022-08-15
17643	1412786	25418658	0	249897	2022-08-21	2022-08-15
17655	1730940		0	250273	2022-08-21	2022-08-15
17660	1731243		1	250273	2022-08-21	2022-08-15
17665	1716119	57655706	0	249897	2022-08-21	2022-08-15
17668	668983	22539149	1	249990	2022-08-21	2022-08-15
17670	1716301	25553830	0	249897	2022-08-21	2022-08-15
17673	1324582	25220681	0	249990	2022-08-21	2022-08-15
17676	1721531	57728192	1	253792	2022-08-21	2022-08-15
17681	1721548	57728896	0	253792	2022-08-21	2022-08-15
17703	1722998	57749514	0	253792	2022-08-21	2022-08-15
17730	1729114	57805112	1	249823	2022-08-21	2022-08-15
17745	1727105	57793518	0	252612	2022-08-21	2022-08-15
17750	1727330	57758898	1	252612	2022-08-21	2022-08-15
17755	1727500	24835115	1	252612	2022-08-21	2022-08-15
17758	1724191	57759578	1	253369	2022-08-21	2022-08-15
17763	1725446	57780606	1	253369	2022-08-21	2022-08-15
17765	1725465	57781330	0	249763	2022-08-21	2022-08-15
17768	1726159	57780494	1	253369	2022-08-21	2022-08-15
17770	1726120	57762772	0	249763	2022-08-21	2022-08-15
17777	1718779	57681816	1	249613	2022-08-21	2022-08-15
17782	1722466	57750870	1	249613	2022-08-21	2022-08-15
17787	1726201	57778324	1	253347	2022-08-21	2022-08-15
17792	1726235	57766280	1	253347	2022-08-21	2022-08-15
17809	1725688	57785232	1	249610	2022-08-21	2022-08-15
17814	1726357	57784838	1	249610	2022-08-21	2022-08-15
17820	1719950	57713534	1	252572	2022-08-21	2022-08-15
17825	1730514	57813834	1	249610	2022-08-21	2022-08-15
19115	1724839	57762404	1	252287	2022-08-21	2022-08-15
19127	776264	23344517	1	252434	2022-08-21	2022-08-15
19132	1463430	25146473	0	249957	2022-08-21	2022-08-15
19137	1723373	57760660	1	249957	2022-08-21	2022-08-15
19172	1723710	57699240	0	253433	2022-08-21	2022-08-15
19175	1722624	25434018	0	253620	2022-08-21	2022-08-15
19177	1724362	57766168	1	253433	2022-08-21	2022-08-15
19180	1722490	24813475	1	252434	2022-08-21	2022-08-15
19182	1724612	57767276	1	249900	2022-08-21	2022-08-15
19185	1722992	57749322	0	252434	2022-08-21	2022-08-15
19187	1724894	25515032	0	249900	2022-08-21	2022-08-15
19191	1725471	57779984	1	253620	2022-08-21	2022-08-15
19192	1725486	57782526	1	249900	2022-08-21	2022-08-15
19196	1725553	57784092	1	253620	2022-08-21	2022-08-15
19197	1725540	57779898	0	249900	2022-08-21	2022-08-15
19201	1726754	57793200	1	253620	2022-08-21	2022-08-15
19202	1725587	57779676	1	249900	2022-08-21	2022-08-15
19207	1725802	57760540	0	249900	2022-08-21	2022-08-15
19230	1723492	57761674	0	250766	2022-08-21	2022-08-15
19232	1727237	57798504	0	253295	2022-08-21	2022-08-15
17415	745227	22976967	0	249593	2022-08-21	2022-08-15
17420	1719960	57665564	1	253465	2022-08-21	2022-08-15
17425	1711749	25127563	0	249928	2022-08-21	2022-08-15
17430	1714396	57640194	1	249928	2022-08-21	2022-08-15
17436	1417494	25432262	0	252342	2022-08-21	2022-08-15
17441	1724323	57760648	1	252232	2022-08-21	2022-08-15
17442	1723539	57761490	1	252271	2022-08-21	2022-08-15
17470	1724512	57760022	1	249593	2022-08-21	2022-08-15
17472	1412713	25417768	0	250121	2022-08-21	2022-08-15
17475	1724764	57761416	1	249593	2022-08-21	2022-08-15
17477	1459897	25560092	0	250121	2022-08-21	2022-08-15
17489	1296503	24706227	0	253449	2022-08-21	2022-08-15
17495	1721639	25227013	0	250121	2022-08-21	2022-08-15
17500	1453027	25529686	0	249820	2022-08-21	2022-08-15
17505	1723420	57758830	1	250121	2022-08-21	2022-08-15
17510	1723446	57758874	1	250121	2022-08-21	2022-08-15
17516	655388	22377553	1	250382	2022-08-21	2022-08-15
17517	1722968	57728224	1	253449	2022-08-21	2022-08-15
17522	1723015	57728758	1	253449	2022-08-21	2022-08-15
17527	1723483	57759628	1	253449	2022-08-21	2022-08-15
17532	1724036	57739126	1	253449	2022-08-21	2022-08-15
17537	1724094	57754910	1	253449	2022-08-21	2022-08-15
17542	1724427	57755120	1	253449	2022-08-21	2022-08-15
17547	1730710		0	249820	2022-08-21	2022-08-15
17552	1724667		0	254597	2022-08-21	2022-08-15
17555	1414861	25425074	0	249616	2022-08-21	2022-08-15
17557	1724677		1	254597	2022-08-21	2022-08-15
17560	1415905	25427414	0	249616	2022-08-21	2022-08-15
17562	1724682		1	254597	2022-08-21	2022-08-15
17565	1436725	25482668	0	249616	2022-08-21	2022-08-15
17568	649820	22283179	0	249954	2022-08-21	2022-08-15
17570	1724177	57752676	1	253443	2022-08-21	2022-08-15
17573	767328	23016875	1	249954	2022-08-21	2022-08-15
17575	1724166	57759332	1	249616	2022-08-21	2022-08-15
17582	1266898	25097791	1	250983	2022-08-21	2022-08-15
17587	1284571	25123123	1	250983	2022-08-21	2022-08-15
17592	1426795	25012225	0	250983	2022-08-21	2022-08-15
17605	1717250	57647330	0	249954	2022-08-21	2022-08-15
17609	1438372	25485112	0	249581	2022-08-21	2022-08-15
17615	1438379	25488218	0	249581	2022-08-21	2022-08-15
17620	1452540	25542064	0	249581	2022-08-21	2022-08-15
17625	1457632		0	249581	2022-08-21	2022-08-15
17627	1725768	57786012	0	250273	2022-08-21	2022-08-15
17630	1711429	57599840	1	249581	2022-08-21	2022-08-15
17632	1726879	57794840	1	250273	2022-08-21	2022-08-15
17635	1711810	25920143	0	249581	2022-08-21	2022-08-15
17637	1728339	57806776	1	250273	2022-08-21	2022-08-15
17640	1722567	57627598	0	253428	2022-08-21	2022-08-15
17645	1722672	57732356	1	253428	2022-08-21	2022-08-15
17667	1729437	57805026	1	249581	2022-08-21	2022-08-15
17672	1729473	57803898	0	249581	2022-08-21	2022-08-15
17675	1116632	24939867	1	253615	2022-08-21	2022-08-15
17677	1439024	25489064	1	249990	2022-08-21	2022-08-15
17680	1415496	25426950	0	253615	2022-08-21	2022-08-15
17682	1466233	25573232	1	249990	2022-08-21	2022-08-15
17686	1721585	57729712	0	253792	2022-08-21	2022-08-15
17687	1723496	57760698	0	249990	2022-08-21	2022-08-15
17691	1721611	57732250	0	253792	2022-08-21	2022-08-15
17692	1726134	25041839	1	249990	2022-08-21	2022-08-15
17696	1457211	25555306	0	253615	2022-08-21	2022-08-15
17697	1726953	57792622	0	249990	2022-08-21	2022-08-15
17702	1717408	57581344	1	251589	2022-08-21	2022-08-15
17708	1719851	25069967	1	253511	2022-08-21	2022-08-15
17710	1723621	57759348	0	249823	2022-08-21	2022-08-15
17713	1723007	57750052	1	253792	2022-08-21	2022-08-15
17715	1723656	57762710	1	249823	2022-08-21	2022-08-15
17718	1723148	57751440	1	253792	2022-08-21	2022-08-15
17720	1724735	57758690	0	249823	2022-08-21	2022-08-15
17723	1723348	57760822	1	253792	2022-08-21	2022-08-15
17725	1725852	57786198	1	249823	2022-08-21	2022-08-15
17728	1719914	21725485	1	253511	2022-08-21	2022-08-15
17733	1724429	57762968	1	252612	2022-08-21	2022-08-15
17735	1729116	57805110	0	249823	2022-08-21	2022-08-15
17757	1724139	57759116	0	251134	2022-08-21	2022-08-15
17762	1728422	57804816	0	251134	2022-08-21	2022-08-15
17767	1730800		1	251134	2022-08-21	2022-08-15
17772	1727791	25579016	0	253369	2022-08-21	2022-08-15
17776	1717525	25157977	1	252579	2022-08-21	2022-08-15
17778	1730639	57822048	1	249763	2022-08-21	2022-08-15
17783	1291419	25131903	0	253347	2022-08-21	2022-08-15
17788	1729157	57808794	1	249613	2022-08-21	2022-08-15
17793	1729460	57809538	1	249613	2022-08-21	2022-08-15
17798	1730050		1	253347	2022-08-21	2022-08-15
17800	1725571	57779868	0	249610	2022-08-21	2022-08-15
17803	1721534	57731166	1	253452	2022-08-21	2022-08-15
17805	1725573	57784432	0	249610	2022-08-21	2022-08-15
17808	1722501	57736788	0	253452	2022-08-21	2022-08-15
17811	1723135	25518166	1	253487	2022-08-21	2022-08-15
17818	1726168	57788434	0	252673	2022-08-21	2022-08-15
17824	1725407	57763130	1	252572	2022-08-21	2022-08-15
19116	1724331	57755740	1	249966	2022-08-21	2022-08-15
19119	1713634	25544598	1	249550	2022-08-21	2022-08-15
19124	1713715	25577496	0	249550	2022-08-21	2022-08-15
19129	1725307	57781594	0	249550	2022-08-21	2022-08-15
19131	1451128	25528758	0	252434	2022-08-21	2022-08-15
19136	1467810	25593170	1	252434	2022-08-21	2022-08-15
19141	1716028	57655062	1	252434	2022-08-21	2022-08-15
17416	1451534	25524668	1	252232	2022-08-21	2022-08-15
17421	1463811	25216519	1	252232	2022-08-21	2022-08-15
17426	1721092	57731718	0	252232	2022-08-21	2022-08-15
17431	1723407	57760830	1	252232	2022-08-21	2022-08-15
17437	1716952	22423245	1	249593	2022-08-21	2022-08-15
17487	1726244	57782060	1	249593	2022-08-21	2022-08-15
17490	1441340	25496121	0	249820	2022-08-21	2022-08-15
17492	1426857	25456152	0	251813	2022-08-21	2022-08-15
17496	1449872	25525666	0	249820	2022-08-21	2022-08-15
17497	1715774	25545026	0	251813	2022-08-21	2022-08-15
17501	1723388	57756664	0	250121	2022-08-21	2022-08-15
17502	1720168		1	251813	2022-08-21	2022-08-15
17506	1465869	25573228	0	249820	2022-08-21	2022-08-15
17507	1728787	57804668	1	251813	2022-08-21	2022-08-15
17512	1722475	57733884	0	253449	2022-08-21	2022-08-15
17554	1717242	57665930	0	253443	2022-08-21	2022-08-15
17559	1723168	57749482	1	253443	2022-08-21	2022-08-15
17564	1723600	57759400	1	253443	2022-08-21	2022-08-15
17567	1724042	57759600	0	250382	2022-08-21	2022-08-15
17569	1723587	57758770	1	249616	2022-08-21	2022-08-15
17572	1724840	57771062	1	250382	2022-08-21	2022-08-15
17574	1724203	57630520	0	253443	2022-08-21	2022-08-15
17577	1020863	24420685	1	249954	2022-08-21	2022-08-15
17580	1724668	57767150	1	249616	2022-08-21	2022-08-15
17597	1724310	57761452	1	250983	2022-08-21	2022-08-15
17604	1316702	25190577	1	249581	2022-08-21	2022-08-15
17610	1725609	57783610	1	250983	2022-08-21	2022-08-15
17641	1714899	57672046	0	249893	2022-08-21	2022-08-15
17646	1728449	57792298	1	250273	2022-08-21	2022-08-15
17649	1724273	57762546	0	249581	2022-08-21	2022-08-15
17651	1728513	57807154	1	250273	2022-08-21	2022-08-15
17654	1435238	25477446	0	253934	2022-08-21	2022-08-15
17657	1717255	57660920	1	253792	2022-08-21	2022-08-15
17659	1466170	25581254	1	253934	2022-08-21	2022-08-15
17664	1466175	25588206	1	253934	2022-08-21	2022-08-15
17679	1721425	25211438	0	249897	2022-08-21	2022-08-15
17684	1723458	57761482	1	249897	2022-08-21	2022-08-15
17689	1723505	57760064	1	249897	2022-08-21	2022-08-15
17694	1723929	57762124	1	249897	2022-08-21	2022-08-15
17699	1722889	57677314	1	253792	2022-08-21	2022-08-15
17701	1730227	57810414	1	249990	2022-08-21	2022-08-15
17705	1723181	57752238	0	253615	2022-08-21	2022-08-15
17706	1720129	57627636	1	251589	2022-08-21	2022-08-15
17711	1724158	57760178	1	251589	2022-08-21	2022-08-15
17716	1727792	57802892	1	251589	2022-08-21	2022-08-15
17721	1728539	57802372	1	251589	2022-08-21	2022-08-15
17726	1729526	57807820	1	251589	2022-08-21	2022-08-15
17731	1723467	57758930	1	253792	2022-08-21	2022-08-15
17736	1724788	24905235	1	252612	2022-08-21	2022-08-15
17739	1730503	57811350	1	249823	2022-08-21	2022-08-15
17741	1725287	57781294	1	252612	2022-08-21	2022-08-15
17744	1717466	57669556	1	253494	2022-08-21	2022-08-15
17747	1409566	25409174	0	249763	2022-08-21	2022-08-15
17749	1718418	57677316	1	253494	2022-08-21	2022-08-15
17751	1723141	21705777	1	253511	2022-08-21	2022-08-15
17754	1719857	57682684	1	253494	2022-08-21	2022-08-15
17756	1466744	25589892	1	249763	2022-08-21	2022-08-15
17761	1713639	25917769	1	249763	2022-08-21	2022-08-15
17774	1726199	57766380	1	249763	2022-08-21	2022-08-15
17781	1720815	57728674	1	253452	2022-08-21	2022-08-15
17785	1720915	57728738	1	253452	2022-08-21	2022-08-15
17786	1426355	25458820	0	249610	2022-08-21	2022-08-15
17790	1717767	57665954	0	252579	2022-08-21	2022-08-15
17791	1428110	25460370	0	249610	2022-08-21	2022-08-15
17795	1717770	57658992	0	252579	2022-08-21	2022-08-15
17796	1451685	25523886	0	249610	2022-08-21	2022-08-15
17819	1727285	57792612	1	249610	2022-08-21	2022-08-15
19117	419158	16673315	0	252434	2022-08-21	2022-08-15
19120	1725470	57771290	0	252287	2022-08-21	2022-08-15
19122	689137		0	252434	2022-08-21	2022-08-15
19125	1725494	57776026	1	252287	2022-08-21	2022-08-15
19133	1725614	57783122	0	249550	2022-08-21	2022-08-15
19138	1725662	57777232	0	249550	2022-08-21	2022-08-15
19143	1725927	57770366	1	249550	2022-08-21	2022-08-15
19148	1726145	57788318	1	249550	2022-08-21	2022-08-15
19153	1723133	57677844	1	253433	2022-08-21	2022-08-15
19158	1723455	57759880	1	253433	2022-08-21	2022-08-15
19168	1723706	57681706	0	253433	2022-08-21	2022-08-15
19171	1713820	57626778	0	253620	2022-08-21	2022-08-15
19173	1715362	25505260	0	249900	2022-08-21	2022-08-15
19178	1724230	57755806	0	249900	2022-08-21	2022-08-15
19189	1718017	57651230	0	253295	2022-08-21	2022-08-15
19194	1724834	57637430	0	253295	2022-08-21	2022-08-15
19199	1724885	57771576	1	253295	2022-08-21	2022-08-15
19204	1724980	57774360	1	253295	2022-08-21	2022-08-15
19206	743747	23047667	0	250766	2022-08-21	2022-08-15
19209	1725595	24175143	1	252434	2022-08-21	2022-08-15
19214	1725613	57783138	1	253295	2022-08-21	2022-08-15
19219	1725667	57776686	1	253295	2022-08-21	2022-08-15
19224	1726729	57792888	0	253295	2022-08-21	2022-08-15
19234	1716647	25562453	0	250381	2022-08-21	2022-08-15
19239	1723364	57760106	1	250381	2022-08-21	2022-08-15
19249	1727391	57795210	0	250766	2022-08-21	2022-08-15
19251	651274		0	256031	2022-08-21	2022-08-15
19256	1717857	57669676	1	256031	2022-08-21	2022-08-15
19261	1721628	57735290	0	256031	2022-08-21	2022-08-15
19291	1032751	24321505	1	249904	2022-08-21	2022-08-15
17417	1071612	23251415	1	253465	2022-08-21	2022-08-15
17418	1050433	24335885	1	252636	2022-08-21	2022-08-15
17422	1437521	25485022	0	249593	2022-08-21	2022-08-15
17423	1725896	57786674	1	252636	2022-08-21	2022-08-15
17427	1459716	25563130	1	249593	2022-08-21	2022-08-15
17428	1727959		1	252636	2022-08-21	2022-08-15
17432	1716731	25075455	1	249593	2022-08-21	2022-08-15
17433	1720708	57682548	0	253465	2022-08-21	2022-08-15
17438	1720761	57730274	0	253465	2022-08-21	2022-08-15
17443	1720995	57730456	1	253465	2022-08-21	2022-08-15
17448	1721005	57730388	1	253465	2022-08-21	2022-08-15
17453	1721074	57729806	1	253465	2022-08-21	2022-08-15
17458	1721130	57728464	1	253465	2022-08-21	2022-08-15
17461	1728378	57805758	0	252271	2022-08-21	2022-08-15
17464	1727438	57798170	1	249928	2022-08-21	2022-08-15
17466	1728566	57792330	1	252271	2022-08-21	2022-08-15
17469	1728334	57805140	0	249928	2022-08-21	2022-08-15
17473	1721542	57734002	0	253465	2022-08-21	2022-08-15
17478	1723348	57760822	0	253465	2022-08-21	2022-08-15
17481	1730458	57813454	1	252271	2022-08-21	2022-08-15
17483	1723467	57758930	0	253465	2022-08-21	2022-08-15
17486	1715153	25082889	0	250121	2022-08-21	2022-08-15
17493	1720102	57642196	0	253449	2022-08-21	2022-08-15
17498	1720765	57729702	1	253449	2022-08-21	2022-08-15
17503	1721041	57731400	0	253449	2022-08-21	2022-08-15
17508	1721216	25529512	1	253449	2022-08-21	2022-08-15
17514	1435238	25477446	1	254597	2022-08-21	2022-08-15
17519	1024681	24620873	0	250382	2022-08-21	2022-08-15
17524	1047770		0	250382	2022-08-21	2022-08-15
17529	1315875	25185607	0	250382	2022-08-21	2022-08-15
17534	1437410	25480824	0	250382	2022-08-21	2022-08-15
17539	1467472	25577308	0	254597	2022-08-21	2022-08-15
17544	1722901	25259787	0	254597	2022-08-21	2022-08-15
17549	1712828	23628039	1	250382	2022-08-21	2022-08-15
17551	1728142	57805240	1	249968	2022-08-21	2022-08-15
17578	1724404	57752402	1	253443	2022-08-21	2022-08-15
17584	1463289	25575984	1	250273	2022-08-21	2022-08-15
17586	1462831	25534070	1	249954	2022-08-21	2022-08-15
17589	1715328	25521990	0	250273	2022-08-21	2022-08-15
17591	1719608	57696912	1	253428	2022-08-21	2022-08-15
17594	1715597	25553880	1	250273	2022-08-21	2022-08-15
17599	1723637	57759918	1	250273	2022-08-21	2022-08-15
17602	1725012	57776006	1	250983	2022-08-21	2022-08-15
17614	1726198	57767038	0	250983	2022-08-21	2022-08-15
17619	1726213	57759908	1	250983	2022-08-21	2022-08-15
17624	1726276	57789120	1	250983	2022-08-21	2022-08-15
17629	1726821	57789126	1	250983	2022-08-21	2022-08-15
17634	1728223	57805650	1	250983	2022-08-21	2022-08-15
17639	1723630	57760526	1	249581	2022-08-21	2022-08-15
17642	1728400	57803016	0	250273	2022-08-21	2022-08-15
17644	1724227	57764098	0	249581	2022-08-21	2022-08-15
17647	1437724	25478000	0	249897	2022-08-21	2022-08-15
17650	1724691	57768188	1	253428	2022-08-21	2022-08-15
17652	1714988	25534758	0	249897	2022-08-21	2022-08-15
17662	1719498	57699814	1	253792	2022-08-21	2022-08-15
17674	1717902		1	249897	2022-08-21	2022-08-15
17685	1415895	25428072	1	253615	2022-08-21	2022-08-15
17690	1455334	25549456	0	253615	2022-08-21	2022-08-15
17695	1722852	57698534	0	253792	2022-08-21	2022-08-15
17700	1721107	57731838	0	253615	2022-08-21	2022-08-15
17707	1723004	57698672	1	253792	2022-08-21	2022-08-15
17709	1717243	25408236	1	252612	2022-08-21	2022-08-15
17712	1719874	25314648	0	253511	2022-08-21	2022-08-15
17714	1718847	25516262	0	252612	2022-08-21	2022-08-15
17717	1719887	21912313	1	253511	2022-08-21	2022-08-15
17719	1720804	24773355	0	252612	2022-08-21	2022-08-15
17722	1719892	22114307	1	253511	2022-08-21	2022-08-15
17724	1722615	25442746	1	252612	2022-08-21	2022-08-15
17727	1723405	57753556	0	253792	2022-08-21	2022-08-15
17732	1721038	25035731	0	253511	2022-08-21	2022-08-15
17734	648762	21586693	0	251134	2022-08-21	2022-08-15
17737	1721044	25188445	1	253511	2022-08-21	2022-08-15
17740	740962	23020277	1	253494	2022-08-21	2022-08-15
17742	1721075	24789431	1	253511	2022-08-21	2022-08-15
17752	1462165	25508166	0	249763	2022-08-21	2022-08-15
17760	1728540	57804992	1	252612	2022-08-21	2022-08-15
17775	1714956	57644800	0	253452	2022-08-21	2022-08-15
17780	1717625	25201201	1	252579	2022-08-21	2022-08-15
17797	1717836	25208371	1	252579	2022-08-21	2022-08-15
17802	1718070	25482638	1	252579	2022-08-21	2022-08-15
17807	1728664	57791128	1	252579	2022-08-21	2022-08-15
17810	1724205	57760378	0	252673	2022-08-21	2022-08-15
17812	1729905	57791648	1	252579	2022-08-21	2022-08-15
17815	1725387	57779674	0	252673	2022-08-21	2022-08-15
17817	1722861	57610990	1	253452	2022-08-21	2022-08-15
17821	1725603	57767850	0	253487	2022-08-21	2022-08-15
17822	1722877	57576852	1	253452	2022-08-21	2022-08-15
19118	1716979	57664648	1	253433	2022-08-21	2022-08-15
19121	1726544	57793098	1	249966	2022-08-21	2022-08-15
19123	1719312	57658104	0	253433	2022-08-21	2022-08-15
19126	1728136	57802206	0	249966	2022-08-21	2022-08-15
19128	1722729	57739150	1	253433	2022-08-21	2022-08-15
19134	1722773	57733122	0	253433	2022-08-21	2022-08-15
19139	1723028	57749920	1	253433	2022-08-21	2022-08-15
19144	1723053	57732842	1	253433	2022-08-21	2022-08-15
19154	1727618	57801352	0	249550	2022-08-21	2022-08-15
19156	1718066	25218113	1	252434	2022-08-21	2022-08-15
17827	1722918	57640096	1	253452	2022-08-21	2022-08-15
17835	1693210	25842683	1	253444	2022-08-21	2022-08-15
17838	1728387	57805106	1	252572	2022-08-21	2022-08-15
17840	1696706	24844503	0	253444	2022-08-21	2022-08-15
17842	439218	18000243	1	252667	2022-08-21	2022-08-15
17848	1718248	57672064	0	249591	2022-08-21	2022-08-15
17853	1724172	24212269	0	249591	2022-08-21	2022-08-15
17855	780807	23470909	0	253614	2022-08-21	2022-08-15
17858	1728298	57790860	1	249591	2022-08-21	2022-08-15
17860	1067932	24885885	0	253614	2022-08-21	2022-08-15
17863	1729136	57807830	0	249591	2022-08-21	2022-08-15
17865	1142595	24966855	0	253614	2022-08-21	2022-08-15
17868	1729204	57807486	1	249591	2022-08-21	2022-08-15
17870	1726150	57782434	1	252667	2022-08-21	2022-08-15
17873	1721142	57730030	1	253444	2022-08-21	2022-08-15
17875	1717341	57667758	0	252525	2022-08-21	2022-08-15
17880	1719229	25427450	0	252525	2022-08-21	2022-08-15
17885	1723061	57750880	0	252525	2022-08-21	2022-08-15
17890	1723070	25283311	0	252525	2022-08-21	2022-08-15
17895	1723685	57759142	0	252525	2022-08-21	2022-08-15
17901	1364833	25145309	1	253599	2022-08-21	2022-08-15
17903	1714369	57641884	0	253429	2022-08-21	2022-08-15
17906	1711244	24807787	1	253599	2022-08-21	2022-08-15
17908	1717200	57659004	1	253429	2022-08-21	2022-08-15
17911	1711259	23852289	1	253599	2022-08-21	2022-08-15
17913	1717483	57669842	1	253429	2022-08-21	2022-08-15
17916	1712674	25209457	0	253599	2022-08-21	2022-08-15
17918	1719498	57699814	0	253429	2022-08-21	2022-08-15
17921	1725552	57778912	1	253599	2022-08-21	2022-08-15
17923	1719666	57701084	1	253429	2022-08-21	2022-08-15
17926	1726406	57777980	0	253599	2022-08-21	2022-08-15
17928	1719933	57713312	0	253429	2022-08-21	2022-08-15
17941	1728427	57805406	1	252272	2022-08-21	2022-08-15
17946	1720715	57728522	1	253429	2022-08-21	2022-08-15
17948	652609	22086637	1	252170	2022-08-21	2022-08-15
17951	1728165	57804032	1	253586	2022-08-21	2022-08-15
17956	1729967	57811818	0	253586	2022-08-21	2022-08-15
17959	1725599	57780510	0	252153	2022-08-21	2022-08-15
17971	1317287	25188197	0	252170	2022-08-21	2022-08-15
17976	1728406	57804782	0	252153	2022-08-21	2022-08-15
17978	1716877	57646814	0	253283	2022-08-21	2022-08-15
17994	1724769	57765464	0	252170	2022-08-21	2022-08-15
18000	1466158	25581972	1	253178	2022-08-21	2022-08-15
18004	1719849	57704474	0	253178	2022-08-21	2022-08-15
18009	1718180	23615491	1	251446	2022-08-21	2022-08-15
18023	1717303	57667272	0	251193	2022-08-21	2022-08-15
18030	1723467	57758930	0	253793	2022-08-21	2022-08-15
18033	1724633	57766886	1	252643	2022-08-21	2022-08-15
18038	1727502	57770336	1	251193	2022-08-21	2022-08-15
18040	1730849	57810446	1	253178	2022-08-21	2022-08-15
18045	1718674	57678474	1	253430	2022-08-21	2022-08-15
18050	1726183	57779992	0	252643	2022-08-21	2022-08-15
18055	1726207	57779970	1	252643	2022-08-21	2022-08-15
18060	1727259	57778640	1	252643	2022-08-21	2022-08-15
18065	1727769	57802198	0	252643	2022-08-21	2022-08-15
18070	1723018	57750306	1	253430	2022-08-21	2022-08-15
18075	1723067	57750918	1	253430	2022-08-21	2022-08-15
18078	1730018		0	252643	2022-08-21	2022-08-15
18080	1723081	57751016	1	253430	2022-08-21	2022-08-15
18083	1724549	57767216	1	250768	2022-08-21	2022-08-15
18086	1724341		1	250765	2022-08-21	2022-08-15
18096	1725211	57780820	1	250765	2022-08-21	2022-08-15
18101	1725280	57779934	0	250765	2022-08-21	2022-08-15
18103	1729686		0	252630	2022-08-21	2022-08-15
18106	1725534	57783964	1	250765	2022-08-21	2022-08-15
18110	1030577	24707453	0	252603	2022-08-21	2022-08-15
18113	1727307	57791140	1	250765	2022-08-21	2022-08-15
18115	1719113	25218991	0	253612	2022-08-21	2022-08-15
18118	1464801	25580374	1	250201	2022-08-21	2022-08-15
18120	1719971	57714068	0	252969	2022-08-21	2022-08-15
18125	1305541	25157479	0	249619	2022-08-21	2022-08-15
18128	1320749	25204567	0	252603	2022-08-21	2022-08-15
18130	1432890	25471700	0	249619	2022-08-21	2022-08-15
18133	1411570	25415534	0	252603	2022-08-21	2022-08-15
18135	1720215	25521484	0	249619	2022-08-21	2022-08-15
18138	1426483	25458076	0	252603	2022-08-21	2022-08-15
18140	1724421	57766700	1	252969	2022-08-21	2022-08-15
18145	1724557	57760042	0	252969	2022-08-21	2022-08-15
18150	1724627	57756656	1	252969	2022-08-21	2022-08-15
18155	1378302	25189275	1	249901	2022-08-21	2022-08-15
18158	1724710	57732724	1	252969	2022-08-21	2022-08-15
18160	1466667	25581158	0	249901	2022-08-21	2022-08-15
18163	1457630	25555256	0	250172	2022-08-21	2022-08-15
18180	1724941	57759166	1	252603	2022-08-21	2022-08-15
18195	1725341	57781430	0	249549	2022-08-21	2022-08-15
18206	1727606	57797870	1	249549	2022-08-21	2022-08-15
18212	1724201	24156873	1	254800	2022-08-21	2022-08-15
18217	1724228	23083377	1	254800	2022-08-21	2022-08-15
18220	773987	23070785	1	252343	2022-08-21	2022-08-15
18247	1725989	57787086	1	252343	2022-08-21	2022-08-15
19142	1723383	57761356	1	249957	2022-08-21	2022-08-15
19145	1731112	57820028	1	252287	2022-08-21	2022-08-15
19147	1723727	57762110	1	249957	2022-08-21	2022-08-15
19150	1731114	57819996	1	252287	2022-08-21	2022-08-15
19152	1725334	57782812	1	249957	2022-08-21	2022-08-15
19155	1731198	57819950	1	252287	2022-08-21	2022-08-15
19157	1728297	57805602	1	249957	2022-08-21	2022-08-15
17828	1727744	57623976	0	252673	2022-08-21	2022-08-15
17830	1726241	25409708	1	253487	2022-08-21	2022-08-15
17833	1726874	57793142	1	252572	2022-08-21	2022-08-15
17843	1302870	25152581	0	249591	2022-08-21	2022-08-15
17847	761192	23158969	1	252667	2022-08-21	2022-08-15
17852	769814	23282057	1	252667	2022-08-21	2022-08-15
17862	1463897	25556066	0	252525	2022-08-21	2022-08-15
17867	1690064	25549634	1	252525	2022-08-21	2022-08-15
17872	1717336	25146761	0	252525	2022-08-21	2022-08-15
17878	522976	21663703	0	252640	2022-08-21	2022-08-15
17883	1722681	57676864	1	253444	2022-08-21	2022-08-15
17900	1719846	25584712	0	252966	2022-08-21	2022-08-15
17902	1717994	25263663	1	252272	2022-08-21	2022-08-15
17905	1721157	25457432	1	252966	2022-08-21	2022-08-15
17907	1718565	25434850	1	252272	2022-08-21	2022-08-15
17910	1723096	25445704	0	252966	2022-08-21	2022-08-15
17912	1723472	57758698	1	252272	2022-08-21	2022-08-15
17915	1725784	57772610	1	252966	2022-08-21	2022-08-15
17917	1723814	57759426	0	252272	2022-08-21	2022-08-15
17920	1726022	57760608	0	252966	2022-08-21	2022-08-15
17922	1724882	57770528	0	252272	2022-08-21	2022-08-15
17925	1726079	57760338	0	252966	2022-08-21	2022-08-15
17927	1725473	57780294	1	252272	2022-08-21	2022-08-15
17930	1726338	57786850	0	252966	2022-08-21	2022-08-15
17933	1719949	57674308	1	253429	2022-08-21	2022-08-15
17935	1730886	57813732	0	252966	2022-08-21	2022-08-15
17938	1719952	57675848	1	253429	2022-08-21	2022-08-15
17940	1457234	25554438	0	251148	2022-08-21	2022-08-15
17945	1720081	57681784	1	251148	2022-08-21	2022-08-15
17952	1314889	25181391	0	250968	2022-08-21	2022-08-15
17957	1054350	24856751	0	252170	2022-08-21	2022-08-15
17963	1727243	57793672	0	252153	2022-08-21	2022-08-15
17968	1728331	57797454	1	252153	2022-08-21	2022-08-15
17973	1723747	57759778	0	250968	2022-08-21	2022-08-15
17980	1717274	25211110	1	252170	2022-08-21	2022-08-15
17982	1718017	57651230	0	253283	2022-08-21	2022-08-15
17985	1720052	25534970	1	252170	2022-08-21	2022-08-15
17987	1723093	57751020	1	253283	2022-08-21	2022-08-15
17992	1723252	57759848	1	253283	2022-08-21	2022-08-15
17998	1729963	57812512	1	252684	2022-08-21	2022-08-15
18003	1714723	57643188	1	251446	2022-08-21	2022-08-15
18013	1720300	57726956	0	253178	2022-08-21	2022-08-15
18015	1439969	25142075	1	252643	2022-08-21	2022-08-15
18018	1725311	57782904	1	253178	2022-08-21	2022-08-15
18020	1459817	25521010	0	252643	2022-08-21	2022-08-15
18025	1723348	57760822	0	253793	2022-08-21	2022-08-15
18032	1724801	57768034	1	251193	2022-08-21	2022-08-15
18035	1030452	24716609	1	251157	2022-08-21	2022-08-15
18037	1725400	57778402	0	252643	2022-08-21	2022-08-15
18043	1728832	57804780	0	251193	2022-08-21	2022-08-15
18052	1723559	57758720	1	253042	2022-08-21	2022-08-15
18057	1723598	57758978	0	253042	2022-08-21	2022-08-15
18062	1723624	57762690	0	253042	2022-08-21	2022-08-15
18084	1723134	57751340	1	253430	2022-08-21	2022-08-15
18090	540168	21839401	0	252969	2022-08-21	2022-08-15
18095	1122329	24877229	0	252969	2022-08-21	2022-08-15
18100	1723360	57753554	0	253430	2022-08-21	2022-08-15
18109	1726103	57787838	1	250765	2022-08-21	2022-08-15
18111	1727109	57791598	1	250768	2022-08-21	2022-08-15
18116	1719957	25273207	1	252969	2022-08-21	2022-08-15
18119	1189575	25006219	0	252603	2022-08-21	2022-08-15
18122	1727766	57801704	1	250765	2022-08-21	2022-08-15
18124	1254736	25080255	0	252603	2022-08-21	2022-08-15
18141	1727290	57795274	0	250201	2022-08-21	2022-08-15
18144	1713818	57609912	0	249943	2022-08-21	2022-08-15
18146	1715820	24757803	0	249618	2022-08-21	2022-08-15
18149	1724384	57766240	0	249943	2022-08-21	2022-08-15
18151	1718566	25323084	0	249618	2022-08-21	2022-08-15
18154	1724639	57768146	1	252969	2022-08-21	2022-08-15
18156	1718981	25293408	1	252603	2022-08-21	2022-08-15
18161	1719031	25407252	0	252603	2022-08-21	2022-08-15
18166	1719112	25554760	1	252603	2022-08-21	2022-08-15
18169	1723702	57761172	1	249901	2022-08-21	2022-08-15
18171	1723159	57739106	1	252603	2022-08-21	2022-08-15
18174	1720157		1	251814	2022-08-21	2022-08-15
18176	1724500	57759960	0	252603	2022-08-21	2022-08-15
18179	1720966	57634682	1	253719	2022-08-21	2022-08-15
18181	1315884	25184337	0	249549	2022-08-21	2022-08-15
18184	1722410	57673662	1	253719	2022-08-21	2022-08-15
18186	1319339	25198963	0	249549	2022-08-21	2022-08-15
18189	1722964	57749762	0	253719	2022-08-21	2022-08-15
18191	1714824	23978655	0	249549	2022-08-21	2022-08-15
18194	1724904	57770784	1	253719	2022-08-21	2022-08-15
18197	1724196	57760818	0	252561	2022-08-21	2022-08-15
18199	1725788	57761834	0	253719	2022-08-21	2022-08-15
18202	1725635	57776096	0	250172	2022-08-21	2022-08-15
18204	1714925	24931123	0	251687	2022-08-21	2022-08-15
18209	1714947	25552120	0	251687	2022-08-21	2022-08-15
18214	1726718	57780414	0	250172	2022-08-21	2022-08-15
18216	772534	23297611	0	252343	2022-08-21	2022-08-15
18219	1445426	25509654	1	253490	2022-08-21	2022-08-15
18221	1409058	25407018	0	250720	2022-08-21	2022-08-15
18224	1711822	25559348	1	253490	2022-08-21	2022-08-15
18226	1417494	25432262	0	250720	2022-08-21	2022-08-15
18229	1723102	25190045	0	253490	2022-08-21	2022-08-15
18232	1426826	25459560	0	249945	2022-08-21	2022-08-15
18234	1724526	57759294	1	253490	2022-08-21	2022-08-15
17829	1726764	57792976	1	252572	2022-08-21	2022-08-15
17844	1729629	57793482	1	253487	2022-08-21	2022-08-15
17849	1730423		1	253487	2022-08-21	2022-08-15
17856	1216760	24855831	1	252667	2022-08-21	2022-08-15
17861	1312307	25085643	0	252667	2022-08-21	2022-08-15
17864	1721027	57730374	0	253444	2022-08-21	2022-08-15
17866	1416495	24803943	0	252667	2022-08-21	2022-08-15
17869	1721046	57729816	0	253444	2022-08-21	2022-08-15
17871	1275207	25108639	0	253614	2022-08-21	2022-08-15
17876	1419867	25433116	1	252966	2022-08-21	2022-08-15
17881	1445423	25418632	0	252966	2022-08-21	2022-08-15
17886	1718977	25446244	0	252966	2022-08-21	2022-08-15
17888	1723178	25585024	0	253614	2022-08-21	2022-08-15
17891	1719038	25448466	1	252966	2022-08-21	2022-08-15
17893	1725559	25547548	0	253614	2022-08-21	2022-08-15
17896	1719689	25915359	1	252966	2022-08-21	2022-08-15
17898	1716714	25475148	1	252272	2022-08-21	2022-08-15
17950	1720786	57730454	1	253429	2022-08-21	2022-08-15
17953	1053482	24831577	1	252170	2022-08-21	2022-08-15
17955	1721030	57730358	1	253429	2022-08-21	2022-08-15
17958	1723527	57761864	0	250968	2022-08-21	2022-08-15
17960	1721088	57731660	0	253429	2022-08-21	2022-08-15
17965	1721111	57731630	1	253429	2022-08-21	2022-08-15
17970	1721540	57729326	1	253429	2022-08-21	2022-08-15
17975	1323491	25214219	0	252170	2022-08-21	2022-08-15
17983	540166	21839409	1	251446	2022-08-21	2022-08-15
17988	1022860	24484037	0	251446	2022-08-21	2022-08-15
17993	1030564	23138873	1	251446	2022-08-21	2022-08-15
17999	1128997	24803227	1	251446	2022-08-21	2022-08-15
18005	1037825	22049171	0	252643	2022-08-21	2022-08-15
18008	1719866	57712654	0	253178	2022-08-21	2022-08-15
18010	1424701	25431988	1	252643	2022-08-21	2022-08-15
18028	1719935		1	251193	2022-08-21	2022-08-15
18041	1718532	57677750	0	253430	2022-08-21	2022-08-15
18046	1725424	57779252	1	252643	2022-08-21	2022-08-15
18048	621028		0	253042	2022-08-21	2022-08-15
18051	1722864	57698338	0	253430	2022-08-21	2022-08-15
18053	1727170	57786872	0	251157	2022-08-21	2022-08-15
18056	1722889	57677314	0	253430	2022-08-21	2022-08-15
18058	1727608	57795204	0	251157	2022-08-21	2022-08-15
18061	1722895	57728938	0	253430	2022-08-21	2022-08-15
18063	1719699	25213274	0	250768	2022-08-21	2022-08-15
18066	1722955	57668828	1	253430	2022-08-21	2022-08-15
18068	1723569	57759280	1	250768	2022-08-21	2022-08-15
18073	1724320	57764416	1	250768	2022-08-21	2022-08-15
18076	1721025	25570604	0	250765	2022-08-21	2022-08-15
18079	1724395	57763036	1	250768	2022-08-21	2022-08-15
18081	1723367	57760580	1	250765	2022-08-21	2022-08-15
18088	1724161	57762186	1	252630	2022-08-21	2022-08-15
18093	1726966	57793130	1	252630	2022-08-21	2022-08-15
18098	1727797	57798482	1	252630	2022-08-21	2022-08-15
18108	1719881	24994459	1	252969	2022-08-21	2022-08-15
18121	339103	8515155	1	249619	2022-08-21	2022-08-15
18123	1724257	57763214	0	250201	2022-08-21	2022-08-15
18126	1720046	25283919	0	252969	2022-08-21	2022-08-15
18131	1724110	57759250	1	252969	2022-08-21	2022-08-15
18136	1724414	57759744	1	252969	2022-08-21	2022-08-15
18148	1682627	25548328	0	252603	2022-08-21	2022-08-15
18153	1440783	25494031	0	250172	2022-08-21	2022-08-15
18159	1456906	25554802	0	250172	2022-08-21	2022-08-15
18168	1369863	25286870	1	253719	2022-08-21	2022-08-15
18173	1725380	57780470	1	249901	2022-08-21	2022-08-15
18178	1727394	25860293	1	251814	2022-08-21	2022-08-15
18183	1728658	57790092	0	251814	2022-08-21	2022-08-15
18188	1728734	57803970	1	251814	2022-08-21	2022-08-15
18193	1729299	57790468	1	251814	2022-08-21	2022-08-15
18196	1725634	57785038	0	250172	2022-08-21	2022-08-15
18198	1731250	57822888	1	251814	2022-08-21	2022-08-15
18201	1727263	57792814	0	249549	2022-08-21	2022-08-15
18203	1726871	57792876	0	252561	2022-08-21	2022-08-15
18208	1727816	57802034	1	252561	2022-08-21	2022-08-15
18213	1724492	24830861	0	251687	2022-08-21	2022-08-15
18218	1727306	57798308	0	250172	2022-08-21	2022-08-15
18223	1727310	57798924	0	250172	2022-08-21	2022-08-15
18228	1255198	25081399	1	252343	2022-08-21	2022-08-15
18231	1434881	25478740	1	250720	2022-08-21	2022-08-15
18233	1723049	25544332	1	252343	2022-08-21	2022-08-15
18236	1726319	25216849	1	254800	2022-08-21	2022-08-15
18238	1725244	57778504	1	252343	2022-08-21	2022-08-15
18241	1723465	57761462	1	250720	2022-08-21	2022-08-15
18243	1725284	57782618	0	252343	2022-08-21	2022-08-15
18246	1723535	57762240	1	250720	2022-08-21	2022-08-15
18254	1727364	57788922	0	253490	2022-08-21	2022-08-15
19146	1717059	25505728	0	252434	2022-08-21	2022-08-15
19149	1723123	57751394	1	253433	2022-08-21	2022-08-15
19151	1717293	57667104	1	252434	2022-08-21	2022-08-15
19159	1727742	57801862	1	249550	2022-08-21	2022-08-15
19163	1727757	57797842	1	249550	2022-08-21	2022-08-15
19170	1721558		1	252434	2022-08-21	2022-08-15
19176	1722478		0	252434	2022-08-21	2022-08-15
19181	1723425	57756172	0	253620	2022-08-21	2022-08-15
19183	1713731	57634606	0	253295	2022-08-21	2022-08-15
19186	1723506	57758836	0	253620	2022-08-21	2022-08-15
19188	1723550	57758810	1	252529	2022-08-21	2022-08-15
19193	1726385	57773444	1	252529	2022-08-21	2022-08-15
19198	1729849	57812030	1	252529	2022-08-21	2022-08-15
19203	1725526	57779670	0	252434	2022-08-21	2022-08-15
17831	1414005	25423390	0	249562	2022-08-21	2022-08-15
17836	1713605	25504664	0	249562	2022-08-21	2022-08-15
17841	1728722	57774508	0	252572	2022-08-21	2022-08-15
17846	1728860	57807806	0	252572	2022-08-21	2022-08-15
17851	1729255	25555308	0	252572	2022-08-21	2022-08-15
17854	1720787	57662406	1	253444	2022-08-21	2022-08-15
17859	1720994	57731032	1	253444	2022-08-21	2022-08-15
17882	1109338	24943297	0	252640	2022-08-21	2022-08-15
17887	1722847	57627438	1	253444	2022-08-21	2022-08-15
17889	1421962	25442810	0	252272	2022-08-21	2022-08-15
17892	1722931	57749288	1	253444	2022-08-21	2022-08-15
17894	1430463	25467452	1	252272	2022-08-21	2022-08-15
17897	1723057	57731010	0	253444	2022-08-21	2022-08-15
17931	1727561	57792296	1	252272	2022-08-21	2022-08-15
17936	1727892	57799336	1	252272	2022-08-21	2022-08-15
17942	1724517	57766364	1	253586	2022-08-21	2022-08-15
17947	1724983	57774156	1	253586	2022-08-21	2022-08-15
17954	1724522	57763234	1	252153	2022-08-21	2022-08-15
17962	1723675	57761836	0	250968	2022-08-21	2022-08-15
17967	1723724	57760068	0	250968	2022-08-21	2022-08-15
17969	1037888	24757215	0	253028	2022-08-21	2022-08-15
17972	1728396	57804666	1	252153	2022-08-21	2022-08-15
17974	1049936	24839317	1	253028	2022-08-21	2022-08-15
17977	1724569	57766790	1	250968	2022-08-21	2022-08-15
17979	1720433	25228301	1	252684	2022-08-21	2022-08-15
17984	1724679	57767258	1	252684	2022-08-21	2022-08-15
17990	1721538	57735742	1	252170	2022-08-21	2022-08-15
17997	1726175	57788582	1	252170	2022-08-21	2022-08-15
18002	1724194	57765258	1	253283	2022-08-21	2022-08-15
18007	1724212	57762376	1	253283	2022-08-21	2022-08-15
18012	1724861	24742853	0	251446	2022-08-21	2022-08-15
18014	1717298	25283395	0	251193	2022-08-21	2022-08-15
18017	1725629	57784458	0	251446	2022-08-21	2022-08-15
18019	1717301	57667248	0	251193	2022-08-21	2022-08-15
18022	1726257	57787572	1	253178	2022-08-21	2022-08-15
18027	1729131	57807674	1	251446	2022-08-21	2022-08-15
18034	1723554	57757432	0	253793	2022-08-21	2022-08-15
18039	1231099	24971691	0	251157	2022-08-21	2022-08-15
18042	1725410	57759680	0	252643	2022-08-21	2022-08-15
18044	1716651	57658510	0	251157	2022-08-21	2022-08-15
18049	1723126	25857491	1	251157	2022-08-21	2022-08-15
18067	1723669	57761842	1	253042	2022-08-21	2022-08-15
18072	1725370	57778408	0	253042	2022-08-21	2022-08-15
18077	1726262	57760194	0	253042	2022-08-21	2022-08-15
18082	1730382	57811324	0	253042	2022-08-21	2022-08-15
18085	1724106	57764702	0	252630	2022-08-21	2022-08-15
18087	1725299	57779770	0	250768	2022-08-21	2022-08-15
18091	1724447	57762006	1	250765	2022-08-21	2022-08-15
18092	1725567	57776594	1	250768	2022-08-21	2022-08-15
18097	1725782	57759006	0	250768	2022-08-21	2022-08-15
18102	1725873	57785744	1	250768	2022-08-21	2022-08-15
18105	1723443	57759644	1	253430	2022-08-21	2022-08-15
18107	1726901	25474222	1	250768	2022-08-21	2022-08-15
18112	1719925	25208949	1	252969	2022-08-21	2022-08-15
18127	1725354	57780444	1	250201	2022-08-21	2022-08-15
18132	1725612	57780206	1	250201	2022-08-21	2022-08-15
18137	1726135	57780406	0	250201	2022-08-21	2022-08-15
18143	1437518	25485012	0	252603	2022-08-21	2022-08-15
18152	1718863	25287452	0	252603	2022-08-21	2022-08-15
18165	1719849	57704474	0	251814	2022-08-21	2022-08-15
18167	1458360	25557990	0	250172	2022-08-21	2022-08-15
18172	1458924	25555302	0	250172	2022-08-21	2022-08-15
18177	1466559	25578438	0	250172	2022-08-21	2022-08-15
18185	1730153	57812866	1	252603	2022-08-21	2022-08-15
18190	1731083		1	252603	2022-08-21	2022-08-15
18200	1725267	57781164	1	252561	2022-08-21	2022-08-15
18207	1725941	57781064	0	250172	2022-08-21	2022-08-15
18211	1318465	25195493	0	253490	2022-08-21	2022-08-15
18230	1726242	25018637	1	254800	2022-08-21	2022-08-15
18235	1720770	25915791	1	250720	2022-08-21	2022-08-15
18240	1727112	24999941	1	254800	2022-08-21	2022-08-15
18245	1727716	24706803	0	254800	2022-08-21	2022-08-15
18248	1432611		0	249817	2022-08-21	2022-08-15
18250	1723649	57762668	1	250720	2022-08-21	2022-08-15
18253	1430307	25466784	1	253509	2022-08-21	2022-08-15
18255	1724159	57764624	0	250720	2022-08-21	2022-08-15
19160	1731593	57819916	1	252287	2022-08-21	2022-08-15
19162	1728381	57806810	1	249957	2022-08-21	2022-08-15
19165	1731666	57819978	1	252287	2022-08-21	2022-08-15
19167	1728511	57804246	0	249957	2022-08-21	2022-08-15
19184	1723034	25242343	0	252529	2022-08-21	2022-08-15
19195	1724626	57767484	1	252434	2022-08-21	2022-08-15
19200	1724629	57768076	1	252434	2022-08-21	2022-08-15
19208	1725429	57778228	1	253295	2022-08-21	2022-08-15
19211	1460001	25555554	1	250926	2022-08-21	2022-08-15
19213	1726968	57797452	0	252434	2022-08-21	2022-08-15
19216	1714853	25524190	0	250926	2022-08-21	2022-08-15
19218	1727207	57798080	1	252434	2022-08-21	2022-08-15
19221	1715658	25558784	0	250926	2022-08-21	2022-08-15
19223	1731199		1	252434	2022-08-21	2022-08-15
19226	1715784	25558854	0	250926	2022-08-21	2022-08-15
19228	1727208	57778664	1	253295	2022-08-21	2022-08-15
19233	1085299	24905183	0	249819	2022-08-21	2022-08-15
19238	1419865	25437016	0	249819	2022-08-21	2022-08-15
19244	1727369	57795132	0	250766	2022-08-21	2022-08-15
19248	1723438	57761342	0	250381	2022-08-21	2022-08-15
19253	1724829	57770228	1	250381	2022-08-21	2022-08-15
17832	1728514	57805818	0	252673	2022-08-21	2022-08-15
17834	1726258	57779734	0	253487	2022-08-21	2022-08-15
17837	1728743	57763178	0	252673	2022-08-21	2022-08-15
17839	1726437	57790614	1	253487	2022-08-21	2022-08-15
17845	1717356	57609258	1	253444	2022-08-21	2022-08-15
17850	1717449	57669460	1	253444	2022-08-21	2022-08-15
17857	1338342	25212924	1	252525	2022-08-21	2022-08-15
17874	1721097		0	253614	2022-08-21	2022-08-15
17877	1721443	57731928	1	253444	2022-08-21	2022-08-15
17879	1722653	57746066	1	253614	2022-08-21	2022-08-15
17884	1722957	25530918	1	253614	2022-08-21	2022-08-15
17899	1724048	57759218	1	252525	2022-08-21	2022-08-15
17904	1724142	57759308	1	252525	2022-08-21	2022-08-15
17909	1724539	57760036	1	252525	2022-08-21	2022-08-15
17914	1725515	57775496	1	252525	2022-08-21	2022-08-15
17919	1725590	57783858	1	252525	2022-08-21	2022-08-15
17924	1725899	57786558	0	252525	2022-08-21	2022-08-15
17929	1726204	57788608	1	252525	2022-08-21	2022-08-15
17932	1055242	24862451	0	253586	2022-08-21	2022-08-15
17934	1726365	57780842	1	252525	2022-08-21	2022-08-15
17937	1720430	17104413	1	253586	2022-08-21	2022-08-15
17939	1461570	25411886	1	252153	2022-08-21	2022-08-15
17943	1720448	57727664	1	253429	2022-08-21	2022-08-15
17944	1723816	57760102	1	252153	2022-08-21	2022-08-15
17949	1724463	57765096	1	252153	2022-08-21	2022-08-15
17961	1274923	25108551	1	252170	2022-08-21	2022-08-15
17964	734004	22946653	0	253028	2022-08-21	2022-08-15
17966	1316836	25188375	0	252170	2022-08-21	2022-08-15
17981	1725547	57784070	0	250968	2022-08-21	2022-08-15
17986	1726878	57792674	1	250968	2022-08-21	2022-08-15
17989	1726853	57792838	1	252684	2022-08-21	2022-08-15
17991	1731436		0	250968	2022-08-21	2022-08-15
17995	1729294	57808926	1	252684	2022-08-21	2022-08-15
17996	1723668	57754916	1	253283	2022-08-21	2022-08-15
18001	1727348	57761702	1	252170	2022-08-21	2022-08-15
18006	1727817	57801070	1	252170	2022-08-21	2022-08-15
18011	1724473	57766658	1	253283	2022-08-21	2022-08-15
18016	1724494	57759700	1	253283	2022-08-21	2022-08-15
18021	1727179	57793506	0	251446	2022-08-21	2022-08-15
18024	1711662	57602104	0	252643	2022-08-21	2022-08-15
18026	1729139	57807768	1	253178	2022-08-21	2022-08-15
18029	1718762	57680880	1	252643	2022-08-21	2022-08-15
18031	1730422	57813370	1	253178	2022-08-21	2022-08-15
18036	1730626	57810750	0	253178	2022-08-21	2022-08-15
18047	1729320	57772388	0	251193	2022-08-21	2022-08-15
18054	524300	21660179	0	250768	2022-08-21	2022-08-15
18059	1715180	25466606	1	250768	2022-08-21	2022-08-15
18064	1728874	57805454	1	251157	2022-08-21	2022-08-15
18069	1727775	57802750	0	252643	2022-08-21	2022-08-15
18071	1457929	25530876	0	250765	2022-08-21	2022-08-15
18074	1728429	57804862	0	252643	2022-08-21	2022-08-15
18089	1723151	57609144	0	253430	2022-08-21	2022-08-15
18094	1723357	57736762	1	253430	2022-08-21	2022-08-15
18099	1189777		0	252969	2022-08-21	2022-08-15
18104	1718691	25571938	1	252969	2022-08-21	2022-08-15
18114	1110598	24936795	1	252603	2022-08-21	2022-08-15
18117	1727446	57794044	0	250765	2022-08-21	2022-08-15
18129	1411139	25123043	0	249943	2022-08-21	2022-08-15
18134	1448846	25520882	0	249943	2022-08-21	2022-08-15
18139	1712724	57608544	0	249943	2022-08-21	2022-08-15
18142	534761	21577759	1	249618	2022-08-21	2022-08-15
18147	1728382	57785044	1	250201	2022-08-21	2022-08-15
18157	1721464	24739793	0	253610	2022-08-21	2022-08-15
18162	1724204	57765032	0	253610	2022-08-21	2022-08-15
18164	1468465	25464628	0	249901	2022-08-21	2022-08-15
18170	1719866	57712654	0	251814	2022-08-21	2022-08-15
18175	1712900	25464330	0	253719	2022-08-21	2022-08-15
18182	1467377	25553214	0	250172	2022-08-21	2022-08-15
18187	1712782	57629588	0	250172	2022-08-21	2022-08-15
18192	1725269	57782048	0	250172	2022-08-21	2022-08-15
18205	744143	23031487	1	253490	2022-08-21	2022-08-15
18210	1726197	57780684	0	250172	2022-08-21	2022-08-15
18215	1416542	25427376	0	253490	2022-08-21	2022-08-15
18222	1725986	57764920	1	254800	2022-08-21	2022-08-15
18225	1043578	24776123	0	252343	2022-08-21	2022-08-15
18227	1726216	24720279	1	254800	2022-08-21	2022-08-15
18239	1724545	57766650	0	253490	2022-08-21	2022-08-15
18244	1724686	57767784	1	253490	2022-08-21	2022-08-15
18249	1726861	57779826	0	253490	2022-08-21	2022-08-15
18252	1464845	25581258	0	249817	2022-08-21	2022-08-15
19161	1721382		1	252434	2022-08-21	2022-08-15
19164	1723581	57755826	1	253433	2022-08-21	2022-08-15
19166	1721532		1	252434	2022-08-21	2022-08-15
19169	1729171	57808114	1	249550	2022-08-21	2022-08-15
19174	1411079	25409352	1	252529	2022-08-21	2022-08-15
19179	1462217	25571648	0	252529	2022-08-21	2022-08-15
19190	1723537	57760214	1	252434	2022-08-21	2022-08-15
19205	1728390	57804828	1	253620	2022-08-21	2022-08-15
19212	1728494	57807070	0	249900	2022-08-21	2022-08-15
19217	1728767	57807606	1	249900	2022-08-21	2022-08-15
19222	1729243	57805380	1	249900	2022-08-21	2022-08-15
19227	1730445		1	249900	2022-08-21	2022-08-15
19229	1341090	25236663	0	250381	2022-08-21	2022-08-15
19264	1720252	25253189	1	252223	2022-08-21	2022-08-15
19269	1723059		1	252223	2022-08-21	2022-08-15
19272	1724865	57765300	0	249819	2022-08-21	2022-08-15
19274	1723449	57760510	1	252223	2022-08-21	2022-08-15
18237	1726029	57787248	0	249945	2022-08-21	2022-08-15
18242	1726943	57793396	0	249945	2022-08-21	2022-08-15
18251	1725991	25534502	1	252343	2022-08-21	2022-08-15
18256	1726228	57788892	0	252343	2022-08-21	2022-08-15
19210	1427279	25454568	0	250766	2022-08-21	2022-08-15
19215	1430675	25466886	0	250766	2022-08-21	2022-08-15
19220	1714919	25556216	0	250766	2022-08-21	2022-08-15
19225	1720217	25249519	0	250766	2022-08-21	2022-08-15
19231	1719735	25240529	0	250926	2022-08-21	2022-08-15
19236	1725303	57782176	1	250926	2022-08-21	2022-08-15
19241	1726007	57778610	1	250926	2022-08-21	2022-08-15
19243	1723409	57759882	1	250381	2022-08-21	2022-08-15
19246	1195225	25011491	0	252223	2022-08-21	2022-08-15
19254	1727444	57796554	0	250766	2022-08-21	2022-08-15
19259	1728263	57801236	0	250766	2022-08-21	2022-08-15
19266	1723012	57749906	0	256031	2022-08-21	2022-08-15
19271	1723729	57754298	1	256031	2022-08-21	2022-08-15
19276	1725421	57777294	1	256031	2022-08-21	2022-08-15
19281	1725693	57785378	0	256031	2022-08-21	2022-08-15
19286	1727800	57802812	1	256031	2022-08-21	2022-08-15
19308	1462298	25571334	1	249816	2022-08-21	2022-08-15
19313	1725783	57786086	0	250253	2022-08-21	2022-08-15
19318	1464941	25579996	0	249816	2022-08-21	2022-08-15
19323	1712831	25562681	0	249816	2022-08-21	2022-08-15
19325	1716210	25266739	0	249904	2022-08-21	2022-08-15
19330	1718060	24320681	0	249904	2022-08-21	2022-08-15
19335	1723487	57761366	1	249904	2022-08-21	2022-08-15
19340	1724182	57764954	1	249904	2022-08-21	2022-08-15
19345	1724410	57759586	1	249904	2022-08-21	2022-08-15
19350	1724423	57766392	1	249904	2022-08-21	2022-08-15
19355	1726980	57792528	1	249904	2022-08-21	2022-08-15
19371	1729090	57804250	1	249816	2022-08-21	2022-08-15
19376	1725503	57784058	1	253467	2022-08-21	2022-08-15
19390	1724460	57760204	0	253912	2022-08-21	2022-08-15
19400	1724950	57767004	0	253912	2022-08-21	2022-08-15
19405	1727538	25581262	0	249622	2022-08-21	2022-08-15
19410	1728532	57807038	0	253912	2022-08-21	2022-08-15
19412	1413005	25419404	0	250451	2022-08-21	2022-08-15
19415	1729008	24872127	0	253912	2022-08-21	2022-08-15
19417	1417945	25199283	0	250451	2022-08-21	2022-08-15
19420	1730105		0	253912	2022-08-21	2022-08-15
19422	1436411	25449694	0	250451	2022-08-21	2022-08-15
19427	1445940	25504632	0	250451	2022-08-21	2022-08-15
19445	528733	21704787	0	252633	2022-08-21	2022-08-15
19450	1724881	57759656	1	253434	2022-08-21	2022-08-15
19456	1695285	25858705	0	253468	2022-08-21	2022-08-15
19461	1704960	57558508	1	253468	2022-08-21	2022-08-15
19471	1729580	57797082	0	250451	2022-08-21	2022-08-15
19475	1725152	57780858	1	253468	2022-08-21	2022-08-15
19480	1726421	57766068	0	253468	2022-08-21	2022-08-15
19483	1730143	57810836	1	252633	2022-08-21	2022-08-15
19493	1725558	57733482	0	253434	2022-08-21	2022-08-15
19498	1728813	57804366	1	253468	2022-08-21	2022-08-15
19500	532346	21697391	1	251851	2022-08-21	2022-08-15
19503	1729202	57790672	1	253468	2022-08-21	2022-08-15
19505	1717550	24350475	0	250202	2022-08-21	2022-08-15
19508	1724554	57758894	0	252269	2022-08-21	2022-08-15
19513	1724610	57766078	1	252269	2022-08-21	2022-08-15
19515	1718065	57674548	0	250202	2022-08-21	2022-08-15
19518	1729175	25573914	0	253253	2022-08-21	2022-08-15
19521	1711239	57615498	0	251851	2022-08-21	2022-08-15
19543	1416686	25429938	0	253133	2022-08-21	2022-08-15
20334	1730674	57813154	1	253455	2022-08-21	2022-08-15
20339	1731479	57817816	1	253455	2022-08-21	2022-08-15
20344	1726115	57787936	1	253437	2022-08-21	2022-08-15
20349	1727300	57791940	1	253437	2022-08-21	2022-08-15
20354	1727625	57793564	0	253437	2022-08-21	2022-08-15
18257	1466606	25580560	1	249817	2022-08-21	2022-08-15
18260	1304466	25154567	1	253174	2022-08-21	2022-08-15
18262	1717327		0	249817	2022-08-21	2022-08-15
18265	1727347	57790804	1	252343	2022-08-21	2022-08-15
18267	1717329	25573398	0	249817	2022-08-21	2022-08-15
18270	1729010	57808176	1	252343	2022-08-21	2022-08-15
18272	1723413	57758832	0	249817	2022-08-21	2022-08-15
18275	1722629	25507704	0	253174	2022-08-21	2022-08-15
18278	1054209	24835495	1	252032	2022-08-21	2022-08-15
18283	1197361	25011411	0	249841	2022-08-21	2022-08-15
18292	1431918	25470430	0	249812	2022-08-21	2022-08-15
18295	1726153	57764344	0	253509	2022-08-21	2022-08-15
18297	1468547	25510478	0	249812	2022-08-21	2022-08-15
18300	1727848	57803000	1	253509	2022-08-21	2022-08-15
18302	1731517	57818106	1	250720	2022-08-21	2022-08-15
18305	1728919	57804986	1	253509	2022-08-21	2022-08-15
18307	1712730	57594142	0	249812	2022-08-21	2022-08-15
18312	1721509	24378613	1	253699	2022-08-21	2022-08-15
18317	1721563		0	253699	2022-08-21	2022-08-15
18322	1722703		0	253699	2022-08-21	2022-08-15
18327	1722735		1	253699	2022-08-21	2022-08-15
18332	1722742		1	253699	2022-08-21	2022-08-15
18368	1718206	57674864	0	252584	2022-08-21	2022-08-15
18379	782646	23488259	1	252573	2022-08-21	2022-08-15
18380	1712921	24314643	1	249567	2022-08-21	2022-08-15
18384	1726864	57792412	0	250246	2022-08-21	2022-08-15
18385	1720376	25199435	0	249567	2022-08-21	2022-08-15
18390	1722722		0	249567	2022-08-21	2022-08-15
18395	1724625	57767808	1	252573	2022-08-21	2022-08-15
18400	1717877	25544808	1	250047	2022-08-21	2022-08-15
18403	1729553	57796394	1	249567	2022-08-21	2022-08-15
18405	1726275	57759084	0	250047	2022-08-21	2022-08-15
18410	1725278	57779320	1	253613	2022-08-21	2022-08-15
18416	1729880	57811878	1	250047	2022-08-21	2022-08-15
18421	1730327	57807552	1	250047	2022-08-21	2022-08-15
18428	765433	23213239	1	249993	2022-08-21	2022-08-15
18433	1728910		0	252573	2022-08-21	2022-08-15
18435	1295950	21685905	0	252219	2022-08-21	2022-08-15
18450	1715303	25528898	0	249993	2022-08-21	2022-08-15
18455	1716185	25579076	0	249993	2022-08-21	2022-08-15
18460	1716200	57656168	0	249993	2022-08-21	2022-08-15
18466	1727579	57790224	0	252550	2022-08-21	2022-08-15
18471	1727590	57801190	0	252550	2022-08-21	2022-08-15
18476	1727868	57792300	0	252550	2022-08-21	2022-08-15
18482	1727423	24754167	0	252988	2022-08-21	2022-08-15
18486	1723137	25534936	0	253703	2022-08-21	2022-08-15
18488	1725811	57784326	0	249993	2022-08-21	2022-08-15
18490	1724082	57759654	1	252565	2022-08-21	2022-08-15
18493	1726687	57793696	1	249993	2022-08-21	2022-08-15
18495	1725308	57781766	1	252565	2022-08-21	2022-08-15
18498	1727801		1	249993	2022-08-21	2022-08-15
18500	1464665	25577148	1	252365	2022-08-21	2022-08-15
18505	1416691	25423678	0	250715	2022-08-21	2022-08-15
18510	1418302	25430734	1	250715	2022-08-21	2022-08-15
18513	1422581	25185409	1	249582	2022-08-21	2022-08-15
18515	1448365	25519728	0	250715	2022-08-21	2022-08-15
18518	1424149	25448360	1	249603	2022-08-21	2022-08-15
18520	1690147		1	250715	2022-08-21	2022-08-15
18523	1451323	25418400	0	249582	2022-08-21	2022-08-15
18528	1457379	25533218	0	249582	2022-08-21	2022-08-15
18533	1711660	24911589	1	249582	2022-08-21	2022-08-15
18538	1722965	25467860	1	249603	2022-08-21	2022-08-15
18543	1723508	57760162	1	249603	2022-08-21	2022-08-15
18548	1723573	57760844	0	249582	2022-08-21	2022-08-15
18555	1726091	57777854	1	250715	2022-08-21	2022-08-15
18559	1721059	57731524	0	252147	2022-08-21	2022-08-15
18560	1726292	57759124	1	250715	2022-08-21	2022-08-15
18564	1724883	57758734	1	249582	2022-08-21	2022-08-15
18565	1726383	57780194	0	250715	2022-08-21	2022-08-15
18580	1724725	57768926	0	252147	2022-08-21	2022-08-15
18583	1059821		0	249588	2022-08-21	2022-08-15
18588	1721002	57727954	0	253473	2022-08-21	2022-08-15
18593	1721206	57732164	1	253473	2022-08-21	2022-08-15
18598	1727341	57759074	0	252147	2022-08-21	2022-08-15
18603	1723464	24898171	0	249588	2022-08-21	2022-08-15
18605	1728295	57790688	0	249828	2022-08-21	2022-08-15
18608	1723466	57759734	1	253473	2022-08-21	2022-08-15
18611	526473	20046403	1	253587	2022-08-21	2022-08-15
18613	1724368	57754444	1	253473	2022-08-21	2022-08-15
18616	1270619	25041249	0	253587	2022-08-21	2022-08-15
18638	1723421	57761256	1	253350	2022-08-21	2022-08-15
18641	1725319	57777338	1	253473	2022-08-21	2022-08-15
18643	1717140	25528906	0	251831	2022-08-21	2022-08-15
18646	1719641	25543940	1	252697	2022-08-21	2022-08-15
18649	1439774	25488826	1	253461	2022-08-21	2022-08-15
18651	1726070	57782502	0	249804	2022-08-21	2022-08-15
18654	1695285	25858705	1	253461	2022-08-21	2022-08-15
18656	1726138	57788324	0	249804	2022-08-21	2022-08-15
18659	1720761	57730274	0	253461	2022-08-21	2022-08-15
18664	1720982	57673060	1	253461	2022-08-21	2022-08-15
18671	1724232	57762550	1	252652	2022-08-21	2022-08-15
18673	1724780	25049619	1	253461	2022-08-21	2022-08-15
19235	1724653	57758730	0	250766	2022-08-21	2022-08-15
19237	1727600	57793900	1	253295	2022-08-21	2022-08-15
19240	1725924	57759212	0	250766	2022-08-21	2022-08-15
19242	1465078	25577624	1	249819	2022-08-21	2022-08-15
19245	1726751	57794094	0	250926	2022-08-21	2022-08-15
19247	1715210	19684853	0	249819	2022-08-21	2022-08-15
18258	1446961	25488334	1	253509	2022-08-21	2022-08-15
18261	1727294	57798820	1	252343	2022-08-21	2022-08-15
18263	1724197	57755742	1	253509	2022-08-21	2022-08-15
18266	1316152	24983313	0	253174	2022-08-21	2022-08-15
18268	1724455	57766158	1	253509	2022-08-21	2022-08-15
18271	1720277	25215047	0	253174	2022-08-21	2022-08-15
18273	1725353	57780934	0	253509	2022-08-21	2022-08-15
18280	1725300	57778514	1	249817	2022-08-21	2022-08-15
18285	1726005	57786372	0	253509	2022-08-21	2022-08-15
18290	1726102	57779972	0	253509	2022-08-21	2022-08-15
18293	1725675	57780260	0	250720	2022-08-21	2022-08-15
18298	1725759	57785456	0	250720	2022-08-21	2022-08-15
18301	1729186	57808632	0	252032	2022-08-21	2022-08-15
18303	1468785	25566492	0	249812	2022-08-21	2022-08-15
18306	1730206	57803674	0	252032	2022-08-21	2022-08-15
18310	1437682	25486388	0	252663	2022-08-21	2022-08-15
18313	1723372	57761290	1	249825	2022-08-21	2022-08-15
18315	1718680	25410310	0	252663	2022-08-21	2022-08-15
18318	1723621	57759348	0	249825	2022-08-21	2022-08-15
18320	1718688		0	252663	2022-08-21	2022-08-15
18323	1724127	57759518	1	249825	2022-08-21	2022-08-15
18325	1723602	57759192	1	252663	2022-08-21	2022-08-15
18328	1724759	57759322	1	249825	2022-08-21	2022-08-15
18333	1725631	57782612	1	249825	2022-08-21	2022-08-15
18338	1725797	57758966	0	249825	2022-08-21	2022-08-15
18343	1725975	57762730	1	249825	2022-08-21	2022-08-15
18348	1728299	57790692	0	249825	2022-08-21	2022-08-15
18351	1728779	57799172	0	249812	2022-08-21	2022-08-15
18361	1727157		0	253699	2022-08-21	2022-08-15
18364	1467743	25583860	0	252584	2022-08-21	2022-08-15
18374	1468318	25522984	1	250246	2022-08-21	2022-08-15
18376	1724382	57763096	1	253172	2022-08-21	2022-08-15
18381	1724579	57761718	1	253172	2022-08-21	2022-08-15
18386	1725270	57782330	1	253172	2022-08-21	2022-08-15
18391	1724495	57762894	1	252573	2022-08-21	2022-08-15
18396	1724817	57761358	1	249567	2022-08-21	2022-08-15
18398	1725397	57759722	0	252573	2022-08-21	2022-08-15
18401	1714921	25551832	1	253613	2022-08-21	2022-08-15
18406	1724114	57764318	0	253613	2022-08-21	2022-08-15
18408	1729588	57809916	0	249567	2022-08-21	2022-08-15
18411	1727748	57788852	1	250047	2022-08-21	2022-08-15
18413	1711360	57602222	0	249995	2022-08-21	2022-08-15
18417	1726894	57793402	0	252573	2022-08-21	2022-08-15
18418	1713608	57634864	0	249995	2022-08-21	2022-08-15
18422	1725812	24425737	0	253613	2022-08-21	2022-08-15
18423	1721131		1	249995	2022-08-21	2022-08-15
18426	1727340	57792754	1	253613	2022-08-21	2022-08-15
18438	1727727	57801904	1	249552	2022-08-21	2022-08-15
18443	1728421	57803082	1	249552	2022-08-21	2022-08-15
18448	1724213	57762310	1	252550	2022-08-21	2022-08-15
18451	1039938	24776565	1	253517	2022-08-21	2022-08-15
18456	1457001	25555082	1	253517	2022-08-21	2022-08-15
18459	1725336	57782926	1	252219	2022-08-21	2022-08-15
18461	1720996	25520418	0	253517	2022-08-21	2022-08-15
18474	1721554		1	253703	2022-08-21	2022-08-15
18479	1728745	57801824	1	252550	2022-08-21	2022-08-15
18485	1724632	57768092	1	249993	2022-08-21	2022-08-15
18501	1718843	25292222	0	250966	2022-08-21	2022-08-15
18504	1725315	57780254	1	252365	2022-08-21	2022-08-15
18509	1310023	25171505	0	249603	2022-08-21	2022-08-15
18511	1449702	25522430	0	253876	2022-08-21	2022-08-15
18516	1707099	24884545	0	253876	2022-08-21	2022-08-15
18521	1707102	24752269	0	253876	2022-08-21	2022-08-15
18526	1713462	57634834	1	253876	2022-08-21	2022-08-15
18531	1713468	57634894	0	253876	2022-08-21	2022-08-15
18536	1722437		0	253876	2022-08-21	2022-08-15
18541	1722633	24819249	1	253876	2022-08-21	2022-08-15
18546	1722636	24831419	1	253876	2022-08-21	2022-08-15
18551	1722641	25214341	1	253876	2022-08-21	2022-08-15
18556	1725959	25568156	1	253876	2022-08-21	2022-08-15
18561	1726302	24057605	1	253876	2022-08-21	2022-08-15
18566	1726532	25002365	1	253876	2022-08-21	2022-08-15
18571	1724199	57759268	0	252147	2022-08-21	2022-08-15
18576	1724633	57766886	0	252147	2022-08-21	2022-08-15
18579	1708151	24333507	1	253473	2022-08-21	2022-08-15
18590	1725221	57782136	0	252147	2022-08-21	2022-08-15
18591	1723654	57762952	1	249828	2022-08-21	2022-08-15
18595	1725410	57759680	0	252147	2022-08-21	2022-08-15
18596	1723744	57759482	0	249828	2022-08-21	2022-08-15
18600	1723422	25033795	1	249588	2022-08-21	2022-08-15
18601	1726212	57769550	0	249828	2022-08-21	2022-08-15
18631	1317309	25192571	0	249804	2022-08-21	2022-08-15
18636	1718891	57682546	1	249804	2022-08-21	2022-08-15
18639	1717084	25556092	0	251831	2022-08-21	2022-08-15
18642	1429619	25465888	0	252697	2022-08-21	2022-08-15
18644	1724081	57759846	1	253350	2022-08-21	2022-08-15
18661	1728535	57791714	1	249804	2022-08-21	2022-08-15
18666	1459817	25521010	1	252652	2022-08-21	2022-08-15
18669	1721442	57671202	1	253461	2022-08-21	2022-08-15
18676	1724781	57759790	1	251831	2022-08-21	2022-08-15
18681	1724864	57760414	0	251831	2022-08-21	2022-08-15
19250	1427529	25451554	1	252223	2022-08-21	2022-08-15
19252	1717188	25571304	0	249819	2022-08-21	2022-08-15
19257	1723501	57758842	0	249819	2022-08-21	2022-08-15
19260	1720163	25449488	1	252223	2022-08-21	2022-08-15
19262	1724465	57759210	0	249819	2022-08-21	2022-08-15
19267	1724624	57759964	0	249819	2022-08-21	2022-08-15
18259	1724283	57765336	1	250720	2022-08-21	2022-08-15
18264	1724367	57765770	1	250720	2022-08-21	2022-08-15
18269	1724529	57760016	1	250720	2022-08-21	2022-08-15
18274	1724697	57759796	0	250720	2022-08-21	2022-08-15
18277	1725564	57780076	0	253509	2022-08-21	2022-08-15
18279	1724964	57759248	1	250720	2022-08-21	2022-08-15
18284	1725530	57780898	1	250720	2022-08-21	2022-08-15
18287	1720164	25095673	0	249841	2022-08-21	2022-08-15
18294	1410644	25412850	0	253699	2022-08-21	2022-08-15
18299	1715218		0	253699	2022-08-21	2022-08-15
18304	1715357		0	253699	2022-08-21	2022-08-15
18330	1725663	57785000	0	252663	2022-08-21	2022-08-15
18335	1728653	57789780	0	252663	2022-08-21	2022-08-15
18337	1722940		1	253699	2022-08-21	2022-08-15
18340	1728931	57800622	0	252663	2022-08-21	2022-08-15
18342	1723116		1	253699	2022-08-21	2022-08-15
18345	1716278	25048549	1	250380	2022-08-21	2022-08-15
18347	1723131		0	253699	2022-08-21	2022-08-15
18352	1723137	25534936	0	253699	2022-08-21	2022-08-15
18357	1724967		0	253699	2022-08-21	2022-08-15
18362	1731040		0	249825	2022-08-21	2022-08-15
18367	1727198	57796482	1	250380	2022-08-21	2022-08-15
18369	1722595	25407568	0	253172	2022-08-21	2022-08-15
18372	1724247	57761724	1	253172	2022-08-21	2022-08-15
18388	1436616	25220139	0	252573	2022-08-21	2022-08-15
18393	1728419	57806812	1	250246	2022-08-21	2022-08-15
18394	1718054	57673968	0	250776	2022-08-21	2022-08-15
18414	518688	21579815	0	249552	2022-08-21	2022-08-15
18419	1727339	57790362	0	252573	2022-08-21	2022-08-15
18424	1728733	57807554	0	252573	2022-08-21	2022-08-15
18429	1728801	57774772	0	252573	2022-08-21	2022-08-15
18439	1720132	25466244	0	252219	2022-08-21	2022-08-15
18444	1723145	57751704	0	252550	2022-08-21	2022-08-15
18452	1718746	57681964	0	249609	2022-08-21	2022-08-15
18454	1724951	18572589	0	252219	2022-08-21	2022-08-15
18457	1726223	57788354	0	252550	2022-08-21	2022-08-15
18462	1727224	57798474	0	252550	2022-08-21	2022-08-15
18464	1716628	25522034	0	249993	2022-08-21	2022-08-15
18469	1716664	25520480	1	249993	2022-08-21	2022-08-15
18475	1717904	25217791	0	249993	2022-08-21	2022-08-15
18477	1726852	57792124	1	253517	2022-08-21	2022-08-15
18481	1723104		1	253703	2022-08-21	2022-08-15
18483	1729019	57808236	1	252550	2022-08-21	2022-08-15
18487	1226513	25049401	0	250966	2022-08-21	2022-08-15
18492	1439002	25488082	0	250966	2022-08-21	2022-08-15
18497	1714363	17335373	0	250966	2022-08-21	2022-08-15
18502	1320466	25206033	0	253876	2022-08-21	2022-08-15
18507	1448416	25519688	0	253876	2022-08-21	2022-08-15
18512	1726873	57794430	0	252365	2022-08-21	2022-08-15
18517	1726931	57794064	0	252365	2022-08-21	2022-08-15
18522	1453914	25546774	0	249603	2022-08-21	2022-08-15
18525	766931	23246733	0	252147	2022-08-21	2022-08-15
18527	1717812	25231285	1	249603	2022-08-21	2022-08-15
18530	1424701	25431988	0	252147	2022-08-21	2022-08-15
18532	1717892	25223573	1	249603	2022-08-21	2022-08-15
18535	1723743	57763142	1	250715	2022-08-21	2022-08-15
18537	1722851	25466178	0	249582	2022-08-21	2022-08-15
18540	1724850	57765462	1	250715	2022-08-21	2022-08-15
18542	1722856	57748762	0	249582	2022-08-21	2022-08-15
18545	1726050	57787380	0	250715	2022-08-21	2022-08-15
18552	1724426	25260301	0	249603	2022-08-21	2022-08-15
18557	1725542	57782842	1	249603	2022-08-21	2022-08-15
18562	1728684	57796956	1	249603	2022-08-21	2022-08-15
18567	1724047	57760334	0	252147	2022-08-21	2022-08-15
18569	1726716	57793224	1	250715	2022-08-21	2022-08-15
18572	1726632	25587324	0	253876	2022-08-21	2022-08-15
18574	1731611	57818266	1	250715	2022-08-21	2022-08-15
18609	1728392	57793068	1	249828	2022-08-21	2022-08-15
18614	1728565	57796512	1	249828	2022-08-21	2022-08-15
18619	1729072	57804808	1	249828	2022-08-21	2022-08-15
18624	1730585	57810054	1	249828	2022-08-21	2022-08-15
18629	1717057	25545270	1	251831	2022-08-21	2022-08-15
18632	1728499	57804660	1	249588	2022-08-21	2022-08-15
18634	1717065	25484990	1	251831	2022-08-21	2022-08-15
18637	1725277	57780292	1	253473	2022-08-21	2022-08-15
18667	1723575	57759164	0	251831	2022-08-21	2022-08-15
18672	1724771	57759664	0	251831	2022-08-21	2022-08-15
18674	1363190	25271433	0	252670	2022-08-21	2022-08-15
18679	1723695	57759840	1	252670	2022-08-21	2022-08-15
18684	1724605	57766738	1	252670	2022-08-21	2022-08-15
19255	1712755	25528990	0	252223	2022-08-21	2022-08-15
19258	1725527	57781380	1	250381	2022-08-21	2022-08-15
19263	1725649	57784910	1	250381	2022-08-21	2022-08-15
19265	1458065	25555364	0	250170	2022-08-21	2022-08-15
19268	1725930	57786604	1	250381	2022-08-21	2022-08-15
19270	1720760	25553740	0	250170	2022-08-21	2022-08-15
19273	1726331	57776240	1	250381	2022-08-21	2022-08-15
19275	1725437	57780604	0	250170	2022-08-21	2022-08-15
19283	1727729	57799302	1	250381	2022-08-21	2022-08-15
19288	1727939	57803292	1	250381	2022-08-21	2022-08-15
19290	1723526	57700402	1	253795	2022-08-21	2022-08-15
19292	1715334	25522242	1	250253	2022-08-21	2022-08-15
19295	1724955	57772112	1	253795	2022-08-21	2022-08-15
19297	1715822	57649314	1	250253	2022-08-21	2022-08-15
19300	1725329	57776200	1	253795	2022-08-21	2022-08-15
19302	1723345	57760576	0	250253	2022-08-21	2022-08-15
19305	1725333	57777388	1	253795	2022-08-21	2022-08-15
19307	1723366	57756652	0	250253	2022-08-21	2022-08-15
18276	1723532	57758852	0	249817	2022-08-21	2022-08-15
18282	1095526	24919685	1	252032	2022-08-21	2022-08-15
18289	1725598	57780536	0	250720	2022-08-21	2022-08-15
18309	1446029		0	249825	2022-08-21	2022-08-15
18316	1714238	57641162	0	249812	2022-08-21	2022-08-15
18321	1715217	25562329	0	249812	2022-08-21	2022-08-15
18326	1716226	25522120	0	249812	2022-08-21	2022-08-15
18331	1724917	57766918	0	249812	2022-08-21	2022-08-15
18336	1726270	57788808	1	249812	2022-08-21	2022-08-15
18341	1727308	57787314	0	249812	2022-08-21	2022-08-15
18344	1729625	57797088	1	252663	2022-08-21	2022-08-15
18346	1728650	57801162	0	249812	2022-08-21	2022-08-15
18349	1723563	57760122	1	250380	2022-08-21	2022-08-15
18354	1724202	57761716	1	250380	2022-08-21	2022-08-15
18356	1729146	57808260	1	249812	2022-08-21	2022-08-15
18359	1724852	57759668	0	250380	2022-08-21	2022-08-15
18366	1731417	57817690	1	249825	2022-08-21	2022-08-15
18371	1414040	21637807	1	249567	2022-08-21	2022-08-15
18377	1718885	57682486	1	249799	2022-08-21	2022-08-15
18382	1718886	57682622	1	249799	2022-08-21	2022-08-15
18387	1718902		1	249799	2022-08-21	2022-08-15
18392	1726013	57786786	0	249799	2022-08-21	2022-08-15
18399	1728452	57790342	0	249567	2022-08-21	2022-08-15
18404	1068146		0	249995	2022-08-21	2022-08-15
18407	1725741	57765940	0	252573	2022-08-21	2022-08-15
18409	1463766	25579222	1	249995	2022-08-21	2022-08-15
18412	1726671	57783666	1	252573	2022-08-21	2022-08-15
18431	1725705	57773706	1	249995	2022-08-21	2022-08-15
18434	1726376	57784628	1	249552	2022-08-21	2022-08-15
18436	1727383	57792592	1	249995	2022-08-21	2022-08-15
18441	1727828		1	249995	2022-08-21	2022-08-15
18446	1730464	57808952	1	249995	2022-08-21	2022-08-15
18449	1724392	25469794	1	252219	2022-08-21	2022-08-15
18463	1718777	22488049	0	252988	2022-08-21	2022-08-15
18467	1723718	57759720	1	253517	2022-08-21	2022-08-15
18468	1720423	25081999	0	252988	2022-08-21	2022-08-15
18472	1724101	57759196	1	253517	2022-08-21	2022-08-15
18473	1720428	25045413	0	252988	2022-08-21	2022-08-15
18478	1726273	25080537	0	252988	2022-08-21	2022-08-15
18484	1039998	24774179	0	250966	2022-08-21	2022-08-15
18489	1724787		0	253703	2022-08-21	2022-08-15
18491	1442841	25497621	0	252365	2022-08-21	2022-08-15
18494	1724976		1	253703	2022-08-21	2022-08-15
18496	1452867	25534236	1	252365	2022-08-21	2022-08-15
18503	1273200	25105811	0	249603	2022-08-21	2022-08-15
18506	1720962	25572980	0	250966	2022-08-21	2022-08-15
18508	1725674	57779782	0	252365	2022-08-21	2022-08-15
18514	1365749	25276549	1	249603	2022-08-21	2022-08-15
18519	1426365	25149281	0	249582	2022-08-21	2022-08-15
18549	1717297	25231737	0	252147	2022-08-21	2022-08-15
18554	1717344	25492825	0	252147	2022-08-21	2022-08-15
18578	1723463	57759162	1	253618	2022-08-21	2022-08-15
18581	1723365	57755588	1	249828	2022-08-21	2022-08-15
18584	1720817	57727998	1	253473	2022-08-21	2022-08-15
18586	1723627	57762732	1	249828	2022-08-21	2022-08-15
18589	1432068	25470480	1	249588	2022-08-21	2022-08-15
18594	1465042	25582846	0	249588	2022-08-21	2022-08-15
18599	1721219	57728236	1	253473	2022-08-21	2022-08-15
18604	1721220	57732248	0	253473	2022-08-21	2022-08-15
18606	1716279	25495285	0	251831	2022-08-21	2022-08-15
18618	1724442	57766596	1	253473	2022-08-21	2022-08-15
18621	1723155	57751798	0	253587	2022-08-21	2022-08-15
18623	1724559	57752618	0	253473	2022-08-21	2022-08-15
18626	1724209	57759302	1	253587	2022-08-21	2022-08-15
18628	1724768	57730746	1	253473	2022-08-21	2022-08-15
18640	1718907	57652284	0	249804	2022-08-21	2022-08-15
18645	1725420	57780754	1	249804	2022-08-21	2022-08-15
18648	1724124	57759948	0	253350	2022-08-21	2022-08-15
18650	1722805	57647152	1	252697	2022-08-21	2022-08-15
18653	1724723	57760180	0	253350	2022-08-21	2022-08-15
18655	1724325	57759448	1	252697	2022-08-21	2022-08-15
18658	1729505	57809652	0	253350	2022-08-21	2022-08-15
18660	1727286	57791628	1	252697	2022-08-21	2022-08-15
18663	1730062		1	253350	2022-08-21	2022-08-15
18665	1731594		1	249804	2022-08-21	2022-08-15
18668	1730468		1	253350	2022-08-21	2022-08-15
18670	1731613		1	249804	2022-08-21	2022-08-15
18678	1724789	25761015	1	253461	2022-08-21	2022-08-15
18683	1725565	57765792	0	252970	2022-08-21	2022-08-15
19277	1725574	57783514	0	249819	2022-08-21	2022-08-15
19279	1724784	25474488	1	252223	2022-08-21	2022-08-15
19282	1729028	57803614	1	249819	2022-08-21	2022-08-15
19284	1727455	57791046	1	252223	2022-08-21	2022-08-15
19287	1730459	57813504	1	249819	2022-08-21	2022-08-15
19289	1728517	57807128	1	256031	2022-08-21	2022-08-15
19294	1728541	57807174	1	256031	2022-08-21	2022-08-15
19299	1728564	57807222	1	256031	2022-08-21	2022-08-15
19304	1728769	57793618	1	256031	2022-08-21	2022-08-15
19309	1728786	57803638	0	256031	2022-08-21	2022-08-15
19314	1728861	57807050	1	256031	2022-08-21	2022-08-15
19319	1728934	57641322	0	256031	2022-08-21	2022-08-15
19324	1725460	57759390	1	253795	2022-08-21	2022-08-15
19359	1727506	57791476	1	249904	2022-08-21	2022-08-15
19362	1726236	57788994	1	249816	2022-08-21	2022-08-15
19364	1727518	57800652	1	249904	2022-08-21	2022-08-15
19367	1728407	57793226	1	249816	2022-08-21	2022-08-15
19374	1724297	57761224	0	253514	2022-08-21	2022-08-15
19381	1719940	24846131	0	253912	2022-08-21	2022-08-15
18281	1725664	57775232	0	253509	2022-08-21	2022-08-15
18286	1465229	25582294	1	252032	2022-08-21	2022-08-15
18288	1430022	25456940	0	249812	2022-08-21	2022-08-15
18291	1724492	24830861	1	252032	2022-08-21	2022-08-15
18296	1725569	57783720	1	252032	2022-08-21	2022-08-15
18308	1721201		1	253699	2022-08-21	2022-08-15
18311	1712734	57630104	0	249812	2022-08-21	2022-08-15
18314	1317237	25193153	0	250380	2022-08-21	2022-08-15
18319	1712729	25250127	1	250380	2022-08-21	2022-08-15
18324	1712797	25129591	1	250380	2022-08-21	2022-08-15
18329	1712938	25447348	1	250380	2022-08-21	2022-08-15
18334	1712953	25466428	1	250380	2022-08-21	2022-08-15
18339	1716162	25281723	0	250380	2022-08-21	2022-08-15
18350	1421360	25441924	0	252611	2022-08-21	2022-08-15
18353	1728537	57794292	1	249825	2022-08-21	2022-08-15
18355	1724262	57759318	0	252611	2022-08-21	2022-08-15
18358	1729116	57805110	1	249825	2022-08-21	2022-08-15
18360	1729981	57812058	1	249812	2022-08-21	2022-08-15
18363	1726380	25229489	1	250380	2022-08-21	2022-08-15
18365	1730052	57812048	1	249812	2022-08-21	2022-08-15
18370	1723576	57758534	1	252584	2022-08-21	2022-08-15
18373	1713651	57575790	1	249799	2022-08-21	2022-08-15
18375	1712854	57629562	1	249567	2022-08-21	2022-08-15
18378	1725281	57778632	1	250246	2022-08-21	2022-08-15
18383	1322586	25213537	0	252573	2022-08-21	2022-08-15
18389	1728324	57797776	1	250246	2022-08-21	2022-08-15
18397	1717804	25535438	0	250047	2022-08-21	2022-08-15
18402	1725497	57782562	1	252573	2022-08-21	2022-08-15
18415	1725326	57778538	1	253613	2022-08-21	2022-08-15
18420	737764	22956687	0	249552	2022-08-21	2022-08-15
18425	1726143	57760150	1	249552	2022-08-21	2022-08-15
18427	1721564		1	249995	2022-08-21	2022-08-15
18430	1726285	57758866	1	249552	2022-08-21	2022-08-15
18432	1287853	25127389	1	249993	2022-08-21	2022-08-15
18437	1441167	25494707	1	249993	2022-08-21	2022-08-15
18440	809632		0	252550	2022-08-21	2022-08-15
18442	1448853	25521098	1	249993	2022-08-21	2022-08-15
18445	1721426	57681668	1	252219	2022-08-21	2022-08-15
18447	1451304	25505280	1	249993	2022-08-21	2022-08-15
18453	1725563	57784442	0	252550	2022-08-21	2022-08-15
18458	1728870	57782870	0	249609	2022-08-21	2022-08-15
18465	1721209		0	253703	2022-08-21	2022-08-15
18470	1721215		0	253703	2022-08-21	2022-08-15
18480	1720189		1	249993	2022-08-21	2022-08-15
18499	1731584	57818150	1	252565	2022-08-21	2022-08-15
18524	1723397	57761252	1	250715	2022-08-21	2022-08-15
18529	1723556	57761398	1	250715	2022-08-21	2022-08-15
18534	1435405	25479996	0	252147	2022-08-21	2022-08-15
18539	1459817	25521010	0	252147	2022-08-21	2022-08-15
18544	1711662	57602104	0	252147	2022-08-21	2022-08-15
18547	1723735	57759810	0	249603	2022-08-21	2022-08-15
18550	1726085	57777918	1	250715	2022-08-21	2022-08-15
18553	1724637	57765584	0	249582	2022-08-21	2022-08-15
18558	1724729	57759032	1	249582	2022-08-21	2022-08-15
18563	1722903	22995481	0	252147	2022-08-21	2022-08-15
18568	1725630	57780122	1	249582	2022-08-21	2022-08-15
18570	1711151	57611802	1	253618	2022-08-21	2022-08-15
18573	1726340	57789668	1	249582	2022-08-21	2022-08-15
18575	1723190	25101243	1	253618	2022-08-21	2022-08-15
18577	1729280	57809010	1	249582	2022-08-21	2022-08-15
18582	1723716	57761616	1	253618	2022-08-21	2022-08-15
18585	1725215	57780602	0	252147	2022-08-21	2022-08-15
18587	1726837	57796354	1	253618	2022-08-21	2022-08-15
18592	1726841	57795168	1	253618	2022-08-21	2022-08-15
18597	1728334	57805140	1	253618	2022-08-21	2022-08-15
18602	1731522	57818010	0	253618	2022-08-21	2022-08-15
18607	1725464	57780308	0	249588	2022-08-21	2022-08-15
18610	1716604	57660626	0	251831	2022-08-21	2022-08-15
18612	1725532	57779616	0	249588	2022-08-21	2022-08-15
18615	1716608	25467742	0	251831	2022-08-21	2022-08-15
18617	1726177	57760000	1	249588	2022-08-21	2022-08-15
18620	1716839	25424514	0	251831	2022-08-21	2022-08-15
18622	1726388	57806958	1	249588	2022-08-21	2022-08-15
18625	1716886	25436460	0	251831	2022-08-21	2022-08-15
18627	1727213	57796378	0	249588	2022-08-21	2022-08-15
18630	1724240	57765562	1	253587	2022-08-21	2022-08-15
18633	1724936	57771936	0	253473	2022-08-21	2022-08-15
18635	1729403	57792680	1	253587	2022-08-21	2022-08-15
18647	1719075	25445970	1	251831	2022-08-21	2022-08-15
18652	1719094	25554942	1	251831	2022-08-21	2022-08-15
18657	1722592	57735824	0	251831	2022-08-21	2022-08-15
18662	1723468	57758722	0	251831	2022-08-21	2022-08-15
18675	1724255	57759382	1	252652	2022-08-21	2022-08-15
18677	1366541	25273957	0	252970	2022-08-21	2022-08-15
18680	1725327	57782130	0	252652	2022-08-21	2022-08-15
18682	1724838	57748070	1	253461	2022-08-21	2022-08-15
19278	1727488	57798306	1	250381	2022-08-21	2022-08-15
19280	1725885	25579886	0	250170	2022-08-21	2022-08-15
19285	1725973	57765710	0	250170	2022-08-21	2022-08-15
19293	1435232	25479408	0	249816	2022-08-21	2022-08-15
19298	1449932	25524670	0	249816	2022-08-21	2022-08-15
19303	1450383	25516204	0	249816	2022-08-21	2022-08-15
19316	1427450	25459530	0	249904	2022-08-21	2022-08-15
19321	1467692	25586378	1	249904	2022-08-21	2022-08-15
19329	716939		0	250048	2022-08-21	2022-08-15
19334	1718086	25563266	0	250048	2022-08-21	2022-08-15
19339	1724265	57760430	1	250048	2022-08-21	2022-08-15
18685	1725400	57778402	0	252652	2022-08-21	2022-08-15
18687	1724879	57644522	0	253461	2022-08-21	2022-08-15
18690	1726030	57787616	1	252652	2022-08-21	2022-08-15
18695	1727771	57798866	0	252652	2022-08-21	2022-08-15
18700	1728406	57804782	0	252652	2022-08-21	2022-08-15
18708	1730076	57810114	1	252652	2022-08-21	2022-08-15
18715	1409972	25410284	0	252626	2022-08-21	2022-08-15
18717	1726125	57782242	1	251448	2022-08-21	2022-08-15
18722	1436399	25483084	0	252632	2022-08-21	2022-08-15
18725	1425861	25457120	1	251198	2022-08-21	2022-08-15
18727	1724047	57760334	0	252632	2022-08-21	2022-08-15
18733	1723666	57759802	1	252626	2022-08-21	2022-08-15
18735	1717313	57667438	0	251198	2022-08-21	2022-08-15
18745	1452354	25456090	0	251810	2022-08-21	2022-08-15
18772	1728563	57785660	1	251810	2022-08-21	2022-08-15
18777	1728578	57807286	1	251810	2022-08-21	2022-08-15
18783	1724388	57759540	1	252285	2022-08-21	2022-08-15
18785	1468078	25593312	0	250921	2022-08-21	2022-08-15
18807	1724302	57765754	1	253431	2022-08-21	2022-08-15
18812	1724313	57765102	0	253431	2022-08-21	2022-08-15
18816	1441820	25492591	0	250120	2022-08-21	2022-08-15
18818	1719054	24731959	0	252278	2022-08-21	2022-08-15
18821	1728705	57804966	0	251140	2022-08-21	2022-08-15
18823	1724361	57765534	1	253431	2022-08-21	2022-08-15
18826	1723481	57758906	0	250120	2022-08-21	2022-08-15
18828	1724566	57767462	0	253431	2022-08-21	2022-08-15
18831	1723502	57758934	1	250120	2022-08-21	2022-08-15
18861	1715165	25166051	0	249970	2022-08-21	2022-08-15
18866	1721461	25578546	1	252344	2022-08-21	2022-08-15
18886	1414548	25422706	0	252426	2022-08-21	2022-08-15
18888	1725288	57776212	0	252344	2022-08-21	2022-08-15
18891	1717511	25180227	1	252426	2022-08-21	2022-08-15
18893	1725345	57783086	0	252344	2022-08-21	2022-08-15
18896	1717529	25148965	1	252426	2022-08-21	2022-08-15
18898	1720752	25422712	0	249950	2022-08-21	2022-08-15
18901	1717614	25100713	0	252426	2022-08-21	2022-08-15
18903	1723676	57760940	1	249950	2022-08-21	2022-08-15
18906	1717799	25176843	0	252426	2022-08-21	2022-08-15
18920	1316590	25189249	1	251806	2022-08-21	2022-08-15
18925	1718201	57675324	0	251806	2022-08-21	2022-08-15
18943	1441893	25497417	0	250934	2022-08-21	2022-08-15
18945	1728487	57805732	0	249925	2022-08-21	2022-08-15
18948	1460908	25522438	0	250934	2022-08-21	2022-08-15
18950	1715998	25524350	0	251578	2022-08-21	2022-08-15
18955	1718531	25849159	1	251578	2022-08-21	2022-08-15
18960	1722745	25577998	1	251578	2022-08-21	2022-08-15
18965	1723005	57750196	0	251578	2022-08-21	2022-08-15
18970	1723593	57759902	0	251578	2022-08-21	2022-08-15
18975	1724600	57763098	1	251578	2022-08-21	2022-08-15
19000	1725902	57779470	0	250934	2022-08-21	2022-08-15
19003	1718240	25278395	0	249890	2022-08-21	2022-08-15
19006	1715348	21842811	0	249834	2022-08-21	2022-08-15
19011	1720040	25459240	0	249890	2022-08-21	2022-08-15
19014	1723451	57759232	1	253462	2022-08-21	2022-08-15
19016	1725514	57781206	1	249890	2022-08-21	2022-08-15
19019	1723729	57754298	1	253462	2022-08-21	2022-08-15
19021	1725648	57775156	1	249890	2022-08-21	2022-08-15
19024	1724144	57761428	1	253462	2022-08-21	2022-08-15
19043	1724250	57759028	1	249814	2022-08-21	2022-08-15
19048	1724499	57759284	0	249814	2022-08-21	2022-08-15
19053	1725352	57780686	1	249814	2022-08-21	2022-08-15
19058	1725443	57780798	1	249814	2022-08-21	2022-08-15
19069	1730466		0	250123	2022-08-21	2022-08-15
19081	1724876	57771328	1	249624	2022-08-21	2022-08-15
19086	1725963	57786964	0	249624	2022-08-21	2022-08-15
19088	1725260	57782278	0	253448	2022-08-21	2022-08-15
19091	1726740	57793096	0	249624	2022-08-21	2022-08-15
19093	1725261	57776078	1	253448	2022-08-21	2022-08-15
19096	1729076	57803488	1	250037	2022-08-21	2022-08-15
19098	1725283	57778220	1	253448	2022-08-21	2022-08-15
19111	1724785	57762274	0	252287	2022-08-21	2022-08-15
19296	1050935	24829751	0	249904	2022-08-21	2022-08-15
19301	1365672	25276763	0	249904	2022-08-21	2022-08-15
19306	1392828	24025669	0	249904	2022-08-21	2022-08-15
19311	1423367	25448756	0	249904	2022-08-21	2022-08-15
19326	1725477	57776808	0	256004	2022-08-21	2022-08-15
19328	1725485	57781354	1	253795	2022-08-21	2022-08-15
19331	1727673	57792668	1	256004	2022-08-21	2022-08-15
19333	1725636	25415640	1	253795	2022-08-21	2022-08-15
19336	1727713	57754964	0	256004	2022-08-21	2022-08-15
19338	1725693	57785378	0	253795	2022-08-21	2022-08-15
19341	1727724	57680766	1	256004	2022-08-21	2022-08-15
19343	1725762	57783832	1	253795	2022-08-21	2022-08-15
19346	1727793	57780318	0	256004	2022-08-21	2022-08-15
19348	1725808	57782122	1	253795	2022-08-21	2022-08-15
19351	1727799	57794256	1	256004	2022-08-21	2022-08-15
19353	1725870	57776134	1	253795	2022-08-21	2022-08-15
19358	1730292	57810720	1	250048	2022-08-21	2022-08-15
19361	1722792	57628066	1	253467	2022-08-21	2022-08-15
19363	1731155	57817074	1	250048	2022-08-21	2022-08-15
19366	1725322	57780062	1	253467	2022-08-21	2022-08-15
19368	1727895	57794790	1	256004	2022-08-21	2022-08-15
19373	1727925	57802092	0	256004	2022-08-21	2022-08-15
19378	1728457	57804078	1	256004	2022-08-21	2022-08-15
19383	1728755	57805524	1	256004	2022-08-21	2022-08-15
19388	1725814	57783934	1	253467	2022-08-21	2022-08-15
19391	1699428	25895161	0	253474	2022-08-21	2022-08-15
18686	1725384	57779692	1	251831	2022-08-21	2022-08-15
18694	1725579	57778516	0	252670	2022-08-21	2022-08-15
18699	1727472	57789730	0	252670	2022-08-21	2022-08-15
18703	1729605	57796384	0	252652	2022-08-21	2022-08-15
18713	1724606	25041903	0	251448	2022-08-21	2022-08-15
18718	1423738	25422934	1	252632	2022-08-21	2022-08-15
18726	1730779		0	252970	2022-08-21	2022-08-15
18734	1725458	57777578	1	253447	2022-08-21	2022-08-15
18736	1725831	57785266	1	252632	2022-08-21	2022-08-15
18739	1725478	57776828	1	253447	2022-08-21	2022-08-15
18741	1730482		1	252626	2022-08-21	2022-08-15
18746	1723640	57760112	1	253623	2022-08-21	2022-08-15
18749	1717237	25448400	0	251810	2022-08-21	2022-08-15
18751	1724790	22036331	1	253623	2022-08-21	2022-08-15
18754	1718084	57674096	1	251810	2022-08-21	2022-08-15
18756	1725752	57782972	1	253623	2022-08-21	2022-08-15
18759	1720225	25193761	0	251810	2022-08-21	2022-08-15
18761	1726715	57791976	0	253623	2022-08-21	2022-08-15
18764	1724115	57762078	0	251810	2022-08-21	2022-08-15
18766	1726899	57783966	0	253623	2022-08-21	2022-08-15
18769	1464910	25575922	0	252366	2022-08-21	2022-08-15
18771	1726396	57789852	1	253447	2022-08-21	2022-08-15
18776	1726625	57790442	1	253447	2022-08-21	2022-08-15
18781	1724439	57759270	1	252366	2022-08-21	2022-08-15
18786	1725979	57786706	1	252366	2022-08-21	2022-08-15
18792	1466682	25589702	1	251140	2022-08-21	2022-08-15
18797	1724909	57764296	0	252285	2022-08-21	2022-08-15
18802	1714959	23159495	0	251140	2022-08-21	2022-08-15
18834	1731122		1	251140	2022-08-21	2022-08-15
18836	1724678	57751500	0	253431	2022-08-21	2022-08-15
18839	1731125		1	251140	2022-08-21	2022-08-15
18841	1024380	24586787	1	252942	2022-08-21	2022-08-15
18844	1731127		1	251140	2022-08-21	2022-08-15
18846	1314819	25182799	1	252942	2022-08-21	2022-08-15
18854	1731614		0	250120	2022-08-21	2022-08-15
18856	1104456		0	250155	2022-08-21	2022-08-15
18862	1720441	25231283	0	252344	2022-08-21	2022-08-15
18869	1720917	25255205	1	250155	2022-08-21	2022-08-15
18875	1724573	57760794	0	252344	2022-08-21	2022-08-15
18880	1724726	57796470	1	250155	2022-08-21	2022-08-15
18885	1723869	57758786	1	252138	2022-08-21	2022-08-15
18890	1725229	57779884	1	250155	2022-08-21	2022-08-15
18894	1724534	57760344	1	252138	2022-08-21	2022-08-15
18899	1726186	57787766	1	250155	2022-08-21	2022-08-15
18902	1727447	57792028	1	252344	2022-08-21	2022-08-15
18905	1727695	57799452	1	252138	2022-08-21	2022-08-15
18907	1725863	57786310	0	249950	2022-08-21	2022-08-15
18927	1729874	57811134	1	250155	2022-08-21	2022-08-15
18930	1721220	57732248	1	253794	2022-08-21	2022-08-15
18932	1724093	57759702	0	249925	2022-08-21	2022-08-15
18937	1724818	57765992	0	249925	2022-08-21	2022-08-15
18942	1293471	24116407	1	249834	2022-08-21	2022-08-15
18947	1312507	25176387	0	249834	2022-08-21	2022-08-15
18953	1723442	57608874	1	253794	2022-08-21	2022-08-15
18958	1723526	57700402	0	253794	2022-08-21	2022-08-15
18963	1724261	57764690	1	253794	2022-08-21	2022-08-15
18968	1724444	57754312	1	253794	2022-08-21	2022-08-15
18973	1724548	57730426	0	253794	2022-08-21	2022-08-15
18980	1712965	57624946	0	253462	2022-08-21	2022-08-15
18984	1716365	57657124	1	253462	2022-08-21	2022-08-15
18987	1711267	24824153	1	249834	2022-08-21	2022-08-15
18989	1725732	57785254	1	251578	2022-08-21	2022-08-15
18992	1711268	25081473	1	249834	2022-08-21	2022-08-15
18994	1728482	57798166	1	251578	2022-08-21	2022-08-15
18997	1725823	57784356	0	250934	2022-08-21	2022-08-15
18999	1722835	57748106	0	253462	2022-08-21	2022-08-15
19004	1723113	57733970	1	253462	2022-08-21	2022-08-15
19026	1724719	57759350	1	249831	2022-08-21	2022-08-15
19031	1724853	57760284	0	249831	2022-08-21	2022-08-15
19036	1725593	57780432	1	249831	2022-08-21	2022-08-15
19041	1722697	25463856	0	249605	2022-08-21	2022-08-15
19046	1728883	57803538	1	249831	2022-08-21	2022-08-15
19051	1722724	25277085	1	249605	2022-08-21	2022-08-15
19056	1730641	57807942	0	249831	2022-08-21	2022-08-15
19061	1728536	57790140	1	249605	2022-08-21	2022-08-15
19064	1724510	57758748	1	250123	2022-08-21	2022-08-15
19066	1728987	57804908	1	249605	2022-08-21	2022-08-15
19071	1729572	57800572	0	249605	2022-08-21	2022-08-15
19076	1466851	25522568	1	249624	2022-08-21	2022-08-15
19089	1435289	24090881	0	249565	2022-08-21	2022-08-15
19094	1711147	57612702	0	249565	2022-08-21	2022-08-15
19099	1724039	57759044	1	249565	2022-08-21	2022-08-15
19101	1729285	57808950	1	254816	2022-08-21	2022-08-15
19104	1724135	57764886	1	249565	2022-08-21	2022-08-15
19106	1729653	57809320	1	254816	2022-08-21	2022-08-15
19109	1728342	57789634	0	249565	2022-08-21	2022-08-15
19310	1725369	57783056	1	253795	2022-08-21	2022-08-15
19312	1464243		0	249816	2022-08-21	2022-08-15
19315	1725421	57777294	0	253795	2022-08-21	2022-08-15
19317	1728370	57802378	1	250253	2022-08-21	2022-08-15
19320	1725425	57777282	0	253795	2022-08-21	2022-08-15
19322	1728524	57807212	1	250253	2022-08-21	2022-08-15
19327	1714463	25471922	1	249816	2022-08-21	2022-08-15
19332	1714470	57642772	1	249816	2022-08-21	2022-08-15
19337	1722802	25458408	0	249816	2022-08-21	2022-08-15
19342	1724693	57759634	1	249816	2022-08-21	2022-08-15
19347	1724795	57759878	1	249816	2022-08-21	2022-08-15
19352	1725689	57784456	1	249816	2022-08-21	2022-08-15
18688	1725849	57781644	1	252970	2022-08-21	2022-08-15
18693	1724984	57774746	1	253461	2022-08-21	2022-08-15
18698	1725092	57780428	1	253461	2022-08-21	2022-08-15
18705	520305	21599999	0	252626	2022-08-21	2022-08-15
18710	1242209	25066547	0	252626	2022-08-21	2022-08-15
18723	1423256	22952257	0	252626	2022-08-21	2022-08-15
18728	1446777	25504446	1	252626	2022-08-21	2022-08-15
18730	1715690	25525374	0	251198	2022-08-21	2022-08-15
18738	1721464	24739793	0	253623	2022-08-21	2022-08-15
18740	1717319	57667474	0	251198	2022-08-21	2022-08-15
18743	1725512	57784090	0	253447	2022-08-21	2022-08-15
18748	1723601	57760752	0	251198	2022-08-21	2022-08-15
18753	1724734	57767134	1	251198	2022-08-21	2022-08-15
18770	561899	21874393	0	250921	2022-08-21	2022-08-15
18773	1723441	57761098	1	252366	2022-08-21	2022-08-15
18775	1041072	24783483	0	250921	2022-08-21	2022-08-15
18778	1724214	57757438	0	252366	2022-08-21	2022-08-15
18780	1431043	25197917	1	250921	2022-08-21	2022-08-15
18790	1726731	57790816	0	252366	2022-08-21	2022-08-15
18795	1728699	57803862	1	252366	2022-08-21	2022-08-15
18800	1730166		0	252366	2022-08-21	2022-08-15
18805	1725271	57764982	1	252285	2022-08-21	2022-08-15
18808	1716731	25075455	0	252278	2022-08-21	2022-08-15
18810	1725375	57766344	1	252285	2022-08-21	2022-08-15
18813	1719016	25275455	0	252278	2022-08-21	2022-08-15
18815	1721034	25521512	1	251140	2022-08-21	2022-08-15
18817	1724356	57765788	1	253431	2022-08-21	2022-08-15
18820	1715214	57648460	1	250120	2022-08-21	2022-08-15
18822	1719726	22955921	0	252278	2022-08-21	2022-08-15
18825	1729980	57812504	1	251140	2022-08-21	2022-08-15
18827	1725766	57782500	0	252278	2022-08-21	2022-08-15
18830	1730006	57811844	1	251140	2022-08-21	2022-08-15
18832	1724635	57729096	0	253431	2022-08-21	2022-08-15
18835	1725479	57783582	0	250120	2022-08-21	2022-08-15
18840	1726822	57792756	1	250120	2022-08-21	2022-08-15
18845	1726937	57789808	1	250120	2022-08-21	2022-08-15
18850	1724162	57761054	1	252942	2022-08-21	2022-08-15
18852	675492	22569219	0	250155	2022-08-21	2022-08-15
18855	1725560	57779170	0	252942	2022-08-21	2022-08-15
18857	1455888	25423024	0	252344	2022-08-21	2022-08-15
18860	1220184	25042781	0	250155	2022-08-21	2022-08-15
18865	1434576	25477378	1	250155	2022-08-21	2022-08-15
18867	771768	23288675	0	249950	2022-08-21	2022-08-15
18870	1281379	25118459	0	252426	2022-08-21	2022-08-15
18872	1461371	25554252	1	249950	2022-08-21	2022-08-15
18876	1298886	25104421	0	252426	2022-08-21	2022-08-15
18877	1467700	24476155	0	249950	2022-08-21	2022-08-15
18881	1371760	25288892	0	252426	2022-08-21	2022-08-15
18882	1713818	57609912	1	249950	2022-08-21	2022-08-15
18887	1718000	57673644	0	249950	2022-08-21	2022-08-15
18892	1718231	25528894	1	249950	2022-08-21	2022-08-15
18895	1726113	57785632	1	250155	2022-08-21	2022-08-15
18897	1727266	57790436	0	252344	2022-08-21	2022-08-15
18900	1727463	57799858	1	252138	2022-08-21	2022-08-15
18904	1726586	25266211	0	250155	2022-08-21	2022-08-15
18910	1724485	57759100	0	252426	2022-08-21	2022-08-15
18912	1726401	25852109	1	249950	2022-08-21	2022-08-15
18915	1726309	57789334	1	252426	2022-08-21	2022-08-15
18917	1726684	57794566	1	249950	2022-08-21	2022-08-15
18929	1718203	25456882	0	251806	2022-08-21	2022-08-15
18935	1721628	57735290	1	253794	2022-08-21	2022-08-15
18940	1722862	57699372	1	253794	2022-08-21	2022-08-15
18952	1715675	57652900	0	250934	2022-08-21	2022-08-15
18957	1716645	25266599	0	250934	2022-08-21	2022-08-15
18962	1716961	25282411	0	250934	2022-08-21	2022-08-15
18966	1717005	57664824	0	250934	2022-08-21	2022-08-15
18969	1337902	25246189	1	249890	2022-08-21	2022-08-15
18971	1723625	57759792	0	250934	2022-08-21	2022-08-15
18974	1468140	25577402	1	249890	2022-08-21	2022-08-15
18976	1723664	57761826	1	250934	2022-08-21	2022-08-15
18981	1711266	22419307	1	249834	2022-08-21	2022-08-15
18986	1724738	57765982	1	250934	2022-08-21	2022-08-15
18991	1724867	57769394	1	250934	2022-08-21	2022-08-15
18996	1711308	25179755	1	249834	2022-08-21	2022-08-15
19009	1723169	57751914	1	253462	2022-08-21	2022-08-15
19027	1717799	25176843	1	249605	2022-08-21	2022-08-15
19029	1323792	24906361	0	249814	2022-08-21	2022-08-15
19032	1724650	57767742	1	253462	2022-08-21	2022-08-15
19034	1453366	24765417	0	249814	2022-08-21	2022-08-15
19037	1722661	25173273	1	249605	2022-08-21	2022-08-15
19039	1723459	57761778	0	249814	2022-08-21	2022-08-15
19042	1728750	57801408	1	249831	2022-08-21	2022-08-15
19044	1439780	25491517	1	253448	2022-08-21	2022-08-15
19047	1722716	25181697	0	249605	2022-08-21	2022-08-15
19049	1723704	57760292	1	250123	2022-08-21	2022-08-15
19052	1728923	57803896	1	249831	2022-08-21	2022-08-15
19054	1724118	57764516	1	250123	2022-08-21	2022-08-15
19057	1726110	57787220	1	249605	2022-08-21	2022-08-15
19059	1724363	57760834	1	250123	2022-08-21	2022-08-15
19074	1724371	57732022	0	253448	2022-08-21	2022-08-15
19077	1728443	57790926	0	249814	2022-08-21	2022-08-15
19079	1724748	57769418	1	253448	2022-08-21	2022-08-15
19082	1728574	57792694	1	249814	2022-08-21	2022-08-15
19084	1724760	57770048	1	253448	2022-08-21	2022-08-15
19105	1731159	57811866	1	249624	2022-08-21	2022-08-15
19344	1725368	57782486	1	250048	2022-08-21	2022-08-15
19349	1726303	57780438	1	250048	2022-08-21	2022-08-15
18689	1724966	57759962	1	252670	2022-08-21	2022-08-15
18691	1725594	57780548	1	251831	2022-08-21	2022-08-15
18696	1725825	57786340	1	251831	2022-08-21	2022-08-15
18701	1726315	57780736	1	252970	2022-08-21	2022-08-15
18704	608920	21967795	0	251448	2022-08-21	2022-08-15
18706	1729337	57808904	1	252970	2022-08-21	2022-08-15
18711	1730015	57812138	1	252970	2022-08-21	2022-08-15
18716	1730700	57807504	0	252970	2022-08-21	2022-08-15
18719	1420038	25437484	0	252626	2022-08-21	2022-08-15
18721	1730739	25542630	0	252970	2022-08-21	2022-08-15
18724	1724291	57727968	1	253447	2022-08-21	2022-08-15
18729	1725433	57776606	0	253447	2022-08-21	2022-08-15
18731	1724903	57759376	0	252632	2022-08-21	2022-08-15
18758	1727133	57781310	0	251198	2022-08-21	2022-08-15
18763	1727841	57778328	1	251198	2022-08-21	2022-08-15
18768	1724647	57765646	0	251810	2022-08-21	2022-08-15
18774	1723486	57761610	1	252285	2022-08-21	2022-08-15
18779	1723722	57758848	1	252285	2022-08-21	2022-08-15
18788	1724130	57752440	1	253431	2022-08-21	2022-08-15
18791	1724866	57762582	1	252285	2022-08-21	2022-08-15
18793	1724174	57752534	1	253431	2022-08-21	2022-08-15
18796	1711260	57615312	1	251140	2022-08-21	2022-08-15
18798	1724289	57764630	0	253431	2022-08-21	2022-08-15
18801	1724932	57764664	0	252285	2022-08-21	2022-08-15
18803	1724298	57717098	0	253431	2022-08-21	2022-08-15
18806	1716095	57650294	1	251140	2022-08-21	2022-08-15
18809	1727549	25503288	1	250921	2022-08-21	2022-08-15
18811	1720695	25420386	1	251140	2022-08-21	2022-08-15
18833	1464676	25513878	1	252275	2022-08-21	2022-08-15
18838	1716684	25463112	0	252275	2022-08-21	2022-08-15
18843	1723674	57759428	1	252275	2022-08-21	2022-08-15
18848	1727567	57801038	0	252275	2022-08-21	2022-08-15
18851	1726602	57792988	0	253431	2022-08-21	2022-08-15
18853	1729079	57807472	0	252275	2022-08-21	2022-08-15
18858	1727847	57801534	0	252942	2022-08-21	2022-08-15
18863	1731467	57817772	1	252942	2022-08-21	2022-08-15
18868	1715876	25517734	0	252138	2022-08-21	2022-08-15
18873	1723127	57665600	0	252138	2022-08-21	2022-08-15
18878	1724707	57768158	1	252344	2022-08-21	2022-08-15
18884	1725212	57781700	0	250155	2022-08-21	2022-08-15
18889	1724511	57759670	0	252138	2022-08-21	2022-08-15
18909	1728348	57805028	1	252138	2022-08-21	2022-08-15
18911	1277457	25111501	1	253794	2022-08-21	2022-08-15
18914	1730304		1	252138	2022-08-21	2022-08-15
18916	1450154	25505198	0	253794	2022-08-21	2022-08-15
18919	1729020	57807172	1	252426	2022-08-21	2022-08-15
18922	1728825		1	249950	2022-08-21	2022-08-15
18924	1729109	57784240	1	252426	2022-08-21	2022-08-15
18931	1729893	57812234	1	250155	2022-08-21	2022-08-15
18934	1723014	25447440	0	251806	2022-08-21	2022-08-15
18938	1371639	25288792	1	250934	2022-08-21	2022-08-15
18944	1723012	57749906	0	253794	2022-08-21	2022-08-15
18946	1018866	24306113	0	251578	2022-08-21	2022-08-15
18949	1723171	57751826	0	253794	2022-08-21	2022-08-15
18978	1715641	25468090	0	249890	2022-08-21	2022-08-15
18983	1715683	25474000	0	249890	2022-08-21	2022-08-15
18988	1716085	25534902	0	249890	2022-08-21	2022-08-15
18993	1717830	25215911	0	249890	2022-08-21	2022-08-15
18998	1718234	25272579	0	249890	2022-08-21	2022-08-15
19001	1713622	25166003	0	249834	2022-08-21	2022-08-15
19005	1731409	57821710	1	250934	2022-08-21	2022-08-15
19008	1718788		0	249890	2022-08-21	2022-08-15
19010	1715274	25557502	1	250123	2022-08-21	2022-08-15
19013	1311396	25175619	0	249605	2022-08-21	2022-08-15
19015	1715278	25564980	1	250123	2022-08-21	2022-08-15
19018	1325929	25221119	0	249605	2022-08-21	2022-08-15
19020	1715298	24911655	0	250123	2022-08-21	2022-08-15
19023	1717614	25100713	1	249605	2022-08-21	2022-08-15
19025	1715577	25553322	0	250123	2022-08-21	2022-08-15
19030	1715896	25412266	1	250123	2022-08-21	2022-08-15
19035	1716273	57661814	1	250123	2022-08-21	2022-08-15
19040	1723565	57759282	1	250123	2022-08-21	2022-08-15
19063	581843	21896333	0	249624	2022-08-21	2022-08-15
19068	1092508	24914801	0	249624	2022-08-21	2022-08-15
19070	1723648	57761696	1	253448	2022-08-21	2022-08-15
19073	1223674		0	249624	2022-08-21	2022-08-15
19075	1712628	57551066	1	250037	2022-08-21	2022-08-15
19080	1722937	24186941	0	250037	2022-08-21	2022-08-15
19083	1724241	57759436	1	254816	2022-08-21	2022-08-15
19085	1725880	57785630	1	250037	2022-08-21	2022-08-15
19090	1727239	57790866	0	250037	2022-08-21	2022-08-15
19103	1725286	57776736	1	253448	2022-08-21	2022-08-15
19108	1725466	57778086	1	253448	2022-08-21	2022-08-15
19110	1730785	57814140	1	254816	2022-08-21	2022-08-15
19113	1728374	57806884	1	249565	2022-08-21	2022-08-15
19354	1728137	57805162	0	250048	2022-08-21	2022-08-15
19356	1727843	57801288	1	256004	2022-08-21	2022-08-15
19369	1725409	57777156	1	253467	2022-08-21	2022-08-15
19379	1724353	57762304	1	253514	2022-08-21	2022-08-15
19385	1725739	57779798	0	253467	2022-08-21	2022-08-15
19387	1718566	25323084	0	249622	2022-08-21	2022-08-15
19395	1724528	57764386	0	253912	2022-08-21	2022-08-15
19406	1727812	57799312	0	253912	2022-08-21	2022-08-15
19421	1726381	25647960	0	253474	2022-08-21	2022-08-15
19430	1719676	57700006	0	253434	2022-08-21	2022-08-15
19435	1724313	57765102	1	253434	2022-08-21	2022-08-15
19440	1724408	25081447	0	253434	2022-08-21	2022-08-15
18692	1726027	57781422	1	252970	2022-08-21	2022-08-15
18697	1726280	57780022	0	252970	2022-08-21	2022-08-15
18702	1725140	57780730	1	253461	2022-08-21	2022-08-15
18707	1725152	57780858	0	253461	2022-08-21	2022-08-15
18709	1716017	25281831	0	251448	2022-08-21	2022-08-15
18712	1730760	57813694	0	252652	2022-08-21	2022-08-15
18714	1468316	25496197	1	253447	2022-08-21	2022-08-15
18720	1712358	25915509	0	253447	2022-08-21	2022-08-15
18732	1446707	25515824	0	253623	2022-08-21	2022-08-15
18737	1726681	57778496	0	252626	2022-08-21	2022-08-15
18742	1722760	25266691	0	253623	2022-08-21	2022-08-15
18744	1720335	25785383	0	251198	2022-08-21	2022-08-15
18747	1725555	57780416	1	253447	2022-08-21	2022-08-15
18750	1442723	25499922	0	252366	2022-08-21	2022-08-15
18752	1725661	57777692	1	253447	2022-08-21	2022-08-15
18755	1445367	25510610	1	252366	2022-08-21	2022-08-15
18757	1725748	57781598	0	253447	2022-08-21	2022-08-15
18760	1461558	25565040	0	252366	2022-08-21	2022-08-15
18762	1725915	57786534	1	253447	2022-08-21	2022-08-15
18765	1462007	25566548	0	252366	2022-08-21	2022-08-15
18767	1726324	57783090	1	253447	2022-08-21	2022-08-15
18782	1730427	57808472	0	251810	2022-08-21	2022-08-15
18784	1723064	57728958	0	253431	2022-08-21	2022-08-15
18787	1724728	57761242	1	252285	2022-08-21	2022-08-15
18789	1723378	57760548	1	250921	2022-08-21	2022-08-15
18794	1723414	57761216	0	250921	2022-08-21	2022-08-15
18799	1725448	57777012	1	250921	2022-08-21	2022-08-15
18804	1725670	57783006	1	250921	2022-08-21	2022-08-15
18814	1729180		0	252285	2022-08-21	2022-08-15
18819	1729612	57797588	0	252285	2022-08-21	2022-08-15
18824	1730731	57814032	1	252285	2022-08-21	2022-08-15
18829	1731100	57819884	1	252285	2022-08-21	2022-08-15
18837	638208		0	252942	2022-08-21	2022-08-15
18842	1724704	57626842	0	253431	2022-08-21	2022-08-15
18847	1725640	57731076	1	253431	2022-08-21	2022-08-15
18849	1728477	57792290	1	250120	2022-08-21	2022-08-15
18859	1039811	24775713	0	252138	2022-08-21	2022-08-15
18864	1164760	24783781	0	252138	2022-08-21	2022-08-15
18871	1724433	57759404	1	252344	2022-08-21	2022-08-15
18874	1724266	57764442	0	250155	2022-08-21	2022-08-15
18879	1723418	57760606	1	252138	2022-08-21	2022-08-15
18883	1724884	17203021	1	252344	2022-08-21	2022-08-15
18908	1726601	57780102	1	250155	2022-08-21	2022-08-15
18913	1728285	57804150	1	250155	2022-08-21	2022-08-15
18918	1729333	57803148	1	250155	2022-08-21	2022-08-15
18921	1718934	57677234	0	253794	2022-08-21	2022-08-15
18923	1729779		0	250155	2022-08-21	2022-08-15
18926	1720203	57677102	1	253794	2022-08-21	2022-08-15
18928	1722500	25217473	0	249925	2022-08-21	2022-08-15
18933	1325036	25198091	0	250934	2022-08-21	2022-08-15
18936	1731150		1	250155	2022-08-21	2022-08-15
18939	1727318	57793232	1	251806	2022-08-21	2022-08-15
18941	1727888	57803146	0	249925	2022-08-21	2022-08-15
18951	1417614	25414808	0	249834	2022-08-21	2022-08-15
18954	735059	22950111	0	249890	2022-08-21	2022-08-15
18956	1437482	25486374	0	249834	2022-08-21	2022-08-15
18959	743589	23006503	0	249890	2022-08-21	2022-08-15
18961	1438106	25422560	1	249834	2022-08-21	2022-08-15
18964	1313411	25179951	0	249890	2022-08-21	2022-08-15
18967	1711140	25108685	0	249834	2022-08-21	2022-08-15
18972	1711158	24894863	1	249834	2022-08-21	2022-08-15
18977	1711181	25066269	0	249834	2022-08-21	2022-08-15
18979	1724860	57760766	1	251578	2022-08-21	2022-08-15
18982	1723753	57762290	1	250934	2022-08-21	2022-08-15
18985	1725431	57780516	0	251578	2022-08-21	2022-08-15
18990	1718890	57681912	1	253462	2022-08-21	2022-08-15
18995	1721429	25901265	1	253462	2022-08-21	2022-08-15
19002	1186125	24860165	0	250123	2022-08-21	2022-08-15
19007	1715211	25324960	1	250123	2022-08-21	2022-08-15
19012	1396385	23831353	1	249831	2022-08-21	2022-08-15
19017	1723544	57758844	1	249831	2022-08-21	2022-08-15
19022	1724714	57759366	0	249831	2022-08-21	2022-08-15
19028	1724443	57766724	1	253462	2022-08-21	2022-08-15
19033	1721556	25179927	1	249605	2022-08-21	2022-08-15
19038	1726415	57734338	1	253462	2022-08-21	2022-08-15
19045	1723684	57760040	0	250123	2022-08-21	2022-08-15
19050	1720208	57726250	1	253448	2022-08-21	2022-08-15
19055	1721052	57731500	1	253448	2022-08-21	2022-08-15
19060	1721630	57728836	1	253448	2022-08-21	2022-08-15
19062	1725504	57782684	1	249814	2022-08-21	2022-08-15
19065	1723128	57751008	1	253448	2022-08-21	2022-08-15
19067	1725606	57784390	1	249814	2022-08-21	2022-08-15
19072	1726269	57759554	1	249814	2022-08-21	2022-08-15
19078	1723484	57761786	1	254816	2022-08-21	2022-08-15
19087	1724260	57759516	1	254816	2022-08-21	2022-08-15
19092	1726336	57789270	0	254816	2022-08-21	2022-08-15
19095	1729108	17944843	1	249624	2022-08-21	2022-08-15
19097	1726393	57780836	1	254816	2022-08-21	2022-08-15
19100	1729564	57781604	0	249624	2022-08-21	2022-08-15
19102	1359997	25213851	0	249966	2022-08-21	2022-08-15
19107	1715293	25583394	1	249966	2022-08-21	2022-08-15
19112	1715345	25530596	0	249966	2022-08-21	2022-08-15
19357	1725836	57783884	1	249816	2022-08-21	2022-08-15
19360	1727850	57803038	1	256004	2022-08-21	2022-08-15
19365	1727869	57781200	0	256004	2022-08-21	2022-08-15
19370	1263622	24738575	0	253514	2022-08-21	2022-08-15
19372	739188	22995803	0	253912	2022-08-21	2022-08-15
19375	1729152	57808614	1	249816	2022-08-21	2022-08-15
19377	1714921	25551832	0	253912	2022-08-21	2022-08-15
19380	1725724	57785612	1	253467	2022-08-21	2022-08-15
19382	1435482	25480232	1	249622	2022-08-21	2022-08-15
19392	1719065	25421568	1	249622	2022-08-21	2022-08-15
19425	1726746	57792170	1	253474	2022-08-21	2022-08-15
19434	1727126	57793208	1	253474	2022-08-21	2022-08-15
19436	1719903	22939337	1	253524	2022-08-21	2022-08-15
19438	1726891	57793058	0	252698	2022-08-21	2022-08-15
19441	1719910	25001333	0	253524	2022-08-21	2022-08-15
19443	1727155	57796332	1	253474	2022-08-21	2022-08-15
19447	1713683	22275895	0	250451	2022-08-21	2022-08-15
19448	1727272	25901357	1	253474	2022-08-21	2022-08-15
19452	1714414	22278829	1	250451	2022-08-21	2022-08-15
19453	773828	23275725	1	252633	2022-08-21	2022-08-15
19466	1721192	57732120	0	253468	2022-08-21	2022-08-15
19472	1724443	57766724	0	253468	2022-08-21	2022-08-15
19478	1727835	57802148	1	252633	2022-08-21	2022-08-15
19485	1727546	57799706	1	253468	2022-08-21	2022-08-15
19488	1730670	57809080	1	252633	2022-08-21	2022-08-15
19490	1727864	57791838	0	253468	2022-08-21	2022-08-15
19492	1723734	57759156	0	253345	2022-08-21	2022-08-15
19497	1725289	57779724	0	253345	2022-08-21	2022-08-15
19502	1728808	57803610	0	253345	2022-08-21	2022-08-15
19507	1729206	57800180	0	253468	2022-08-21	2022-08-15
19510	1717977	24315515	1	250202	2022-08-21	2022-08-15
19512	1729272	57808970	1	253468	2022-08-21	2022-08-15
19517	1724863	57757472	1	252269	2022-08-21	2022-08-15
19520	1378374	25276733	1	253453	2022-08-21	2022-08-15
19522	1724898	57770322	1	252269	2022-08-21	2022-08-15
19526	1714865	23288333	0	251851	2022-08-21	2022-08-15
19527	1725291	57779482	0	252269	2022-08-21	2022-08-15
19531	1715291	25924467	1	251851	2022-08-21	2022-08-15
19532	1725323	57779566	1	252269	2022-08-21	2022-08-15
19540	1716270	25460404	0	251851	2022-08-21	2022-08-15
19542	1727802	57802798	1	253453	2022-08-21	2022-08-15
19384	1725110	57780506	1	253514	2022-08-21	2022-08-15
19386	1722518	25227651	0	253912	2022-08-21	2022-08-15
19389	1726334	57788670	1	253514	2022-08-21	2022-08-15
19394	1725969	57634318	1	253467	2022-08-21	2022-08-15
19396	1720438	57727660	0	253474	2022-08-21	2022-08-15
19398	1727153	57780130	1	253514	2022-08-21	2022-08-15
19401	1727196	57781058	1	249622	2022-08-21	2022-08-15
19403	1727588	57789462	1	253514	2022-08-21	2022-08-15
19408	1727756	57802492	1	253514	2022-08-21	2022-08-15
19411	1726263	57789168	1	253474	2022-08-21	2022-08-15
19413	1729586	57809786	1	253514	2022-08-21	2022-08-15
19416	1726374	57779610	0	253474	2022-08-21	2022-08-15
19418	1730412	57792676	0	253514	2022-08-21	2022-08-15
19423	1726554	57791252	1	253467	2022-08-21	2022-08-15
19428	1726926	57797204	0	253474	2022-08-21	2022-08-15
19431	1719898	24978083	1	253524	2022-08-21	2022-08-15
19433	1725684	57785356	0	252698	2022-08-21	2022-08-15
19437	1712904	21630579	1	250451	2022-08-21	2022-08-15
19439	1727140	57790208	1	253474	2022-08-21	2022-08-15
19442	1713615	21603625	1	250451	2022-08-21	2022-08-15
19454	1721086	21635011	0	253524	2022-08-21	2022-08-15
19459	1725032	57752010	1	253434	2022-08-21	2022-08-15
19464	1725250	57778092	1	253434	2022-08-21	2022-08-15
19469	1725259	57776620	1	253434	2022-08-21	2022-08-15
19474	1725385	57777186	0	253434	2022-08-21	2022-08-15
19476	1724299	57762072	0	253368	2022-08-21	2022-08-15
19481	1724570	24777989	0	253368	2022-08-21	2022-08-15
19486	1725009	57775426	0	253368	2022-08-21	2022-08-15
19491	1430481	25467844	1	250202	2022-08-21	2022-08-15
19495	1727923	57803064	1	253468	2022-08-21	2022-08-15
19496	1450135	25520026	0	250202	2022-08-21	2022-08-15
19524	1720427	57727056	1	253453	2022-08-21	2022-08-15
19529	1722985	57734020	0	253453	2022-08-21	2022-08-15
19534	1303431	25152995	0	253133	2022-08-21	2022-08-15
19536	1725519	57758752	0	252269	2022-08-21	2022-08-15
19539	1416682	25429934	1	253133	2022-08-21	2022-08-15
19541	1726124	57787850	1	252269	2022-08-21	2022-08-15
19545	1718061	25577102	1	251851	2022-08-21	2022-08-15
19546	1728585	57792540	0	252269	2022-08-21	2022-08-15
16039	1720204	25266293	0	249982	2022-08-07	2022-08-01
16044	1732163		0	249998	2022-08-07	2022-08-01
16069	1409823	25411200	0	249575	2022-08-07	2022-08-01
16074	1410830	25406636	0	249575	2022-08-07	2022-08-01
16087	1727130	57797818	0	249982	2022-08-07	2022-08-01
16093	1713834	57637890	1	249466	2022-08-07	2022-08-01
16102	1707028	57555428	1	249477	2022-08-07	2022-08-01
16112	1467303	25427676	0	249575	2022-08-07	2022-08-01
16115	1731765		0	249982	2022-08-07	2022-08-01
16117	1711262	57611100	0	249492	2022-08-07	2022-08-01
16120	1036297	24750125	1	249811	2022-08-07	2022-08-01
16122	1711774	57624792	0	249575	2022-08-07	2022-08-01
16125	1064521	24754307	1	249811	2022-08-07	2022-08-01
16127	1712082	57609096	1	249492	2022-08-07	2022-08-01
16130	1712714	57623258	0	249477	2022-08-07	2022-08-01
16133	1714380	24794017	0	249575	2022-08-07	2022-08-01
16135	1712720	57618242	1	249477	2022-08-07	2022-08-01
16145	1713654	57626392	1	249492	2022-08-07	2022-08-01
16150	1712389	57594522	1	249601	2022-08-07	2022-08-01
16155	1713231	25486708	0	249601	2022-08-07	2022-08-01
16170	1719001	25529818	0	249575	2022-08-07	2022-08-01
16177	1414122	25213397	0	249481	2022-08-07	2022-08-01
19393	1727141	57797750	0	253514	2022-08-21	2022-08-15
19397	1725462	57781774	1	249622	2022-08-21	2022-08-15
19399	1726028	57787570	1	253467	2022-08-21	2022-08-15
19402	1721202	57729810	0	253474	2022-08-21	2022-08-15
19404	1726049	57783064	1	253467	2022-08-21	2022-08-15
19407	1725425	57777282	1	253474	2022-08-21	2022-08-15
19409	1726184	57751352	1	253467	2022-08-21	2022-08-15
19414	1726226	23864827	0	253467	2022-08-21	2022-08-15
19419	1726294	57777248	1	253467	2022-08-21	2022-08-15
19424	1730217	57812990	0	253912	2022-08-21	2022-08-15
19426	1724975	57758496	1	252698	2022-08-21	2022-08-15
19429	1725678	57785328	1	252698	2022-08-21	2022-08-15
19432	1462581	25567846	0	250451	2022-08-21	2022-08-15
19444	1724870	57755076	1	253434	2022-08-21	2022-08-15
19449	739803	22938799	1	252633	2022-08-21	2022-08-15
19455	1724919	57678572	1	253434	2022-08-21	2022-08-15
19460	1727626	23083873	1	253524	2022-08-21	2022-08-15
19465	1727716	24706803	1	253524	2022-08-21	2022-08-15
19470	1728752	24889929	1	253524	2022-08-21	2022-08-15
19477	1036224	24751847	1	250202	2022-08-21	2022-08-15
19479	1725402	57777528	1	253434	2022-08-21	2022-08-15
19482	1319728	25188321	0	250202	2022-08-21	2022-08-15
19484	1725477	57776808	0	253434	2022-08-21	2022-08-15
19487	1319899	25203255	0	250202	2022-08-21	2022-08-15
19489	1725548	57781834	0	253434	2022-08-21	2022-08-15
19509	1723390	57755652	0	253253	2022-08-21	2022-08-15
19514	1725284	57782618	0	253253	2022-08-21	2022-08-15
19519	1727346	57784140	1	250202	2022-08-21	2022-08-15
19525	1029545	24659961	0	253133	2022-08-21	2022-08-15
19530	1040510	24773923	1	253133	2022-08-21	2022-08-15
19535	1715972	16983755	0	251851	2022-08-21	2022-08-15
19537	1711190	57611342	0	249589	2022-08-21	2022-08-15
16040	1731751		0	249998	2022-08-07	2022-08-01
16042	1714218	24698811	1	249599	2022-08-07	2022-08-01
16045	1721091		0	249982	2022-08-07	2022-08-01
16047	1721094	24831355	0	249982	2022-08-07	2022-08-01
16052	1721213	22953375	0	249982	2022-08-07	2022-08-01
16057	1721431	23226477	0	249982	2022-08-07	2022-08-01
16062	1721475		0	249982	2022-08-07	2022-08-01
16067	1460073	25565474	0	249466	2022-08-07	2022-08-01
16072	1723111	25533162	0	249982	2022-08-07	2022-08-01
16077	1724844	25244035	0	249982	2022-08-07	2022-08-01
16082	1726973	24438261	0	249982	2022-08-07	2022-08-01
16092	1729535		0	249982	2022-08-07	2022-08-01
16094	1443260	25502748	0	249575	2022-08-07	2022-08-01
16097	1414959	25420118	1	249477	2022-08-07	2022-08-01
16099	690166	16978471	1	249811	2022-08-07	2022-08-01
16104	738821	23003871	1	249811	2022-08-07	2022-08-01
16107	1464581	25580586	0	249575	2022-08-07	2022-08-01
16109	756287		1	249811	2022-08-07	2022-08-01
16114	781008	25469300	1	249811	2022-08-07	2022-08-01
16119	1731777		0	249982	2022-08-07	2022-08-01
16124	1732110		0	249982	2022-08-07	2022-08-01
16129	1326970	25230707	1	249811	2022-08-07	2022-08-01
16132	1712972	57614196	1	249492	2022-08-07	2022-08-01
16134	1702495		0	249811	2022-08-07	2022-08-01
16137	1714385	57642314	0	249575	2022-08-07	2022-08-01
16142	1715018	57646864	0	249575	2022-08-07	2022-08-01
16144	1713043	57631224	1	249477	2022-08-07	2022-08-01
16149	1713498	57634576	1	249477	2022-08-07	2022-08-01
16160	1713238	22565901	0	249601	2022-08-07	2022-08-01
16165	1713712	57636806	1	249477	2022-08-07	2022-08-01
16167	1714913	57612850	1	249492	2022-08-07	2022-08-01
16169	1714950	57646258	1	249492	2022-08-07	2022-08-01
16172	622530	22057279	1	249465	2022-08-07	2022-08-01
16174	1719087	25531488	0	249575	2022-08-07	2022-08-01
16179	1719833	25551104	0	249575	2022-08-07	2022-08-01
16192	1712949	57631622	0	249481	2022-08-07	2022-08-01
19446	1719914	21725485	0	253524	2022-08-21	2022-08-15
19451	1721075	24789431	0	253524	2022-08-21	2022-08-15
19457	1716682	24884391	1	250451	2022-08-21	2022-08-15
19458	1076867	24908761	1	252633	2022-08-21	2022-08-15
19462	1728633	57791084	1	250451	2022-08-21	2022-08-15
19463	1174593	24990253	1	252633	2022-08-21	2022-08-15
19467	1729373	57792224	1	250451	2022-08-21	2022-08-15
19468	1200054	25018503	1	252633	2022-08-21	2022-08-15
19473	1726068	57786616	0	252633	2022-08-21	2022-08-15
19494	1718052	25549936	1	252269	2022-08-21	2022-08-15
19499	1723758	57759976	0	252269	2022-08-21	2022-08-15
19501	1714883	25545700	0	250202	2022-08-21	2022-08-15
19504	1724296	57762190	1	252269	2022-08-21	2022-08-15
19506	757751	23111869	1	251851	2022-08-21	2022-08-15
19511	1277154	21710193	0	251851	2022-08-21	2022-08-15
19516	1303719	25149829	1	251851	2022-08-21	2022-08-15
19523	1728632	57807146	0	250202	2022-08-21	2022-08-15
19528	1729638	57793794	1	250202	2022-08-21	2022-08-15
19533	1727555	57762014	0	253453	2022-08-21	2022-08-15
19538	1727629	57801066	1	253453	2022-08-21	2022-08-15
19544	764713	23215139	0	253914	2022-08-21	2022-08-15
16041	1714173		1	249887	2022-08-07	2022-08-01
16048	669244	22542673	0	249466	2022-08-07	2022-08-01
16050	1466130	25583402	0	249488	2022-08-07	2022-08-01
16053	1384209	25315052	0	249466	2022-08-07	2022-08-01
16055	1710877	57595386	1	249488	2022-08-07	2022-08-01
16058	1440231	25492199	0	249466	2022-08-07	2022-08-01
16060	1711285	57610824	1	249488	2022-08-07	2022-08-01
16063	1447441	25516670	1	249466	2022-08-07	2022-08-01
16065	1711510	57616258	1	249488	2022-08-07	2022-08-01
16068	1723044	25451408	0	249982	2022-08-07	2022-08-01
16070	1712329	57617896	1	249488	2022-08-07	2022-08-01
16073	1711272	57615940	1	249466	2022-08-07	2022-08-01
16075	1712675	57629242	1	249488	2022-08-07	2022-08-01
16078	1711459	25576032	0	249466	2022-08-07	2022-08-01
16080	1712686	57627576	1	249488	2022-08-07	2022-08-01
16083	1711479	57611426	1	249466	2022-08-07	2022-08-01
16085	1712702	57629616	1	249488	2022-08-07	2022-08-01
16088	1712202	25567180	1	249466	2022-08-07	2022-08-01
16090	1712777	57609342	0	249488	2022-08-07	2022-08-01
16095	1712971	57631172	1	249854	2022-08-07	2022-08-01
16098	1447059	25502920	0	249575	2022-08-07	2022-08-01
16100	1713762	57632430	1	249854	2022-08-07	2022-08-01
16103	1449348	25518398	0	249575	2022-08-07	2022-08-01
16105	1730493		0	249982	2022-08-07	2022-08-01
16108	766591	23236679	1	249492	2022-08-07	2022-08-01
16110	1730602		0	249982	2022-08-07	2022-08-01
16113	1708950	57593342	0	249492	2022-08-07	2022-08-01
16118	1711717	57624308	0	249575	2022-08-07	2022-08-01
16123	1711635	57618222	0	249492	2022-08-07	2022-08-01
16128	1711792	57624948	0	249575	2022-08-07	2022-08-01
16140	1712846	57630138	1	249477	2022-08-07	2022-08-01
16151	1714153	57633020	1	249492	2022-08-07	2022-08-01
16156	1714409	57642472	1	249492	2022-08-07	2022-08-01
16161	1714814	57644374	1	249492	2022-08-07	2022-08-01
16175	1448206	25510940	0	249469	2022-08-07	2022-08-01
16178	1728971	57808116	0	249997	2022-08-07	2022-08-01
16180	1708460	57589816	1	249465	2022-08-07	2022-08-01
16183	1729274	57808972	0	249997	2022-08-07	2022-08-01
16185	1466048	25585746	0	249469	2022-08-07	2022-08-01
16188	1729343	57809204	0	249997	2022-08-07	2022-08-01
16190	1466656	25587922	0	249469	2022-08-07	2022-08-01
16193	1729412	57809354	0	249997	2022-08-07	2022-08-01
16195	1713535	25566434	1	249469	2022-08-07	2022-08-01
16198	1729511	57809684	0	249997	2022-08-07	2022-08-01
16200	1712129	57595610	1	249465	2022-08-07	2022-08-01
16205	1712262	57617874	1	249465	2022-08-07	2022-08-01
16210	1712300	57592498	0	249465	2022-08-07	2022-08-01
16215	1712315	25552608	1	249465	2022-08-07	2022-08-01
16220	1712350	57617668	1	249465	2022-08-07	2022-08-01
16225	1712358	25915509	0	249465	2022-08-07	2022-08-01
16230	1712513	57628080	1	249465	2022-08-07	2022-08-01
16236	1731759	57784116	0	249997	2022-08-07	2022-08-01
16240	1724542	57767452	0	249575	2022-08-07	2022-08-01
16243	1732104	57822464	0	249997	2022-08-07	2022-08-01
19547	1727862	57792734	0	253453	2022-08-21	2022-08-15
19559	1717323	25424230	1	253914	2022-08-21	2022-08-15
19562	1718681		0	253133	2022-08-21	2022-08-15
19564	1724053	25544772	0	253914	2022-08-21	2022-08-15
19567	1718698		0	253133	2022-08-21	2022-08-15
19569	1724640	57767722	1	253914	2022-08-21	2022-08-15
19572	1725215	57780602	1	253133	2022-08-21	2022-08-15
19574	1727478	57793728	1	253914	2022-08-21	2022-08-15
19577	1730752	57814054	0	252269	2022-08-21	2022-08-15
19579	1730449	57804702	1	253914	2022-08-21	2022-08-15
19584	1248980	24425829	0	252672	2022-08-21	2022-08-15
19587	1039811	24775713	0	252139	2022-08-21	2022-08-15
19589	1723723	57759926	0	252672	2022-08-21	2022-08-15
19592	1043236	24756157	1	252139	2022-08-21	2022-08-15
19612	1726332	57789590	1	253435	2022-08-21	2022-08-15
19617	1726390	24758549	0	253435	2022-08-21	2022-08-15
19622	1726566	57790780	1	253435	2022-08-21	2022-08-15
19647	1724462	57766550	1	252279	2022-08-21	2022-08-15
19652	1726649	25291050	1	251602	2022-08-21	2022-08-15
19654	780393		0	251676	2022-08-21	2022-08-15
19657	1725830	57784404	0	255104	2022-08-21	2022-08-15
19659	1380667	25273375	1	251676	2022-08-21	2022-08-15
19664	655945	22292989	1	251450	2022-08-21	2022-08-15
19669	1372594	25208249	0	251450	2022-08-21	2022-08-15
19672	1723033	25555982	1	251676	2022-08-21	2022-08-15
19677	1723083	57751110	1	251676	2022-08-21	2022-08-15
19692	1714855	57645764	0	250925	2022-08-21	2022-08-15
19697	1715669	25558818	0	250925	2022-08-21	2022-08-15
19717	1724136	57760502	1	251583	2022-08-21	2022-08-15
19722	1726045	57786552	1	251583	2022-08-21	2022-08-15
19724	530544	21719889	0	251190	2022-08-21	2022-08-15
19727	1724092	57764610	0	251852	2022-08-21	2022-08-15
19730	1719676	57700006	0	256569	2022-08-21	2022-08-15
19732	1724245	57765192	0	251852	2022-08-21	2022-08-15
19735	1727713	57754964	1	256569	2022-08-21	2022-08-15
19737	1728501	57807156	1	251583	2022-08-21	2022-08-15
19739	1728634	57805570	0	252034	2022-08-21	2022-08-15
19741	1724604	57763082	0	251852	2022-08-21	2022-08-15
19746	1724663	57768010	0	251852	2022-08-21	2022-08-15
19749	622088		0	251453	2022-08-21	2022-08-15
19754	1716017	25281831	0	251453	2022-08-21	2022-08-15
19759	1724564	57766932	1	251453	2022-08-21	2022-08-15
19781	1720017	57715308	1	251143	2022-08-21	2022-08-15
19786	1726408	25518214	0	251143	2022-08-21	2022-08-15
19791	1729461	57809042	0	251143	2022-08-21	2022-08-15
19799	1715838	57653076	0	253796	2022-08-21	2022-08-15
19801	1043317	24800143	1	252782	2022-08-21	2022-08-15
19806	1233460	25011943	0	252782	2022-08-21	2022-08-15
19811	1291419	25131903	1	252782	2022-08-21	2022-08-15
19838	413291	16317397	1	250156	2022-08-21	2022-08-15
19843	1725213	57774744	1	249930	2022-08-21	2022-08-15
19848	1725646	57781530	0	249930	2022-08-21	2022-08-15
19851	1726133	57786560	1	253796	2022-08-21	2022-08-15
19853	1727288	57790998	1	249930	2022-08-21	2022-08-15
19856	1726158	57781428	1	253796	2022-08-21	2022-08-15
19858	1727733	57792990	0	249930	2022-08-21	2022-08-15
19863	1728291	57803174	0	249930	2022-08-21	2022-08-15
19866	1718692	22672081	0	252444	2022-08-21	2022-08-15
19871	1719061	25428046	1	250932	2022-08-21	2022-08-15
16043	1710334	57601026	0	249854	2022-08-07	2022-08-01
16051	1710541	25582282	1	249854	2022-08-07	2022-08-01
16054	773926	23226015	0	249575	2022-08-07	2022-08-01
16056	1710758	57608144	1	249854	2022-08-07	2022-08-01
16059	1018866	24306113	0	249575	2022-08-07	2022-08-01
16061	1711100	57611310	1	249854	2022-08-07	2022-08-01
16064	1370352	25286547	0	249575	2022-08-07	2022-08-01
16066	1711420	57616950	1	249854	2022-08-07	2022-08-01
16071	1711738	57617098	1	249854	2022-08-07	2022-08-01
16076	1711758	57623084	1	249854	2022-08-07	2022-08-01
16079	1411709	25203541	0	249575	2022-08-07	2022-08-01
16086	1712434	57627230	1	249854	2022-08-07	2022-08-01
16096	1729543		0	249982	2022-08-07	2022-08-01
16101	1729546		0	249982	2022-08-07	2022-08-01
16136	1712977	57608578	1	249492	2022-08-07	2022-08-01
16138	289438	7294889	0	249997	2022-08-07	2022-08-01
16141	1713235	57625700	1	249492	2022-08-07	2022-08-01
16143	525265	21687615	0	249997	2022-08-07	2022-08-01
16146	1715760	25546592	0	249575	2022-08-07	2022-08-01
16148	640994	21658665	0	249997	2022-08-07	2022-08-01
16153	1322392	25211882	0	249997	2022-08-07	2022-08-01
16157	1717353	25550974	0	249575	2022-08-07	2022-08-01
16158	1713592	57635922	0	249997	2022-08-07	2022-08-01
16162	1718724	57680528	0	249575	2022-08-07	2022-08-01
16163	1723026		0	249997	2022-08-07	2022-08-01
16166	1718877	57676796	0	249575	2022-08-07	2022-08-01
16168	1724887	57771658	0	249997	2022-08-07	2022-08-01
16173	1726770		0	249997	2022-08-07	2022-08-01
16176	1707729	25435440	1	249465	2022-08-07	2022-08-01
16181	1465732	25553412	1	249469	2022-08-07	2022-08-01
16186	1709845	57594982	1	249465	2022-08-07	2022-08-01
16191	1710921	57609066	1	249465	2022-08-07	2022-08-01
16196	1711983	57617902	1	249465	2022-08-07	2022-08-01
16201	1713695	57632454	1	249481	2022-08-07	2022-08-01
16203	529002	21719835	1	249813	2022-08-07	2022-08-01
16206	1714443	57642044	1	249481	2022-08-07	2022-08-01
16208	1723105		0	249575	2022-08-07	2022-08-01
16211	1714493	57642810	0	249481	2022-08-07	2022-08-01
16213	1723107	57751238	0	249575	2022-08-07	2022-08-01
19548	1427806	25462160	0	253133	2022-08-21	2022-08-15
19553	1727883	57803112	1	253453	2022-08-21	2022-08-15
19558	1728678	57794804	1	253453	2022-08-21	2022-08-15
19580	1727201	57790082	1	253133	2022-08-21	2022-08-15
19595	1726844	57795090	1	252760	2022-08-21	2022-08-15
19598	1724617	57766822	1	252672	2022-08-21	2022-08-15
19600	1727429	57787686	1	252760	2022-08-21	2022-08-15
19603	1725248	57780770	0	252672	2022-08-21	2022-08-15
19605	1727517	57800570	0	252760	2022-08-21	2022-08-15
19608	1726301	57789396	1	253435	2022-08-21	2022-08-15
19610	1465031	25581050	1	252139	2022-08-21	2022-08-15
19615	1717262	24903035	0	252139	2022-08-21	2022-08-15
19618	756221	22984799	1	255104	2022-08-21	2022-08-15
19620	1717272	57666902	0	252139	2022-08-21	2022-08-15
19623	1164327	24988201	1	255104	2022-08-21	2022-08-15
19625	1719879	25006119	0	252139	2022-08-21	2022-08-15
19628	1293728	24191661	1	255104	2022-08-21	2022-08-15
19630	1730115	57810234	1	252672	2022-08-21	2022-08-15
19635	1722606	25567024	0	252139	2022-08-21	2022-08-15
19638	1726234	57788798	1	251602	2022-08-21	2022-08-15
19640	1724120	57759288	0	252139	2022-08-21	2022-08-15
19643	1726261	57789040	0	251602	2022-08-21	2022-08-15
19645	1724558	57761586	0	252139	2022-08-21	2022-08-15
19648	1726281	57789288	0	251602	2022-08-21	2022-08-15
19650	1726246	57788708	1	252139	2022-08-21	2022-08-15
19655	1730866	57813686	1	252139	2022-08-21	2022-08-15
19660	1727707	57790678	1	252279	2022-08-21	2022-08-15
19665	1727873	23629377	1	252279	2022-08-21	2022-08-15
19670	1727933	57803272	1	252279	2022-08-21	2022-08-15
19675	1729033	57803800	1	252279	2022-08-21	2022-08-15
19680	1730577	57819370	1	252279	2022-08-21	2022-08-15
19683	756221	22984799	0	251852	2022-08-21	2022-08-15
19685	1730611		0	252279	2022-08-21	2022-08-15
19688	756762	23076359	1	251852	2022-08-21	2022-08-15
19690	1466301	25586422	0	252034	2022-08-21	2022-08-15
19693	1038503	24764911	0	251852	2022-08-21	2022-08-15
19695	1712903	25595598	0	252034	2022-08-21	2022-08-15
19698	1164327	24988201	0	251852	2022-08-21	2022-08-15
19700	1722549	25532998	0	252034	2022-08-21	2022-08-15
19703	1272933	24414483	1	251852	2022-08-21	2022-08-15
19705	1722558	25533360	0	252034	2022-08-21	2022-08-15
19708	1293728	24191661	0	251852	2022-08-21	2022-08-15
19710	1722828	25503112	1	252034	2022-08-21	2022-08-15
19713	1303826	25044749	0	251852	2022-08-21	2022-08-15
19715	1722840	25524710	1	252034	2022-08-21	2022-08-15
19720	1724233	57759590	0	252034	2022-08-21	2022-08-15
19723	1723138	18000441	0	251852	2022-08-21	2022-08-15
19725	1724664	57761944	1	252034	2022-08-21	2022-08-15
19742	1717308	57667308	0	251190	2022-08-21	2022-08-15
19745	593178	21927109	1	251453	2022-08-21	2022-08-15
19747	1717309	57667328	0	251190	2022-08-21	2022-08-15
19752	1718924	57682732	1	251190	2022-08-21	2022-08-15
19765	1724115	57762078	1	251812	2022-08-21	2022-08-15
19770	1724647	57765646	1	251812	2022-08-21	2022-08-15
19775	1730544	57807742	1	251812	2022-08-21	2022-08-15
19783	767095	23243515	0	250967	2022-08-21	2022-08-15
19788	1379592	25306152	1	250967	2022-08-21	2022-08-15
19792	775955	23344953	0	252782	2022-08-21	2022-08-15
19804	744933	23066517	0	249930	2022-08-21	2022-08-15
19809	1408906	25070353	0	249930	2022-08-21	2022-08-15
19812	1721079	25527748	1	250971	2022-08-21	2022-08-15
19814	1410121	25409278	0	249930	2022-08-21	2022-08-15
19819	1714302	25577236	0	249930	2022-08-21	2022-08-15
19822	1723632	57762512	0	250971	2022-08-21	2022-08-15
19824	1718185	57673472	1	249930	2022-08-21	2022-08-15
19827	1724913	57762106	1	250971	2022-08-21	2022-08-15
19829	1723646	57758896	0	249930	2022-08-21	2022-08-15
19832	1727470	57794626	1	250971	2022-08-21	2022-08-15
19834	1723682	57759224	0	249930	2022-08-21	2022-08-15
19837	1725644	57783486	1	253796	2022-08-21	2022-08-15
19840	1728475	57766524	0	250967	2022-08-21	2022-08-15
19842	1725999	57783252	1	253796	2022-08-21	2022-08-15
19845	1729043	57808232	0	250967	2022-08-21	2022-08-15
19847	1726040	57787576	1	253796	2022-08-21	2022-08-15
19862	1718684	22971953	0	252444	2022-08-21	2022-08-15
19872	1710741	57608208	1	253488	2022-08-21	2022-08-15
19877	1711279	57616014	1	253488	2022-08-21	2022-08-15
19881	1713817	57632274	0	253488	2022-08-21	2022-08-15
19884	1724944	57759660	1	249818	2022-08-21	2022-08-15
19886	1717706	57668356	1	253488	2022-08-21	2022-08-15
19889	1725645	57783708	1	249818	2022-08-21	2022-08-15
19891	1718031	57674196	0	253488	2022-08-21	2022-08-15
19906	605474	21963165	0	250171	2022-08-21	2022-08-15
19911	1318500	25191475	0	249761	2022-08-21	2022-08-15
19934	1695407	25860725	0	250171	2022-08-21	2022-08-15
19939	1725580	57784498	1	255071	2022-08-21	2022-08-15
19944	1726221	57761188	0	255071	2022-08-21	2022-08-15
19949	1724777	57765494	0	250171	2022-08-21	2022-08-15
19954	1726342	57789588	1	253470	2022-08-21	2022-08-15
19959	1725544	57779456	0	250171	2022-08-21	2022-08-15
19964	1726969	57793422	1	253470	2022-08-21	2022-08-15
19976	1054079	24839365	0	250035	2022-08-21	2022-08-15
19979	1727798	57793002	0	255071	2022-08-21	2022-08-15
19984	1727859	57803068	1	255071	2022-08-21	2022-08-15
19987	1716279	25495285	0	251809	2022-08-21	2022-08-15
19994	1725488	57782944	1	249590	2022-08-21	2022-08-15
19999	1720994	57731032	1	253454	2022-08-21	2022-08-15
19549	1328738	25235567	1	253914	2022-08-21	2022-08-15
19563	1728710	57805572	1	253453	2022-08-21	2022-08-15
19568	1728740	57807440	1	253453	2022-08-21	2022-08-15
19573	1728888	57676776	1	253453	2022-08-21	2022-08-15
19578	1729319	57697314	1	253453	2022-08-21	2022-08-15
19583	1705752		0	253435	2022-08-21	2022-08-15
19586	522166	21633027	0	252614	2022-08-21	2022-08-15
19588	1721156	57728838	0	253435	2022-08-21	2022-08-15
19591	1725714	57785468	0	252614	2022-08-21	2022-08-15
19593	1722512	57729184	0	253435	2022-08-21	2022-08-15
19599	1057396	24866347	1	251602	2022-08-21	2022-08-15
19604	1157821	24979643	1	251602	2022-08-21	2022-08-15
19609	1286283	25125423	0	251602	2022-08-21	2022-08-15
19614	1409674	25410930	0	251602	2022-08-21	2022-08-15
19616	1725536	57783958	1	252672	2022-08-21	2022-08-15
19619	1453380	25543972	1	251602	2022-08-21	2022-08-15
19621	1725944	57786908	0	252672	2022-08-21	2022-08-15
19624	1713462	57634834	0	251602	2022-08-21	2022-08-15
19626	1729634	57788812	1	252672	2022-08-21	2022-08-15
19631	1721627	25194009	0	252139	2022-08-21	2022-08-15
19633	1720334	25574878	0	251602	2022-08-21	2022-08-15
19639	1723138	18000441	1	255104	2022-08-21	2022-08-15
19644	1724092	57764610	0	255104	2022-08-21	2022-08-15
19649	1724245	57765192	1	255104	2022-08-21	2022-08-15
19661	1726580	57792084	1	255104	2022-08-21	2022-08-15
19667	1140201	24966767	1	252034	2022-08-21	2022-08-15
19671	1414546	25424468	0	252034	2022-08-21	2022-08-15
19674	1714741	57645214	1	251450	2022-08-21	2022-08-15
19678	1722789	25504448	1	251450	2022-08-21	2022-08-15
19681	1466170	25581254	0	252034	2022-08-21	2022-08-15
19684	1461611	25557984	1	250925	2022-08-21	2022-08-15
19689	1468176	25584738	1	250925	2022-08-21	2022-08-15
19691	1726136	57788304	1	251450	2022-08-21	2022-08-15
19694	1450862	25425570	0	251583	2022-08-21	2022-08-15
19696	1727646	57792312	1	251450	2022-08-21	2022-08-15
19701	1727749	57775326	1	251450	2022-08-21	2022-08-15
19704	1719712	25576352	0	251583	2022-08-21	2022-08-15
19706	1727763		0	251450	2022-08-21	2022-08-15
19709	1719909	57701866	0	251583	2022-08-21	2022-08-15
19711	1729716	57810524	1	251450	2022-08-21	2022-08-15
19716	1723428	57760324	0	250925	2022-08-21	2022-08-15
19719	518924	21629335	0	251190	2022-08-21	2022-08-15
19721	1724747	57769894	1	250925	2022-08-21	2022-08-15
19726	1726245	57787162	1	251583	2022-08-21	2022-08-15
19729	1727399	57789464	1	252034	2022-08-21	2022-08-15
19731	1726929	57793740	0	251583	2022-08-21	2022-08-15
19734	1727519	57800082	1	252034	2022-08-21	2022-08-15
19736	1724381	57763076	1	251852	2022-08-21	2022-08-15
19740	1729720	57794260	0	256569	2022-08-21	2022-08-15
19757	1719921		0	251190	2022-08-21	2022-08-15
19762	1719930	25074955	1	251190	2022-08-21	2022-08-15
19764	1020091	21889057	0	251451	2022-08-21	2022-08-15
19769	1719836	24778749	0	251451	2022-08-21	2022-08-15
19774	1722751	57746180	1	251451	2022-08-21	2022-08-15
19779	1722757	57747720	1	251451	2022-08-21	2022-08-15
19782	394789		1	252782	2022-08-21	2022-08-15
19784	1723672	57759230	0	251451	2022-08-21	2022-08-15
19787	551851	21862279	1	252782	2022-08-21	2022-08-15
19789	1724454	57758920	0	251451	2022-08-21	2022-08-15
19794	1725742	57784162	1	251451	2022-08-21	2022-08-15
19797	1041577	24782813	1	252782	2022-08-21	2022-08-15
19802	1719498	57699814	1	253796	2022-08-21	2022-08-15
19807	1721548	57728896	0	253796	2022-08-21	2022-08-15
19810	1721633	25468726	0	250967	2022-08-21	2022-08-15
19815	1723450	57759898	1	250967	2022-08-21	2022-08-15
19817	1721432	25524860	0	250971	2022-08-21	2022-08-15
19820	1723599	57762380	1	250967	2022-08-21	2022-08-15
19825	1725265	57780156	0	250967	2022-08-21	2022-08-15
19828	1724701	57761774	0	253796	2022-08-21	2022-08-15
19830	1726908	57792662	0	250967	2022-08-21	2022-08-15
19833	1724799	57591334	0	253796	2022-08-21	2022-08-15
19835	1728325	57804188	1	250967	2022-08-21	2022-08-15
19852	519662	21636029	1	250932	2022-08-21	2022-08-15
19857	795503	22973217	0	250932	2022-08-21	2022-08-15
19868	1729908		0	249930	2022-08-21	2022-08-15
19870	1721022	25511462	0	252444	2022-08-21	2022-08-15
19875	1724334	57762364	1	252444	2022-08-21	2022-08-15
19880	1727648	25111007	1	250932	2022-08-21	2022-08-15
19885	1727780	57780094	0	250932	2022-08-21	2022-08-15
19890	1728880	57807938	1	250932	2022-08-21	2022-08-15
19893	1725712	57780484	1	249818	2022-08-21	2022-08-15
16046	1710339	57596116	1	249854	2022-08-07	2022-08-01
16049	734645	22958819	0	249575	2022-08-07	2022-08-01
16081	1712432	57627188	1	249854	2022-08-07	2022-08-01
16084	1415506	25426814	0	249575	2022-08-07	2022-08-01
16089	1425958	25456538	0	249575	2022-08-07	2022-08-01
16091	1712845	57609804	0	249854	2022-08-07	2022-08-01
16106	1711659	57618424	0	249477	2022-08-07	2022-08-01
16111	1712095	57617420	1	249477	2022-08-07	2022-08-01
16116	1712325	57611742	0	249477	2022-08-07	2022-08-01
16121	1712515	57628170	1	249477	2022-08-07	2022-08-01
16126	1712694	57628592	1	249477	2022-08-07	2022-08-01
16131	1708952	25812771	1	250050	2022-08-07	2022-08-01
16139	1712540		0	249811	2022-08-07	2022-08-01
16147	1277953	25114711	0	249601	2022-08-07	2022-08-01
16152	1716734	25530808	0	249575	2022-08-07	2022-08-01
16154	1713511	57634344	0	249477	2022-08-07	2022-08-01
19550	1720149	23111977	1	251851	2022-08-21	2022-08-15
19552	1461341	25565114	0	253133	2022-08-21	2022-08-15
19555	1720736	24316119	1	251851	2022-08-21	2022-08-15
19557	1712441		0	253133	2022-08-21	2022-08-15
19560	1723737	57759300	1	251851	2022-08-21	2022-08-15
19565	1724282	57760168	1	251851	2022-08-21	2022-08-15
19570	1725830	57784404	1	251851	2022-08-21	2022-08-15
19575	1727734	57801996	1	251851	2022-08-21	2022-08-15
19582	956675		0	252139	2022-08-21	2022-08-15
19585	1422237	25445596	1	252760	2022-08-21	2022-08-15
19590	1726728	57792918	1	252760	2022-08-21	2022-08-15
19597	1725913	57777864	1	253435	2022-08-21	2022-08-15
19602	1725932	57782378	0	253435	2022-08-21	2022-08-15
19607	1725482	57779234	1	252672	2022-08-21	2022-08-15
19613	525265	21687615	0	255104	2022-08-21	2022-08-15
19627	1726579	57790680	1	253435	2022-08-21	2022-08-15
19632	1726706	57790846	0	253435	2022-08-21	2022-08-15
19637	1723522	57759346	1	252279	2022-08-21	2022-08-15
19642	1723732	24764163	0	252279	2022-08-21	2022-08-15
19653	1724604	57763082	1	255104	2022-08-21	2022-08-15
19658	1728879	24837797	1	251602	2022-08-21	2022-08-15
19682	1724794	57769628	1	251450	2022-08-21	2022-08-15
19687	1725641	57785062	1	251450	2022-08-21	2022-08-15
19702	1717186	25229433	1	250925	2022-08-21	2022-08-15
19707	1722669	25557730	1	250925	2022-08-21	2022-08-15
19712	1723378	57760548	0	250925	2022-08-21	2022-08-15
19718	1317440	25192651	0	251852	2022-08-21	2022-08-15
19743	1729593	57809928	1	252034	2022-08-21	2022-08-15
19748	1729997	57812472	1	256569	2022-08-21	2022-08-15
19750	1715780	57653476	0	251812	2022-08-21	2022-08-15
19755	1717129	25443152	0	251812	2022-08-21	2022-08-15
19758	1730162	57812652	1	256569	2022-08-21	2022-08-15
19761	1727459	57800140	1	251852	2022-08-21	2022-08-15
19767	1727100	57780808	0	251190	2022-08-21	2022-08-15
19772	1727638	57798798	0	251190	2022-08-21	2022-08-15
19773	1730561	57811650	1	256569	2022-08-21	2022-08-15
19777	1728428		0	251190	2022-08-21	2022-08-15
19778	1730708	57813540	1	256569	2022-08-21	2022-08-15
19796	1714492	57642630	1	250967	2022-08-21	2022-08-15
19816	1306990	21578381	0	252782	2022-08-21	2022-08-15
19821	1363165	25273777	0	252782	2022-08-21	2022-08-15
19826	1397812	24172227	1	252782	2022-08-21	2022-08-15
19831	1467708	25592976	0	252782	2022-08-21	2022-08-15
19836	1725219	57778556	0	252782	2022-08-21	2022-08-15
19839	1724877	57771406	1	249930	2022-08-21	2022-08-15
19841	1726287	57789332	1	252782	2022-08-21	2022-08-15
19844	611675	21981297	1	250156	2022-08-21	2022-08-15
19846	1728567	57804170	1	252782	2022-08-21	2022-08-15
19849	1043397	24200779	0	250156	2022-08-21	2022-08-15
19854	1256409	25082195	1	250156	2022-08-21	2022-08-15
19859	1275567	25047755	1	250156	2022-08-21	2022-08-15
19861	1456753	25526622	0	250932	2022-08-21	2022-08-15
19864	1410120	25292614	0	250156	2022-08-21	2022-08-15
19867	1708154	57585644	1	253488	2022-08-21	2022-08-15
19869	1717814	57672588	0	250156	2022-08-21	2022-08-15
19874	1724873	57761228	0	249818	2022-08-21	2022-08-15
19879	1724908	57765452	1	249818	2022-08-21	2022-08-15
19882	1726549	57792860	0	250156	2022-08-21	2022-08-15
19887	1730419	57813324	0	250156	2022-08-21	2022-08-15
19894	1729162	57808510	1	250932	2022-08-21	2022-08-15
19899	1729489	57764262	1	250932	2022-08-21	2022-08-15
19904	1722707	57746288	0	253488	2022-08-21	2022-08-15
19907	1728583		0	251807	2022-08-21	2022-08-15
19909	1726312	57789552	1	253488	2022-08-21	2022-08-15
19914	1030369	21968261	0	250171	2022-08-21	2022-08-15
19919	1442848	25501368	0	250171	2022-08-21	2022-08-15
19924	1452503	25542818	0	250171	2022-08-21	2022-08-15
19929	1725452	57781448	1	255071	2022-08-21	2022-08-15
19935	1723608	57758942	1	249761	2022-08-21	2022-08-15
19940	1724856	57610212	1	253470	2022-08-21	2022-08-15
19945	1726174	57784074	1	249623	2022-08-21	2022-08-15
19950	1726347	57784066	0	249623	2022-08-21	2022-08-15
19955	1725364	57780678	0	250171	2022-08-21	2022-08-15
19960	1726636	57792932	1	253470	2022-08-21	2022-08-15
19965	1725607	57784396	0	250171	2022-08-21	2022-08-15
19969	1727303	57798796	0	255071	2022-08-21	2022-08-15
19974	1727210	57793218	1	253470	2022-08-21	2022-08-15
19977	1723670	57760046	1	249590	2022-08-21	2022-08-15
16159	1713659	57632490	1	249477	2022-08-07	2022-08-01
16164	1714162	25266933	1	249601	2022-08-07	2022-08-01
16171	1414005	25423390	0	249469	2022-08-07	2022-08-01
16184	1719858	57705580	0	249575	2022-08-07	2022-08-01
16187	1712915	57630846	1	249481	2022-08-07	2022-08-01
16189	1720781	25586358	0	249575	2022-08-07	2022-08-01
16194	1721207	25220377	0	249575	2022-08-07	2022-08-01
16199	1721544	57735796	0	249575	2022-08-07	2022-08-01
16202	1729869	57812290	0	249997	2022-08-07	2022-08-01
16207	1729886	57812364	0	249997	2022-08-07	2022-08-01
16212	1729939	57812474	0	249997	2022-08-07	2022-08-01
16217	1729984	57812564	0	249997	2022-08-07	2022-08-01
16222	1730274	57813136	0	249997	2022-08-07	2022-08-01
16227	1731188	57817228	0	249997	2022-08-07	2022-08-01
16232	1731698	57818736	0	249997	2022-08-07	2022-08-01
16234	1712587	57627306	1	249465	2022-08-07	2022-08-01
16244	1724556	57767552	0	249575	2022-08-07	2022-08-01
16247	1710326	57595324	1	249456	2022-08-07	2022-08-01
16252	1711141	57614740	1	249472	2022-08-07	2022-08-01
19551	1728770	57794010	1	252269	2022-08-21	2022-08-15
19554	1417731	25418688	1	253914	2022-08-21	2022-08-15
19556	1729587	57800050	1	252269	2022-08-21	2022-08-15
19561	1729608	57789474	1	252269	2022-08-21	2022-08-15
19566	1729982	57811214	1	252269	2022-08-21	2022-08-15
19571	1730425	57811042	1	252269	2022-08-21	2022-08-15
19576	1726170	57787618	1	253133	2022-08-21	2022-08-15
19581	657181	22408799	0	252760	2022-08-21	2022-08-15
19594	1724131	57761454	1	252672	2022-08-21	2022-08-15
19596	1164760	24783781	1	252139	2022-08-21	2022-08-15
19601	1314963	25183453	0	252139	2022-08-21	2022-08-15
19606	1427701	25461264	1	252139	2022-08-21	2022-08-15
19611	1725493	57783954	1	252672	2022-08-21	2022-08-15
19629	1713468	57634894	0	251602	2022-08-21	2022-08-15
19634	1317440	25192651	1	255104	2022-08-21	2022-08-15
19636	1726776	57792834	0	253435	2022-08-21	2022-08-15
19641	1726814	57795192	0	253435	2022-08-21	2022-08-15
19646	1726880	57793876	1	253435	2022-08-21	2022-08-15
19651	1726314	57787868	1	252279	2022-08-21	2022-08-15
19656	1726456		0	252279	2022-08-21	2022-08-15
19662	632887	22154493	1	252034	2022-08-21	2022-08-15
19663	1428985	25463706	0	251676	2022-08-21	2022-08-15
19666	1727734	57801996	0	255104	2022-08-21	2022-08-15
19668	1721107	57731838	1	251676	2022-08-21	2022-08-15
19673	289438	7294889	0	251852	2022-08-21	2022-08-15
19676	1414577	25424920	0	252034	2022-08-21	2022-08-15
19679	439138	17976165	1	251852	2022-08-21	2022-08-15
19686	1466175	25588206	0	252034	2022-08-21	2022-08-15
19699	1468596	25528840	1	251583	2022-08-21	2022-08-15
19714	1723661	57760056	0	251583	2022-08-21	2022-08-15
19728	636880	22202025	0	251190	2022-08-21	2022-08-15
19733	1294276	25133605	0	251190	2022-08-21	2022-08-15
19738	1421484	25443014	0	251190	2022-08-21	2022-08-15
19744	1729940	57809720	1	256569	2022-08-21	2022-08-15
19751	1724988	57775202	1	251852	2022-08-21	2022-08-15
19753	1730000	57811674	1	256569	2022-08-21	2022-08-15
19756	1726580	57792084	0	251852	2022-08-21	2022-08-15
19760	1722989	57750024	1	251812	2022-08-21	2022-08-15
19763	1730374	57803868	1	256569	2022-08-21	2022-08-15
19766	1727580	57800656	1	251852	2022-08-21	2022-08-15
19768	1730417	57807816	1	256569	2022-08-21	2022-08-15
19771	1727753	25545206	1	251852	2022-08-21	2022-08-15
19776	1728651	57814334	1	251852	2022-08-21	2022-08-15
19780	1730713	57812924	1	256569	2022-08-21	2022-08-15
19785	1730717	57812466	1	256569	2022-08-21	2022-08-15
19790	1730728	57813532	1	256569	2022-08-21	2022-08-15
19793	1464703	25580960	1	250967	2022-08-21	2022-08-15
19795	1729655	57803204	1	251143	2022-08-21	2022-08-15
19798	1728144	57803946	0	251451	2022-08-21	2022-08-15
19800	1719097		1	250967	2022-08-21	2022-08-15
19803	1461231	25556592	1	250971	2022-08-21	2022-08-15
19805	1720007	25213088	0	250967	2022-08-21	2022-08-15
19808	1721019	25234653	0	250971	2022-08-21	2022-08-15
19813	1721611	57732250	1	253796	2022-08-21	2022-08-15
19818	1722998	57749514	1	253796	2022-08-21	2022-08-15
19823	1723184	57752234	0	253796	2022-08-21	2022-08-15
19850	1728655	57804542	1	252782	2022-08-21	2022-08-15
19855	1728927	57807616	1	252782	2022-08-21	2022-08-15
19860	1727113	57792728	0	253796	2022-08-21	2022-08-15
19865	1716042	25288894	0	250932	2022-08-21	2022-08-15
19892	1720145	25586550	0	251807	2022-08-21	2022-08-15
19897	1723026		1	251807	2022-08-21	2022-08-15
19900	1722578	57668760	1	253488	2022-08-21	2022-08-15
19902	1726770		1	251807	2022-08-21	2022-08-15
19905	1729116	57805110	0	249822	2022-08-21	2022-08-15
19908	1730667		1	249818	2022-08-21	2022-08-15
19912	1055124	23844597	0	249623	2022-08-21	2022-08-15
19915	1315824	25114965	0	255071	2022-08-21	2022-08-15
19917	1308787	22951267	0	249623	2022-08-21	2022-08-15
19920	1725348	57780576	1	255071	2022-08-21	2022-08-15
19922	1714696	57640134	1	249623	2022-08-21	2022-08-15
19925	1725411	57759206	0	255071	2022-08-21	2022-08-15
19927	1715306	20697999	0	249623	2022-08-21	2022-08-15
19930	1467171	25583214	0	250171	2022-08-21	2022-08-15
19932	1717534	25503726	1	249623	2022-08-21	2022-08-15
19936	1721192	57732120	0	253470	2022-08-21	2022-08-15
19941	1725272	57778434	0	249761	2022-08-21	2022-08-15
19946	1726038	57787416	1	253470	2022-08-21	2022-08-15
19951	1726316	57789090	1	253470	2022-08-21	2022-08-15
19956	1726806	57794102	0	255071	2022-08-21	2022-08-15
19961	1726876	57792320	1	255071	2022-08-21	2022-08-15
19967	1367470	25280673	0	249590	2022-08-21	2022-08-15
19970	1725781	57784970	0	250171	2022-08-21	2022-08-15
19972	1715277	24214657	1	249590	2022-08-21	2022-08-15
16182	1709262	25878567	1	249481	2022-08-07	2022-08-01
16235	1715349	57615000	1	249481	2022-08-07	2022-08-01
16237	1724479	57767032	0	249575	2022-08-07	2022-08-01
16242	1712617	57628908	0	249465	2022-08-07	2022-08-01
16245	1708165	57585742	0	249472	2022-08-07	2022-08-01
16255	1710892	57608188	1	249456	2022-08-07	2022-08-01
16260	1711305	57615878	1	249472	2022-08-07	2022-08-01
16262	1711482	57608858	1	249456	2022-08-07	2022-08-01
16265	1449093	25521880	0	249830	2022-08-07	2022-08-01
16275	1713642	57632358	1	249472	2022-08-07	2022-08-01
16277	1711151	57611802	1	251116	2022-08-07	2022-08-01
16283	1712207	57625888	1	249456	2022-08-07	2022-08-01
16290	1714121	57594294	1	251116	2022-08-07	2022-08-01
19873	1718047	22947769	1	250156	2022-08-21	2022-08-15
19876	1722721	25130329	0	250932	2022-08-21	2022-08-15
19878	1718090	57674706	1	250156	2022-08-21	2022-08-15
19883	525265	21687615	1	251807	2022-08-21	2022-08-15
19888	1711257	57611392	0	251807	2022-08-21	2022-08-15
19896	1723656	57762710	0	249822	2022-08-21	2022-08-15
19901	1729114	57805112	0	249822	2022-08-21	2022-08-15
19916	1680764	25778507	0	249761	2022-08-21	2022-08-15
19923	1730714	57810158	0	253488	2022-08-21	2022-08-15
19928	1730786	57809748	1	253488	2022-08-21	2022-08-15
19933	1725499	57783924	1	255071	2022-08-21	2022-08-15
19937	1719629	23062525	1	249623	2022-08-21	2022-08-15
19938	1719987	25559418	0	250171	2022-08-21	2022-08-15
19943	1724155	57759724	0	250171	2022-08-21	2022-08-15
19948	1726278	25509030	0	255071	2022-08-21	2022-08-15
19953	1727149	57790840	1	249623	2022-08-21	2022-08-15
19957	1726410	57790042	1	249761	2022-08-21	2022-08-15
19958	1727376	57799272	0	249623	2022-08-21	2022-08-15
19962	1729247	57790604	1	249761	2022-08-21	2022-08-15
19963	1727499	57789106	0	249623	2022-08-21	2022-08-15
19978	1727704	57800536	1	253470	2022-08-21	2022-08-15
19981	1724123	57759786	1	249590	2022-08-21	2022-08-15
19983	1727721	57801934	1	253470	2022-08-21	2022-08-15
19986	1724172	24212269	1	249590	2022-08-21	2022-08-15
19988	1727726	57800192	1	253470	2022-08-21	2022-08-15
19992	1717921	57671208	1	251809	2022-08-21	2022-08-15
19993	1712358	25915509	0	253454	2022-08-21	2022-08-15
19998	1302051	24793325	1	253933	2022-08-21	2022-08-15
20003	1397102	23632417	0	253933	2022-08-21	2022-08-15
20008	1723143	22996455	0	253933	2022-08-21	2022-08-15
20013	1727231	57791876	1	250035	2022-08-21	2022-08-15
20018	1725539		0	253933	2022-08-21	2022-08-15
20023	1725557		1	253933	2022-08-21	2022-08-15
20028	1725651		0	253933	2022-08-21	2022-08-15
20031	1718515	57641806	1	251585	2022-08-21	2022-08-15
20034	1080546	24773407	1	252605	2022-08-21	2022-08-15
20039	1274035	25106213	0	252605	2022-08-21	2022-08-15
20061	1727689	57799390	1	250032	2022-08-21	2022-08-15
20063	1723720	57763068	0	252605	2022-08-21	2022-08-15
20066	1728708	57805040	0	250032	2022-08-21	2022-08-15
20068	1724875	57767496	1	252605	2022-08-21	2022-08-15
20074	1326555	25208661	0	252451	2022-08-21	2022-08-15
20079	1693769	25851009	0	252451	2022-08-21	2022-08-15
20084	1724513	57761990	0	253436	2022-08-21	2022-08-15
20086	629031	22118487	0	251458	2022-08-21	2022-08-15
20089	1726397	57789452	0	252451	2022-08-21	2022-08-15
20091	1079748	24910749	1	251458	2022-08-21	2022-08-15
20096	1716948	25045841	0	251458	2022-08-21	2022-08-15
20098	1269577	25101207	0	250979	2022-08-21	2022-08-15
20103	1719982	24740241	0	250979	2022-08-21	2022-08-15
20108	1724237	57760784	1	250979	2022-08-21	2022-08-15
20112	1719144	57682514	0	252967	2022-08-21	2022-08-15
20113	1724347	57761890	1	250979	2022-08-21	2022-08-15
20117	1720423	25081999	1	252967	2022-08-21	2022-08-15
20122	1722969	25511284	0	252967	2022-08-21	2022-08-15
20127	1725977	24932429	0	250979	2022-08-21	2022-08-15
20132	1726286	24818207	1	252967	2022-08-21	2022-08-15
20133	1274994	24948891	0	253299	2022-08-21	2022-08-15
20141	1724138	57764352	0	249908	2022-08-21	2022-08-15
20147	1724248	57761504	0	253299	2022-08-21	2022-08-15
20154	1726761	57788558	1	253299	2022-08-21	2022-08-15
20157	1104661	24936699	0	249815	2022-08-21	2022-08-15
20159	1727806	57802904	1	253299	2022-08-21	2022-08-15
20162	1415318	25424262	1	249956	2022-08-21	2022-08-15
20164	1727834	57802988	0	253299	2022-08-21	2022-08-15
20167	1430632	25220537	0	249956	2022-08-21	2022-08-15
20169	1728943	25875303	0	253299	2022-08-21	2022-08-15
20172	1446733	25420536	0	249956	2022-08-21	2022-08-15
20174	1729021	57807944	1	253299	2022-08-21	2022-08-15
20177	1464069	25579500	1	249956	2022-08-21	2022-08-15
20179	1729544	57793916	0	253299	2022-08-21	2022-08-15
20182	1467566	24721281	0	249956	2022-08-21	2022-08-15
20184	1729954	57810906	0	253299	2022-08-21	2022-08-15
20187	1714367	57641774	0	249956	2022-08-21	2022-08-15
20189	1730182	57812898	1	253299	2022-08-21	2022-08-15
20212	761693	22984609	0	253176	2022-08-21	2022-08-15
20214	1292234	25118715	1	254618	2022-08-21	2022-08-15
20219	1717064	25485242	0	249807	2022-08-21	2022-08-15
20222	666303	22528045	0	252469	2022-08-21	2022-08-15
20229	1728875	23134339	0	252469	2022-08-21	2022-08-15
20232	1718995	25126065	0	253176	2022-08-21	2022-08-15
20234	1723433	57761632	1	249807	2022-08-21	2022-08-15
20240	1724303	57761830	0	253176	2022-08-21	2022-08-15
20247	1725535	57780056	0	249807	2022-08-21	2022-08-15
20249	1729590	57809872	1	254618	2022-08-21	2022-08-15
16197	1712955	57631694	1	249481	2022-08-07	2022-08-01
16204	1722524	25510018	0	249575	2022-08-07	2022-08-01
16209	1030948	24449063	0	249813	2022-08-07	2022-08-01
16214	1293728	24191661	1	249813	2022-08-07	2022-08-01
16219	1323904	25218099	1	249813	2022-08-07	2022-08-01
16224	1418990	25434166	1	249813	2022-08-07	2022-08-01
16229	1714529		0	249813	2022-08-07	2022-08-01
16239	1732060	57822326	0	249997	2022-08-07	2022-08-01
16246	1724766	57770216	0	249575	2022-08-07	2022-08-01
16249	1710088	57599508	1	249476	2022-08-07	2022-08-01
16259	1711375	57609336	0	249456	2022-08-07	2022-08-01
16264	1711014	57613276	1	249476	2022-08-07	2022-08-01
19895	1718458	57677436	1	253488	2022-08-21	2022-08-15
19898	1727298	57787076	0	249818	2022-08-21	2022-08-15
19903	1729458	57807032	0	249818	2022-08-21	2022-08-15
19910	642180	22242171	0	250171	2022-08-21	2022-08-15
19913	1726941	57790514	1	253488	2022-08-21	2022-08-15
19918	1727418	57788110	1	253488	2022-08-21	2022-08-15
19921	1718990	57682448	0	249761	2022-08-21	2022-08-15
19926	1718992		1	249761	2022-08-21	2022-08-15
19931	1720447	25278219	1	249761	2022-08-21	2022-08-15
19942	1724503	57763242	1	249623	2022-08-21	2022-08-15
19947	1726220	57775112	0	249761	2022-08-21	2022-08-15
19952	1726339	57789432	1	249761	2022-08-21	2022-08-15
19966	1727033	57797496	0	255071	2022-08-21	2022-08-15
19968	1727768	57790326	0	249623	2022-08-21	2022-08-15
19971	1727104	57790752	0	253470	2022-08-21	2022-08-15
19973	1728728	57804960	1	249623	2022-08-21	2022-08-15
19980	1226460	24942355	0	250035	2022-08-21	2022-08-15
19985	1409570	25409660	0	250035	2022-08-21	2022-08-15
19991	1058939	24877949	1	253933	2022-08-21	2022-08-15
19997	1719101		1	251809	2022-08-21	2022-08-15
20002	1719103		1	251809	2022-08-21	2022-08-15
20007	1723600	57759400	0	253454	2022-08-21	2022-08-15
20012	1724132	57761640	0	253454	2022-08-21	2022-08-15
20030	1719711	25424212	0	250032	2022-08-21	2022-08-15
20033	1726568	57793144	1	253454	2022-08-21	2022-08-15
20035	1722540	24055965	0	250032	2022-08-21	2022-08-15
20041	1723391	57760924	1	251585	2022-08-21	2022-08-15
20046	1724950	57767004	1	250032	2022-08-21	2022-08-15
20051	1725734	57782352	1	250032	2022-08-21	2022-08-15
20056	1727239	57790866	0	250032	2022-08-21	2022-08-15
20064	1687436	25813899	0	253436	2022-08-21	2022-08-15
20069	1719312	57658104	0	253436	2022-08-21	2022-08-15
20075	1729068	57803888	1	251585	2022-08-21	2022-08-15
20092	1724699	57766662	0	253436	2022-08-21	2022-08-15
20094	1727710	57801940	0	253619	2022-08-21	2022-08-15
20099	1716956	57664680	0	251458	2022-08-21	2022-08-15
20102	1047691	24766543	0	252967	2022-08-21	2022-08-15
20104	1725730	57778818	1	251458	2022-08-21	2022-08-15
20107	1718044	25162369	0	252967	2022-08-21	2022-08-15
20109	1724187	57758956	0	249923	2022-08-21	2022-08-15
20114	1724553	57766330	1	249923	2022-08-21	2022-08-15
20119	1724702	57759066	0	249923	2022-08-21	2022-08-15
20125	1726187	57780982	0	251458	2022-08-21	2022-08-15
20130	1729192	57805704	1	251458	2022-08-21	2022-08-15
20135	1727871	57792928	0	249923	2022-08-21	2022-08-15
20137	1716837		0	253299	2022-08-21	2022-08-15
20140	1727911	57611994	1	252967	2022-08-21	2022-08-15
20143	1723099	57750826	0	251136	2022-08-21	2022-08-15
20150	758561	23133571	0	249592	2022-08-21	2022-08-15
20152	1036766	24749767	0	249815	2022-08-21	2022-08-15
20155	1097938	24707489	0	249592	2022-08-21	2022-08-15
20158	1317906	25196439	0	249836	2022-08-21	2022-08-15
20160	1451566	25530534	0	249592	2022-08-21	2022-08-15
20163	1322255	25211992	1	249836	2022-08-21	2022-08-15
20165	1466603	25558690	0	249592	2022-08-21	2022-08-15
20168	1322568	25198643	0	249815	2022-08-21	2022-08-15
20170	1714381	25920017	0	249592	2022-08-21	2022-08-15
20173	1391097	25305868	0	249815	2022-08-21	2022-08-15
20175	1715284	25920089	1	249592	2022-08-21	2022-08-15
20178	1724581	57759326	1	249815	2022-08-21	2022-08-15
20180	1717624	25413322	1	249592	2022-08-21	2022-08-15
20183	1724971	25558680	0	249815	2022-08-21	2022-08-15
20185	1724601	57760624	1	249592	2022-08-21	2022-08-15
20188	1725591	57784280	1	249815	2022-08-21	2022-08-15
20202	1730767	57813950	0	253299	2022-08-21	2022-08-15
20207	1730853	57813688	0	253299	2022-08-21	2022-08-15
20213	1727529	57779340	0	255072	2022-08-21	2022-08-15
20220	1341618	25199905	0	253176	2022-08-21	2022-08-15
20227	1723417	57757508	0	249807	2022-08-21	2022-08-15
20230	1717269	57665940	0	254618	2022-08-21	2022-08-15
20235	1720337	57556030	0	253176	2022-08-21	2022-08-15
20237	1720339	57726156	1	254618	2022-08-21	2022-08-15
20242	1724880	57761622	0	249807	2022-08-21	2022-08-15
20248	1727627	57784546	0	253176	2022-08-21	2022-08-15
20250	1724608	57759030	1	250981	2022-08-21	2022-08-15
20252	1729633	57810028	1	253176	2022-08-21	2022-08-15
20257	1726976	57796452	1	250981	2022-08-21	2022-08-15
20262	1719007	57649320	1	253797	2022-08-21	2022-08-15
20267	1711364	23655375	1	249566	2022-08-21	2022-08-15
20272	1726224	57788762	1	253797	2022-08-21	2022-08-15
20275	1726284	57789312	1	253797	2022-08-21	2022-08-15
20277	1717564	25579350	0	252699	2022-08-21	2022-08-15
20282	1712615	25419830	1	249566	2022-08-21	2022-08-15
20287	1727388	57791802	0	253797	2022-08-21	2022-08-15
20292	1728504	57804954	1	252699	2022-08-21	2022-08-15
20300	1712904	21630579	0	249566	2022-08-21	2022-08-15
20305	1730137	57780618	0	253472	2022-08-21	2022-08-15
20308	1725972	57767034	0	249551	2022-08-21	2022-08-15
20315	1730783	57812996	1	253472	2022-08-21	2022-08-15
20320	1725419	57767506	1	252277	2022-08-21	2022-08-15
20325	1718195	57643768	0	253455	2022-08-21	2022-08-15
19975	1727772	57802682	0	255071	2022-08-21	2022-08-15
19989	1409582	25410802	0	250035	2022-08-21	2022-08-15
19995	1711507	57746174	0	250035	2022-08-21	2022-08-15
20000	1712544	57746324	1	250035	2022-08-21	2022-08-15
20005	1729098	57793812	0	249590	2022-08-21	2022-08-15
20010	1729154	57808324	1	249590	2022-08-21	2022-08-15
20015	1729559	57789772	1	249590	2022-08-21	2022-08-15
20020	1724761	57750728	0	253454	2022-08-21	2022-08-15
20021	1410626	25413190	1	251585	2022-08-21	2022-08-15
20024	1729368	57809272	1	250035	2022-08-21	2022-08-15
16216	1714683	57643910	1	249481	2022-08-07	2022-08-01
16218	1723437	57761678	0	249575	2022-08-07	2022-08-01
16221	1714694	57643950	1	249481	2022-08-07	2022-08-01
16223	1723555	57762330	0	249575	2022-08-07	2022-08-01
16226	1714822	57645362	1	249481	2022-08-07	2022-08-01
16228	1723618	57762664	0	249575	2022-08-07	2022-08-01
16231	1714863	57643680	1	249481	2022-08-07	2022-08-01
16233	1723644	57762566	0	249575	2022-08-07	2022-08-01
16238	1712614	57628514	1	249465	2022-08-07	2022-08-01
16241	1164877	24982627	0	249472	2022-08-07	2022-08-01
16251	1710330	57595716	0	249456	2022-08-07	2022-08-01
16256	1711300	57610126	0	249472	2022-08-07	2022-08-01
16258	1729644	57803400	0	249575	2022-08-07	2022-08-01
16261	1710747	25917839	1	249476	2022-08-07	2022-08-01
16270	1711747	57612018	0	249456	2022-08-07	2022-08-01
16273	1713820	57626778	0	249830	2022-08-07	2022-08-01
16276	1711176	57615008	0	249476	2022-08-07	2022-08-01
16278	1712098	57612176	0	249456	2022-08-07	2022-08-01
16285	1714301	57639734	0	249472	2022-08-07	2022-08-01
16291	1712212	57616676	1	249456	2022-08-07	2022-08-01
16298	1714921	25551832	0	251116	2022-08-07	2022-08-01
16300	1708308	57584424	1	249460	2022-08-07	2022-08-01
16303	1711659	57618424	0	249476	2022-08-07	2022-08-01
16305	1712522	57628110	1	249456	2022-08-07	2022-08-01
16318	1713499	57635156	1	249460	2022-08-07	2022-08-01
16320	531903	21764879	0	249497	2022-08-07	2022-08-01
16326	1712104	57617908	1	249450	2022-08-07	2022-08-01
16333	1712321	57609252	1	249450	2022-08-07	2022-08-01
16335	1710906	57607756	0	249462	2022-08-07	2022-08-01
16340	1712811	57613696	0	249450	2022-08-07	2022-08-01
16345	1453385	25544646	0	249497	2022-08-07	2022-08-01
16347	1711049	57612964	1	249462	2022-08-07	2022-08-01
16352	1712896	57609160	1	249450	2022-08-07	2022-08-01
16362	1711164	57614818	1	249462	2022-08-07	2022-08-01
16365	1468012	25593358	1	249497	2022-08-07	2022-08-01
16372	1713638	57617320	1	249450	2022-08-07	2022-08-01
16375	1714245	57633072	1	249420	2022-08-07	2022-08-01
16377	1712235	57625938	1	249462	2022-08-07	2022-08-01
16383	1710877	57595386	0	249489	2022-08-07	2022-08-01
16387	1714697	57645060	0	249420	2022-08-07	2022-08-01
16395	1711221	57611668	1	249478	2022-08-07	2022-08-01
16397	1710749	57608036	0	249453	2022-08-07	2022-08-01
16402	1710868	57609516	1	249453	2022-08-07	2022-08-01
16410	1712653	57627720	1	249478	2022-08-07	2022-08-01
16413	1712974	57631796	1	249478	2022-08-07	2022-08-01
16415	1715300	57648720	1	249493	2022-08-07	2022-08-01
16417	1711147	57612702	1	249453	2022-08-07	2022-08-01
16425	1714332	57641810	1	249473	2022-08-07	2022-08-01
16427	1714359	57636232	1	249473	2022-08-07	2022-08-01
16432	1452284	25542198	1	249449	2022-08-07	2022-08-01
16440	1714472	57585188	1	249473	2022-08-07	2022-08-01
16442	1712284	57625604	1	249467	2022-08-07	2022-08-01
16445	1712357	57617284	0	249467	2022-08-07	2022-08-01
16447	1711191	57614612	1	249449	2022-08-07	2022-08-01
16458	1712888	57627754	1	249467	2022-08-07	2022-08-01
16460	1712908	57631384	1	249467	2022-08-07	2022-08-01
16462	1711601	57617014	1	249449	2022-08-07	2022-08-01
16473	1711020	57613090	1	249457	2022-08-07	2022-08-01
16475	1711046	57613464	1	249457	2022-08-07	2022-08-01
16478	1711258	57599834	1	249457	2022-08-07	2022-08-01
16480	1708345	57588170	1	249486	2022-08-07	2022-08-01
16482	1714861	57643882	1	249461	2022-08-07	2022-08-01
16493	1712208	57617772	0	249457	2022-08-07	2022-08-01
16495	1711054	57612880	1	249486	2022-08-07	2022-08-01
16497	1715309	57627940	1	249461	2022-08-07	2022-08-01
16502	1711285	57610824	1	249486	2022-08-07	2022-08-01
16505	1712932	57610150	1	249457	2022-08-07	2022-08-01
16512	1711803	57624984	1	249486	2022-08-07	2022-08-01
16517	1711241	57612096	0	249475	2022-08-07	2022-08-01
16522	1711506	57612040	1	249475	2022-08-07	2022-08-01
16527	1695419	25862131	1	249463	2022-08-07	2022-08-01
16532	1710733	25142227	1	249463	2022-08-07	2022-08-01
16537	1710954	57611850	1	249463	2022-08-07	2022-08-01
16542	1711312	57608238	0	249463	2022-08-07	2022-08-01
16547	1707703	57580038	1	248963	2022-08-07	2022-08-01
16552	1709767	57595832	1	248963	2022-08-07	2022-08-01
16557	1710340	57590738	1	248963	2022-08-07	2022-08-01
16562	1712088	57617750	1	248963	2022-08-07	2022-08-01
16568	1718224	57671388	1	251228	2022-08-14	2022-08-08
16572	1301692	25150577	1	250750	2022-08-14	2022-08-08
16576	1450643	25528182	0	251477	2022-08-14	2022-08-08
16581	1718444	57677812	0	251228	2022-08-14	2022-08-08
16586	1453807	25545302	0	249606	2022-08-14	2022-08-08
16588	1715289		0	251675	2022-08-14	2022-08-08
16592	1714546	57643362	0	250750	2022-08-14	2022-08-08
16601	1715749	57652966	1	250750	2022-08-14	2022-08-08
16627	736031	22971255	1	249660	2022-08-14	2022-08-08
19982	590346	21910635	1	251809	2022-08-21	2022-08-15
19990	1725430	57765008	0	249590	2022-08-21	2022-08-15
19996	1281516		0	253933	2022-08-21	2022-08-15
20001	1726362	57789696	0	249590	2022-08-21	2022-08-15
20006	1727203	57766914	1	251809	2022-08-21	2022-08-15
20011	1727219	57791176	1	251809	2022-08-21	2022-08-15
20016	1724248	57761504	1	253454	2022-08-21	2022-08-15
20017	766824	23250691	0	251585	2022-08-21	2022-08-15
20032	1725676		0	253933	2022-08-21	2022-08-15
20037	1725715		0	253933	2022-08-21	2022-08-15
20042	1725726		1	253933	2022-08-21	2022-08-15
20047	1725737		0	253933	2022-08-21	2022-08-15
16248	1710954	57611850	0	249472	2022-08-07	2022-08-01
16250	1725982	25210301	0	249575	2022-08-07	2022-08-01
16253	1710320	57595478	1	249476	2022-08-07	2022-08-01
16263	1712300	57592498	1	249472	2022-08-07	2022-08-01
16268	1711151	57611802	0	249476	2022-08-07	2022-08-01
16271	1712966	57631818	0	249472	2022-08-07	2022-08-01
16279	1713815	57637222	1	249472	2022-08-07	2022-08-01
16286	1713820	57626778	0	251116	2022-08-07	2022-08-01
16288	1711302	57612498	0	249476	2022-08-07	2022-08-01
16293	1714326	57638232	1	249472	2022-08-07	2022-08-01
16296	1711494	57609228	0	249476	2022-08-07	2022-08-01
16306	1715938	25266027	0	251116	2022-08-07	2022-08-01
16308	1712216	57608910	0	249460	2022-08-07	2022-08-01
16313	1719113	25218991	0	251116	2022-08-07	2022-08-01
16323	1710743	57594166	0	249462	2022-08-07	2022-08-01
16328	1316303	25188491	0	249497	2022-08-07	2022-08-01
16334	1714347	57634844	0	249460	2022-08-07	2022-08-01
16342	1439702	25491051	1	249497	2022-08-07	2022-08-01
16349	1714537	57610952	0	249460	2022-08-07	2022-08-01
16351	1711087		0	249462	2022-08-07	2022-08-01
16356	1712907	57627534	1	249450	2022-08-07	2022-08-01
16359	1711400	57610866	1	249420	2022-08-07	2022-08-01
16366	1711251	57608580	1	249462	2022-08-07	2022-08-01
16369	1468270	25582120	1	249497	2022-08-07	2022-08-01
16376	1712967	25570778	0	249497	2022-08-07	2022-08-01
16381	1712255	57626114	1	249462	2022-08-07	2022-08-01
16386	1708936	57592158	0	249478	2022-08-07	2022-08-01
16391	1710067	57600434	1	249453	2022-08-07	2022-08-01
16396	1714866	57637912	1	249420	2022-08-07	2022-08-01
16401	1711494	57609228	1	249478	2022-08-07	2022-08-01
16404	1712266	57608672	0	249478	2022-08-07	2022-08-01
16409	1714986	57643738	0	249493	2022-08-07	2022-08-01
16411	1710999	57613146	1	249453	2022-08-07	2022-08-01
16416	1369487	25278733	0	249467	2022-08-07	2022-08-01
16419	1707018	57573718	1	249467	2022-08-07	2022-08-01
16421	1711348	57610966	1	249473	2022-08-07	2022-08-01
16426	1711255	57615328	1	249453	2022-08-07	2022-08-01
16434	1711737	57609230	1	249467	2022-08-07	2022-08-01
16437	1714469	57637812	1	249473	2022-08-07	2022-08-01
16439	1712107	57608772	0	249467	2022-08-07	2022-08-01
16444	1711160	57614940	1	249449	2022-08-07	2022-08-01
16455	1712875	57630580	1	249467	2022-08-07	2022-08-01
16457	1715301	57637856	1	249473	2022-08-07	2022-08-01
16459	1711508	57608834	1	249449	2022-08-07	2022-08-01
16464	1711713		0	249461	2022-08-07	2022-08-01
16467	1713681	57636736	0	249461	2022-08-07	2022-08-01
16470	1710715	57585512	1	249457	2022-08-07	2022-08-01
16472	1711663	57613472	1	249445	2022-08-07	2022-08-01
16474	1714541	57638614	1	249461	2022-08-07	2022-08-01
16477	1708341	57579966	1	249486	2022-08-07	2022-08-01
16479	1714851	57643710	1	249461	2022-08-07	2022-08-01
16490	1712107	57608772	1	249457	2022-08-07	2022-08-01
16492	1711022	57613370	1	249486	2022-08-07	2022-08-01
16494	1715248	57643934	1	249461	2022-08-07	2022-08-01
16504	1711328	57608824	1	249486	2022-08-07	2022-08-01
16507	1713518	57634320	1	249457	2022-08-07	2022-08-01
16509	1707348	57578690	0	249419	2022-08-07	2022-08-01
16514	1707794	57582598	1	249475	2022-08-07	2022-08-01
16519	1711330	57616438	0	249475	2022-08-07	2022-08-01
16524	1711785	57617684	1	249475	2022-08-07	2022-08-01
16529	1706454	57569396	1	249463	2022-08-07	2022-08-01
16534	1710776	57599846	0	249463	2022-08-07	2022-08-01
16539	1711265	57614712	1	249463	2022-08-07	2022-08-01
16544	1711160	57614940	0	249418	2022-08-07	2022-08-01
16549	1708936	57592158	0	248963	2022-08-07	2022-08-01
16554	1710314	57605130	0	248963	2022-08-07	2022-08-01
16559	1710607	25580400	0	248963	2022-08-07	2022-08-01
16564	1711803	57624984	0	249487	2022-08-07	2022-08-01
16574	1355670	25264687	1	251675	2022-08-14	2022-08-08
16578	1430307	25466784	0	250750	2022-08-14	2022-08-08
16582	1445271	25473764	1	249606	2022-08-14	2022-08-08
16587	1457951	25556114	1	250750	2022-08-14	2022-08-08
16593	1715342		0	251675	2022-08-14	2022-08-08
16598	1715356	25019789	0	251675	2022-08-14	2022-08-08
16603	1717843	25544400	0	250750	2022-08-14	2022-08-08
16606	1718226	25528908	0	250750	2022-08-14	2022-08-08
16608	1164872	24908097	1	250175	2022-08-14	2022-08-08
16613	1311286		0	250175	2022-08-14	2022-08-08
16618	1682106	25582170	0	250175	2022-08-14	2022-08-08
16621	1331017	25242025	1	249594	2022-08-14	2022-08-08
16626	1712278	18055217	0	250175	2022-08-14	2022-08-08
16628	1384209	25315052	0	253195	2022-08-14	2022-08-08
16631	1714197	17667965	1	250175	2022-08-14	2022-08-08
16633	1682121	25583842	1	253195	2022-08-14	2022-08-08
16636	1715066		0	250175	2022-08-14	2022-08-08
20052	1725764		1	253933	2022-08-21	2022-08-15
20004	1718535	57746260	1	250035	2022-08-21	2022-08-15
20009	1723683	57761478	0	250035	2022-08-21	2022-08-15
20014	1725489		0	253933	2022-08-21	2022-08-15
20019	1728403	57806890	1	250035	2022-08-21	2022-08-15
20022	1412669	25419226	0	249560	2022-08-21	2022-08-15
20025	1725889	57776524	1	253454	2022-08-21	2022-08-15
20027	1713471	57631152	0	249560	2022-08-21	2022-08-15
20044	1354926	25192341	0	252605	2022-08-21	2022-08-15
20049	1428470	25205287	0	252605	2022-08-21	2022-08-15
20054	1718190	57675236	1	252605	2022-08-21	2022-08-15
20059	1718193	57642892	1	252605	2022-08-21	2022-08-15
16254	1726018	57787632	0	249575	2022-08-07	2022-08-01
16257	1710333	57595468	0	249476	2022-08-07	2022-08-01
16267	1712965	57624946	0	249472	2022-08-07	2022-08-01
16272	1711157	57614874	1	249476	2022-08-07	2022-08-01
16274	1711798	57617504	1	249456	2022-08-07	2022-08-01
16280	1711232	57615378	0	249476	2022-08-07	2022-08-01
16282	1714167	57638804	1	249472	2022-08-07	2022-08-01
16284	1711274	57594324	1	249476	2022-08-07	2022-08-01
16289	1714317	57641736	1	249472	2022-08-07	2022-08-01
16294	1712223	57609816	1	249456	2022-08-07	2022-08-01
16299	1711506	57612040	0	249476	2022-08-07	2022-08-01
16301	1712511	57628100	1	249456	2022-08-07	2022-08-01
16311	1712691	57609292	1	249460	2022-08-07	2022-08-01
16316	1710739	57595370	0	249462	2022-08-07	2022-08-01
16321	1712093	57617842	0	249450	2022-08-07	2022-08-01
16329	1714258	57641278	0	249460	2022-08-07	2022-08-01
16331	1710761	57607748	1	249462	2022-08-07	2022-08-01
16336	1714400	57637720	1	249460	2022-08-07	2022-08-01
16341	1714499	57633064	0	249460	2022-08-07	2022-08-01
16343	1711008	57613116	1	249462	2022-08-07	2022-08-01
16348	1712885	57629902	1	249450	2022-08-07	2022-08-01
16354	1458220	25552320	1	249497	2022-08-07	2022-08-01
16358	1711135	57594228	1	249462	2022-08-07	2022-08-01
16361	1465819	25586026	0	249497	2022-08-07	2022-08-01
16368	1713440	57634596	1	249450	2022-08-07	2022-08-01
16371	1713813	57637344	0	249420	2022-08-07	2022-08-01
16379	1466130	25583402	0	249489	2022-08-07	2022-08-01
16388	1706782	25529518	1	249453	2022-08-07	2022-08-01
16393	1714856	57643982	1	249420	2022-08-07	2022-08-01
16406	1714886	57645672	1	249493	2022-08-07	2022-08-01
16408	1710921	57609066	1	249453	2022-08-07	2022-08-01
16418	1710954	57611850	1	249473	2022-08-07	2022-08-01
16423	1711175	57612996	1	249453	2022-08-07	2022-08-01
16431	1711661	57618432	1	249467	2022-08-07	2022-08-01
16433	1714387	57638410	0	249473	2022-08-07	2022-08-01
16438	1709640	57596486	1	249449	2022-08-07	2022-08-01
16446	1714531	57643106	0	249473	2022-08-07	2022-08-01
16449	1714679	57643610	1	249473	2022-08-07	2022-08-01
16451	1712761	57630338	1	249467	2022-08-07	2022-08-01
16453	1711403	57609560	1	249449	2022-08-07	2022-08-01
16468	1714391	57638120	1	249461	2022-08-07	2022-08-01
16484	1711306	57616106	0	249457	2022-08-07	2022-08-01
16486	1710757	57607906	0	249486	2022-08-07	2022-08-01
16488	1714968	57631922	1	249461	2022-08-07	2022-08-01
16499	1711196	57612738	0	249486	2022-08-07	2022-08-01
16501	1712770	57630426	0	249457	2022-08-07	2022-08-01
16508	1711635	57618222	0	249486	2022-08-07	2022-08-01
16513	1711808	57618402	1	249486	2022-08-07	2022-08-01
16518	1711294	57616048	1	249475	2022-08-07	2022-08-01
16523	1711655	57618486	1	249475	2022-08-07	2022-08-01
16528	1695664	25861091	1	249463	2022-08-07	2022-08-01
16533	1710752	57608448	1	249463	2022-08-07	2022-08-01
16538	1711254	57611848	1	249463	2022-08-07	2022-08-01
16543	1708953	57591558	0	249418	2022-08-07	2022-08-01
16548	1708600	24316615	1	248963	2022-08-07	2022-08-01
16553	1710232	57598394	1	248963	2022-08-07	2022-08-01
16558	1710599	57596198	1	248963	2022-08-07	2022-08-01
16563	1711328	57608824	0	249487	2022-08-07	2022-08-01
16629	1714288	57639550	1	251240	2022-08-14	2022-08-08
16632	736149	22957449	0	249660	2022-08-14	2022-08-08
16634	1714479	57634280	1	251240	2022-08-14	2022-08-08
16637	741473	23024137	0	249660	2022-08-14	2022-08-08
16639	1714662	57644696	1	251240	2022-08-14	2022-08-08
16654	1715008	57646736	1	251240	2022-08-14	2022-08-08
16661	1412863	25418526	1	249660	2022-08-14	2022-08-08
16666	1423784	25450094	0	249660	2022-08-14	2022-08-08
16671	1427230	25460068	1	249660	2022-08-14	2022-08-08
16676	1715367	57638384	1	251357	2022-08-14	2022-08-08
16679	622530	22057279	0	251239	2022-08-14	2022-08-08
16684	1701389	25909829	1	251239	2022-08-14	2022-08-08
16687	1464229	25577318	1	249660	2022-08-14	2022-08-08
16689	1710868	57609516	1	251239	2022-08-14	2022-08-08
16694	1414183	25423788	1	251582	2022-08-14	2022-08-08
16699	1433680	25474744	1	251582	2022-08-14	2022-08-08
16716	1456892	25551618	0	251045	2022-08-14	2022-08-08
16722	1719116	25291794	1	251582	2022-08-14	2022-08-08
16724	1712793	25555680	0	249840	2022-08-14	2022-08-08
16727	1720246	25513386	1	251582	2022-08-14	2022-08-08
16729	1713502	25913003	1	249840	2022-08-14	2022-08-08
16732	1720334	25574878	1	251582	2022-08-14	2022-08-08
16734	1714211	23300663	0	249840	2022-08-14	2022-08-08
16737	1714700	57645080	0	251047	2022-08-14	2022-08-08
16741	632915	22152749	0	251284	2022-08-14	2022-08-08
16742	1715749	57652966	0	251047	2022-08-14	2022-08-08
16743	1714865	23288333	0	249840	2022-08-14	2022-08-08
16744	1718973	25505076	0	251494	2022-08-14	2022-08-08
20026	1716226	25522120	0	251585	2022-08-21	2022-08-15
20029	1726247	57778038	1	253454	2022-08-21	2022-08-15
20036	1718531	25849159	0	251585	2022-08-21	2022-08-15
20038	1726779	57791538	0	253454	2022-08-21	2022-08-15
20040	1724464	57762974	1	250032	2022-08-21	2022-08-15
20043	1726887	57792802	1	253454	2022-08-21	2022-08-15
20045	1723692	57760160	1	251585	2022-08-21	2022-08-15
20048	1727175	57792518	0	253454	2022-08-21	2022-08-15
20050	1726210	57778340	1	251585	2022-08-21	2022-08-15
16266	1711699	57617168	1	249456	2022-08-07	2022-08-01
16269	1713583	25584216	0	249830	2022-08-07	2022-08-01
16281	1713809	57629668	1	251116	2022-08-07	2022-08-01
16287	1712210	57607860	1	249456	2022-08-07	2022-08-01
16292	1711331	57608410	0	249476	2022-08-07	2022-08-01
16295	1714388	57640056	1	251116	2022-08-07	2022-08-01
16302	1714941	25456184	1	251116	2022-08-07	2022-08-01
16304	1711491	57609330	0	249460	2022-08-07	2022-08-01
16307	1711764	57623768	1	249476	2022-08-07	2022-08-01
16309	1712766	57630042	1	249456	2022-08-07	2022-08-01
16314	1711493	57597452	1	249450	2022-08-07	2022-08-01
16319	1710742	57607626	1	249462	2022-08-07	2022-08-01
16322	1713590	57609386	0	249460	2022-08-07	2022-08-01
16324	741473	23024137	0	249497	2022-08-07	2022-08-01
16330	1712267	57625618	1	249450	2022-08-07	2022-08-01
16337	1712419	57608718	0	249450	2022-08-07	2022-08-01
16339	1710916	57611336	1	249462	2022-08-07	2022-08-01
16344	1712833	57590726	1	249450	2022-08-07	2022-08-01
16350	1456892	25551618	0	249497	2022-08-07	2022-08-01
16357	1460266	25564474	1	249497	2022-08-07	2022-08-01
16364	1713425	25879115	1	249450	2022-08-07	2022-08-01
16367	1713611	57627704	0	249420	2022-08-07	2022-08-01
16374	1711382	57595302	1	249462	2022-08-07	2022-08-01
16382	1714352	57638090	1	249420	2022-08-07	2022-08-01
16384	1714460	57641156	0	249420	2022-08-07	2022-08-01
16389	1709262	25878567	1	249478	2022-08-07	2022-08-01
16392	1710318	57595582	1	249478	2022-08-07	2022-08-01
16394	1710731	57607984	1	249453	2022-08-07	2022-08-01
16399	1714888	57646046	1	249420	2022-08-07	2022-08-01
16407	1712325	57611742	1	249478	2022-08-07	2022-08-01
16412	1715095	57647448	1	249493	2022-08-07	2022-08-01
16414	1711046	57613464	0	249453	2022-08-07	2022-08-01
16422	1710776	57599846	1	249467	2022-08-07	2022-08-01
16424	1710880	57610064	1	249467	2022-08-07	2022-08-01
16429	1711270	57608604	0	249453	2022-08-07	2022-08-01
16436	1711818	57609094	1	249467	2022-08-07	2022-08-01
16441	1710899	57607760	0	249449	2022-08-07	2022-08-01
16452	1714858	57643400	1	249473	2022-08-07	2022-08-01
16454	1714864	57645810	1	249473	2022-08-07	2022-08-01
16456	1711493	57597452	0	249449	2022-08-07	2022-08-01
16461	1458138	25553602	1	249461	2022-08-07	2022-08-01
16466	1710886	57608382	0	249445	2022-08-07	2022-08-01
16469	1711510	57616258	0	249445	2022-08-07	2022-08-01
16471	1714412	57642438	0	249461	2022-08-07	2022-08-01
16476	1714543	57643296	0	249461	2022-08-07	2022-08-01
16487	1711491	57609330	0	249457	2022-08-07	2022-08-01
16489	1710886	57608382	1	249486	2022-08-07	2022-08-01
16491	1715209	57647744	1	249461	2022-08-07	2022-08-01
16506	1711335	57610772	0	249486	2022-08-07	2022-08-01
16511	1713040	57631204	0	249419	2022-08-07	2022-08-01
16516	1710923	57610760	0	249475	2022-08-07	2022-08-01
16521	1711505	57616404	1	249475	2022-08-07	2022-08-01
16526	1712200	57618218	1	249475	2022-08-07	2022-08-01
16531	1710345	57595642	1	249463	2022-08-07	2022-08-01
16536	1710877	57595386	1	249463	2022-08-07	2022-08-01
16541	1711299	57611114	1	249463	2022-08-07	2022-08-01
16546	1707217	25915761	1	248963	2022-08-07	2022-08-01
16551	1708966	57593878	1	248963	2022-08-07	2022-08-01
16556	1710332	57595798	1	248963	2022-08-07	2022-08-01
16561	1710739	57595370	1	248963	2022-08-07	2022-08-01
16638	1711239	57615498	1	253195	2022-08-14	2022-08-08
16641	1712674	25209457	0	249594	2022-08-14	2022-08-08
16646	1713438	24923041	1	249594	2022-08-14	2022-08-08
16648	1714865	23288333	0	253195	2022-08-14	2022-08-08
16651	1715779	20871855	1	249594	2022-08-14	2022-08-08
16653	1715291	25924467	0	253195	2022-08-14	2022-08-08
16656	1718104	25435270	0	250175	2022-08-14	2022-08-08
16678	1042485	24793167	0	251673	2022-08-14	2022-08-08
16681	1715859	57652198	1	251357	2022-08-14	2022-08-08
16683	1463703	25579150	0	251673	2022-08-14	2022-08-08
16686	1715895	57651468	1	251357	2022-08-14	2022-08-08
16688	1465172	25578286	1	251673	2022-08-14	2022-08-08
16691	1715942	57653040	0	251357	2022-08-14	2022-08-08
16693	1710906	57607756	1	251239	2022-08-14	2022-08-08
16696	1464898	25582182	0	249660	2022-08-14	2022-08-08
16698	1712617	57628908	0	251239	2022-08-14	2022-08-08
16701	1466250	25557846	1	249660	2022-08-14	2022-08-08
16703	1714378	57642222	1	251239	2022-08-14	2022-08-08
16706	1716128	25275085	0	249660	2022-08-14	2022-08-08
16708	1714399	57637878	1	251239	2022-08-14	2022-08-08
16715	1711459	25576032	0	249840	2022-08-14	2022-08-08
16720	1716271	57646834	1	251357	2022-08-14	2022-08-08
16725	1716291	57631448	1	251357	2022-08-14	2022-08-08
16730	1716298	57656768	1	251357	2022-08-14	2022-08-08
16735	1716365	57657124	0	251357	2022-08-14	2022-08-08
16738	1714323	22624701	1	249840	2022-08-14	2022-08-08
16739	1715768		0	251494	2022-08-14	2022-08-08
16740	1714965	57646326	1	251239	2022-08-14	2022-08-08
20053	1727392	57791546	1	253454	2022-08-21	2022-08-15
20055	1727714	57802274	0	251585	2022-08-21	2022-08-15
20058	1731546	57818002	1	253454	2022-08-21	2022-08-15
20060	1728446	57790662	1	251585	2022-08-21	2022-08-15
20073	1722542	57627770	1	253436	2022-08-21	2022-08-15
20078	1724298	57717098	1	253436	2022-08-21	2022-08-15
20083	1720028	57625650	0	252451	2022-08-21	2022-08-15
20085	1411284	25283243	0	249923	2022-08-21	2022-08-15
20088	1724660	57767826	1	253436	2022-08-21	2022-08-15
20090	1715270	25490523	0	249923	2022-08-21	2022-08-15
15609	1713046		1	249765	2022-08-07	2022-08-01
15610	1703429	25917735	0	249474	2022-08-07	2022-08-01
15611	1456892	25551618	0	251044	2022-08-07	2022-08-01
15612	1711510	57616258	0	249490	2022-08-07	2022-08-01
15613	735280	22955869	0	250096	2022-08-07	2022-08-01
15614	1713047		1	249765	2022-08-07	2022-08-01
15615	1714761	25558258	0	251044	2022-08-07	2022-08-01
15616	770483	23287947	0	250096	2022-08-07	2022-08-01
15617	1711398	57616720	0	249474	2022-08-07	2022-08-01
15618	1710318	57595582	0	249479	2022-08-07	2022-08-01
15619	1713048		1	249765	2022-08-07	2022-08-01
15620	810665	23775765	0	250096	2022-08-07	2022-08-01
15621	1713049		1	249765	2022-08-07	2022-08-01
15622	1711174	57607698	0	249479	2022-08-07	2022-08-01
15623	1709466	57591468	1	249464	2022-08-07	2022-08-01
15624	1053015	24841485	0	250096	2022-08-07	2022-08-01
15625	1713050		1	249765	2022-08-07	2022-08-01
15626	1711398	57616720	0	249479	2022-08-07	2022-08-01
15627	1710754	57608000	1	249464	2022-08-07	2022-08-01
15628	1055362	24857643	0	250096	2022-08-07	2022-08-01
15629	518957	21631857	0	249498	2022-08-07	2022-08-01
15630	1713051		1	249765	2022-08-07	2022-08-01
15631	1713498	57634576	0	249479	2022-08-07	2022-08-01
15632	1711288	57612392	1	249464	2022-08-07	2022-08-01
15633	1197361	25011411	0	250096	2022-08-07	2022-08-01
15634	526877	21694125	1	249498	2022-08-07	2022-08-01
15635	1713052		1	249765	2022-08-07	2022-08-01
15636	1713511	57634344	0	249479	2022-08-07	2022-08-01
15637	1711296	57615866	1	249464	2022-08-07	2022-08-01
15638	1202923	25015581	0	250096	2022-08-07	2022-08-01
15639	1409674	25410930	1	249498	2022-08-07	2022-08-01
15640	1711300	57610126	1	249464	2022-08-07	2022-08-01
15641	1711783	57594314	0	249597	2022-08-07	2022-08-01
15642	1707256	57577776	0	249468	2022-08-07	2022-08-01
15643	1275647	21568053	0	250096	2022-08-07	2022-08-01
15644	1443403	25502192	1	249498	2022-08-07	2022-08-01
15645	1711333	57608004	1	249464	2022-08-07	2022-08-01
15646	1713449	24914661	0	249597	2022-08-07	2022-08-01
15647	1707768	25577436	1	249468	2022-08-07	2022-08-01
15648	1322000	25210333	0	250096	2022-08-07	2022-08-01
15649	1446306	25510120	1	249498	2022-08-07	2022-08-01
15650	1711345	57616218	1	249464	2022-08-07	2022-08-01
15651	1711601	57617014	1	249468	2022-08-07	2022-08-01
15652	1411288	25415182	0	250096	2022-08-07	2022-08-01
15653	1455886	25528322	0	249498	2022-08-07	2022-08-01
15654	1713711	57611316	0	249839	2022-08-07	2022-08-01
15655	1711363	57616700	1	249464	2022-08-07	2022-08-01
15656	1412842	25270971	0	250096	2022-08-07	2022-08-01
15657	1712319	57617910	1	249468	2022-08-07	2022-08-01
15658	1458281	25534662	0	249498	2022-08-07	2022-08-01
15659	1713820	57626778	0	249839	2022-08-07	2022-08-01
15660	1711369	57610840	1	249464	2022-08-07	2022-08-01
15661	1712688	57627562	0	249468	2022-08-07	2022-08-01
15662	1422135	25446784	0	250096	2022-08-07	2022-08-01
15663	1462392	25571644	0	249498	2022-08-07	2022-08-01
15664	1711427	57611646	0	249464	2022-08-07	2022-08-01
15665	1303603	25153027	1	249792	2022-08-07	2022-08-01
15666	1712941	57626648	1	249468	2022-08-07	2022-08-01
15667	1459996	25559974	0	250096	2022-08-07	2022-08-01
15668	1462525	25573866	0	249498	2022-08-07	2022-08-01
15669	1711449	57610084	1	249464	2022-08-07	2022-08-01
15670	1310777	25173749	1	249792	2022-08-07	2022-08-01
15671	1712954	57629436	1	249468	2022-08-07	2022-08-01
15672	1462193	25557634	0	250096	2022-08-07	2022-08-01
15673	1711461	57609106	1	249464	2022-08-07	2022-08-01
15674	1713064	57609266	1	249491	2022-08-07	2022-08-01
15675	1401328	25006017	1	249792	2022-08-07	2022-08-01
15676	1712956	57631744	1	249468	2022-08-07	2022-08-01
15677	1466206	25588288	0	250096	2022-08-07	2022-08-01
15678	1711481	57610628	1	249464	2022-08-07	2022-08-01
15679	1713606	57636062	1	249491	2022-08-07	2022-08-01
15680	1448849	25520438	0	249792	2022-08-07	2022-08-01
15681	1712957	57591760	1	249468	2022-08-07	2022-08-01
15682	1711680		0	250096	2022-08-07	2022-08-01
15683	1711602	57623182	0	249464	2022-08-07	2022-08-01
15684	1713674	57612322	1	249491	2022-08-07	2022-08-01
15685	1452793	25535178	0	249792	2022-08-07	2022-08-01
15686	1712775		0	250096	2022-08-07	2022-08-01
15687	1712979	57625538	1	249468	2022-08-07	2022-08-01
15688	1711608	57623106	0	249464	2022-08-07	2022-08-01
15689	1713731	57634606	0	249491	2022-08-07	2022-08-01
15690	1464068	25577196	0	249792	2022-08-07	2022-08-01
15691	1713035	57631168	1	249468	2022-08-07	2022-08-01
15692	1715269	25554296	0	250096	2022-08-07	2022-08-01
15693	1711661	57618432	0	249464	2022-08-07	2022-08-01
15694	1713801	57627236	1	249491	2022-08-07	2022-08-01
15695	1465104	25579450	1	249792	2022-08-07	2022-08-01
15696	1713037	57631188	1	249468	2022-08-07	2022-08-01
15697	1715550		0	250096	2022-08-07	2022-08-01
15709	1711161		0	249792	2022-08-07	2022-08-01
15714	1712790	57599830	1	249792	2022-08-07	2022-08-01
15719	1714190	24954185	1	249792	2022-08-07	2022-08-01
15724	1720055	25194415	0	250096	2022-08-07	2022-08-01
15727	1714672	57633092	0	249491	2022-08-07	2022-08-01
15729	1720164	25095673	0	250096	2022-08-07	2022-08-01
15732	1448446	25519694	1	249494	2022-08-07	2022-08-01
15734	1720965	57731060	0	250096	2022-08-07	2022-08-01
15737	1712824	57630640	1	249458	2022-08-07	2022-08-01
15742	1455112	25549862	0	249494	2022-08-07	2022-08-01
15745	1708438	57589320	1	249480	2022-08-07	2022-08-01
15750	1711302	57612498	1	249480	2022-08-07	2022-08-01
15755	1711413	57616912	1	249454	2022-08-07	2022-08-01
15760	1712665	57609154	1	249480	2022-08-07	2022-08-01
15762	1462872	25572850	0	249494	2022-08-07	2022-08-01
15764	1712754	57627818	0	249480	2022-08-07	2022-08-01
15770	1711666	57623228	1	249454	2022-08-07	2022-08-01
15777	1724336	57766116	0	250096	2022-08-07	2022-08-01
15779	1714757		0	251547	2022-08-07	2022-08-01
15782	1713782	57632558	0	249480	2022-08-07	2022-08-01
15784	1715252		0	251547	2022-08-07	2022-08-01
15787	1713800	57637318	1	249480	2022-08-07	2022-08-01
15789	1715267		0	251547	2022-08-07	2022-08-01
15792	1713811	57612712	1	249480	2022-08-07	2022-08-01
15794	1716589		0	251547	2022-08-07	2022-08-01
15797	1713835	57609346	1	249480	2022-08-07	2022-08-01
15799	1711125	57614672	0	249494	2022-08-07	2022-08-01
15802	1401328	25006017	0	249790	2022-08-07	2022-08-01
15804	1727863	57803046	0	250096	2022-08-07	2022-08-01
15807	1449409	25522114	0	250799	2022-08-07	2022-08-01
15809	1728735	57807574	0	250096	2022-08-07	2022-08-01
15812	1712345		0	249862	2022-08-07	2022-08-01
15814	1730071	57812718	0	250096	2022-08-07	2022-08-01
15817	1712643		1	249862	2022-08-07	2022-08-01
15819	1730780	57814142	0	250096	2022-08-07	2022-08-01
15827	1712935		1	249862	2022-08-07	2022-08-01
15832	1713559		1	249862	2022-08-07	2022-08-01
15847	776910	23375073	0	249998	2022-08-07	2022-08-01
15851	1202338		0	249998	2022-08-07	2022-08-01
15884	1380692	24626727	0	249982	2022-08-07	2022-08-01
15886	1467050	25533022	1	249496	2022-08-07	2022-08-01
15889	615887	22006191	1	249809	2022-08-07	2022-08-01
15891	1468089	25590968	1	249496	2022-08-07	2022-08-01
15894	738821	23003871	0	249809	2022-08-07	2022-08-01
15896	1711178	57707156	1	249496	2022-08-07	2022-08-01
15899	781008	25469300	0	249809	2022-08-07	2022-08-01
15901	1711214	25595106	1	249496	2022-08-07	2022-08-01
15904	1029829	24704629	0	249809	2022-08-07	2022-08-01
15906	1712812	25576296	1	249496	2022-08-07	2022-08-01
15909	1038503	24764911	0	249809	2022-08-07	2022-08-01
15911	1712819	57626812	0	249459	2022-08-07	2022-08-01
15916	1712963	57631056	0	249459	2022-08-07	2022-08-01
15920	1042486	24782319	1	249809	2022-08-07	2022-08-01
15930	1043637	24793135	1	249809	2022-08-07	2022-08-01
15944	1264396	25083155	0	249809	2022-08-07	2022-08-01
15949	1300813	25142717	1	249809	2022-08-07	2022-08-01
15954	1314883	25182203	0	249809	2022-08-07	2022-08-01
15959	1314888	25183229	0	249809	2022-08-07	2022-08-01
15963	780807	23470909	0	249887	2022-08-07	2022-08-01
15964	1326970	25230707	0	249809	2022-08-07	2022-08-01
15968	1711124	57614492	1	249451	2022-08-07	2022-08-01
15969	1418990	25434166	0	249809	2022-08-07	2022-08-01
15973	1712093	57617842	1	249451	2022-08-07	2022-08-01
15974	1462934	25509444	0	249809	2022-08-07	2022-08-01
15979	1702418		1	249809	2022-08-07	2022-08-01
15984	1702495		1	249809	2022-08-07	2022-08-01
15989	1714342		0	249809	2022-08-07	2022-08-01
15994	1720145	25586550	0	249809	2022-08-07	2022-08-01
15999	1715246		0	249982	2022-08-07	2022-08-01
16003	1713667	57614648	0	249451	2022-08-07	2022-08-01
16004	1715247		0	249982	2022-08-07	2022-08-01
16008	1713701	57632292	0	249451	2022-08-07	2022-08-01
16009	1715250		0	249982	2022-08-07	2022-08-01
16018	1713759	57637058	1	249451	2022-08-07	2022-08-01
16023	1713767	25577646	1	249451	2022-08-07	2022-08-01
16028	1713822	57637626	0	249451	2022-08-07	2022-08-01
16297	1712372	57624344	1	249456	2022-08-07	2022-08-01
16310	1717323	25424230	0	251116	2022-08-07	2022-08-01
16312	1710717	57607696	1	249462	2022-08-07	2022-08-01
16315	1712770	57630426	0	249460	2022-08-07	2022-08-01
16317	1711729	57612614	0	249450	2022-08-07	2022-08-01
16325	1713790	57635940	1	249460	2022-08-07	2022-08-01
16327	1710755	57607732	1	249462	2022-08-07	2022-08-01
16332	1364027	25224567	1	249497	2022-08-07	2022-08-01
16338	1409044	25406876	1	249497	2022-08-07	2022-08-01
16346	1714505	57642020	1	249460	2022-08-07	2022-08-01
16353	1715330	57617904	0	249460	2022-08-07	2022-08-01
16355	1711099	57614008	1	249462	2022-08-07	2022-08-01
16360	1713040	57631204	1	249450	2022-08-07	2022-08-01
16363	1711750	57617862	1	249420	2022-08-07	2022-08-01
16370	1711252	57615520	1	249462	2022-08-07	2022-08-01
16373	1712903	25595598	0	249497	2022-08-07	2022-08-01
16378	1714279	57639442	1	249420	2022-08-07	2022-08-01
16380	1714761	25558258	1	249497	2022-08-07	2022-08-01
16385	1697285	25880183	0	249453	2022-08-07	2022-08-01
16390	1714852	57645638	1	249420	2022-08-07	2022-08-01
16398	1711274	57594324	1	249478	2022-08-07	2022-08-01
15698	1714069	57639134	0	249491	2022-08-07	2022-08-01
15702	1707263	57576464	1	249454	2022-08-07	2022-08-01
15703	1714154	57639926	0	249491	2022-08-07	2022-08-01
15707	1710892	57608188	0	249454	2022-08-07	2022-08-01
15708	1714253	57640920	0	249491	2022-08-07	2022-08-01
15712	1711141	57614740	1	249454	2022-08-07	2022-08-01
15713	1714312	57625588	1	249491	2022-08-07	2022-08-01
15718	1714479	57634280	0	249491	2022-08-07	2022-08-01
15723	1714542	57642174	1	249491	2022-08-07	2022-08-01
15725	1711306	57616106	0	249454	2022-08-07	2022-08-01
15735	1711348	57610966	1	249454	2022-08-07	2022-08-01
15775	1714754		0	251547	2022-08-07	2022-08-01
15783	1039995	24764939	0	250799	2022-08-07	2022-08-01
15788	1050304	24831305	0	250799	2022-08-07	2022-08-01
15795	1468622	25578016	0	249494	2022-08-07	2022-08-01
15803	1448921	25521838	0	250799	2022-08-07	2022-08-01
15808	1712344		0	249862	2022-08-07	2022-08-01
15810	1468538	25586070	0	249790	2022-08-07	2022-08-01
15815	1712332	25484224	0	249790	2022-08-07	2022-08-01
15818	1713228	57626756	1	249470	2022-08-07	2022-08-01
15820	1713055		1	249790	2022-08-07	2022-08-01
15825	1713056		1	249790	2022-08-07	2022-08-01
15830	1713058		1	249790	2022-08-07	2022-08-01
15838	1713718	57627842	1	249470	2022-08-07	2022-08-01
15840	527436	21698533	0	249982	2022-08-07	2022-08-01
15843	1038434	24755645	1	249496	2022-08-07	2022-08-01
15858	1452826	25534400	0	249496	2022-08-07	2022-08-01
15863	1458124	25549910	0	249496	2022-08-07	2022-08-01
15868	1458399	25559030	0	249496	2022-08-07	2022-08-01
15876	1414491	25425238	0	249998	2022-08-07	2022-08-01
15881	1441337	25494947	0	249998	2022-08-07	2022-08-01
15883	593883	57645988	1	249809	2022-08-07	2022-08-01
15888	1413234	25419250	0	249982	2022-08-07	2022-08-01
15893	1414153	25422594	0	249982	2022-08-07	2022-08-01
15898	1443181	25501330	0	249982	2022-08-07	2022-08-01
15903	1444034	25504602	0	249982	2022-08-07	2022-08-01
15908	1450643	25528182	0	249982	2022-08-07	2022-08-01
15914	1041577	24782813	1	249809	2022-08-07	2022-08-01
15919	1720140	25122721	0	249998	2022-08-07	2022-08-01
15924	1720693	57727988	0	249998	2022-08-07	2022-08-01
15929	1721201		0	249998	2022-08-07	2022-08-01
15934	1721209		0	249998	2022-08-07	2022-08-01
15939	1721215		0	249998	2022-08-07	2022-08-01
15946	1714296	57640358	1	249459	2022-08-07	2022-08-01
15951	1714311	57641658	0	249459	2022-08-07	2022-08-01
15956	1714334	57633670	1	249459	2022-08-07	2022-08-01
15961	1722742		0	249998	2022-08-07	2022-08-01
15966	1722817	25504546	0	249998	2022-08-07	2022-08-01
15971	1711665		1	249887	2022-08-07	2022-08-01
15976	1711667		1	249887	2022-08-07	2022-08-01
15981	1711669		0	249887	2022-08-07	2022-08-01
15986	1723137	25534936	0	249998	2022-08-07	2022-08-01
15991	1723154	25548690	0	249998	2022-08-07	2022-08-01
15996	1724787		0	249998	2022-08-07	2022-08-01
16002	1712344		1	249887	2022-08-07	2022-08-01
16007	1712345		1	249887	2022-08-07	2022-08-01
16012	1712406		1	249887	2022-08-07	2022-08-01
16017	1712646		1	249887	2022-08-07	2022-08-01
16022	1713441		1	249887	2022-08-07	2022-08-01
16027	1713447		1	249887	2022-08-07	2022-08-01
16038	1710087	57588610	1	249854	2022-08-07	2022-08-01
16400	1710751	57607720	1	249453	2022-08-07	2022-08-01
16403	1714461	57642694	0	249493	2022-08-07	2022-08-01
16405	1710878	57608406	1	249453	2022-08-07	2022-08-01
16420	1711174	57607698	1	249453	2022-08-07	2022-08-01
16428	1711069	57613488	0	249467	2022-08-07	2022-08-01
16430	1714371	57632210	1	249473	2022-08-07	2022-08-01
16435	1708953	57591558	1	249449	2022-08-07	2022-08-01
16443	1714503	57640808	0	249473	2022-08-07	2022-08-01
16448	1712361	57623374	1	249467	2022-08-07	2022-08-01
16450	1711262	57611100	1	249449	2022-08-07	2022-08-01
16463	1712969	57631776	1	249467	2022-08-07	2022-08-01
16465	1713003	57631802	1	249467	2022-08-07	2022-08-01
16481	1711270	57608604	1	249457	2022-08-07	2022-08-01
16483	1710681	57607366	1	249486	2022-08-07	2022-08-01
16485	1714943	57637920	1	249461	2022-08-07	2022-08-01
16496	1712216	57608910	0	249457	2022-08-07	2022-08-01
16498	1712222	57617854	1	249457	2022-08-07	2022-08-01
16500	1711269	57615274	1	249486	2022-08-07	2022-08-01
16503	1712889	57609216	1	249457	2022-08-07	2022-08-01
16510	1711773	57624782	1	249486	2022-08-07	2022-08-01
16515	1708448	25142275	0	249475	2022-08-07	2022-08-01
16520	1711342	57610842	1	249475	2022-08-07	2022-08-01
16525	1711802	57617894	1	249475	2022-08-07	2022-08-01
16530	1710272	57593006	0	249463	2022-08-07	2022-08-01
16535	1710863	57610202	1	249463	2022-08-07	2022-08-01
16540	1711291	57609760	1	249463	2022-08-07	2022-08-01
16545	1711493	57597452	0	249418	2022-08-07	2022-08-01
16550	1708963	57593700	1	248963	2022-08-07	2022-08-01
16555	1710318	57595582	0	248963	2022-08-07	2022-08-01
16560	1710710	57607684	1	248963	2022-08-07	2022-08-01
16674	1720207	25206445	0	249594	2022-08-14	2022-08-08
16677	1430327	25466850	1	249660	2022-08-14	2022-08-08
16682	1448298	25519976	1	249660	2022-08-14	2022-08-08
16692	1464595	25572128	1	249660	2022-08-14	2022-08-08
16697	1277154	21710193	1	249840	2022-08-14	2022-08-08
16702	1384209	25315052	0	249840	2022-08-14	2022-08-08
16704	1437008	25422050	0	251582	2022-08-14	2022-08-08
16707	1682121	25583842	0	249840	2022-08-14	2022-08-08
15699	1713506	57635240	1	249468	2022-08-07	2022-08-01
15704	1713508	57635186	1	249468	2022-08-07	2022-08-01
15710	1713623	57634326	1	249468	2022-08-07	2022-08-01
15716	1711227	57612430	0	249454	2022-08-07	2022-08-01
15738	1722572	57741420	0	250096	2022-08-07	2022-08-01
15743	1722827	25547506	0	250096	2022-08-07	2022-08-01
15748	1723088	25232783	0	250096	2022-08-07	2022-08-01
15753	1724185	57765210	0	250096	2022-08-07	2022-08-01
15758	1724225	57765466	0	250096	2022-08-07	2022-08-01
15763	1724226	57765502	0	250096	2022-08-07	2022-08-01
15768	1712768	57627732	0	249480	2022-08-07	2022-08-01
15773	1713520	57634330	1	249480	2022-08-07	2022-08-01
15776	1466301	25586422	0	249494	2022-08-07	2022-08-01
15778	1713716	57633056	0	249480	2022-08-07	2022-08-01
15786	1724398	57756648	0	250096	2022-08-07	2022-08-01
15791	1724803		0	250096	2022-08-07	2022-08-01
15793	1429413	25456394	0	250799	2022-08-07	2022-08-01
15796	1725296	57778506	0	250096	2022-08-07	2022-08-01
15798	1439143	25488006	0	250799	2022-08-07	2022-08-01
15801	1714493	57642810	1	249480	2022-08-07	2022-08-01
15806	1443132	25502282	1	249790	2022-08-07	2022-08-01
15811	1450211	25523864	0	250799	2022-08-07	2022-08-01
15813	1711407	57616904	0	249470	2022-08-07	2022-08-01
15816	1457894	25556946	0	250799	2022-08-07	2022-08-01
15821	1457945	25495103	0	250799	2022-08-07	2022-08-01
15823	1713297	57634272	1	249470	2022-08-07	2022-08-01
15826	1716983	57664746	0	250799	2022-08-07	2022-08-01
15828	1713474	57634856	1	249470	2022-08-07	2022-08-01
15831	1717009	57664856	0	250799	2022-08-07	2022-08-01
15833	1713678	57632462	1	249470	2022-08-07	2022-08-01
15836	1713577		1	249862	2022-08-07	2022-08-01
15841	1713730	57631138	1	249470	2022-08-07	2022-08-01
15846	1022629	24608289	1	250128	2022-08-07	2022-08-01
15856	1279200	25111413	0	249998	2022-08-07	2022-08-01
15861	1308905	25169065	0	249998	2022-08-07	2022-08-01
15866	1318311	25197561	0	249998	2022-08-07	2022-08-01
15871	1412695	25419548	0	249998	2022-08-07	2022-08-01
15873	1462392	25571644	0	249496	2022-08-07	2022-08-01
15878	1462525	25573866	0	249496	2022-08-07	2022-08-01
15885	1449820	25521264	0	249998	2022-08-07	2022-08-01
15890	1692576	25513640	0	249998	2022-08-07	2022-08-01
15913	1455009	24228649	0	249982	2022-08-07	2022-08-01
15918	1455917	25552028	0	249982	2022-08-07	2022-08-01
15923	1457212	25524100	0	249982	2022-08-07	2022-08-01
15928	1468475	25594654	0	249982	2022-08-07	2022-08-01
15933	1686368	25573026	0	249982	2022-08-07	2022-08-01
15938	1712716	25524262	0	249982	2022-08-07	2022-08-01
15940	1125303	24956269	1	249809	2022-08-07	2022-08-01
15943	1721509	24378613	0	249998	2022-08-07	2022-08-01
15945	1711468	57602158	0	249596	2022-08-07	2022-08-01
15948	1721554		0	249998	2022-08-07	2022-08-01
15950	1711765	57607808	0	249596	2022-08-07	2022-08-01
15953	1722703		0	249998	2022-08-07	2022-08-01
15958	1722735		0	249998	2022-08-07	2022-08-01
15960	1714221	24229583	0	249982	2022-08-07	2022-08-01
15965	1714411	57642466	0	249982	2022-08-07	2022-08-01
15970	1714446	24256129	0	249982	2022-08-07	2022-08-01
15975	1714473	57642784	0	249982	2022-08-07	2022-08-01
15980	1714512	24311899	0	249982	2022-08-07	2022-08-01
15985	1714758	24905113	0	249982	2022-08-07	2022-08-01
15990	1714798	25547592	0	249982	2022-08-07	2022-08-01
15995	1715241		0	249982	2022-08-07	2022-08-01
16001	1724976		0	249998	2022-08-07	2022-08-01
16006	1725517	25556824	0	249998	2022-08-07	2022-08-01
16011	1465126	25581634	0	249791	2022-08-07	2022-08-01
16016	1711817	25482508	0	249791	2022-08-07	2022-08-01
16021	1712230	25419940	0	249791	2022-08-07	2022-08-01
16026	1712917		0	249791	2022-08-07	2022-08-01
16031	1713563		1	249887	2022-08-07	2022-08-01
16033	1707892	57579834	1	249854	2022-08-07	2022-08-01
16036	1714172		1	249887	2022-08-07	2022-08-01
16565	1728330		0	250982	2022-08-14	2022-08-08
16569	1319033	25195383	1	251675	2022-08-14	2022-08-08
16573	581843	21896333	0	249606	2022-08-14	2022-08-08
16577	1092508	24914801	0	249606	2022-08-14	2022-08-08
16579	1427386	25460078	1	251675	2022-08-14	2022-08-08
16583	1437008	25422050	1	250750	2022-08-14	2022-08-08
16584	1435286	25479654	1	251675	2022-08-14	2022-08-08
16589	1466733	25580808	1	249606	2022-08-14	2022-08-08
16594	1714882	57643310	1	249606	2022-08-14	2022-08-08
16597	1714700	57645080	1	250750	2022-08-14	2022-08-08
16599	1715279	25506844	1	249606	2022-08-14	2022-08-08
16604	763039	23078909	1	250175	2022-08-14	2022-08-08
16609	738040	22995303	1	251240	2022-08-14	2022-08-08
16614	783448	22380147	0	251240	2022-08-14	2022-08-08
16619	1273962	24953107	1	251240	2022-08-14	2022-08-08
16622	735869	22970081	0	249660	2022-08-14	2022-08-08
16624	1466130	25583402	1	251240	2022-08-14	2022-08-08
16642	743091	22983801	0	249660	2022-08-14	2022-08-08
16644	1714690	57643812	1	251240	2022-08-14	2022-08-08
16647	1021509	24316659	0	249660	2022-08-14	2022-08-08
16649	1714885	57643928	1	251240	2022-08-14	2022-08-08
16659	1715142	57647048	0	251240	2022-08-14	2022-08-08
16662	1722439		0	253195	2022-08-14	2022-08-08
16664	1715254	57610432	1	251240	2022-08-14	2022-08-08
16667	632915	22152749	0	251357	2022-08-14	2022-08-08
16669	1720206	25118687	0	249594	2022-08-14	2022-08-08
16672	1712875	57630580	1	251357	2022-08-14	2022-08-08
15700	1468538	25586070	1	249792	2022-08-07	2022-08-01
15705	1711159		0	249792	2022-08-07	2022-08-01
15721	1711305	57615878	1	249454	2022-08-07	2022-08-01
15726	421004	16644141	0	249494	2022-08-07	2022-08-01
15731	1712351	57623098	1	249458	2022-08-07	2022-08-01
15736	1453380	25543972	1	249494	2022-08-07	2022-08-01
15739	1711351	57610664	1	249454	2022-08-07	2022-08-01
15741	1712929	57631408	1	249458	2022-08-07	2022-08-01
15744	1711366	57616722	1	249454	2022-08-07	2022-08-01
15746	1713028	57609020	1	249458	2022-08-07	2022-08-01
15751	1713426	57632090	1	249458	2022-08-07	2022-08-01
15756	1713645	57630614	1	249458	2022-08-07	2022-08-01
15761	1715309	57627940	0	249458	2022-08-07	2022-08-01
15766	1465104	25579450	0	249494	2022-08-07	2022-08-01
15769	1711729	57612614	0	249447	2022-08-07	2022-08-01
15771	1465121	25583090	0	249494	2022-08-07	2022-08-01
15774	1711670	57618232	1	249454	2022-08-07	2022-08-01
15781	1724353	57762304	0	250096	2022-08-07	2022-08-01
15822	1712646		0	249862	2022-08-07	2022-08-01
15824	1731475	57817806	0	250096	2022-08-07	2022-08-01
15829	1732322		0	250096	2022-08-07	2022-08-01
15834	1713059		1	249790	2022-08-07	2022-08-01
15839	1713825		1	249790	2022-08-07	2022-08-01
15844	531772	21738977	0	249982	2022-08-07	2022-08-01
15849	533433	21713343	0	249982	2022-08-07	2022-08-01
15852	1023806	23313801	1	250128	2022-08-07	2022-08-01
15854	596883	21709623	0	249982	2022-08-07	2022-08-01
15857	1028465	24654051	1	250128	2022-08-07	2022-08-01
15859	609755	21975551	0	249982	2022-08-07	2022-08-01
15862	1034015	24738887	1	250128	2022-08-07	2022-08-01
15864	1054269	24857227	0	249982	2022-08-07	2022-08-01
15867	1038000	24764391	1	250128	2022-08-07	2022-08-01
15869	1176170	24693043	0	249982	2022-08-07	2022-08-01
15872	1111984	24946527	1	250128	2022-08-07	2022-08-01
15874	1294727	23482695	0	249982	2022-08-07	2022-08-01
15877	1186578	24989143	1	250128	2022-08-07	2022-08-01
15879	1369481	25284109	0	249982	2022-08-07	2022-08-01
15887	1707141	57559494	0	249459	2022-08-07	2022-08-01
15892	1711518	57612104	1	249459	2022-08-07	2022-08-01
15897	1711747	57612018	1	249459	2022-08-07	2022-08-01
15905	1715357		0	249998	2022-08-07	2022-08-01
15907	1712784	57630450	1	249459	2022-08-07	2022-08-01
15910	1718734	25571376	0	249998	2022-08-07	2022-08-01
15912	1045201	24802837	1	249766	2022-08-07	2022-08-01
15917	1209487	24955465	1	249766	2022-08-07	2022-08-01
15922	1463324	25572746	0	249766	2022-08-07	2022-08-01
15927	1464187	25572738	1	249766	2022-08-07	2022-08-01
15932	1464650	25576642	1	249766	2022-08-07	2022-08-01
15935	1064521	24754307	0	249809	2022-08-07	2022-08-01
15937	1713245	24955443	1	249766	2022-08-07	2022-08-01
15942	1712816	25546984	0	249982	2022-08-07	2022-08-01
15947	1712849	25575888	0	249982	2022-08-07	2022-08-01
15952	1712958	25515166	0	249982	2022-08-07	2022-08-01
15955	1712288	57626422	0	249596	2022-08-07	2022-08-01
15957	1713792	25553490	0	249982	2022-08-07	2022-08-01
15978	1712419	57608718	1	249451	2022-08-07	2022-08-01
15983	1712926	57631516	0	249451	2022-08-07	2022-08-01
15988	1713352	25558056	0	249451	2022-08-07	2022-08-01
15993	1713586	57632996	0	249451	2022-08-07	2022-08-01
15998	1713617	57635518	1	249451	2022-08-07	2022-08-01
16000	1412945	25418042	0	249791	2022-08-07	2022-08-01
16005	1415170	25422396	1	249791	2022-08-07	2022-08-01
16010	1727157		0	249998	2022-08-07	2022-08-01
16015	1727741		0	249998	2022-08-07	2022-08-01
16020	1727845		0	249998	2022-08-07	2022-08-01
16025	1728881		0	249998	2022-08-07	2022-08-01
16030	1729045		0	249998	2022-08-07	2022-08-01
16032	1301408	25149545	1	249599	2022-08-07	2022-08-01
16035	1731749		0	249998	2022-08-07	2022-08-01
16037	1713757	25521128	1	249599	2022-08-07	2022-08-01
16566	1039938	24776565	1	250750	2022-08-14	2022-08-08
16570	1718352	57678228	1	251228	2022-08-14	2022-08-08
16590	1718516	57676834	1	251228	2022-08-14	2022-08-08
16595	1718534	57675188	1	251228	2022-08-14	2022-08-08
16600	1718687	57676654	0	251228	2022-08-14	2022-08-08
16602	455883	18047771	0	250175	2022-08-14	2022-08-08
16607	1718763	57676634	0	251228	2022-08-14	2022-08-08
16610	1716522		0	251675	2022-08-14	2022-08-08
16612	1718897	57677816	1	251228	2022-08-14	2022-08-08
16615	1717130	25559404	1	251675	2022-08-14	2022-08-08
16617	1718934	57677234	0	251228	2022-08-14	2022-08-08
16623	1712201	57625350	0	250175	2022-08-14	2022-08-08
16652	1024485	24141761	1	249660	2022-08-14	2022-08-08
16657	1328978	25235681	1	249660	2022-08-14	2022-08-08
16663	573260	21888599	1	251357	2022-08-14	2022-08-08
16670	727615	22138879	0	251673	2022-08-14	2022-08-08
16673	1716745	57659072	0	251240	2022-08-14	2022-08-08
16675	743932	23051177	1	251673	2022-08-14	2022-08-08
16680	777541		1	251582	2022-08-14	2022-08-08
16685	1055011	24856891	1	251582	2022-08-14	2022-08-08
16690	1331020	25243947	1	251582	2022-08-14	2022-08-08
16695	1715973	57645562	1	251357	2022-08-14	2022-08-08
16700	1715976	57578732	1	251357	2022-08-14	2022-08-08
16705	1716154	57655858	1	251357	2022-08-14	2022-08-08
16709	1466301	25586422	0	251582	2022-08-14	2022-08-08
16710	1716213	25505060	1	251357	2022-08-14	2022-08-08
16712	1711239	57615498	0	249840	2022-08-14	2022-08-08
16714	1714700	57645080	0	251582	2022-08-14	2022-08-08
15701	1717945	57673372	0	250096	2022-08-07	2022-08-01
15706	1718010	57673922	0	250096	2022-08-07	2022-08-01
15711	1718054	57673968	0	250096	2022-08-07	2022-08-01
15715	1718822	25555976	0	250096	2022-08-07	2022-08-01
15717	1711174	57607698	1	249458	2022-08-07	2022-08-01
15720	1719947		0	250096	2022-08-07	2022-08-01
15722	1711227	57612430	1	249458	2022-08-07	2022-08-01
15728	1711767	57617804	0	249458	2022-08-07	2022-08-01
15730	1711344	57609372	1	249454	2022-08-07	2022-08-01
15733	1715243	57648638	0	249491	2022-08-07	2022-08-01
15740	1708363	57588198	1	249480	2022-08-07	2022-08-01
15747	1458104	25549170	1	249494	2022-08-07	2022-08-01
15749	1711367	57608882	1	249454	2022-08-07	2022-08-01
15752	1459011	25549842	1	249494	2022-08-07	2022-08-01
15754	1711330	57616438	0	249480	2022-08-07	2022-08-01
15757	1462676	25574882	1	249494	2022-08-07	2022-08-01
15759	1711443	57609894	1	249454	2022-08-07	2022-08-01
15765	1711492	57608928	1	249454	2022-08-07	2022-08-01
15767	1724258	57764846	0	250096	2022-08-07	2022-08-01
15772	1724297	57761224	0	250096	2022-08-07	2022-08-01
15780	1466437	25560918	1	249494	2022-08-07	2022-08-01
15785	1467532	25547650	1	249494	2022-08-07	2022-08-01
15790	1468012	25593358	0	249494	2022-08-07	2022-08-01
15800	1725793	57786126	0	250096	2022-08-07	2022-08-01
15805	1714500	57641822	1	249480	2022-08-07	2022-08-01
15835	1727787	57802886	0	250799	2022-08-07	2022-08-01
15837	526894	21697305	0	249982	2022-08-07	2022-08-01
15842	767705	23249823	0	249998	2022-08-07	2022-08-01
15845	1713814	57626782	1	249470	2022-08-07	2022-08-01
15848	1044643	24802841	0	249496	2022-08-07	2022-08-01
15850	1713826	57632050	1	249470	2022-08-07	2022-08-01
15853	1446306	25510120	0	249496	2022-08-07	2022-08-01
15855	1713840	57632314	0	249470	2022-08-07	2022-08-01
15860	1713843	57637254	1	249470	2022-08-07	2022-08-01
15865	1714134	57639564	1	249470	2022-08-07	2022-08-01
15870	1714254	57640244	1	249470	2022-08-07	2022-08-01
15875	1714284	57640442	1	249470	2022-08-07	2022-08-01
15880	1714285	57632130	0	249470	2022-08-07	2022-08-01
15882	1463301	25576234	0	249496	2022-08-07	2022-08-01
15895	1714243	25567694	0	249998	2022-08-07	2022-08-01
15900	1715218		0	249998	2022-08-07	2022-08-01
15902	1712516	57627404	1	249459	2022-08-07	2022-08-01
15915	1719834	23978241	0	249998	2022-08-07	2022-08-01
15921	1713633	57636364	1	249459	2022-08-07	2022-08-01
15925	1043562	24801611	1	249809	2022-08-07	2022-08-01
15926	1713754	57632384	1	249459	2022-08-07	2022-08-01
15931	1713823	57637304	1	249459	2022-08-07	2022-08-01
15936	1714124	57639642	0	249459	2022-08-07	2022-08-01
15941	1714144	57639938	0	249459	2022-08-07	2022-08-01
15962	1709853	57577970	0	249451	2022-08-07	2022-08-01
15967	1466733	25580808	0	249887	2022-08-07	2022-08-01
15972	1722915	57749364	0	249998	2022-08-07	2022-08-01
15977	1723089	57751176	0	249998	2022-08-07	2022-08-01
15982	1723104		0	249998	2022-08-07	2022-08-01
15987	1711673		1	249887	2022-08-07	2022-08-01
15992	1711677		1	249887	2022-08-07	2022-08-01
15997	1712341		1	249887	2022-08-07	2022-08-01
16013	1713704	57632442	1	249451	2022-08-07	2022-08-01
16014	1716276		0	249982	2022-08-07	2022-08-01
16019	1716872	57664268	0	249982	2022-08-07	2022-08-01
16024	1717332	25085281	0	249982	2022-08-07	2022-08-01
16029	1718852	25464652	0	249982	2022-08-07	2022-08-01
16034	1720024	25451300	0	249982	2022-08-07	2022-08-01
16567	533433	21713343	0	251477	2022-08-14	2022-08-08
16571	1413234	25419250	1	251477	2022-08-14	2022-08-08
16575	1718405	57677828	1	251228	2022-08-14	2022-08-08
16580	1455917	25552028	1	251477	2022-08-14	2022-08-08
16585	1718507	57679286	1	251228	2022-08-14	2022-08-08
16591	1444034	25504602	1	251483	2022-08-14	2022-08-08
16596	1714372	57642018	1	251483	2022-08-14	2022-08-08
16605	1715368		1	251675	2022-08-14	2022-08-08
16611	1719734	25548566	0	250750	2022-08-14	2022-08-08
16616	1720970	25143295	1	250750	2022-08-14	2022-08-08
16620	1719069	57669068	1	251228	2022-08-14	2022-08-08
16625	1468471	23739323	1	249594	2022-08-14	2022-08-08
16630	1468811	25583028	0	249594	2022-08-14	2022-08-08
16635	1696019	25860051	1	249594	2022-08-14	2022-08-08
16640	1715085		1	250175	2022-08-14	2022-08-08
16643	1714211	23300663	0	253195	2022-08-14	2022-08-08
16645	1715234	19654533	1	250175	2022-08-14	2022-08-08
16650	1716190	20843567	1	250175	2022-08-14	2022-08-08
16655	1715954	57652298	0	249594	2022-08-14	2022-08-08
16658	1715306	20697999	1	253195	2022-08-14	2022-08-08
16660	1717590		0	249594	2022-08-14	2022-08-08
16665	1720200	22440313	1	249594	2022-08-14	2022-08-08
16668	1715857	57649950	1	251240	2022-08-14	2022-08-08
16711	1720424	25244717	1	249660	2022-08-14	2022-08-08
16713	1714421	57638784	1	251239	2022-08-14	2022-08-08
16717	1714517	57638108	1	251239	2022-08-14	2022-08-08
16718	1717486		0	251582	2022-08-14	2022-08-08
16719	1712669	24905507	0	249840	2022-08-14	2022-08-08
16721	1714670	57644742	1	251239	2022-08-14	2022-08-08
16723	1437008	25422050	0	251047	2022-08-14	2022-08-08
16726	1714681	57644484	1	251239	2022-08-14	2022-08-08
16728	1457951	25556114	0	251047	2022-08-14	2022-08-08
16731	1714940	57643524	1	251239	2022-08-14	2022-08-08
16733	1714546	57643362	0	251047	2022-08-14	2022-08-08
16736	1714956	57644800	0	251239	2022-08-14	2022-08-08
16745	1715193	57610728	1	251239	2022-08-14	2022-08-08
16750	1715093	57647570	0	251284	2022-08-14	2022-08-08
16755	1715763	57650598	0	251284	2022-08-14	2022-08-08
16758	1711809	25558972	0	251460	2022-08-14	2022-08-08
16761	551851	21862279	1	249842	2022-08-14	2022-08-08
16773	1714534	57627632	1	251460	2022-08-14	2022-08-08
16778	1715841	25534924	0	251460	2022-08-14	2022-08-08
16783	1715850	25534744	0	251460	2022-08-14	2022-08-08
16788	1719621	25552764	1	251460	2022-08-14	2022-08-08
16795	766931	23246733	1	249611	2022-08-14	2022-08-08
16800	1275207	25108639	0	249611	2022-08-14	2022-08-08
16803	1715265	57647050	1	251238	2022-08-14	2022-08-08
16808	1714531	57643106	1	251366	2022-08-14	2022-08-08
16810	743623	23025939	0	251277	2022-08-14	2022-08-08
16813	1715236	57647830	1	251366	2022-08-14	2022-08-08
16815	1714253	57640920	1	251277	2022-08-14	2022-08-08
16822	526699	21697835	0	253033	2022-08-14	2022-08-08
16825	1202313	25005955	1	251674	2022-08-14	2022-08-08
16827	1717650	57668490	1	251277	2022-08-14	2022-08-08
16832	1718030	57668560	1	251277	2022-08-14	2022-08-08
16835	1415496	25426950	0	251674	2022-08-14	2022-08-08
16837	1718111	57670762	1	251277	2022-08-14	2022-08-08
16842	1718753	57680522	1	251277	2022-08-14	2022-08-08
16847	1718860	57627564	1	251277	2022-08-14	2022-08-08
16850	1715342		1	251674	2022-08-14	2022-08-08
16852	1452535	25534190	0	253033	2022-08-14	2022-08-08
16857	1713490	25215219	0	253033	2022-08-14	2022-08-08
16862	1716354	57585800	1	251225	2022-08-14	2022-08-08
16869	1715382	57626932	0	251234	2022-08-14	2022-08-08
16873	1716256		1	251674	2022-08-14	2022-08-08
16874	1715667	57652860	1	251234	2022-08-14	2022-08-08
16878	610609	21977495	0	249843	2022-08-14	2022-08-08
16879	1716690	57660886	0	251234	2022-08-14	2022-08-08
16892	756221	22984799	0	249843	2022-08-14	2022-08-08
16897	1717351	57659770	0	251234	2022-08-14	2022-08-08
16902	1717622		0	251234	2022-08-14	2022-08-08
16912	1718181	57672724	1	251234	2022-08-14	2022-08-08
16917	1718473	57677118	1	251234	2022-08-14	2022-08-08
16925	1718991	57683086	1	251360	2022-08-14	2022-08-08
16930	1714498	57642954	1	251224	2022-08-14	2022-08-08
16937	1172151	24988499	1	249661	2022-08-14	2022-08-08
16939	1714495	25283027	1	249843	2022-08-14	2022-08-08
16944	1714884	24251421	1	249843	2022-08-14	2022-08-08
16949	1715642	57628132	1	251221	2022-08-14	2022-08-08
16954	1718473	57677118	0	251283	2022-08-14	2022-08-08
16969	1463614	25575646	1	249661	2022-08-14	2022-08-08
16972	1717102	24885847	1	249602	2022-08-14	2022-08-08
16974	1465080	25580436	1	249661	2022-08-14	2022-08-08
16977	1714982	57633332	1	251273	2022-08-14	2022-08-08
16979	1468666	25510798	0	249661	2022-08-14	2022-08-08
16985	1718124	57674150	1	251224	2022-08-14	2022-08-08
16989	1719040	57670260	0	251224	2022-08-14	2022-08-08
16994	1719013	57679450	0	251273	2022-08-14	2022-08-08
16997	1714478	57637996	1	251431	2022-08-14	2022-08-08
16999	1719115	57676606	0	251273	2022-08-14	2022-08-08
17004	1719731	57696938	1	251273	2022-08-14	2022-08-08
17009	1426654	25448490	1	249617	2022-08-14	2022-08-08
17014	1429141	25463806	0	249617	2022-08-14	2022-08-08
17022	1716302	57650522	1	251431	2022-08-14	2022-08-08
17025	773987	23070785	0	252340	2022-08-14	2022-08-08
17027	1720244	57726872	0	251273	2022-08-14	2022-08-08
17032	1714638	57644586	1	251278	2022-08-14	2022-08-08
17035	1715812	57650728	0	251230	2022-08-14	2022-08-08
17048	1716730	57662324	0	251359	2022-08-14	2022-08-08
17053	1716737	57637204	1	251359	2022-08-14	2022-08-08
17058	1717035	57643782	1	251359	2022-08-14	2022-08-08
17063	1717290	57665460	1	251359	2022-08-14	2022-08-08
17068	1717315	57567892	1	251359	2022-08-14	2022-08-08
17073	1717352	57667728	1	251359	2022-08-14	2022-08-08
17078	1717407	57669338	0	251359	2022-08-14	2022-08-08
17083	1715294	57646818	0	251278	2022-08-14	2022-08-08
17085	1720432	25419380	1	251043	2022-08-14	2022-08-08
17090	1716270	25460404	0	251640	2022-08-14	2022-08-08
17103	1719113	25218991	0	251761	2022-08-14	2022-08-08
17105	780193	23454691	1	251641	2022-08-14	2022-08-08
17131	1715239	57648552	0	251272	2022-08-14	2022-08-08
17133	1717660	57581268	1	251428	2022-08-14	2022-08-08
17138	1717706	57668356	1	251428	2022-08-14	2022-08-08
17143	1717784	57669246	1	251428	2022-08-14	2022-08-08
17148	1719693	57679830	1	251428	2022-08-14	2022-08-08
17153	1710954	57611850	0	251426	2022-08-14	2022-08-08
17156	1023687	22955157	0	251279	2022-08-14	2022-08-08
17161	1714701	57632612	1	251279	2022-08-14	2022-08-08
17166	1714965	57646326	1	251279	2022-08-14	2022-08-08
17168	1719940	24846131	1	251762	2022-08-14	2022-08-08
17171	1716094	57652656	0	251279	2022-08-14	2022-08-08
17173	1720419	25422740	0	251762	2022-08-14	2022-08-08
17176	1717292	57666982	1	251279	2022-08-14	2022-08-08
17178	1721356	25533812	1	251762	2022-08-14	2022-08-08
17181	1717501	57668810	1	251279	2022-08-14	2022-08-08
17183	1466575	25546758	0	251800	2022-08-14	2022-08-08
17198	1712926	57631516	1	251236	2022-08-14	2022-08-08
17201	727615	22138879	0	251672	2022-08-14	2022-08-08
17203	1716079	57655552	1	251271	2022-08-14	2022-08-08
17208	1719142	57677110	1	251426	2022-08-14	2022-08-08
17218	1071612	23251415	0	251363	2022-08-14	2022-08-08
17223	1466996	25580430	0	251672	2022-08-14	2022-08-08
16746	1707568	57578980	0	251284	2022-08-14	2022-08-08
16752	1715306	20697999	0	249840	2022-08-14	2022-08-08
16754	1369863	25286870	0	251460	2022-08-14	2022-08-08
16766	569485	21883391	1	249842	2022-08-14	2022-08-08
16771	615165	22005941	0	249842	2022-08-14	2022-08-08
16774	1717718	57669654	0	251284	2022-08-14	2022-08-08
16776	781008	25469300	0	249842	2022-08-14	2022-08-08
16781	1018736	23320191	1	249842	2022-08-14	2022-08-08
16784	1717964	57672010	0	251284	2022-08-14	2022-08-08
16786	1038503	24764911	1	249842	2022-08-14	2022-08-08
16789	1718058	57673074	1	251284	2022-08-14	2022-08-08
16791	1186273	25004167	1	249842	2022-08-14	2022-08-08
16794	1715233	57633826	0	251238	2022-08-14	2022-08-08
16796	1243889	25037391	1	249842	2022-08-14	2022-08-08
16799	1715262	57627406	1	251238	2022-08-14	2022-08-08
16801	1314883	25182203	1	249842	2022-08-14	2022-08-08
16806	1314888	25183229	1	249842	2022-08-14	2022-08-08
16809	1717345		0	249611	2022-08-14	2022-08-08
16811	1460064	25513810	0	249842	2022-08-14	2022-08-08
16814	1718566	25323084	0	249611	2022-08-14	2022-08-08
16816	1712806	25558486	1	249842	2022-08-14	2022-08-08
16819	658475	22430849	1	251225	2022-08-14	2022-08-08
16821	1716285	57650508	1	251366	2022-08-14	2022-08-08
16826	1716624	57660652	1	251366	2022-08-14	2022-08-08
16830	1413075	25420010	0	251674	2022-08-14	2022-08-08
16840	1457211	25555306	0	251674	2022-08-14	2022-08-08
16845	1715205		1	251674	2022-08-14	2022-08-08
16864	1715089	57647612	1	251234	2022-08-14	2022-08-08
16868	1716125	57655898	1	251674	2022-08-14	2022-08-08
16870	1714687	57623368	1	251360	2022-08-14	2022-08-08
16875	1716585	57657610	1	251225	2022-08-14	2022-08-08
16880	1718502	57677248	1	251360	2022-08-14	2022-08-08
16885	1718518	57675328	0	251360	2022-08-14	2022-08-08
16890	1718532	57677750	0	251360	2022-08-14	2022-08-08
16895	1718539	24056863	0	251360	2022-08-14	2022-08-08
16898	1713756	57633082	1	251221	2022-08-14	2022-08-08
16900	1718690	57679936	0	251360	2022-08-14	2022-08-08
16905	1718700	57677716	1	251360	2022-08-14	2022-08-08
16908	1714491	57627602	1	251221	2022-08-14	2022-08-08
16910	1718739	57680534	1	251360	2022-08-14	2022-08-08
16913	1717534	25503726	0	249614	2022-08-14	2022-08-08
16915	1718811	57676890	0	251360	2022-08-14	2022-08-08
16920	1718918	57682164	1	251360	2022-08-14	2022-08-08
16935	1714375	25488416	1	249843	2022-08-14	2022-08-08
16940	1715443	57651054	1	251221	2022-08-14	2022-08-08
16945	1715528	57651910	1	251221	2022-08-14	2022-08-08
16951	1448866	25521752	1	249661	2022-08-14	2022-08-08
16958	1713449	24914661	1	249602	2022-08-14	2022-08-08
16963	1429270	25463616	0	251668	2022-08-14	2022-08-08
16968	1433217	25473372	1	251668	2022-08-14	2022-08-08
16983	1710334	57601026	1	251431	2022-08-14	2022-08-08
16988	1711676	57619410	1	251431	2022-08-14	2022-08-08
16990	1718473	57677118	0	251273	2022-08-14	2022-08-08
16998	1304669	25155695	1	249620	2022-08-14	2022-08-08
17003	1419325	25435390	1	249620	2022-08-14	2022-08-08
17008	1468471	23739323	1	249620	2022-08-14	2022-08-08
17013	1715930	57650144	1	251431	2022-08-14	2022-08-08
17018	1717289	25231105	1	249617	2022-08-14	2022-08-08
17023	1720222	57699214	1	251273	2022-08-14	2022-08-08
17026	1717721	57665608	1	251668	2022-08-14	2022-08-08
17028	1689477	25821443	1	251278	2022-08-14	2022-08-08
17034	1716574	57657212	1	251359	2022-08-14	2022-08-08
17039	1716683	57658742	1	251359	2022-08-14	2022-08-08
17088	1719124	57676474	1	251230	2022-08-14	2022-08-08
17091	1715311	57607838	1	251278	2022-08-14	2022-08-08
17094	1417731	25418688	0	251761	2022-08-14	2022-08-08
17099	1717323	25424230	0	251761	2022-08-14	2022-08-08
17101	1715996	57609802	0	251278	2022-08-14	2022-08-08
17104	1713840	57632314	0	251428	2022-08-14	2022-08-08
17106	743623	23025939	0	251272	2022-08-14	2022-08-08
17111	1716877	57646814	0	251287	2022-08-14	2022-08-08
17117	1716982	57660742	0	251287	2022-08-14	2022-08-08
17122	1714991	57627026	1	251272	2022-08-14	2022-08-08
17127	1715193	57610728	0	251272	2022-08-14	2022-08-08
17132	1717579	57669220	0	251287	2022-08-14	2022-08-08
17137	1717666	57669218	1	251287	2022-08-14	2022-08-08
17142	1717839	57670196	1	251287	2022-08-14	2022-08-08
17151	1715372	25503094	0	251762	2022-08-14	2022-08-08
17169	1429270	25463616	1	251800	2022-08-14	2022-08-08
17179	1464627	25576430	0	251800	2022-08-14	2022-08-08
17184	1714791	57632638	0	251271	2022-08-14	2022-08-08
17186	1717796	57669626	1	251426	2022-08-14	2022-08-08
17189	1718069	57674490	1	251279	2022-08-14	2022-08-08
17191	1713245	24955443	0	251800	2022-08-14	2022-08-08
17194	1718161	57650708	0	251426	2022-08-14	2022-08-08
17196	1715851	57650768	0	251271	2022-08-14	2022-08-08
17206	1716865	57658382	1	251236	2022-08-14	2022-08-08
17209	1449734	25519654	0	251672	2022-08-14	2022-08-08
17211	1716186	25469250	1	251271	2022-08-14	2022-08-08
17214	1717157	57659264	1	251236	2022-08-14	2022-08-08
17216	1463703	25579150	0	251672	2022-08-14	2022-08-08
17219	1716686	57659044	1	251271	2022-08-14	2022-08-08
17221	1717449	57669460	0	251236	2022-08-14	2022-08-08
17224	1713611	57627704	0	251229	2022-08-14	2022-08-08
17226	1710607	25580400	1	251363	2022-08-14	2022-08-08
17231	1713245	24955443	0	251672	2022-08-14	2022-08-08
17241	618758		0	249658	2022-08-14	2022-08-08
16747	1718226	25528908	0	251047	2022-08-14	2022-08-08
16749	1323800	25202701	0	251460	2022-08-14	2022-08-08
16757	1453689	25566208	0	249662	2022-08-14	2022-08-08
16760	1714343	57598564	0	251238	2022-08-14	2022-08-08
16762	1457887	25546056	1	249662	2022-08-14	2022-08-08
16765	1717606	57669212	1	251284	2022-08-14	2022-08-08
16767	1458090	25549162	1	249662	2022-08-14	2022-08-08
16770	1717617	57671054	0	251284	2022-08-14	2022-08-08
16772	1458281	25534662	1	249662	2022-08-14	2022-08-08
16777	1460083	25563544	0	249662	2022-08-14	2022-08-08
16780	1717761	57670874	1	251284	2022-08-14	2022-08-08
16782	1466576	25576738	1	249662	2022-08-14	2022-08-08
16785	1715000	57642002	1	251238	2022-08-14	2022-08-08
16790	1715093	57647570	1	251238	2022-08-14	2022-08-08
16805	1279221	25116497	0	249611	2022-08-14	2022-08-08
16817	1716137	57655710	1	251366	2022-08-14	2022-08-08
16820	758780	23099859	1	251674	2022-08-14	2022-08-08
16823	1717222	57666292	1	251277	2022-08-14	2022-08-08
16828	610609	21977495	0	253033	2022-08-14	2022-08-08
16833	735891	22971123	1	253033	2022-08-14	2022-08-08
16838	1071880	24903803	1	253033	2022-08-14	2022-08-08
16843	1275930	25100145	0	253033	2022-08-14	2022-08-08
16848	1275931	25111361	1	253033	2022-08-14	2022-08-08
16853	1715216	57647820	1	251225	2022-08-14	2022-08-08
16855	1707818	57579684	0	251234	2022-08-14	2022-08-08
16858	1715951	57608992	0	251225	2022-08-14	2022-08-08
16861	1714982	57633332	0	251234	2022-08-14	2022-08-08
16866	526699	21697835	0	249843	2022-08-14	2022-08-08
16871	1716570	57658528	0	251225	2022-08-14	2022-08-08
16876	1717857	57669676	1	251360	2022-08-14	2022-08-08
16881	1716280		1	251674	2022-08-14	2022-08-08
16883	1716729	57661752	1	251234	2022-08-14	2022-08-08
16886	1716283		1	251674	2022-08-14	2022-08-08
16888	1717010	57664816	1	251234	2022-08-14	2022-08-08
16891	1716522		1	251674	2022-08-14	2022-08-08
16893	1717285	57630034	1	251234	2022-08-14	2022-08-08
16903	1714360	57642108	0	251221	2022-08-14	2022-08-08
16909	1466351	25578138	1	249614	2022-08-14	2022-08-08
16914	1714528	57583326	1	251221	2022-08-14	2022-08-08
16919	1714875	57645756	0	251221	2022-08-14	2022-08-08
16923	1401328	25006017	0	251801	2022-08-14	2022-08-08
16928	1413649	25422442	0	251801	2022-08-14	2022-08-08
16933	1715919	57654492	1	251224	2022-08-14	2022-08-08
16938	1716229	57643990	0	251224	2022-08-14	2022-08-08
16941	1466130	25583402	0	251283	2022-08-14	2022-08-08
16943	1716572	25837781	1	251224	2022-08-14	2022-08-08
16946	1716653	57659728	0	251283	2022-08-14	2022-08-08
16948	1716601	57660266	1	251224	2022-08-14	2022-08-08
16953	1412945	25418042	0	251668	2022-08-14	2022-08-08
16961	1716928	57637672	0	251224	2022-08-14	2022-08-08
16973	1445814	25512560	0	251668	2022-08-14	2022-08-08
16978	1445839	25509338	0	251668	2022-08-14	2022-08-08
16991	764856	23225723	1	249617	2022-08-14	2022-08-08
16993	1711758	57623084	1	251431	2022-08-14	2022-08-08
17020	622530	22057279	1	251359	2022-08-14	2022-08-08
17033	1719913	25448064	1	252340	2022-08-14	2022-08-08
17038	1714698	57642986	0	251278	2022-08-14	2022-08-08
17040	1717160	57585790	0	251230	2022-08-14	2022-08-08
17043	1714848	57644952	0	251278	2022-08-14	2022-08-08
17045	1717228	57666386	1	251230	2022-08-14	2022-08-08
17050	518957	21631857	1	251043	2022-08-14	2022-08-08
17055	1445236	25509694	0	251043	2022-08-14	2022-08-08
17060	1446270	25513644	1	251043	2022-08-14	2022-08-08
17065	1446961	25488334	0	251043	2022-08-14	2022-08-08
17070	1455886	25528322	0	251043	2022-08-14	2022-08-08
17075	1714545	25237389	0	251043	2022-08-14	2022-08-08
17080	1715686	24459423	1	251043	2022-08-14	2022-08-08
17092	1719126	57687764	1	251230	2022-08-14	2022-08-08
17095	1717322	25199553	1	251640	2022-08-14	2022-08-08
17097	1719482	57698786	0	251230	2022-08-14	2022-08-08
17102	1716204	57652232	1	251287	2022-08-14	2022-08-08
17110	531903	21764879	0	250748	2022-08-14	2022-08-08
17115	742858	23031387	0	250748	2022-08-14	2022-08-08
17120	1263622	24738575	0	250748	2022-08-14	2022-08-08
17125	1265412	25096007	0	250748	2022-08-14	2022-08-08
17130	1709980		1	250748	2022-08-14	2022-08-08
17135	1715756	57653276	1	250748	2022-08-14	2022-08-08
17140	1718204	25520036	0	250748	2022-08-14	2022-08-08
17145	1718812	23003637	0	250748	2022-08-14	2022-08-08
17155	1712963	57631056	0	251271	2022-08-14	2022-08-08
17157	1413649	25422442	0	251799	2022-08-14	2022-08-08
17162	1718022	57627644	0	251799	2022-08-14	2022-08-08
17167	1714876	57645916	0	251426	2022-08-14	2022-08-08
17170	1714412	57642438	1	251271	2022-08-14	2022-08-08
17172	1715859	57652198	1	251426	2022-08-14	2022-08-08
17175	1714540	57633448	1	251271	2022-08-14	2022-08-08
17177	1717242	57665930	1	251426	2022-08-14	2022-08-08
17180	1714687	57623368	1	251271	2022-08-14	2022-08-08
17182	1717318	57667332	1	251426	2022-08-14	2022-08-08
17185	1718017	57651230	0	251279	2022-08-14	2022-08-08
17187	1467109	25506588	1	251800	2022-08-14	2022-08-08
17192	1715283	25901311	1	251271	2022-08-14	2022-08-08
17197	1718765	57676840	1	251426	2022-08-14	2022-08-08
17202	1716151	57652568	0	251236	2022-08-14	2022-08-08
17205	1448849	25520438	0	251672	2022-08-14	2022-08-08
17207	1716095	57650294	1	251271	2022-08-14	2022-08-08
17210	1716922	57633344	1	251236	2022-08-14	2022-08-08
16748	1715291	25924467	0	249840	2022-08-14	2022-08-08
16759	1717326	57643716	1	251284	2022-08-14	2022-08-08
16764	1714447	57627288	1	251238	2022-08-14	2022-08-08
16769	1714766	57616356	1	251238	2022-08-14	2022-08-08
16775	1714796	57645072	1	251238	2022-08-14	2022-08-08
16779	1714973	57646432	1	251238	2022-08-14	2022-08-08
16787	1468666	25510798	1	249662	2022-08-14	2022-08-08
16792	1718109	25580580	0	249662	2022-08-14	2022-08-08
16797	1718171	25248791	0	249662	2022-08-14	2022-08-08
16802	1718890	57681912	1	251284	2022-08-14	2022-08-08
16804	1714293	57591556	1	251366	2022-08-14	2022-08-08
16807	1715775	57652964	1	251238	2022-08-14	2022-08-08
16812	1715899	57637760	0	251238	2022-08-14	2022-08-08
16831	1716626	57660796	1	251366	2022-08-14	2022-08-08
16836	1716666	57660096	1	251366	2022-08-14	2022-08-08
16841	1717167	57665738	0	251366	2022-08-14	2022-08-08
16846	1717217	57666284	0	251366	2022-08-14	2022-08-08
16851	1718208	57674394	0	251366	2022-08-14	2022-08-08
16854	1715344		1	251674	2022-08-14	2022-08-08
16859	1715366		1	251674	2022-08-14	2022-08-08
16867	1716367	57650742	1	251225	2022-08-14	2022-08-08
16872	602776	21953581	0	249843	2022-08-14	2022-08-08
16877	1716269		1	251674	2022-08-14	2022-08-08
16882	615165	22005941	0	249843	2022-08-14	2022-08-08
16884	1712714	57623258	0	251221	2022-08-14	2022-08-08
16887	735891	22971123	0	249843	2022-08-14	2022-08-08
16889	1712949	57631622	1	251221	2022-08-14	2022-08-08
16894	1713668	57632342	1	251221	2022-08-14	2022-08-08
16896	1071880	24903803	0	249843	2022-08-14	2022-08-08
16899	581843	21896333	0	249614	2022-08-14	2022-08-08
16901	1275930	25100145	0	249843	2022-08-14	2022-08-08
16904	1363865	25268059	0	249614	2022-08-14	2022-08-08
16906	1275931	25111361	0	249843	2022-08-14	2022-08-08
16911	1293728	24191661	0	249843	2022-08-14	2022-08-08
16916	1303826	25044749	1	249843	2022-08-14	2022-08-08
16921	1452535	25534190	0	249843	2022-08-14	2022-08-08
16924	632915	22152749	0	251224	2022-08-14	2022-08-08
16926	1711823	25503980	1	249843	2022-08-14	2022-08-08
16929	1719007	57649320	1	251360	2022-08-14	2022-08-08
16931	1713490	25215219	0	249843	2022-08-14	2022-08-08
16934	1720025	57700148	0	251360	2022-08-14	2022-08-08
16936	1715353	57611288	0	251221	2022-08-14	2022-08-08
16942	1312665	24352653	0	249661	2022-08-14	2022-08-08
16947	1426020	25458256	1	249661	2022-08-14	2022-08-08
16956	1716726	57661760	1	251224	2022-08-14	2022-08-08
16959	1719058	57647792	0	251283	2022-08-14	2022-08-08
16964	1720744	57727992	0	251283	2022-08-14	2022-08-08
16966	1717160	57585790	0	251224	2022-08-14	2022-08-08
16971	1704575	57555420	1	251273	2022-08-14	2022-08-08
16976	1717207	25509962	0	249602	2022-08-14	2022-08-08
16981	1717622		0	251273	2022-08-14	2022-08-08
16984	1712976	25579360	1	249661	2022-08-14	2022-08-08
16986	1718195	57643768	1	251273	2022-08-14	2022-08-08
16996	1466036	25561104	0	251668	2022-08-14	2022-08-08
17001	1466913	25590394	1	251668	2022-08-14	2022-08-08
17006	1467256	25542294	1	251668	2022-08-14	2022-08-08
17011	1712230	25419940	0	251668	2022-08-14	2022-08-08
17016	1715347	25516932	1	251668	2022-08-14	2022-08-08
17019	1720208	57726250	0	251273	2022-08-14	2022-08-08
17021	1717227		1	251668	2022-08-14	2022-08-08
17029	1712617	57628908	1	251359	2022-08-14	2022-08-08
17031	415836	16505173	0	251640	2022-08-14	2022-08-08
17036	669244	22542673	0	251640	2022-08-14	2022-08-08
17041	757751	23111869	0	251640	2022-08-14	2022-08-08
17044	1716688	57659152	0	251359	2022-08-14	2022-08-08
17046	1440231	25492199	1	251640	2022-08-14	2022-08-08
17051	1442222	25499126	0	251640	2022-08-14	2022-08-08
17056	1464782	25515852	0	251640	2022-08-14	2022-08-08
17061	1464786	25582256	0	251640	2022-08-14	2022-08-08
17066	1467556	25449820	0	251640	2022-08-14	2022-08-08
17071	1715296	25288702	0	251640	2022-08-14	2022-08-08
17076	1715302	25288980	0	251640	2022-08-14	2022-08-08
17081	1715306	20697999	0	251640	2022-08-14	2022-08-08
17086	1715972	16983755	0	251640	2022-08-14	2022-08-08
17093	1071612	23251415	0	251287	2022-08-14	2022-08-08
17096	1715350	57647356	1	251278	2022-08-14	2022-08-08
17098	1715003	57646700	1	251287	2022-08-14	2022-08-08
17108	1715862	57650700	1	251428	2022-08-14	2022-08-08
17113	1716840	57657768	1	251428	2022-08-14	2022-08-08
17116	1714701	57632612	1	251272	2022-08-14	2022-08-08
17118	1717269	57665940	1	251428	2022-08-14	2022-08-08
17121	1717460	57668400	1	251287	2022-08-14	2022-08-08
17123	1717466	57669556	0	251428	2022-08-14	2022-08-08
17126	1717538	57668046	0	251287	2022-08-14	2022-08-08
17128	1717496	57668006	1	251428	2022-08-14	2022-08-08
17136	1715271	57609844	1	251272	2022-08-14	2022-08-08
17141	1715757	57652484	1	251272	2022-08-14	2022-08-08
17146	1716299	57638652	1	251272	2022-08-14	2022-08-08
17150	1718444	57677812	0	251287	2022-08-14	2022-08-08
17158	1711305	57615878	1	251426	2022-08-14	2022-08-08
17160	1714124	57639642	1	251271	2022-08-14	2022-08-08
17163	1713840	57632314	1	251426	2022-08-14	2022-08-08
17165	1714343	57598564	0	251271	2022-08-14	2022-08-08
17188	1715003	57646700	1	251271	2022-08-14	2022-08-08
17190	1717963	57644422	1	251426	2022-08-14	2022-08-08
17193	1719058	57647792	0	251279	2022-08-14	2022-08-08
17195	1715202	25580650	1	251800	2022-08-14	2022-08-08
16751	1712963	57631056	0	251238	2022-08-14	2022-08-08
16753	1452826	25534400	0	249662	2022-08-14	2022-08-08
16756	1713037	57631188	1	251238	2022-08-14	2022-08-08
16763	1712900	25464330	0	251460	2022-08-14	2022-08-08
16768	1712943	24172405	1	251460	2022-08-14	2022-08-08
16793	1718403	57675252	1	251284	2022-08-14	2022-08-08
16798	1718486	57678882	1	251284	2022-08-14	2022-08-08
16818	1715243	57648638	0	251277	2022-08-14	2022-08-08
16824	1710323	57595902	0	251225	2022-08-14	2022-08-08
16829	1713586	57632996	1	251225	2022-08-14	2022-08-08
16834	1713611	57627704	1	251225	2022-08-14	2022-08-08
16839	1713667	57614648	1	251225	2022-08-14	2022-08-08
16844	1713822	57637626	0	251225	2022-08-14	2022-08-08
16849	1714892	57643410	1	251225	2022-08-14	2022-08-08
16856	1718706	57671328	1	251366	2022-08-14	2022-08-08
16860	1720431	57698830	0	251366	2022-08-14	2022-08-08
16863	1715373		1	251674	2022-08-14	2022-08-08
16865	632915	22152749	1	251360	2022-08-14	2022-08-08
16907	1717888	57672822	0	251234	2022-08-14	2022-08-08
16918	1717560	25433090	0	249614	2022-08-14	2022-08-08
16922	1714889	57643764	1	251221	2022-08-14	2022-08-08
16927	1715000	57642002	0	251221	2022-08-14	2022-08-08
16932	1715100	57647184	0	251221	2022-08-14	2022-08-08
16950	1718145	57674940	0	251283	2022-08-14	2022-08-08
16952	1716651	57658510	1	251224	2022-08-14	2022-08-08
16955	1458090	25549162	0	249661	2022-08-14	2022-08-08
16957	1415170	25422396	1	251668	2022-08-14	2022-08-08
16960	1460083	25563544	1	249661	2022-08-14	2022-08-08
16962	1715820	24757803	0	249602	2022-08-14	2022-08-08
16965	1461228	25505428	0	249661	2022-08-14	2022-08-08
16967	1715856	25545524	0	249602	2022-08-14	2022-08-08
16970	1717175	25290368	0	251224	2022-08-14	2022-08-08
16975	1717200	57659004	0	251224	2022-08-14	2022-08-08
16980	1717447	57669050	0	251224	2022-08-14	2022-08-08
16982	1446973	25513424	1	251668	2022-08-14	2022-08-08
16987	1448257	25516412	1	251668	2022-08-14	2022-08-08
16992	1465086	25580684	1	251668	2022-08-14	2022-08-08
16995	766931	23246733	0	249617	2022-08-14	2022-08-08
17000	1306732	24821769	0	249617	2022-08-14	2022-08-08
17002	1714526	57643146	1	251431	2022-08-14	2022-08-08
17005	1310334	25141281	0	249617	2022-08-14	2022-08-08
17007	1715600	57651818	1	251431	2022-08-14	2022-08-08
17010	1719765	57673550	1	251273	2022-08-14	2022-08-08
17012	1711259	23852289	1	249620	2022-08-14	2022-08-08
17015	1720031	57717128	0	251273	2022-08-14	2022-08-08
17017	1716163	57650168	1	251431	2022-08-14	2022-08-08
17024	1164877	24982627	0	251359	2022-08-14	2022-08-08
17030	1465512	25576472	1	252340	2022-08-14	2022-08-08
17037	1720038	25194999	1	252340	2022-08-14	2022-08-08
17042	1720948	25472636	1	252340	2022-08-14	2022-08-08
17047	1714878	57645936	0	251278	2022-08-14	2022-08-08
17049	1717731	57668340	0	251230	2022-08-14	2022-08-08
17052	1714922	57638282	1	251278	2022-08-14	2022-08-08
17054	1718229	57676132	0	251230	2022-08-14	2022-08-08
17057	1714967	57646318	1	251278	2022-08-14	2022-08-08
17059	1718255	57597098	0	251230	2022-08-14	2022-08-08
17062	1714977	57644412	1	251278	2022-08-14	2022-08-08
17064	1718346	57677904	1	251230	2022-08-14	2022-08-08
17067	1714978	57598300	1	251278	2022-08-14	2022-08-08
17069	1718511	57669616	1	251230	2022-08-14	2022-08-08
17072	1714980	57644272	1	251278	2022-08-14	2022-08-08
17074	1718674	57678474	0	251230	2022-08-14	2022-08-08
17077	1714984	57644478	0	251278	2022-08-14	2022-08-08
17079	1718932	57682042	1	251230	2022-08-14	2022-08-08
17082	1717415	57638852	1	251359	2022-08-14	2022-08-08
17084	1718964	57682706	1	251230	2022-08-14	2022-08-08
17087	1715305	57638938	0	251278	2022-08-14	2022-08-08
17089	1031161	24722905	1	251287	2022-08-14	2022-08-08
17100	1717734	24263347	1	251640	2022-08-14	2022-08-08
17107	1716464	57638988	1	251287	2022-08-14	2022-08-08
17109	1222919	25045707	0	251641	2022-08-14	2022-08-08
17112	1714547	57638772	1	251272	2022-08-14	2022-08-08
17114	1238148	25058365	1	251641	2022-08-14	2022-08-08
17119	1413559	25421850	1	251641	2022-08-14	2022-08-08
17124	1426672	25406878	1	251641	2022-08-14	2022-08-08
17129	1715156	25305214	0	251641	2022-08-14	2022-08-08
17134	1716174	57655978	1	251641	2022-08-14	2022-08-08
17139	1716742	25470264	0	251641	2022-08-14	2022-08-08
17144	1717791	25579960	0	251641	2022-08-14	2022-08-08
17147	1717886	57670560	1	251287	2022-08-14	2022-08-08
17149	1717979	24246857	0	251641	2022-08-14	2022-08-08
17152	1707568	57578980	0	251271	2022-08-14	2022-08-08
17154	1715938	25266027	0	251762	2022-08-14	2022-08-08
17159	1718489	25423976	0	251762	2022-08-14	2022-08-08
17164	1718759	25418714	1	251762	2022-08-14	2022-08-08
17174	1453894	25535208	0	251800	2022-08-14	2022-08-08
17199	1716018	57653370	1	251271	2022-08-14	2022-08-08
17204	1719092	57550908	1	251426	2022-08-14	2022-08-08
17232	1717763	57671982	1	251236	2022-08-14	2022-08-08
17234	1043384	24765279	1	251222	2022-08-14	2022-08-08
17237	1717008	57660708	0	251363	2022-08-14	2022-08-08
17239	1717898	57673254	1	251236	2022-08-14	2022-08-08
17242	1711398	57616720	0	251222	2022-08-14	2022-08-08
17249	1714486	57642880	1	251222	2022-08-14	2022-08-08
17252	1718053	57673098	1	251363	2022-08-14	2022-08-08
20057	1725844		1	253933	2022-08-21	2022-08-15
20062	1726114		1	253933	2022-08-21	2022-08-15
17200	1718821	57681470	0	251426	2022-08-14	2022-08-08
17213	1463457	25578484	0	251672	2022-08-14	2022-08-08
17215	1716587	57658674	1	251271	2022-08-14	2022-08-08
17220	1464068	25577196	0	251672	2022-08-14	2022-08-08
17228	1715382	57626932	0	251229	2022-08-14	2022-08-08
17230	1715654	57647776	1	251363	2022-08-14	2022-08-08
17235	1715369	25505546	0	251672	2022-08-14	2022-08-08
17245	1713800	57637318	0	251222	2022-08-14	2022-08-08
17248	1717271	57666056	0	251363	2022-08-14	2022-08-08
20065	1728850	57805046	1	251585	2022-08-21	2022-08-15
20067	1726119		1	253933	2022-08-21	2022-08-15
20071	1729076	57803488	1	250032	2022-08-21	2022-08-15
20072	1724929	57764888	0	252605	2022-08-21	2022-08-15
20077	1726674	24707195	0	252605	2022-08-21	2022-08-15
20082	1729621	57759080	0	252605	2022-08-21	2022-08-15
20087	1730768	57782734	1	252605	2022-08-21	2022-08-15
20093	1727711	57792288	0	252451	2022-08-21	2022-08-15
20095	1715567	25544434	0	249923	2022-08-21	2022-08-15
20101	1725570	57733920	0	253436	2022-08-21	2022-08-15
20106	1725600	57784520	1	253436	2022-08-21	2022-08-15
20111	1725690	57777046	1	253436	2022-08-21	2022-08-15
20116	1725891	57775964	0	253436	2022-08-21	2022-08-15
20118	1725652	57784468	1	250979	2022-08-21	2022-08-15
20121	1725908	57782216	0	253436	2022-08-21	2022-08-15
20126	1726390	24758549	1	253436	2022-08-21	2022-08-15
20131	1726723	57795084	0	250979	2022-08-21	2022-08-15
20136	1727423	24754167	1	252967	2022-08-21	2022-08-15
20138	1716206	57656242	0	251136	2022-08-21	2022-08-15
20145	1726872	57791952	0	249908	2022-08-21	2022-08-15
20151	1724918	57771996	1	253299	2022-08-21	2022-08-15
20153	1395960	24524693	0	249956	2022-08-21	2022-08-15
20191	1714394	57641870	1	249956	2022-08-21	2022-08-15
20193	1730307	57813108	1	253299	2022-08-21	2022-08-15
20196	1718056	25559792	0	249956	2022-08-21	2022-08-15
20198	1730394	57809028	1	253299	2022-08-21	2022-08-15
20201	1719718	57677794	1	249956	2022-08-21	2022-08-15
20204	1725263	57779612	1	255072	2022-08-21	2022-08-15
20206	1719905	25595516	0	249956	2022-08-21	2022-08-15
20209	1725522	57760294	0	255072	2022-08-21	2022-08-15
20216	1273307	25105547	0	253176	2022-08-21	2022-08-15
20218	1706357	57565864	1	254618	2022-08-21	2022-08-15
20223	1722552	25438186	0	249807	2022-08-21	2022-08-15
20226	1711420	57616950	0	254618	2022-08-21	2022-08-15
20233	1720089	57698702	1	254618	2022-08-21	2022-08-15
20238	1724811	57759870	1	249807	2022-08-21	2022-08-15
20244	1724382	57763096	0	253176	2022-08-21	2022-08-15
20246	1724428	57761966	1	250981	2022-08-21	2022-08-15
20251	1726270	57788808	0	249807	2022-08-21	2022-08-15
20253	1730049	57812668	1	254618	2022-08-21	2022-08-15
20256	1445940	25504632	0	249566	2022-08-21	2022-08-15
20264	1727857	57802608	1	250981	2022-08-21	2022-08-15
20266	1721197	57730406	1	253797	2022-08-21	2022-08-15
20271	1725390	57778520	1	253041	2022-08-21	2022-08-15
20276	1712287	25144679	1	249566	2022-08-21	2022-08-15
20281	1726961	57759266	0	253797	2022-08-21	2022-08-15
20286	1727119	57790694	0	252699	2022-08-21	2022-08-15
20294	1712707	22161055	1	249566	2022-08-21	2022-08-15
20297	1712712	24746851	1	249566	2022-08-21	2022-08-15
20299	1727691	57801688	1	253797	2022-08-21	2022-08-15
20309	1730604	57803872	1	253472	2022-08-21	2022-08-15
20314	1718987	25227879	0	252277	2022-08-21	2022-08-15
20319	1730856	57811698	1	253472	2022-08-21	2022-08-15
20324	1731160	57810802	0	253472	2022-08-21	2022-08-15
20329	1729890	57812106	1	253455	2022-08-21	2022-08-15
17212	1719719	57701840	0	251426	2022-08-14	2022-08-08
17217	1717312	25838003	1	251236	2022-08-14	2022-08-08
17222	1706620	57570312	1	251363	2022-08-14	2022-08-08
17225	1717473	57638180	1	251236	2022-08-14	2022-08-08
17227	1713047		1	251672	2022-08-14	2022-08-08
17240	1717062	57664978	1	251363	2022-08-14	2022-08-08
17247	1718110	57674112	0	251236	2022-08-14	2022-08-08
17250	1021509	24316659	0	249658	2022-08-14	2022-08-08
20070	1728967	57804176	1	251585	2022-08-21	2022-08-15
20076	1729695		1	250032	2022-08-21	2022-08-15
20080	1730218		1	250032	2022-08-21	2022-08-15
20081	278196	6796615	0	251458	2022-08-21	2022-08-15
20097	1725309	57773752	1	253436	2022-08-21	2022-08-15
20128	1723424	24857067	1	252967	2022-08-21	2022-08-15
20146	692996	22677143	1	249592	2022-08-21	2022-08-15
20148	1080677	24890699	0	249956	2022-08-21	2022-08-15
20190	1711290	24732981	0	249836	2022-08-21	2022-08-15
20195	1711409	24948731	1	249836	2022-08-21	2022-08-15
20200	1711418	22235935	0	249836	2022-08-21	2022-08-15
20203	1455979	25500106	0	249807	2022-08-21	2022-08-15
20205	1712906	22035699	0	249836	2022-08-21	2022-08-15
20208	1459137	25533202	0	249807	2022-08-21	2022-08-15
20210	1720099	25553750	0	249956	2022-08-21	2022-08-15
20215	1716839	25424514	0	249807	2022-08-21	2022-08-15
20225	1725293	57778678	0	252469	2022-08-21	2022-08-15
20228	1452240	25088003	0	253176	2022-08-21	2022-08-15
20236	1305997	25159859	1	250981	2022-08-21	2022-08-15
20243	1723426	57756640	1	250981	2022-08-21	2022-08-15
20245	1725459	57779618	1	254618	2022-08-21	2022-08-15
20255	1730411	57811930	1	253176	2022-08-21	2022-08-15
20258	1730884	57814102	1	254618	2022-08-21	2022-08-15
20260	1727381	57792886	1	250981	2022-08-21	2022-08-15
20263	1711355	21643087	1	249566	2022-08-21	2022-08-15
20265	1049936	24839317	1	253041	2022-08-21	2022-08-15
20270	1711389	23155817	1	249566	2022-08-21	2022-08-15
20278	1726807	57790736	1	253797	2022-08-21	2022-08-15
20280	1724186	57762210	1	252699	2022-08-21	2022-08-15
20285	1712632	25464662	1	249566	2022-08-21	2022-08-15
20290	1727390	57793220	0	253797	2022-08-21	2022-08-15
20295	1728631	57807110	0	252699	2022-08-21	2022-08-15
20298	1731210		0	252699	2022-08-21	2022-08-15
20302	1711135	57594228	1	253472	2022-08-21	2022-08-15
20307	1730590	57813486	1	253472	2022-08-21	2022-08-15
20310	1727706	57797292	0	249551	2022-08-21	2022-08-15
20312	1717239	24913521	1	252277	2022-08-21	2022-08-15
20317	1730831	57808634	1	253472	2022-08-21	2022-08-15
20322	1725441	57783656	1	252277	2022-08-21	2022-08-15
20327	1729347	57766130	0	253455	2022-08-21	2022-08-15
17229	1717574	57670182	1	251236	2022-08-14	2022-08-08
17233	1715899	57637760	1	251363	2022-08-14	2022-08-08
17236	1717868	57670274	1	251236	2022-08-14	2022-08-08
17238	1711232	57615378	1	251222	2022-08-14	2022-08-08
17243	1718100	57674368	0	251236	2022-08-14	2022-08-08
17246	735703	22957741	1	249658	2022-08-14	2022-08-08
17253	1448032	25518380	0	249658	2022-08-14	2022-08-08
20100	1723495	57758812	1	249923	2022-08-21	2022-08-15
20105	1723757	57759596	1	249923	2022-08-21	2022-08-15
20110	1725765	57779740	1	251458	2022-08-21	2022-08-15
20115	1725829	57780708	1	251458	2022-08-21	2022-08-15
20120	1725898	57781252	0	251458	2022-08-21	2022-08-15
20123	1725758	57785742	1	250979	2022-08-21	2022-08-15
20124	1724715	57769096	0	249923	2022-08-21	2022-08-15
20129	1725750	57782394	1	249923	2022-08-21	2022-08-15
20134	1726955	57794188	1	250979	2022-08-21	2022-08-15
20139	1727381	57792886	0	250979	2022-08-21	2022-08-15
20142	1723082	57633984	1	253299	2022-08-21	2022-08-15
20144	1731252	57824970	1	252967	2022-08-21	2022-08-15
20149	1115744		0	251685	2022-08-21	2022-08-15
20156	1413260	25421340	0	249956	2022-08-21	2022-08-15
20161	1127090	24932453	0	249815	2022-08-21	2022-08-15
20166	1371813	25284015	1	249836	2022-08-21	2022-08-15
20171	1711128		0	249836	2022-08-21	2022-08-15
20176	1711129	24980231	1	249836	2022-08-21	2022-08-15
20181	1711169	23114083	1	249836	2022-08-21	2022-08-15
20186	1711275	24916229	1	249836	2022-08-21	2022-08-15
20192	1728976	57803326	1	249815	2022-08-21	2022-08-15
20194	1424743	25450356	0	255072	2022-08-21	2022-08-15
20197	1729618	57808858	1	249815	2022-08-21	2022-08-15
20199	1725141	57778390	0	255072	2022-08-21	2022-08-15
20211	1716608	25467742	0	249807	2022-08-21	2022-08-15
20217	1728454	57803526	0	255072	2022-08-21	2022-08-15
20221	1710338	57595690	1	254618	2022-08-21	2022-08-15
20224	1411694	24713791	0	253176	2022-08-21	2022-08-15
20231	1723431	57758382	1	249807	2022-08-21	2022-08-15
20239	1720156	25550448	0	250981	2022-08-21	2022-08-15
20241	1720371	57697156	1	254618	2022-08-21	2022-08-15
20254	1726699	57790128	1	250981	2022-08-21	2022-08-15
20261	781008	25469300	0	253041	2022-08-21	2022-08-15
20268	1724765	57768554	1	253041	2022-08-21	2022-08-15
20273	1711728	57611386	0	249566	2022-08-21	2022-08-15
20283	1724713	57768488	0	252699	2022-08-21	2022-08-15
20288	1712693	21968039	1	249566	2022-08-21	2022-08-15
20291	1712704	22014621	1	249566	2022-08-21	2022-08-15
20293	1727404	57791456	1	253797	2022-08-21	2022-08-15
20303	1729601	57602266	1	253472	2022-08-21	2022-08-15
20306	1714306	25466674	0	249551	2022-08-21	2022-08-15
20313	1730737	57813508	1	253472	2022-08-21	2022-08-15
20318	1724274	57759146	0	252277	2022-08-21	2022-08-15
20323	1731099	57816494	1	253472	2022-08-21	2022-08-15
20328	1729614	57809876	1	253455	2022-08-21	2022-08-15
17244	1717255	57660920	1	251363	2022-08-14	2022-08-08
17251	1718471	57675774	1	251236	2022-08-14	2022-08-08
17254	1714498	57642954	0	251222	2022-08-14	2022-08-08
17255	1718199	57674446	1	251363	2022-08-14	2022-08-08
17256	1714989	57570084	0	251222	2022-08-14	2022-08-08
17257	1453385	25544646	1	249658	2022-08-14	2022-08-08
17258	1408168	25400474	0	251227	2022-08-14	2022-08-08
17259	1718374	57675288	0	251363	2022-08-14	2022-08-08
17260	1714990	57646644	0	251222	2022-08-14	2022-08-08
17261	1455112	25549862	0	249658	2022-08-14	2022-08-08
17262	1697817	25871197	0	251227	2022-08-14	2022-08-08
17263	1718444	57677812	0	251363	2022-08-14	2022-08-08
17264	1715340	57639504	1	251222	2022-08-14	2022-08-08
17265	1464595	25572128	0	249658	2022-08-14	2022-08-08
17266	1714491	57627602	1	251227	2022-08-14	2022-08-08
17267	1718502	57677248	0	251363	2022-08-14	2022-08-08
17268	1715371	25911345	1	251222	2022-08-14	2022-08-08
17269	1464898	25582182	0	249658	2022-08-14	2022-08-08
17270	1716561	57658962	0	251227	2022-08-14	2022-08-08
17271	1718715	57680394	0	251363	2022-08-14	2022-08-08
17272	1715852	57651516	1	251222	2022-08-14	2022-08-08
17273	1465229	25582294	0	249658	2022-08-14	2022-08-08
17274	1716918	57659398	1	251227	2022-08-14	2022-08-08
17275	1716084	57651810	1	251222	2022-08-14	2022-08-08
17276	1465797	25585590	1	249658	2022-08-14	2022-08-08
17277	1716979	57664648	0	251227	2022-08-14	2022-08-08
17278	783448	22380147	0	251285	2022-08-14	2022-08-08
17279	1716147	57627542	1	251222	2022-08-14	2022-08-08
17280	1466134	25584672	1	249658	2022-08-14	2022-08-08
17281	1717410	57669640	1	251227	2022-08-14	2022-08-08
17282	1466130	25583402	0	251285	2022-08-14	2022-08-08
17283	1716297	57656698	1	251222	2022-08-14	2022-08-08
17284	1467262	25589870	1	249658	2022-08-14	2022-08-08
17285	1717483	57669842	0	251227	2022-08-14	2022-08-08
17286	1716094	57652656	1	251285	2022-08-14	2022-08-08
17287	1467451	25585916	1	249658	2022-08-14	2022-08-08
17288	1717541	57659048	0	251227	2022-08-14	2022-08-08
17289	1716653	57659728	1	251285	2022-08-14	2022-08-08
17290	743747	23047667	0	249608	2022-08-14	2022-08-08
17291	1717612	57669180	1	251227	2022-08-14	2022-08-08
17292	1468071	25593798	0	249658	2022-08-14	2022-08-08
17293	1415964	25413634	1	249608	2022-08-14	2022-08-08
17294	1718145	57674940	1	251285	2022-08-14	2022-08-08
17295	1717844	57669674	1	251227	2022-08-14	2022-08-08
17296	1712903	25595598	0	249658	2022-08-14	2022-08-08
17297	1453807	25545302	0	249608	2022-08-14	2022-08-08
17298	1718677	25531840	0	251285	2022-08-14	2022-08-08
17299	1717907	57673180	1	251227	2022-08-14	2022-08-08
17300	1715268	25552932	0	249658	2022-08-14	2022-08-08
17301	1713238	22565901	0	249608	2022-08-14	2022-08-08
17302	1719058	57647792	0	251285	2022-08-14	2022-08-08
17303	1714696	57640134	1	249608	2022-08-14	2022-08-08
17304	1717972	57673602	1	251227	2022-08-14	2022-08-08
17305	1715369	25505546	0	249658	2022-08-14	2022-08-08
17306	1720744	57727992	1	251285	2022-08-14	2022-08-08
17307	1716001	25578386	0	249608	2022-08-14	2022-08-08
17308	1718006	57672802	1	251227	2022-08-14	2022-08-08
17309	1721101	57731634	1	251285	2022-08-14	2022-08-08
17310	1716883	57653332	1	249608	2022-08-14	2022-08-08
17311	1712755	25528990	0	250173	2022-08-14	2022-08-08
17312	1316626	25190539	0	251276	2022-08-14	2022-08-08
17313	1712419	57608718	1	251282	2022-08-14	2022-08-08
17314	1714219	25513318	0	250173	2022-08-14	2022-08-08
17315	1713813	57637344	0	251276	2022-08-14	2022-08-08
17316	1712966	57631818	0	251282	2022-08-14	2022-08-08
17317	1717099	25304698	0	250173	2022-08-14	2022-08-08
17318	1714876	57645916	1	251276	2022-08-14	2022-08-08
17319	1714285	57632130	0	251282	2022-08-14	2022-08-08
17320	1715951	57608992	0	251276	2022-08-14	2022-08-08
17321	1712358	25915509	1	251362	2022-08-14	2022-08-08
17322	1714685	57639684	1	251282	2022-08-14	2022-08-08
17323	1716665	57660960	1	251276	2022-08-14	2022-08-08
17324	1715294	57646818	0	251362	2022-08-14	2022-08-08
17325	1715322	57623044	0	251282	2022-08-14	2022-08-08
17326	1716747	57663790	1	251276	2022-08-14	2022-08-08
17327	1717697	57671072	1	251362	2022-08-14	2022-08-08
17328	1715346	25837425	1	251282	2022-08-14	2022-08-08
17329	1716891	57659620	1	251276	2022-08-14	2022-08-08
17330	1718959	57677650	1	251362	2022-08-14	2022-08-08
17331	1715350	57647356	0	251282	2022-08-14	2022-08-08
17332	1717351	57659770	0	251276	2022-08-14	2022-08-08
17333	1718996	57683178	1	251362	2022-08-14	2022-08-08
17334	1715383	57650256	1	251282	2022-08-14	2022-08-08
17335	1717888	57672822	0	251276	2022-08-14	2022-08-08
17336	1715514	57638092	1	251282	2022-08-14	2022-08-08
17337	1718211	57633118	0	251276	2022-08-14	2022-08-08
17338	1715609	57651538	1	251282	2022-08-14	2022-08-08
17339	1718223	57675748	0	251276	2022-08-14	2022-08-08
17340	1715652	57638808	1	251282	2022-08-14	2022-08-08
17341	1718672	57676538	1	251276	2022-08-14	2022-08-08
17342	1715740	57633004	1	251282	2022-08-14	2022-08-08
17343	1718979	57682828	1	251276	2022-08-14	2022-08-08
17344	1715838	57653076	1	251282	2022-08-14	2022-08-08
17345	1719130	57677342	0	251276	2022-08-14	2022-08-08
17346	1716289	57656676	1	251282	2022-08-14	2022-08-08
17347	1717363	57633162	0	251231	2022-08-14	2022-08-08
17348	1717169	57650670	1	251282	2022-08-14	2022-08-08
17349	1717447	57669050	1	251231	2022-08-14	2022-08-08
17354	1716092	57653368	1	251275	2022-08-14	2022-08-08
17359	1719676	57700006	0	251231	2022-08-14	2022-08-08
17364	1717165	57627716	1	251275	2022-08-14	2022-08-08
17369	1720227	57726716	0	251231	2022-08-14	2022-08-08
17374	1717980	25576516	0	251429	2022-08-14	2022-08-08
17379	1720685	57610284	1	251429	2022-08-14	2022-08-08
17384	1695439	25852277	1	251364	2022-08-14	2022-08-08
17389	1719073	57679500	1	251364	2022-08-14	2022-08-08
17394	1720175	57562788	0	251364	2022-08-14	2022-08-08
17399	1721052	57731500	1	251280	2022-08-14	2022-08-08
17404	1716229	57643990	1	251233	2022-08-14	2022-08-08
17409	1720811	57699770	1	251233	2022-08-14	2022-08-08
20259	1459798	25533536	0	249566	2022-08-21	2022-08-15
20269	1723151	57609144	1	253797	2022-08-21	2022-08-15
20274	1217267	25041161	0	252699	2022-08-21	2022-08-15
20279	1712294	25098421	1	249566	2022-08-21	2022-08-15
20284	1727269	57792270	1	253797	2022-08-21	2022-08-15
20289	1728362	57803166	0	252699	2022-08-21	2022-08-15
20296	1727504	57799680	0	253797	2022-08-21	2022-08-15
20301	1730204	57822924	1	249566	2022-08-21	2022-08-15
20304	1468589	25583216	0	249551	2022-08-21	2022-08-15
20311	1730723	57813926	1	253472	2022-08-21	2022-08-15
20316	1724234	57759226	1	252277	2022-08-21	2022-08-15
20321	1730895	57813098	0	253472	2022-08-21	2022-08-15
20326	1727175	57792518	1	253455	2022-08-21	2022-08-15
17350	1712098	57612176	1	251275	2022-08-14	2022-08-08
17355	1719631	57698456	1	251231	2022-08-14	2022-08-08
17360	1716877	57646814	0	251275	2022-08-14	2022-08-08
17365	1719979	22855125	0	251231	2022-08-14	2022-08-08
17370	1711468	57602158	1	251429	2022-08-14	2022-08-08
17375	1719906	57702108	1	251429	2022-08-14	2022-08-08
17380	1720758	57730424	1	251429	2022-08-14	2022-08-08
17385	1717326	57643716	1	251364	2022-08-14	2022-08-08
17390	1719713	57696578	1	251364	2022-08-14	2022-08-08
17395	1720214	57560760	0	251364	2022-08-14	2022-08-08
17400	1721142	57730030	1	251280	2022-08-14	2022-08-08
17405	1720230	57680296	1	251233	2022-08-14	2022-08-08
17410	1720971	57730412	1	251233	2022-08-14	2022-08-08
20330	1730043	57812632	1	253455	2022-08-21	2022-08-15
20335	1730718	57813390	1	253455	2022-08-21	2022-08-15
20340	1715338		0	253437	2022-08-21	2022-08-15
20345	1726904	57796996	1	253437	2022-08-21	2022-08-15
20350	1727333	57628494	1	253437	2022-08-21	2022-08-15
20355	1727653	57800824	1	253437	2022-08-21	2022-08-15
17351	1718176	57670328	1	251231	2022-08-14	2022-08-08
17356	1716237	57656360	1	251275	2022-08-14	2022-08-08
17361	1719709	57700792	0	251231	2022-08-14	2022-08-08
17366	1717191	57666148	1	251275	2022-08-14	2022-08-08
17371	1716365	57657124	0	251429	2022-08-14	2022-08-08
17376	1720102	57642196	0	251429	2022-08-14	2022-08-08
17381	1720765	57729702	1	251429	2022-08-14	2022-08-08
17386	1717617	57671054	1	251364	2022-08-14	2022-08-08
17391	1719829	57666202	1	251364	2022-08-14	2022-08-08
17396	1720427	57727056	0	251280	2022-08-14	2022-08-08
17401	1721630	57728836	1	251280	2022-08-14	2022-08-08
17406	1720389	57713858	1	251233	2022-08-14	2022-08-08
17411	1721156	57728838	0	251233	2022-08-14	2022-08-08
20331	1730093	57810616	1	253455	2022-08-21	2022-08-15
20336	1730852	57807690	1	253455	2022-08-21	2022-08-15
20341	1723706	57681706	1	253437	2022-08-21	2022-08-15
20346	1726911	57791398	1	253437	2022-08-21	2022-08-15
20351	1727426	57796578	1	253437	2022-08-21	2022-08-15
20356	1731528	57817952	1	253437	2022-08-21	2022-08-15
17352	1713681	57636736	1	251275	2022-08-14	2022-08-08
17357	1719666	57701084	0	251231	2022-08-14	2022-08-08
17362	1716957	57600490	0	251275	2022-08-14	2022-08-08
17367	1720034	57715366	1	251231	2022-08-14	2022-08-08
17372	1716688	57659152	0	251429	2022-08-14	2022-08-08
17377	1720409	57676210	1	251429	2022-08-14	2022-08-08
17382	1720813	57730810	1	251429	2022-08-14	2022-08-08
17387	1718552	57612838	1	251364	2022-08-14	2022-08-08
17392	1719943	57702360	0	251364	2022-08-14	2022-08-08
17397	1720437	57727576	0	251280	2022-08-14	2022-08-08
17402	1408168	25400474	1	251233	2022-08-14	2022-08-08
17407	1720422	57676976	1	251233	2022-08-14	2022-08-08
17412	1721265	57728874	0	251233	2022-08-14	2022-08-08
20332	1730628	57803940	0	253455	2022-08-21	2022-08-15
20337	1730981	57812458	1	253455	2022-08-21	2022-08-15
20342	1724699	57766662	0	253437	2022-08-21	2022-08-15
20347	1727156	57794286	1	253437	2022-08-21	2022-08-15
20352	1727430	57793978	0	253437	2022-08-21	2022-08-15
17353	1719608	57696912	0	251231	2022-08-14	2022-08-08
17358	1716869	57588568	1	251275	2022-08-14	2022-08-08
17363	1719855	57643850	1	251231	2022-08-14	2022-08-08
17368	1720211	57726536	1	251231	2022-08-14	2022-08-08
17373	1717407	57669338	1	251429	2022-08-14	2022-08-08
17378	1720442	57656770	1	251429	2022-08-14	2022-08-08
17383	1721033	57555840	1	251429	2022-08-14	2022-08-08
17388	1719063	57695514	0	251364	2022-08-14	2022-08-08
17393	1720014	57714238	1	251364	2022-08-14	2022-08-08
17398	1721046	57729816	0	251280	2022-08-14	2022-08-08
17403	1714500	57641822	0	251233	2022-08-14	2022-08-08
17408	1720500	57727542	0	251233	2022-08-14	2022-08-08
20333	1730654	57809890	1	253455	2022-08-21	2022-08-15
20338	1731081	57816664	1	253455	2022-08-21	2022-08-15
20343	1724704	57626842	1	253437	2022-08-21	2022-08-15
20348	1727206	57792706	1	253437	2022-08-21	2022-08-15
20353	1727581	57800762	1	253437	2022-08-21	2022-08-15
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 75, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 22, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 21, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 69, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);


--
-- Name: home_globalgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.home_globalgroup_id_seq', 10855, true);


--
-- Name: home_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.home_group_id_seq', 2218, true);


--
-- Name: home_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.home_location_id_seq', 773, true);


--
-- Name: home_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.home_payment_id_seq', 1258, true);


--
-- Name: home_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.home_report_id_seq', 5052, true);


--
-- Name: home_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.home_student_id_seq', 1, false);


--
-- Name: home_studentamoref_id_seq; Type: SEQUENCE SET; Schema: public; Owner: logikaadmin
--

SELECT pg_catalog.setval('public.home_studentamoref_id_seq', 20356, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: home_globalgroup home_globalgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_globalgroup
    ADD CONSTRAINT home_globalgroup_pkey PRIMARY KEY (id);


--
-- Name: home_group home_group_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_group
    ADD CONSTRAINT home_group_pkey PRIMARY KEY (id);


--
-- Name: home_location home_location_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_location
    ADD CONSTRAINT home_location_pkey PRIMARY KEY (id);


--
-- Name: home_payment home_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_payment
    ADD CONSTRAINT home_payment_pkey PRIMARY KEY (id);


--
-- Name: home_report home_report_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_report
    ADD CONSTRAINT home_report_pkey PRIMARY KEY (id);


--
-- Name: home_student home_student_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_student
    ADD CONSTRAINT home_student_pkey PRIMARY KEY (id);


--
-- Name: home_studentamoref home_studentamoref_pkey; Type: CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.home_studentamoref
    ADD CONSTRAINT home_studentamoref_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: logikaadmin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: logikaadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: cloudsqlsuperuser
--

REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO cloudsqlsuperuser;


--
-- PostgreSQL database dump complete
--

