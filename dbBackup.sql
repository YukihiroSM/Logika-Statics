PGDMP         7                z           statistics-db    14.4     14.5 (Ubuntu 14.5-1.pgdg20.04+1) �                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            !           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            "           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            #           1262    16465    statistics-db    DATABASE     c   CREATE DATABASE "statistics-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF8';
    DROP DATABASE "statistics-db";
                cloudsqlsuperuser    false            $           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   cloudsqlsuperuser    false    3            %           0    0 4   FUNCTION pg_replication_origin_advance(text, pg_lsn)    ACL     c   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    254            &           0    0 +   FUNCTION pg_replication_origin_create(text)    ACL     Z   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    242            '           0    0 )   FUNCTION pg_replication_origin_drop(text)    ACL     X   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    243            (           0    0 (   FUNCTION pg_replication_origin_oid(text)    ACL     W   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    244            )           0    0 6   FUNCTION pg_replication_origin_progress(text, boolean)    ACL     e   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    245            *           0    0 1   FUNCTION pg_replication_origin_session_is_setup()    ACL     `   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    246            +           0    0 8   FUNCTION pg_replication_origin_session_progress(boolean)    ACL     g   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    255            ,           0    0 .   FUNCTION pg_replication_origin_session_reset()    ACL     ]   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    247            -           0    0 2   FUNCTION pg_replication_origin_session_setup(text)    ACL     a   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    248            .           0    0 +   FUNCTION pg_replication_origin_xact_reset()    ACL     Z   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    249            /           0    0 K   FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone)    ACL     z   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    250            0           0    0    FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn)    ACL     �   GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    256            �            1259    16493 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    logikaadmin    false            �            1259    16492    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          logikaadmin    false    216            1           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          logikaadmin    false    215            �            1259    16502    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    logikaadmin    false            �            1259    16501    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          logikaadmin    false    218            2           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          logikaadmin    false    217            �            1259    16486    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    logikaadmin    false            �            1259    16485    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          logikaadmin    false    214            3           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          logikaadmin    false    213            �            1259    16509 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
    DROP TABLE public.auth_user;
       public         heap    logikaadmin    false            �            1259    16518    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    logikaadmin    false            �            1259    16517    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          logikaadmin    false    222            4           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          logikaadmin    false    221            �            1259    16508    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          logikaadmin    false    220            5           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          logikaadmin    false    219            �            1259    16525    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    logikaadmin    false            �            1259    16524 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          logikaadmin    false    224            6           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          logikaadmin    false    223            �            1259    16584    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    logikaadmin    false            �            1259    16583    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          logikaadmin    false    226            7           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          logikaadmin    false    225            �            1259    16477    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    logikaadmin    false            �            1259    16476    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          logikaadmin    false    212            8           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          logikaadmin    false    211            �            1259    16468    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    logikaadmin    false            �            1259    16467    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          logikaadmin    false    210            9           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          logikaadmin    false    209            �            1259    16691    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    logikaadmin    false            �            1259    16614    home_globalgroup    TABLE     b  CREATE TABLE public.home_globalgroup (
    id integer NOT NULL,
    group_id character varying(20) NOT NULL,
    group_name character varying(256) NOT NULL,
    group_location character varying(256) NOT NULL,
    group_teacher character varying(256) NOT NULL,
    group_manager character varying(256) NOT NULL,
    group_region character varying(256)
);
 $   DROP TABLE public.home_globalgroup;
       public         heap    logikaadmin    false            �            1259    16613    home_globalgroup_id_seq    SEQUENCE     �   CREATE SEQUENCE public.home_globalgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.home_globalgroup_id_seq;
       public          logikaadmin    false    228            :           0    0    home_globalgroup_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.home_globalgroup_id_seq OWNED BY public.home_globalgroup.id;
          public          logikaadmin    false    227            �            1259    16623 
   home_group    TABLE     �  CREATE TABLE public.home_group (
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
    DROP TABLE public.home_group;
       public         heap    logikaadmin    false            �            1259    16622    home_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.home_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.home_group_id_seq;
       public          logikaadmin    false    230            ;           0    0    home_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.home_group_id_seq OWNED BY public.home_group.id;
          public          logikaadmin    false    229            �            1259    16632    home_location    TABLE     m  CREATE TABLE public.home_location (
    id integer NOT NULL,
    standart_name character varying(256),
    lms_location_name character varying(256) NOT NULL,
    region character varying(200),
    client_manager character varying(256),
    territorial_manager character varying(256),
    regional_manager character varying(256),
    tutor character varying(256)
);
 !   DROP TABLE public.home_location;
       public         heap    logikaadmin    false            �            1259    16631    home_location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.home_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.home_location_id_seq;
       public          logikaadmin    false    232            <           0    0    home_location_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.home_location_id_seq OWNED BY public.home_location.id;
          public          logikaadmin    false    231            �            1259    16641    home_payment    TABLE     �  CREATE TABLE public.home_payment (
    id integer NOT NULL,
    group_manager character varying(256) NOT NULL,
    client_name character varying(256) NOT NULL,
    client_lms_id character varying(256) NOT NULL,
    group_course character varying(256) NOT NULL,
    bussiness character varying(256) NOT NULL,
    report_date_start character varying(256) NOT NULL,
    report_date_end character varying(256) NOT NULL
);
     DROP TABLE public.home_payment;
       public         heap    logikaadmin    false            �            1259    16640    home_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.home_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.home_payment_id_seq;
       public          logikaadmin    false    234            =           0    0    home_payment_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.home_payment_id_seq OWNED BY public.home_payment.id;
          public          logikaadmin    false    233            �            1259    16650    home_report    TABLE     0  CREATE TABLE public.home_report (
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
    DROP TABLE public.home_report;
       public         heap    logikaadmin    false            �            1259    16649    home_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.home_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.home_report_id_seq;
       public          logikaadmin    false    236            >           0    0    home_report_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.home_report_id_seq OWNED BY public.home_report.id;
          public          logikaadmin    false    235            �            1259    16659    home_student    TABLE     ;  CREATE TABLE public.home_student (
    id integer NOT NULL,
    lms_id character varying(256) NOT NULL,
    student_name character varying(256) NOT NULL,
    group_id character varying(256) NOT NULL,
    group_location character varying(256),
    amo_id character varying(100),
    region character varying(256)
);
     DROP TABLE public.home_student;
       public         heap    logikaadmin    false            �            1259    16658    home_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.home_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.home_student_id_seq;
       public          logikaadmin    false    238            ?           0    0    home_student_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.home_student_id_seq OWNED BY public.home_student.id;
          public          logikaadmin    false    237            �            1259    16668    home_studentamoref    TABLE     T  CREATE TABLE public.home_studentamoref (
    id integer NOT NULL,
    lms_id character varying(20) NOT NULL,
    amo_id character varying(20) NOT NULL,
    attended character varying(10) NOT NULL,
    group_id character varying(20) NOT NULL,
    report_end character varying(64) NOT NULL,
    report_start character varying(64) NOT NULL
);
 &   DROP TABLE public.home_studentamoref;
       public         heap    logikaadmin    false            �            1259    16667    home_studentamoref_id_seq    SEQUENCE     �   CREATE SEQUENCE public.home_studentamoref_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.home_studentamoref_id_seq;
       public          logikaadmin    false    240            @           0    0    home_studentamoref_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.home_studentamoref_id_seq OWNED BY public.home_studentamoref.id;
          public          logikaadmin    false    239                       2604    16496    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    216    215    216                       2604    16505    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    218    217    218                       2604    16489    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    213    214    214                        2604    16512    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    219    220    220            !           2604    16521    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    222    221    222            "           2604    16528    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    223    224    224            #           2604    16587    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    225    226    226                       2604    16480    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    211    212    212                       2604    16471    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    209    210    210            %           2604    16617    home_globalgroup id    DEFAULT     z   ALTER TABLE ONLY public.home_globalgroup ALTER COLUMN id SET DEFAULT nextval('public.home_globalgroup_id_seq'::regclass);
 B   ALTER TABLE public.home_globalgroup ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    227    228    228            &           2604    16626    home_group id    DEFAULT     n   ALTER TABLE ONLY public.home_group ALTER COLUMN id SET DEFAULT nextval('public.home_group_id_seq'::regclass);
 <   ALTER TABLE public.home_group ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    229    230    230            '           2604    16635    home_location id    DEFAULT     t   ALTER TABLE ONLY public.home_location ALTER COLUMN id SET DEFAULT nextval('public.home_location_id_seq'::regclass);
 ?   ALTER TABLE public.home_location ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    231    232    232            (           2604    16644    home_payment id    DEFAULT     r   ALTER TABLE ONLY public.home_payment ALTER COLUMN id SET DEFAULT nextval('public.home_payment_id_seq'::regclass);
 >   ALTER TABLE public.home_payment ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    233    234    234            )           2604    16653    home_report id    DEFAULT     p   ALTER TABLE ONLY public.home_report ALTER COLUMN id SET DEFAULT nextval('public.home_report_id_seq'::regclass);
 =   ALTER TABLE public.home_report ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    236    235    236            *           2604    16662    home_student id    DEFAULT     r   ALTER TABLE ONLY public.home_student ALTER COLUMN id SET DEFAULT nextval('public.home_student_id_seq'::regclass);
 >   ALTER TABLE public.home_student ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    237    238    238            +           2604    16671    home_studentamoref id    DEFAULT     ~   ALTER TABLE ONLY public.home_studentamoref ALTER COLUMN id SET DEFAULT nextval('public.home_studentamoref_id_seq'::regclass);
 D   ALTER TABLE public.home_studentamoref ALTER COLUMN id DROP DEFAULT;
       public          logikaadmin    false    239    240    240                      0    16493 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          logikaadmin    false    216   ��                 0    16502    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          logikaadmin    false    218   ,�                 0    16486    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          logikaadmin    false    214   C�                 0    16509 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          logikaadmin    false    220   U�       
          0    16518    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          logikaadmin    false    222   �                 0    16525    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          logikaadmin    false    224   ��                 0    16584    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          logikaadmin    false    226   ��                  0    16477    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          logikaadmin    false    212   �       �          0    16468    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          logikaadmin    false    210   ��                 0    16691    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          logikaadmin    false    241   ��                 0    16614    home_globalgroup 
   TABLE DATA           �   COPY public.home_globalgroup (id, group_id, group_name, group_location, group_teacher, group_manager, group_region) FROM stdin;
    public          logikaadmin    false    228   9�                 0    16623 
   home_group 
   TABLE DATA           �   COPY public.home_group (id, group_id, group_name, group_location, group_teacher, group_manager, group_course, report_date_start, report_date_end, total, attended) FROM stdin;
    public          logikaadmin    false    230   V�                 0    16632    home_location 
   TABLE DATA           �   COPY public.home_location (id, standart_name, lms_location_name, region, client_manager, territorial_manager, regional_manager, tutor) FROM stdin;
    public          logikaadmin    false    232   v#                0    16641    home_payment 
   TABLE DATA           �   COPY public.home_payment (id, group_manager, client_name, client_lms_id, group_course, bussiness, report_date_start, report_date_end) FROM stdin;
    public          logikaadmin    false    234   :5                0    16650    home_report 
   TABLE DATA           �   COPY public.home_report (id, location_name, region, total, attended, payments, conversion, start_date, end_date, students_without_amo, territorial_manager, business, regional_manager, client_manager) FROM stdin;
    public          logikaadmin    false    236   \R                0    16659    home_student 
   TABLE DATA           j   COPY public.home_student (id, lms_id, student_name, group_id, group_location, amo_id, region) FROM stdin;
    public          logikaadmin    false    238   C�                0    16668    home_studentamoref 
   TABLE DATA           n   COPY public.home_studentamoref (id, lms_id, amo_id, attended, group_id, report_end, report_start) FROM stdin;
    public          logikaadmin    false    240   `�      A           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);
          public          logikaadmin    false    215            B           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 75, true);
          public          logikaadmin    false    217            C           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);
          public          logikaadmin    false    213            D           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 22, true);
          public          logikaadmin    false    221            E           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 21, true);
          public          logikaadmin    false    219            F           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          logikaadmin    false    223            G           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 69, true);
          public          logikaadmin    false    225            H           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);
          public          logikaadmin    false    211            I           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);
          public          logikaadmin    false    209            J           0    0    home_globalgroup_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.home_globalgroup_id_seq', 10855, true);
          public          logikaadmin    false    227            K           0    0    home_group_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.home_group_id_seq', 2218, true);
          public          logikaadmin    false    229            L           0    0    home_location_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.home_location_id_seq', 773, true);
          public          logikaadmin    false    231            M           0    0    home_payment_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.home_payment_id_seq', 1258, true);
          public          logikaadmin    false    233            N           0    0    home_report_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.home_report_id_seq', 5052, true);
          public          logikaadmin    false    235            O           0    0    home_student_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.home_student_id_seq', 1, false);
          public          logikaadmin    false    237            P           0    0    home_studentamoref_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.home_studentamoref_id_seq', 20356, true);
          public          logikaadmin    false    239            9           2606    16611    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            logikaadmin    false    216            >           2606    16541 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            logikaadmin    false    218    218            A           2606    16507 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            logikaadmin    false    218            ;           2606    16498    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            logikaadmin    false    216            4           2606    16532 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            logikaadmin    false    214    214            6           2606    16491 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            logikaadmin    false    214            I           2606    16523 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            logikaadmin    false    222            L           2606    16556 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            logikaadmin    false    222    222            C           2606    16514    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            logikaadmin    false    220            O           2606    16530 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            logikaadmin    false    224            R           2606    16570 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            logikaadmin    false    224    224            F           2606    16606     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            logikaadmin    false    220            U           2606    16592 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            logikaadmin    false    226            /           2606    16484 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            logikaadmin    false    212    212            1           2606    16482 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            logikaadmin    false    212            -           2606    16475 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            logikaadmin    false    210            g           2606    16697 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            logikaadmin    false    241            X           2606    16621 &   home_globalgroup home_globalgroup_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.home_globalgroup
    ADD CONSTRAINT home_globalgroup_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.home_globalgroup DROP CONSTRAINT home_globalgroup_pkey;
       public            logikaadmin    false    228            Z           2606    16630    home_group home_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.home_group
    ADD CONSTRAINT home_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.home_group DROP CONSTRAINT home_group_pkey;
       public            logikaadmin    false    230            \           2606    16639     home_location home_location_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.home_location
    ADD CONSTRAINT home_location_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.home_location DROP CONSTRAINT home_location_pkey;
       public            logikaadmin    false    232            ^           2606    16648    home_payment home_payment_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.home_payment
    ADD CONSTRAINT home_payment_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.home_payment DROP CONSTRAINT home_payment_pkey;
       public            logikaadmin    false    234            `           2606    16657    home_report home_report_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.home_report
    ADD CONSTRAINT home_report_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.home_report DROP CONSTRAINT home_report_pkey;
       public            logikaadmin    false    236            b           2606    16666    home_student home_student_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.home_student
    ADD CONSTRAINT home_student_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.home_student DROP CONSTRAINT home_student_pkey;
       public            logikaadmin    false    238            d           2606    16673 *   home_studentamoref home_studentamoref_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.home_studentamoref
    ADD CONSTRAINT home_studentamoref_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.home_studentamoref DROP CONSTRAINT home_studentamoref_pkey;
       public            logikaadmin    false    240            7           1259    16612    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            logikaadmin    false    216            <           1259    16552 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            logikaadmin    false    218            ?           1259    16553 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            logikaadmin    false    218            2           1259    16538 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            logikaadmin    false    214            G           1259    16568 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            logikaadmin    false    222            J           1259    16567 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            logikaadmin    false    222            M           1259    16582 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            logikaadmin    false    224            P           1259    16581 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            logikaadmin    false    224            D           1259    16607     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            logikaadmin    false    220            S           1259    16603 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            logikaadmin    false    226            V           1259    16604 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            logikaadmin    false    226            e           1259    16699 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            logikaadmin    false    241            h           1259    16698 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            logikaadmin    false    241            k           2606    16547 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          logikaadmin    false    218    3894    214            j           2606    16542 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          logikaadmin    false    216    3899    218            i           2606    16533 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          logikaadmin    false    214    3889    212            m           2606    16562 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          logikaadmin    false    222    216    3899            l           2606    16557 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          logikaadmin    false    220    222    3907            o           2606    16576 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          logikaadmin    false    214    224    3894            n           2606    16571 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          logikaadmin    false    220    224    3907            p           2606    16593 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          logikaadmin    false    212    226    3889            q           2606    16598 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          logikaadmin    false    3907    226    220               6   x�3�LL����2�,I-*�,�/�L̉�M�KLO-�2�,JM���K������ k{�           x�ѹ�$1CQ��qӒ��?��k�0��EQ��J�T��ڵ5����u\����s}��gKd( "Q
�hL�(�*�,�.�/�/=�o�T�e)�x9J��J�<J��J�|*�Z*�
^���+�
�Z�W�«�«�«�«�����P�u���;�-��x=j��j�>j��j�~�Y�	ޤ��d�iү0�h6�5����%�N�{/�����%���+�ݤ�C��I����ڗt��Wg9=��������|���{��'�?�7Py           x�m�Q��0E��Ud���Ɠ�Rp)$QZ����}'�ǌ��|=��쇪?���x�°�O�L��cM��	9��KPTj�x��j0�
����)��(P�ͦ0߯�rS�Zi�=�)��=��bYخ(*��;f��<>&�I�~[�C9Yg/F:	�:��EE ��e�K�MC���5x>���	h�t����ټLG��C>�4k��j}N��d��WǺE60)��^����wEsC��b]�^B��=	sek��°g�T��z����2R�~����_�!E�Z�k��,�B^%~�KȐ��o�8d��� ��C�;�|�!��N�K~���fש__�GW*�o���T]�zve0�.�8�2ƣK��2��y��3q��J���E $SK8�����\/ �4��)ɟ�4ΑH�>U�Q�/+	�r_(
b_���~YgNӝKۨ�$/Q8�r��)
�*�Ea�[�����~��.vcӶ���E��.��wis�U��������Z���4         �  x��W[���}���<�v�޾#����jl�����6�`�S2U�V��*��!��ӧ�J���d2ӿ ����tfT*�c	���ַ�2s��5gp��L2 ��]T �2��L��1��*���(�䪞��.���|��L�ju���F��Su(8��79 |p�C��KQl��3� �f9;@ko�h�(w���������������_��~�s�y�v��o|����`�I�<f��1�Ih����yΰS��Gasȷ�)1�,��z{%�QcF6:l�\�.0�\��h�g���*&kd:�7��㧹��ï��?���'��e�*q�]��ǌ���vǜm�t�r4߬�mQ�.I g�Y�����%�Y\�zX/����/��G�(ػ��O1쯎�����㇇����t��
t�ˠ3���}���ޝjT�d���64�a�t\��X���H^1�$D����j������՟��-�(QT	� x�8�wh�L�z�--7Dk3��rxq���K���9>�÷�1��Ǐ��JQ"�i�e6u�60�17�M���k)
�D���u4���u`�L�v8�9�`����u�Q���[��s���I�"��(\;.�b����I|�� ������,���e�6s�NE�ܩA�7���,[;����˗�V!紎�[�3��P�_���$����,�$d }C��ho�]ob:kL���eF��8�������
�$�+ː.v��-�u�9r��3���9���d��`V���VӺ���Œc�VC-G�tCi���h�D��a'!9�d�"'����<~���4�?9�_�@���#�I?̄��&䫦k���F����cIq��4�U:wA9a���纰&�ď�]s��L�.ߪ�=H�� �O�E(�d�y&������:Z�������	^���<�����'L��dh|��-�e�*�TaC�r
@=�c��6�vQ���,rg�<�-��v�k:F�ژb��.��̕!y�>O&\9���d��ڑg�d�b���RHpذJ'븹�r�����k��2H���8�����&M��}�+�^�u�\�m�Wt=�v�L�j��G#�4h� H�!��a��?κ"K�)��I[ɚNz4�b'�H�N�0O��`ƳU�u�l��V�U2VzB���#l�$߆�;N��#U`�>��
��&���IT�J|�����o�W�?��xy?vq���e�.�"-/ Em����q}�WZ��8�m�2�t�#օ���.�@��Ԥ�z�������Ԁ��=�q�2����d��<G�i!��e^�!ה��+�,>o���;����M�If$~*�e%o��*,2p���������2K��q�g&j�O��{4�DS��Y�:.��ɠ��t�)�R��3W�?\��ױGew��.��S�o�xT6kz����W�|��V�H�զ�[ih�����/�P�p6r*HU�����zC �Lc�B/B�}�%�;�3SQ�_��U�T��<�?q:!���L8PӍ�nw����[R��)�#�15���dZ&�⾻��-7Bq-КL=R�ix�b���a�eam7���\qN<������T=~8~��ﺖ`f7W��Qv{-��>Lf�^�h���ӜZ�6�e%&�ƞ��:+b$�؃-�
����
K���A��M
���JDV�X�''����K�ߧ$�b�$�o|˕�h#���]�J�Y��N4��j������x��N��4u��o��ہy�Ve��=����s�MQn���r#s�s��D���k�	�0�`Hn���,,E�(��R>h{�� ���v��Ͱ��;p-d��E�]q�d���K?��d
�4wN��D��'�h���~�O�G|�/N���O������>��e
C+�kƠ�Q6� �c�ї+y���y���QI}hH��S��6�Ti���ޤ��,�hP`	��_�����duvЯ�t�d��R��w�\�������Ve$o����$�v^�6z��x���!]���"폚{��@�k�m�G詬l3$�(���ny����ğ��f�}�!+zWJ7β��we�h�4=Ua]�I����y�2��J�w'U[��*�k��t��*�5�qA��A4�=��dm$�o�\{����p��0�ߟ�~�R���᷅���� D�I�      
   Z   x����0�b���������8(P;J���e�ȇ$c2�Œ�-����#�ׅ�S���_L=1���S̎�ݫ��^�����"� �|            x������ � �         e  x��Yˎ�D]{���-��n=��a�����3m�kdw�HQ$$HYD$�؍�a�_��#nٞ$��'L2V�iw��=�֭S��i�c�D�SSH�I�H�p-��D4��Ė�~\���|aK���푝L��(�o߹s#2�c!"�D
è~"D�@�蔓�R��i &�|�A ��|�ۘ�A��S�i���� _-��@� `CW� ZgE��WEn��]ڃ����!�Љ�k�a���.j�ѭ<�OJ|y}�IV,���эsl��,�L��Z�{5��q��'����vP��C\0�%c�(��0/�u���lt-}l_��tmo݊˵]oJ�Q��6�x�M�c�#����[��rzs�/�ҡ$,�R�{�J��6�2���p�m6+��h�o�i�����b!�D0B���ejA*F$aXV��.�N�^jo_�)�	(����?_�3[K�E��[��ȄpJD�JG�'w���o�s��{�G�;q��%j���=�����=�r�Nb�Нl�n�o���g�t#nt��g"أm�@z�9���z?+�H���N��n�vO�����I'BP�i�IF�9�zR��==g�aԖ+d�d��J���̽�ޫ���Z����uo{��­�a�X����������|G��Nc�{��7~<�R��.
�5���u��v�0��R)TJQ_����dm��(������0�v�����D��zOr�x�K�?�$3�Ω�!:bH�d��%�� � ��0n��W&1M,��@qu����`<�%�]�&k0�i?�H��ʝiD=f�S�{����>�7��J�o<vO=�}��������|���=�|�����ٿ���z�=;���M�+]d,F#���i�bU/����p���xfљ�����`�76�ɾ�FH�0:j�BWG���ڲ�rUL^�[A8��:"B+�(� Y�]����.']�!2����r C6�
� ��|��Ya�nV���S潍��P8	sﰹ�>����!4I���UBGs[��v|�A�֗�	Q@%Be:@ʅ�6�M��P?{�|�!ڂ tJ6�� ��UW�}��o�Ba{)9�C�p��`R�N{��OI����t���(�U�ޗ�P��b�K�*)r��75z�jh�4���东�.;��v��X��L`�se걧슴��vt魳`�ޣ�E��b��3;΋�$t�vRj��n'�PKcB"L%�޴	D_M�b����f$D��D0(%#hHC�Ind�<�K[���|�Eo6����􇌙.���	� �?�(��f�t*������t%P^�%JT�P�*���&�iSV!���W���_D��?��BZ�A�V��XB��uV*:�gv^t�I���H@�)�=HC�������Im_��ʬ�fRy�A$m��kƨ��X%&���D%�?���=j��E��xr�m�b�@#tu
I�g���0՜O#U�1���:;���E�'�0~��I�8��3TB�L��H�y�Ё�4�|3�b��Mv2
�&�OMy?�P���B���$g�����>�#"��_1�"��^z:��yB�0n Tkv��;��������b�          �   x�U�M�0�5�1��wq���v&	H��5�����)�	ϔ�l؁�e�LWՕ����5��P��0r*�[�2�/�J�[�^a�H0|���'j������т췸עsf�̲�3j�S[������8 ��RL�      �      x���ێ�0���)����3>�,�,�)�$���;v��]���������3 ���Ou?M�s=nc�����n�!>3��	`��x�*�0�ō���g
Qi��H
���?��
Tz_��G�G�2\\���vt����P���%��1��A:��S3���G�?͞�_b	m8�(��*\��~��7��]]$iae��:�Nup�:t�8�z��u�͵u��J ��V&�LF�+j�Qw�i?��
4�#�f����G*g8O%oTťbJD�̐��֏S�����m�ݪ�U�@�(���܄lnr�Eӊ͹��'�%S_Ky�ms�����:�!��G,v]U�3KM<�Lѝm���K�Ad�}��WP�K��� W�+����%��B�"�1��3YT�s�.w�,���n����g��[�4�ײT���e6����a*�L
H�%qI�}��}��y�|OE�B�m�0��X��; C�_W"d�XW��_�HXڳr [1�&ـ�9�V
��0y�A=�B����D�9q��C��8��gt��4��Z`�Ͷ
5$�Qd�&V��C���|7�Q�]Α���Iꗢ�ap���B��:��)�@�FV!H!��UMu��K�EhFU$J�/�Ӓ�o�7�R��8W�>��g�濤�Zr��<g�j�XX�r+Ģ�Aq�뀲TT+�_����'�d�[�G�d9� W�~�c��)�I�!Ҏ�3S�y'䠇�H<��v�h�*MqI��;�+���#>1�C�cPqf,O��?��v����         g  x���Y��V ��U�z���g3Sc�B��m���i��J"u:;(����^��>L	u���L���i<,<��?����#]���~���5�՗�>��0c�U��.N��˔Y�G<��2X�wix���K�O`����7B�6M��~�rKڈ�C���*?��S���SÖn��gd��Zx^��q0�vCX����&z��qT���f�!�\'�n�7
|`����DװO�S雇g���㉱��f����X]f��M�<�'�
�
�S��� ��0"$�IQ��-�.�$���b���[��N������g[��xտ�\s'x0�h&9��̙~ �1��)�!���K�cҿ�A�S$.�pڧ��2��'�VXJw���*�3V�D��rng-4�����3TP{���O���2#�M4:1�ʐ�0�^>`�Ƀ��V��D&QJS2�Wi���jq��F`&;3�]'��9�Y�?o0��7|�EDY�L�`�$Dd�ETWL;׋|��uV�0��	|�l��oID[��r���^�j~^�z���l	栫J��w�9��K�9D�+�N! P�_D,
��k��i$�(�j"��1n����E����p�$7�3��ǣ�>�&R�f��[s�"o��9����Ź���v�����٠J4jl{_;�n}�4l����\�����v�U������Ǜ�E�Ln�����[,ti�-Au�����,��}�&�"b4Q��F�1�����{o4eǳ4����;���2�������8�$(I��	�ny�zK�U=�CP���m{(طlGLv�^Mt!���)�W^�M���!C�����0#"
��|4�!�s�����&�            x������ � �            x��}ݏǑ�s���7�����^��a���>�`��I�� ?�C�d�9$5�ΐ��,-���!9���=U�G����YY���]3^��fOWwGFF��/>2��|��iV��q���<mΚ�f�y՜m6Ϛ׋������s�bq��_\_|��ތ��y���o�o��o����Y�xq޼l��7�ӷ����Y�?k�n^�/�)�z�9�?E�K�ŋ�����b�9O}���~���4K�Irm^]�s��$�����U\�R���{��;��Y�)�9N��y�� ({�����K���T7G����s�3��s���q�$�x����ɟ>x?�������"JZD�-����ŧ�C���c��	�n =D�ߛ��]��9��.e�޻'>u���������������1B+$4�F����S��#I�K{!^�,n�d܍����;�!p�� S���GA��gO9���N����r$��
<�3�r����T�r<F��:,�ٱ�5�_�Aց�}��������>%6Fbs��Ǒe��Ǳ�'tY���#���z��qd���qd�^�q��P�T�Ƴ��v��i�-5�Q(��'���ش[�G�/bMw�[��;� �bOB�#'M�I��ei���|yq�h�B\�@��[�v��8g$5'�q�1/`E�
һ�FRe�-������v�ģo��_���������Y���>q��!����,m��~�|��'�~<�
a=��z\@�Z�f�`�|�`��Ah�l��K�<A��-
u4�E�`�	.�}�M�߀������'�ĥ��-��׼�5ų�$�[(���3!������U�į�g����c��-�>>�Ev,�-�ٯ���!��eZ"Xm������F�Ϥ���w�TӪF=1s5U�j�Ay��� RJv�z��'$U��H����-��5ߢ̟�$E��[�����؀<������M��+|(}u��s���es�ka'^�9��.�&4>�v;_t*��C���şN"�G$~��h[�"���#�\��?i^E�ˑ˯7�����ۋ��נe_��C;�8(���D��fW(<d�fdۉѡ�툓����S.��9=d�Q���th�dl�u�M��8O!b���`��X���p)��|��<;���耀-�W����K�
����Ma�X[A���Ԡ��n��bҤ�������7:���pS��#� �SeҒ����,���Ꝗ*rs��I�k��M�����pߵ�Mb�!���r�� �9���t���C�?�'v�>n�k��B��KcE���7��п[�6Ko�������e�ˌ��GFhb��k����ˣH���>p���11����3��DfA���*�IL���$:��2醚w��M��zMЊ'JT��~:��J�����ó��uIs�d֔��9T�&`�D9�,�8w��RLK����1D;��&OI�'�\>�e l�E+IB���:�	ڴr�IL��K�� ��$'�QvOb�>�H�eh��+��XwS�\�?��K�-D���F�#t9),�E�qN1<�{�E��@�(�*͊�>��~[B�qG*䒠�:!0��-�p�¤&����
�i_3V�������� �I�L&��c]�Zc�Cw��^���E�s�oQ2�/߼�3�>��Zr>�胱EI�9w�O����*Ki>�?C����k�2���'�)�^Z��%)�}EPb�JJ�،Ew�Ze�D*!�q���*���H�n&5���*���H+�b�tЋ����zԋ�ΊoM��bF�XO��Dl`�A��KK�ddA�ԏk��5KF	�t\�;�%�2��q����(��<��ZP���;�RF�-u�	|��
	���	�́�[%ϰ�.��
��u��0�,�9G.���/��8�F)�^Jř�J�:��=�Lg�3�d[%�g��f�K�;H�"Y-��P&�?i� �@��X��mG�J�Y�����H���f��F<�}(�/�wt�ZK8���<U'���ڔo��}�f_�~?��a]�_���
�e^�T� �Y��w��]V�z��Inڪ��rs���jB3����J��9��|^� �I���_�np$,�w>��4*��lt�9�d��g"�|��	>|fYl��[�CޞK�����uI�y<<"�H� ُ lC1��(��,a�p�x��<iO����زȗ>�j�9��XW6u^�
���<%� FĚ�dD���A?��ׂ�C����}3dy'8�+;�^W軤�GȘ���6X~��{[v���9��c���>äs{n=E#']�{���Ȝ���G��3�fK˔Kh��(�G$½�h� � '�ZԮcj�&Z�$jM�9�!K���V1wF]�\�Y����Njj�T+ue��>�[:��p��(� .�� �``���?-��@{�����:�bi�ި�	!?&�H9�p�Z�`�P��v4�c�y�AJwQ�fKD����$%�\��uz����}q�ޓt˘���t�����"%/� ,)zּ�+�{�u�,,�k�5��EF�r:bڌ�J"�!�<;�Q�J���{�ގJ�i�N�_�g�; B�����+���b^���N;�D�� D��0�:�t�;�6�K%itZ�<�u-�5�Hn��cS`��k�}�����:�<ʑ� ��P�'�JP8���[��œ<�$B�l5#'�O�xK�G,n��\��ƀ��wP6�߽�����?I�P�#<*�c[�4�X$O����J�qh'�I��V����zp�$Ε��Rȝ8�_����F���Ch>pi�����X�b�G袠*�fg	�0� B�t
�5��AT��AUމ��%ٽg6�/��j,L�e�m;��h���~�.�2�q��Q��#�l SQ�Zk#ݪ���3UL-V���?(�x���.8���c�l�,�Ge��{P�6��(ǋ��q���]����M����t;Pu ��$t4%�-M)X�Z7�=D�?*�Y\��7�"h�cxz�}v�|�rV�`ъ7�\B����V�ڎ�6d=(!��[r��.�y/��<kk��{oh����z�R��Q?I��rr�t�<<�Ǭ���������Ro�Ib�$��.5(f�!^��'��1��/�_b�S�������c�$5�@KX�}�j�L�~S�����t��I瀂�\h)2�zE�6�(��|���������7A_]��ԢùKB�K14H�\�x�_�k�c�4��*Wx�rΞ�De���ca5G7��x��L?*�ܻ=�`��('NG;�. �b��Rӿk�c���xy��C�5���]G��-�wX-Y�y@L��Q:mN�̟FD��]U�I2�)Sm��06R�G�c�wZ���(��"��6�k �$-���1�A>^�����V]��qZ��'�5^����p�Z�:�]���#׺�F_��g��&���_WB|�WU��]1�������z۞f�*�ݮ+/w�p�K�jG�{+]�-����M�?�w�%��]$�J���mC߆�	�Q�����غ��E{2�\��������wu�Iߗ'lc���ŗ��᳠ wL�Aɶ�`�!�k���[��b_��Y�ׯ���V��x�A��VB�!9����'KB��ɿe��!I� 2��w÷`���U�oy/;Zkm<]1ذ�,����Z�:[�$������v���ʽn�C��������G��+�B�:%�{q�e\5��������-�*B06�A+�OX��{��؂S�H`d���ہ����V{^����VY {�AB>F3�}*m{��T��G�����ٺ��H��V�{���_=Ec�l����,֪�Q�h�#mi9�ah�(��E)��Z�4O!˫����yp�]����;f��lf:�J`�����섁��$�9Y�y6��ux����]�0=��3b�T��)�J��N�����l@��f$m�W[N�ղ�)�`l�ɓ�D�\'8Y    ��}f��JM����|���s�����NEɝ'6{1&�deZ�PFC��-���c�P]R&0�����Į��
~�p�7�}#�������	����DzW	��� ��ԓ|l�Ir�%���J6,����B����V씉SG>͋j�+����_ꓸ0��V�5��VB2W�\�I��-�I?�0�v8:�\�	����!�)����8$���TNUe��^�����dJ|Z�1�$�c6-� 3�d`�[7��� �b��Iw	iG���'��VV9p���;b��g�e�dɾ��N���?�Ә�Џ���
p����7K��}��b R�\�������CLX��t�OTyڧ*͵����`具���-�tB/ݗl�,��5�#��G� �c�����;��M��HVR�v!��qB���!�<N��g��¸��-��]z��Ȃ�����P��n�݀��8��(��IxIяr\#`w�u�b��5��h��a��|�Lv8"ظ�1�M鉫��J��B�!7Zo�w�A@9/d�P�'���3o������.����TD��<F��!?�i�R�1��5����t�Xז��U�BOb�b�&��q��0e������]������n-ot�;P}�����IZ�ib��Kך��֌rBj���
���6F�п����4�:�
Z*c�L��kJ8�E�ku�v����}'�#Z���i"�Ց�ͳ~|�$��M�$()�Ҟ�~���FO�D�� ���Vb�镪F��I^��:.�$%z�A5]�iK�tؤ?J@ӞR�H��#5Ѯ��t
�2`A1!�� R)'�Ӓ,�.]7^�Uz��q�SR�5k���T��N�1��D��и�Uia*��^�J�����MI��9����n��+��TC�+���Ҝ�9�&�P�Eں��ܔ���̰>��K�����MI���"��f��)?Sn�l��n��[&d�V�2l�`@�g4����X0� �o�{�=tx�; t��^���`�7�?@u|�m���ƹO�v(3�ܷt0`�2���??�Y�!��A?!뤾ݸd���L��(�c�;�h�G��4*���0 (�< (�aڷ�A�Ҡt Z�����eTv�'<�A/)����"T¬�3d���QQi��罒����TƏ�*�𧝚�bvZ��l�"��u���eT��/��Y?�Q���t�o������|_�v����^14�m^��G"�4�1�E�J��~�:Fb����e�@W�F��UF�]>��6CH?:C<����]��G\�.�0w�w+^�*G��I.r�#j,�����0Zƭs.x�[������6)�x�/��d+�cB��Q�Uaa2��Hfkn�
Y�r�@f����Z:i��M�(Af���=X�]uL�)�X_���Z�a��û������O���Ԁ��<tO\"ԟ/�@٫r�60l�)m.�Lo��W�#9���� .�XjP��/H�`�HÜi$��j��=�>Ɑe]�αB+���܃�\�`@�)������33�i�.��Դ��U|AQ�.f��c����c!k����l�����f|u	�d�2o��rT��PK=F�n83z��3�	��]$��D���'���z�+\YZ/�r9�c�yj��+��+h(��(ɄO��� ���N�� dB+]F��I�雊�'��JQҵ��W�[����S��ao;Vֻ(��q�
�B"׊���5/�����2�9�b`u�"K�\X�ޑ���R�su7�w��e7R憶\z&_q7R�2N�8���|�p�T���u➞h#}��g�7�	j3r�a�DdKwϽ���C�!���U�����o�8�#��Ly'��m�����ŽK��RL߈=����o�g��B��Y촉�w<|/e��uP�4j,��uġU1���A�D]�0H��q,�.^S!��t��;ua=L}�fа��*=4�f�}ȁ�j���\5+�:��P_�e�	;���!�����U����0|��{�l�U��|�ZEw�v�{�M	-�`5B4%����� .�����[�_��k)�m��>��ZBsc���C^�Q�!�G��3���D�Q�����O����ir|�9��U�~�b�y�U�уT|�c%ˡ�y�&�%M��TԂ�T�q����8�q��0��g�ڊ�`�0�XY��C���2�^�}D�^�f���Yw�������O�������n?2���ڒ*��2�����񻖡l�"�l��.6ۛo�ו��\AL
�V��7yث].�T�#�O)4��P���G���d{.:Zӥh��B'�4�3�8��B�t�C���Pr��~C�������j�6�40��t1���	�v,c5�ouN�9��Dyqc3��[ ?_��u�;x����ʫ�fG%���D�I�PP��
�2��9���jt$�r�� ���L,���y��ߐ����a�s��,�_��_~��!�#I-�M���{w#9�QNO рw颒�� g=Y���M(��Ȼ&Cf�:�f�^p�t���D�4cT����Ḿ!��kwcD��w��(t
����H��^�"�Bx�\��;!��:��N������3���=5cA(��J����'�΋� �;����ZD�3�O�'���C{ͤ��+�Ji�.��+F{�[*۸Aj�{G����LʻH4�qUI;��Ʊ\*X�i
��sh��s�"��R!,������sқ���8&k��'H���F�o`�.Y"��@���P���/%ضP��y?�{ߜF�W�i�ރ�B���Ji9���FsOP�b�%��(�_Ti�>��e}����b��5O2�	�&��`\i6�٬�>HJ��߇�Ef�E�!�X�p��y�f5����`����n�N�M�ԃڽ-���b>Y�n�}���*�^��ã�= �9�v��@��`��W������9�)��&��×�*�k��A��%��.���Ie������w����k��>��6����x��R Pz �C1@�� D|�!XON`��N���+r�}���V%�n-�L3|n�މ`��[��u']�[��֧�zK���o���<#�Do����5=jo�9A��@���0��<�7��ْ:����vLb�%i=>����9�C����GÆIz�˔c�l?�1����FX�oU	�1睩�(��e�%c9�GԨ�}�I$�����i�+�|"�j�>̞x.mf���^Q���؄���:o��$d�s��[��i�c?[���:ޤ|9�|����VY[<�����)#x_�dZ*�X�ߺT��s�9EMq?j��#Z��ѓ'=����ة?�����1��J��*W5,I돤<�QQ�1�A0Z����R�,n*�=��M���s/qg�����C�ѱ2t#-�!���g}o���]TV����$^�Q2F���qJ�1�\���F�)�+w6�3��D�z����`pJ���fFz���m��~�[Ȓ�7[	�j��0Ď�zn����@�s~�D���v$t�/�m����$Ӑ�9��^a]�1�xbdA`Gq�Zb"t5�jkc��Di�Z�Jc-�m�:-�:f�N�J�	k���P�v�x#�C<EFbA����hx�c3�c��s�
�/Jxߓ���X���l����w,�od���P�(*Dީ[ׇ.1躧�֠k�X�fγ9 ]�u�[��,͑�L͑0ـ���w��O�0w�s�X�۩na�ѣ��_�Ee�Il�N�l�O/T_J�)����ܺ����;�S,�Κ����Wz�1D�9V���ª uH���B'���;¾�	��;��0�	[E�K���a~'b���}I?b�BL�68E�D���9@dA��@��w� zt��������p	��B���}!�x�9�$Y])
�Hc#���Y���]晻0O��"�BF"y:����h*s�^O�d)ϱ��&��X���E���4.�`CGd�d��2� 8?o�z�sy�
	g�k� E&u����Hd�+حղ����    3U��Fݺ�Π.�R:�sTmy�-�pT��1q�Ki�+��4B.룊n�,��5�ɑ�+����͆J3�lK�$�r�Au��Q�6�N(�����R^|�Y��'��l���P_'�6��_u����2Lcf޲=lF���4\���*!0pێi=RÏ��m�2a�[�㜰�r ������W��C�K9�/����?Ω�F{�L��[����c5f=+�x�	
�t��k{v�
��sϥA���D��uv��R&�{&~�[a��7?2�x��I!��Z�bi�y�K+~4L��gBټFҥ��T�>�I���>�s�-ih� �4�)��~���� �3bejM=�4����
t�h�B/�z�����1��"/d�Y��f��;]]��ߋ�0_��}���@~���>W��,.Jܛ��A������~w���3@�A}CH��f�5]&5�@�B��7�~�i�y�p3[M�@d9�C�qg���^ԁ��<�C\�<O��x+��_�� S����PK�s�D���CV��^Q��Մ���F�%����M\��(�d���^�s6q�\f��S�8�=�����H=1����1]R溇ywL}	3Wd������j���vKt7d#�j0#���ƞ����3mgC)'���c˻2�6̀��&,]�z���W�1Q:/܋�Ū�F���0@�pTR�{sFy{��w�����go�9��#����ۀv��<uE����N*Y^����8B�X:o^}�!�&��}v��9g���[�43�uX�:���X�$�o�2�V��ɘ�s��:cL�0y�q�ڡ3F���4��]2�����qϱ"��q�=<8ҡgw�;�b
u-��%���>�h{�e��^�3��$��> ���B ѐ�J)��h�� �7��ۍ�j#g���a���x���"�:K����?�h/֦����k�=����m��B��+k��6�8I�Q���],FrW�]�!Jb�q�K5�ī�R�h'k]z��~��0̂�m# ��jz<�}������8��M��@�۲Ԑ
��Q���(ͳ1/���Ҭ(�\n�ޓiN� �\Lg�뜦����w&���sO����6�;��>XA�q��>jt񏆉���uk�?!+�f�2�.�)e�J��j�W��,�Q��'���)"ֆ'\t�rɓ��l�<���2�a�E��o@�c���� �'ٞ��b[I%0�?�m�Z2:O�	i�h�E�X�Yl5���%U��b��~��ʇrH�|�2g��~����Kw��1(ѕ���4+�i��7��^�&#�Wʫ�:���t�ȥ���l��X�-ǟ �;jX珲����5�wY0��Si��Ʌ��.Gx�������w�����p	�Q�ث�̳��Lɜ)���es\`���V��	�6�B׃����	�MP�A��D9��va����Đͧ~�/7��ꪛϭ_�;_�S���R��.kV�+C�4������b�T��{��{��R���FI7��&�����Nu����?��{�S��~͗�,���1�5�n+��|�V�F>e�P��u[����'0���H�����ǟD��w���G\��������?����X^�+��t��-�X�WCu�s!usSM�ڈ0�;��os6��<�t���Z��=[�9{t,�Qn��ͺ[�5>Kv)�� ��?q���ͨ售[��xB���(�)���~Ivn���r��y<Y��F�� C�Fs~�Γ�p�<2]h�^��4�Q��acEV����nu� /px�n;<��g�u�Z�V)�X��e��m�4̇�^�ipZ�l��k�"�
F��KU(4t���xQw��F���I�z}�f�"�Y���tL֮���M1�Ucq�b��X�Ƥ����A�'�|iB���㚏!zj͗���b֏w��uz�B�:V5�j�᨜�I�,�^+�?�Io ��g�L���:��S�E2��X�?�ѓ�E��|���pk�R�k2��q���5���<�p5üM��@��5���u��>��⿻�OD��5��o�/2�4Ļ�4��}[Oū��X������=p�i�%��F.��4����fk���MŨg��\��ͨ��F7�����'���(��2���3��1���`�*8�s���+Y�<�↩�@�e!��Uq�DO��2��y�9����e��� �6L������$�.��H����U#~�r���L^1���
��9���.t��' �S��`���@�d#kVsH�5��@��B��Ԇi��@��B�������@J9��ɭa�I2c5��@^�����9��9��2:����m��S�d��hp�qŬ�gM3:�Q�/�o�scL��h��@�����g�;�-:Gb�=��[vُt�:H�K�b}�E�!�P��<��kD�N�D��'"��'��'��Y?n����V�I�SJ�7ԝ�J�[Hj1J�w��F�%��mE%|NM�}�8���H�
b��j8CLz�=1���T�)[�0(,�ܧ���Z��9jX��P�:��R�J�j�:X|�װQ%Z�]L�*����&�r۱$���hxC;a���5�:��b��u�5t��(���㾔��EՔ��B��u9���.��z�
����(C˨��{I�Љ�4�+�v,��"[��3~�u4��K�BQ4�Q�D�B҄DE"~���]P����5T<���9�^���!d�I����h�D3�����R~������,�(�W�Bo�ar\����9��K����Om�dSV=�Goo���ϋ���sG��$*
Hp��-��a+�B޾�x�c�G��R�Ǳ��0/��/ۍ*e�x������W�:x����<�XAW:� �oq
əI1���y;�~�s��Rh�k=����Y�2�y�c����#�N�\��J�{Z�.-�=ڐ:�w)�R��+ޅa*���ed�,?���\nS�pN�x]���x~K}��t(?�$Sσج�7D#�$SO�>r�b��m�@�Rr�۩��.E?`��f���zٽ��:N��=��EXa��,�,�����ɞ��1��?5�c<����E�KC�-�I����X��.y�q���2�A�5ljw0]zC�Ħ�y2.h���d��Sx��G���"B�pިi�@ ��3�8KD0��x�a[1���Ҝ��8kD0��tɃ\cz�Z; ���h���N����#��,J���\Q_�P���40��2)�r��q�_-+�G;:)�a�'H�ղX8���0�W����>Ϯ�)�a�O���/�K�;)�a��9�'Ǆ�V;��˪٧�!�(F�h�K�ة	׮��NN�q9;5�G�!�J�(_�����p1����*vj��	K�[{L^�S��4��]�yi;�\ZŐN���W���^���.ü�B��9�낖\�fX��A[#��!�
�VFr���^T��q��^F�Q�Ξ��#&0o.'�	Z��h�;0s�/
c�$�3�4M%9O5ƥ	�#s��a�c�\�Z0��{��S_�a�f������WHx2�	ޜ��:K�Z��n�0ѫu�X�qb��i٠NK��봘n��n����X3a��'�܌Hf���<�)
$_i?����TXqF��FJÔOe$b2me�c3L�$j6&���؏��z�lL�,�n5��h�'�"�7v)��ʍ_��*$�nW�9�Sj��#�����|Nx��c���hZ��5?
��j���_�f�����8���B?�B�J��T-a����C�W��ӄ6/��иeSb��\/�2,��"'T���s�h�d�u�V�Z�iFuoH�Z�0jO0�z�ٗ���m�vC�����sx$��9�'�V�5ڏ,`�#O��?�4B�T.PB[�1�n��5{��B�_�P=�+��P5��ռ�[�Vkּ4ק��gRZO�y�{^�r���Xw ��(��������kx�Rs!��)	�.����~^j�"�Tz�M�#4O��R���ɗn57}����.t��S���<'t�^��;��
����74���jd�   <�F�H4X}�R*�b�x��%L -8�'���{�VTՈ
3�6���6�=Ҁ�m'�i�{Ry�c�D>�ȓ�B��4��c��9'�C��}������F��̰o����O���SF,�nf��Lk2p3��8�F���Tg�cƵ�nz�K0�'O�)�XعR��9��# !r[�$��xWD
�_#e(qT��Ow�xѸ �p�"n�֍KW��h�
~<H�]^*����Y�s�)>Cn�Nd����'��U��6��f��U�7�D�=��&����!��޺��=�ί���3�z����U�]���q��l��44X�cf���-��[[O�/��S���U�t�ũg����o��閷��u{�=�/F�x�<�V��2��1��y��p��2�܊bÎ��v��ꃐ�T$�cs!�=]4O���C�T�F$��x%��S#]E�wqZ��7��F��ä�q��Vn��}q[�
�_uZl�����g�� �;�S�ay#�IDG�l�@���>�i
-W6C�������p�+�6zvm�jh)�=��D_4��FV �< ��� ��x�6�[����Z��"�3�Uv�P���bc��k���ِr8O^��tm��� e@��boM�I�j�mQ��6��cs�hR�ǒ&�f|����ͮ%E��xke})ok{�>����r���D�GTc�X�[��f�0\dD~��;��*������9ձ}�q�v�0�p\����aop���%��S��x�po(@��q/�Q��E���7LGۺK��x1��F	J����e����6��e��@{.���P�a�ᔣ3�E`�
��
 �1zh�����������4�p���Gϙ_ft��'G|1�O^F�*@�HQ0��3B��=g��͑�ץ��2��9#<��Ɍ���!��V;��'�&���;��%z�;��9˂�N5�Z���ZCsN|c�c1-�p6+��IG,�'T���{<B��[�ܺj��O��-�~��5W?�����6T�2L��,4�)�+q������5��MY��&���m�"J�$a7Î�MB5���eQ}M��<�&��3�&d�&������!���S�\NeM�=��7~8����gM�����>���Z�jY�͚ ������Pi+���S�/��3I��9M�R	�������&qK:0=+�Ky͎5�f�˟J�O�)�}�e ��;HŒ�r|��}g�0�+>���=I�&AI�/C:�%Y�1	c��+�#B+$4�8�z�z���_6~��_��6�            x��]Ko�?�>om�XI��Esk��SBE��p � �7��$�g�T�L��\��"E�+�~��3�3�C�q��lsgfw~�y��3Υ�=��������?�����++_z��_M���T�_�l��;�k��u�&��#~i�7�F
�����ߘP;�K<��w�[�"�_>���c*���+ �_�nMF���	���FP~�{)�0��P{��U.�P�?$\��J ��������т���2�&�9vt��������-%�Fb�;�A�hZ���i�nt��Z�\����!���C�;܌� �t�# Ph,	�*�"�����6��Q����~���|�e{8�!�sG�ݯ�%� ���	v����� bD��^��������� ��_XU
���0���Q
x�0�.���
>��҅��0�P?�_�^}�v�����������1����S��3X  �n���7�Ț�� ��;�����G�C�]r�삡;�5���\��X�ٴ��-�o�g�X	ٌGl�z%��*���`��J
��llN^��-ҁ �%s���9�x�R:*d�d>��{����=8�����)�I�e($"��D�%���G�ď$�����	�L�Ez5�1�9D� ��K��"��EN�G�A��I���[}�8��=����8���]c[fl��K��q�E��8��gz�j����a���De�`N� �������@��,r�6��>�u(�i�[\@|�8�o�X�ȍ��>ÎhcwcB����p_�����DXC#������ r;�Kj��r�1"���T��'�Ƭb�ESUi�h�\3��C�$�$��I_��R�N��y�AӐ��q�vn5uD�Q
�6�F\Lrq��)5���J�lQ����\k� 1���h"�e�O���XuijaN�h]\�P�f0д�r�U�:�����C�[P����|���-��h�lQ�6�֍����A=�h_�F��D�[iʺ��`|jhH'��3��F3�[�:�R��p��24�:��LP�O��z=����|!�#���L�Y!$�%~��|����:��%���t�Z��ߍl��пI5� ���!�U䌨�П��K�;s&���c��_��Z�P'�;�5̻(�C�}8S�9��ǆ���o���`]��>���_$l���k�`J#�`��=P���y�jX�|��Ս�����ec�Y�¿	t��k��)���P���k��Q��Oh=����Gs&tw��H�#!`6��|Й�Iȱ]=��Ia̸��-�f 5�=��7�8��)��P�Â'Dd_T��$����`�-ҶIġY�D@F�eNJ#�>ujz�H�ub�-6~��뢱�F�+�y��p�	�ȬtC�M��y�#���{�Ӊ�;Gk�w?�'��CI�\F��r�2�uQ���
.� �L�=n�ȧ�V�B�� E٘\1�^�DB(�ǺM�X�{i�����(�#/Qc���5Tk�R���I��E���:C")�.¯�;.�-o7�Yn�$�dQW�Q�#��S�S��b��l5��*�lW2�*�P"���0F�i����-�L6)�;�������uFq�;ό��xB];�ǈN�3R�E��mN�|�:
GlND)�S�LƄ�Jޣ�i�
�Z���+F/�qhW�-��rw���3� ���ŧ�����0bMɀ����p�(�<�{(>��I͜'R[�J�*���9/t#h��.�}?������߬h�c��=;�L�.&f�	�_��R>�#��;
���2�&1F�x�^s&�򂧬G����@%���%m/܍S�x�-��rg����� �%:|j<�=Z[{����
����x���Z1%����TZ
��f��k�W������q�S׌����4�rT��*H,x�W�~���*V�����3�����!�.}X$E�䐀3�I���K�h�&�R�pS��j���
ތH��Lu)��&�6Γ�����+v2Y:���|2�;��uR�8ՑU�"���̊��Yc�wfD��`��j>Bb���)��	̈ 0�w���]�ݯ�x�M%4�$�p�̎CHvsJ�Ez�lm�_���H��*���@~�#��LnO*d+�����n��+�H|>6�\Da�:�	�)4���(�Ǎ�$9�S����r���r��\6�FY�6m��m�����_h:���V(Z�-7���з�0C��mU����:%�&����
��
��Ew��"��`�eC]�T����P�E�X���y8��%N'�Iύ�d��S>-�;2�ThcYE
�$FR:-�8()��'f좻GZ��3�5�5���Q�pc�l��6+/Oi|�nz�C�uW�ps����l1aW��N�~IA�i��ƙ-2��x���*8lM� G*�;9%\O�<Io����S(�����}S�?+��MuW>���b�+�-�
�)�[ԏ�F�p�]�ے<-Ц���ia�Ɏ�)�>�d�.�,��:�,���j#���xdOx�!|��u�f�f9j���P-{�ő�eCDӼ<��ZM�
9�\�I�q�=u�+RX�m6`P����ND��|���a��BL�=�؋1��e�s��ez�� �$�B10�{lLBXU�����4��4<&�T��0���IB4�td���<Q��2� *����sY:b�����ա؈Zb:�O'��Tڙ��Qu$6\K�o�r)����7�O��ıH:�,� ��!�<{�X'l-���fiҌ.G�P�R1�V�pP�,�u ���s��T��sl�T��*E�mJ*gA֤T�:l���qف�vʤ�|����u*�+���B���3��:�vR8n����ښ�b�w[��� ����z��N���t��t�Nk�\���U�$���#G���c|qv0b*�w�]��HL�LC74���&��э��x���:�Z�/i �,c��:F�M�ԝ��Kg]\�m5	�iKΎo�j�EYc��c�N}��<�L�r�3|t�Cw�}J1����0��Py�����1�B���Ω��uC��4��6Q�T�'�W��K��݀N�h���Q.{4c*O���V�$R������]��5M�"EΑ<����#Q�i���'a�",s£��D�+���8�*��':NhO�`�LA�������XY/r�m��3t�N4�y���DF�=g�Hw3����Lc�w��dl?L��#f�G��������s�Wom��J�ug��@�7\Ǐw��q�BD��8�{�S@De'U���K�2�(o.(��ƿRndaՏ���X8{6����ӑ;�L�==k�=�<qf⌍x��H� V+U�B3�"5�泔����7�+[+R��h#�k7�� {���7�;xe��S� 'S?�_\���F7��G ���SDKY	��5=�j��@fO'm����E&�� �
0�A�;��~�	�R���Y�7w��w۾f�ګk�F�ڨË:�^y�`}+�}�:�m���<>�����5�]����>�M�IEt�>_[��#�x�9���Z�/��V8=Yw 8�Y�� �.}ؚ�>���#���?Z��ᓁ�q��Ub"y2���M�%OO�,q�E��x�Q�/ś%�cE��#�j$���cL72�O#�LoƧ�d3�.���a+��բ����A���L"�m�S���uG�qb��a���o�!��:[N���W�Ċ8͂���h��xy�b)�*�������׍+�2�rJ�,�h8�G�2|v�V����+<T�C�x��pF4���;�$��f+8^?<���$(ٖzm����G� X;BlY7{���¼vD��Ƥ0����%�n���E��A��t�i�H��P?���Jr� ޢ8�ԡK��ce�3��\~��5�K��P�=tΘ�%z��<��e!��B%��h�t��tW�P�n�+E�5���DH�ń6�w��SJjvM��@��(|������N� �  ����,p���r���:J�p
\�ʿ��N�I�3�>A��]:a��pz��
,�5v[H̆C����!��Ѱӏo9��׀5-�d�9�,��U�3���U�I; �1g�#��q��S�@n���կ� K���5�:�Y��U��[�n$�bxV�}a�a��uܡ@�`�}�,y���ܨ֥�j�!���0�z*����}���,R(��j��X��1W���$2�շ��.�$�2��b.GXJ�ϑ��6�JX�"ͮ�W��&�9t����-���+/TZI�Q�;��xW��/��t������U0��_�t����ãaqs�|��-��B�����H��jF��p��E�	9;;�%	S������c�\BT=�OWV^Z��3m�����.K�9)�M����3/������'��            x��]Ko�H�>�����9t��L&��{[0׽氽�b����,?d7�h���B�-K��d�d�%���_`���G�M��dP�[V��`dd<���U�R���ty���Ɵ������e1_�3���q]\�?>�+�Fq���O�;��)~�~�lE�Lk�V������_�_)�s��������=���9+>����Sz�%|WGZe�F��1�&��[ł.>Y>-��y���g���9|p9@�6���<���-��G��U�XQiG*%U���.[0��c��׎�ҳZ������S$,��l�������w���?�(B]�R<_���@�x�
\��#ϋk`�w@Z/�����yF%+��]���������-��$j����r�H /�O��4Osy�$��l�I l�b�Z���B�5W-3����ޒ�-z�S �)<����Z� fΗ�@'�X�t,O_�R��]x��>F����G��sx�ՠ9����ߣ ���ly�W���4��*N|�[6�V�>ؼ6���VɃ���CT��$�����=�����:
"q��d~���:�EI3#����9r��F�]ő(�:��C\f�H���Hdg�k��(�q��ae�y�v�1@�m�8�%� [�0?��+��`s�#�9\�.<c3��G8C�'�p�X>d�/�T��uQ�G����`���y�3��6Yi�)��Glq�S���P�Ud��;H�3���3�:�B�m��K�w����6�^h^��[��YӮ�X�<��k�A��5.��W�!�q������fu�H�;;�(�-���0�s_���lz*���t�N�c�X�L�a6��㮇KK�8�Aq�Z�˖��ĩ(��C��0˃*�*(�-�����Ѳ��-,V]�'�s�����2I�[�Ñ2��O���|��RY9�a�X�{����*G.�$�i ���9�>���ϙ0��7p�������y&�e���KR�?�$��lʄٙ��-3�����,�Ef]�hӜc���k_�ZR��b&L�o�i&�|�����0Ì�)��.G���nTQdEӍ&L��b?-�E���b�B1���np��c~�fV~	���`Nh���>��Oμ@�-��$�'U�\S^���\��T�� Z_���\$�c�i^��f�G�YEJtU���<�A�m:�;3�|�7��N/^��pV�9��Q������p�����wE�
��Wƪiө����Q~�ѽ�"O�\n�U/�rw���.H�9YPq��l���}#�}�ǡ���3����R{�)�f8��*Ob8Cߐ@\��lxF��j�[�2��Z�l0���z7���r:��*���
D�Z���F�PJ�m:Φҹ�	 �2B:�%9atNdt���%��^�4�>҄/�J	��eNH�.w��D�;���hd�t5K��K��]�I-�A�����C%B�i��6̈́�t6���m9��j1�.���ǲ�@�.�h;��$���-�6�_�C�!�8�A%Ɠ�}d=���/jV��l2"���n�`0�:��XdC=k���&>�d���-�L�߶aFX\�g��� *�Ʋ�U֊�
�pƢ�}J��Z8kk�I�R����>]G ����NU-.	Y8s��:?�QsWq$_���yy���L�g��D6����c4�9x�������D��p������~R4
��*N]�K���}rR��~�|�<Ų�֒�1 6�j�ѐ�4�����f�Q8%�B��+j�\�����L�MM��Ab��3J��:\8��X�W�� �TɤnuX!r-.=�z�~d��8ץ#�<v��v�D�:a�&-�'�7i��'� �a�˺��$�MgG�[�5>�<~�M��V(-��L���p���Go��M-�%��|v0+J�T���Ϯ�0`OEk������Svk���\P�8�-�f�r���9��j i�!lE8�.�/�S���d�l�q4*Kx�˱��'�ࣹ���Ǯy8o�5��u^U��o��7q΂��ڪ�����i3k��:a�G�����H&��W{(�r�"gS�A�Jڍs�~�O��c�1�ɴx��B�M5�9�~(���I�>\�J_Y��A8Zn����C��н�s�IOH"����<� %a?��k�YM�gZ�yM�'q� ��j}R�u��uJ2^	쁨���[���:�V� >+c?P��uw�9 �ƞ����,�s ��� 8���p1��B���-���#��ϸ�`XY�8���g���E��y��$�߳p�>�dţ&Z��A�%�|2>g�1����
�nn��0�	��F+���-�V�)���Fn>&|��ں��@���<��zj�FV�&ё���"�å��Z}�pg���e�s�^`��}�Ht�uPt�E=�p�cbny��u��Dc0��>B��X�jaJ�S{�Y ^㴎��?֨�SU*�D��$�%��g��w��R᜷/�ރ���V`��A%�(���቙�e<\sX�"M���F�>q.�����|��|o<���8�/�%Dq:-.O�0����Wpr������k�G_�'u�#&� ����{����]��k�	�^�<����fnͽv-0�?g��y8������/%���D��{�O���]���pM��to	�� ��)�	���� nnXG_�H^��é�4Fw���:	?��ELԦbkd�GhޢD�� �kd�clؙ�3�<g�m"	>����Mg斳ǀ�����T�0�<h��Ҭ�qZ��XY�x0�~T�	YqHm�vp�Ȕ��،���4*�V�-WQ*��n�W�h���.���\��@kB�BB �ܕ5r7w)��8=p�KҜ����K�!.ߨ|�Ac]Yr�xCfR��;\pq�v�J��#oE2Oiݦ�N�TK���5�/��Hix΢�~�FO��ڞċVu�%;��o|���)I͍YY�R�y
�.�F����P6���/���ܓ�7Ō�\�a[Q671:9wD3j�(�h��H�$���Ci����<�K�Q�)����$F��߆��nLƭ+�r{ɠ8cSy2ÝOZz�T�����T�;����m�.� ;�8s�^���p(�+��f�tlb�|NL���??�j�x��YX
� c����v�������Tr�*���P;�W�(����H4�Ѧ
�2�Vd(ʽ�O�#.]2$ᜥ���<���v��?�eo|���;��ѥ1|��;:� l���5��9���a�7��\�׽���E�Ɨ���,��A��7�U]��ZQ�Bii�
��@�vOYoWX_����,Vp���`���N�.u� �����"���/�th��a�X��/pQ��-�X�	�+�:�D�J�.ö�i���[�e&�iG@{$��Ka\�����hC���t���T�#�.m:.���eBB�/�1�$���9�Ϳ�G-��^����v�Tᚢn�h|���TM��B��\�}nP�@����Ă��ΉRڅ�s��'�oD|�h��q��Ǚ�Ȫ�]�GE��eP�T9ԫʞ��M��ҡ9�/���T�u	]e �A�
���ݸ��U�D�H%���2�n��l�ԕD[�w�q>����ΏB�A�� ;t�9�L~�Q�������Rި2�8����ᜦ)���b�oOM�����op����e!�YR501�1168|9Ep�0�����itWl�X(
��R�5\�@;���ݿ��	Q�!Ѯ����2-~���w��lr�nOKSN�C'��ʕ��Ą��y����)��~c��*ekw�FW��@qu7��e���/E�L�f�Ԉ�t��'���.�Nm��d���H���W���QF8��h2�3Ny6��\�ڥڷ���7:���OZ�3��H�W�BT\_TC�}S<h�"�m
ԟGy�zJ#ܧrj��6^�m�%��g����2��p����h���[a�n��Ʃ��d����&���;0����R7	.�@�c �xj�?3�3 �P��������]�_{*0���v|�nvػ��d�Cպ4�_+��9F8��Α^��we2�*J�M��*�R��:��	��I�;���U�d�z�>}�S��O��   =�]�)��~eş��?m��zF�oɁ|H��g=D��`ZoQ�aGM ׋�e��<�87F4|	���|�V=�AAB.Q��3�F;&yFsy�_���y���f�FT�ez ������$MEk�J�B�g0g��`,�YY�U*���vhN�y����2ˬ�G���UE3�f�q-NQ���	�R�M� �0D�}yǷJu>�W��Qv�Y~�OX�jj�Pž¯��o�/�l����pH�:��O����J~m��{Rٸ�R�[#�W���cO��~�l@-�[z8����c2r�'m�=1z©P(��D��{ם�*��5�|��9�/�L��f���
AKeFX 02,ѿ�4}(�#�+��LM�g�}�G��?����n��nזqTz&��CG���<状o J���KQ�<?��q}�#j2k���T��YT~jN7�dԝ%q��ךo�wq�z�Scsq�P�"���2Ĭq�{�Z�Fi߱8k��Ȝ�����@�45c'kvi��+�?��pF�I�AR4�bQ�ɠKa�� �����j��koi�n�´�ox+���ok�KG׺פS{����#�������Q�z'dp�Ź�R�|��=�쀪W]�y��P5�$�,�yĩ\Ջ�z���̍8��hƘ�c�@�%��d����A1;|P-�kb%޿9������QvjU�����i�P即�+L���aGm	�,�S��问 ���<��'x�&�`��'��Q��}��`^��V��;j������ҝ�X*�2f���(��H�ĮG9�QY�n�}g��0o�+�+x����rL��x�& "�����N�*ѩ8 \}��rF��ݗ�UQc�A �B��m²(yReU�4�8�l?Y?;l���#N���ȶ�4�p������n3k#Zf��T���s0�<#WQˤ �ۄ��E.&� 18��S��M'ksUR���A�f��"�''��uE�J�L��֗��_]���)Iԉ��Q��۫G��!Whw�tz=�h䑆=�|�7��C�]��ɲ���lD��;���˲��c��J����y�#2	�*Q�t�@���sZ��K\p:0(����
+s�X��?/��<NuF��9���R��B��)e�|��i��;��a�	�{��"\�R�N�h �c���գ;����n�Єg�I����0	s܎�J����;�r�(��v��$�<���l���8�B�:_;H
���]��t�f$��G�7����ܚG\�98�X�:߁č3'�.mق�G���(��w��>~�=QFG�8Z.�~�C��88�K��k�?&c��@���K:�J�4�`�t���VYY�� ߻v���2��U"��(�l��O�����qx�C�}�2t��X�����7�$3+q�|���"7O;a�J��>�;0I���9��6 ���H��|��	&�쁅�.)#�{p=��_�:4Z���G��z�7r�j�ݒ%�о]�F��������Ó̗��IY�Gr�nO���Th-�徨 ~������ٓ5�yش�m��ƶλ��#ϰ�ШG@�0g��}ƙ���1Dg7�O̖�6��`���q���[��N�0�}�qOm��џ�|���pr��)��R߄����3<~)��t�=%.��u;���B^�N�����Q�{�V֪�P���ǉlܖ�'��{]��5�j�xT@��0@�C���D_C�A��D�9���#x&�~�35��K.��Mt�Rpp��m$����|Gdm҂V��L$�Sy�@<r&c�>_��qW���j`E�N�\!�5�9���_�O�|�i"=G%p��ݬ�u�)�v�c�;�ҝӆ7�d弮�EN��Q>fp+�����oQ�T��u&�h�u:f�X�Ӱ)?�~��A��9�i���/ߙ(8ə���5Q�F�}���Mq��o[>I%��cY͟������e;zt�葧��h��b5U��~42v�Y�=�>i�!��	���#*��Ϛ��m=��R�H�����3�D�;R�:
�c�4�H���j&��l�<�Na�u�w���tVxJ����������E����tX�~b C%.�ʹ'���z֛Xi3s����C}��<���T���j�s=8Q〆=U.xG�f;ܿSN�	?<�����_�bמ(�U	'u�9�^�p:M�Jۉ�8:���Mٝ'L/Z��ju#D��X�Q��>���8x�W4�(s{|�;z��j�%��A���6"Agf�)&�w�my��p�[����:����#��&�9?�o_��J�EOGv�t�S����SZs��@#�>h募k>�1�؃�+��ګ�s ���m���K��i
�l�X+�
�!��u|� ù�d3�jL��&��3os�ć���q�R7�3�A%����{�1Gr7W5;�MG:q�Q�|1�Kڪ��
MK_Ŵ8��eZ�VY<K�*�ؾ����`1��'kd�1�N��z�|�+��Eg��+� k�1�d���a+��d�����D��ux�����������'�C�{����c��tc�ؑ�j�h�5_��<���rpWJ/+V��&�$�O���@{U�VYk'��k<~ɷ��B�f��b&m�l�i�=��-�&Z�oˑ2�e3=����I�cw81[i>��9a�)�J�h�1��J�������>j�T���&l�RzG�EY&='�GuxW��&Įϻ̓���)8l.:B6�Ď?��G����P�R�ǪRW�����ǀ�#J�\��d�xM��p���1��Rn�Y��BУ����23�G��"+io��˚/N�u)V|�s
�(�g8�ͬ��7o�O�;��c��o�]����E9����=�v3��{ ��|V5��|@2��e�Ȁ~�9`������Xo7B��̺��(�F�1pJ�ú4a��~ҥ���}w m}@��冢���	�*A �X��ژ0��6�����kb_�T����o�e�F�w��6����xk?'�x�oЛ���?Nw�R7k�G{}˖�F��$�_VI��vj'2��i�/���G��X���q�e��l��&��#I�"�ڇ�e��!*�q5����,V��� ����#�B[�!�䔡L8K�YYRY�e��������z1����c�d��?�ظ��V��v���p��[���< �����|�3�Xʬq�X�j{�E��F=H,m�'�dn��Mn�%H���PGZJNoݐ���4Wrn����,C������ �4�F���-���E)@��~���'l��DS��6)�:JyO3���}'��J��#�D��w�|���nד�            x��}[oG��s�W�mv�Q�u<�yۃ���O �8�G�WȂ�IԱ䁌�Lq8s�u�e^l�d�4)R����ȬkWUfuGf�gF�MvGEfFF��E�26˾����Qv�]�?��߇��������ٵ����>����,g<�y������\aa�O�f�l?{������=�__<���捏nn��_���,���hq?��O9�.7��ٹ��;�'�7�'٩x��#~�|��� N��_�7��n�_��t���]le�w������ �^��٧o��qC
.�f~��?�O�g�ᣟ���-娋/�,����!~v&`?�u�,�F���x� �/�u��~#{$~@(H|�.����B?K!�3�&��(�����}r��?���4��r����H�~�"FB�����9βS�_�x���k��lK�rƣKW�r�2ů��wD���>���X�K!�W����w��ߋ_��>G���_md��3��B������Ac6�c�%�xS��	�;r��������3�X�+�K|����bO�d�#�>�7��B���\���'�����7Y|�D��ϯ_��֧�o����1�|�!��A�_�}����*�7�y�-�ة���b;�w�瀿�ذe���>B�e
���{�_�����I��'�0��n��:�u����[�/E^��,���H�M�P�Z�]|0qU��CICV5o��Vd]7x+?�X�9�o���_���|��p	�֬�+|������~!nF��#����^�\�_�}�H[��6�y�l���a����8qxy|%������c��k��C|�/7p�+M&	��<�'��2Cps�J,�iZ_�-�`ߍ$�K�&h�P�o�9���$,�W\mg��;��C�^�u��V@�9_�1�u�[l/Ⳇ�xB���3�v�B�A<�x7j��X~C���"^�~ cP����w���7G���~�}�JH�#̻�^(���5��ϲ'�
�ٳ��'�&s���	�����ɬu�ȭ���)�!�N�5��j��)��I]�	J,�D���x�#X8���C����O�SU�ے��,0q�ellf{���y����v���I�V�݃'�I���ȏ1�x#tQq��^	�B�Y�}!i��l�c��\��@�w�5�H';�����/�JbeUkE�X�����:�����7>ٮ8��\8sspW�r�W;� ���9��x�wҩ���$�t�n�bQ���2��S׌C]JQ��<J2�o�;�D��s���k�0�����<;�"\�9�����;	�mL��XK^F���>�:��=��lr�R��꿀+�ɳ*��T�_H@aH_�z��� H=L�U��;ܵ�N��[���=�`���HV���n��hI���?Cp)~�Hj3?\�D�j2��Pt�U�1B��rP���L��&<���^rr<B��(�H�e���=��������/}�{�������Q9�"�ĂY:�3�7y�?r`ڴR�k�no8�}�K!�f���'�����������A$��c�V���Oh�mʼ3���ܫ�)~>cn��7*5VY�6%e0�������cL.�8	g�Y0$k�I����� ��w���,���:����U]����+�V��!I���٥�Ŀ��~8���r-�:n���%�ie��9�x��|N)(5��pS`ھf!�8��V�����4l $��%��i��F�5�[<�5�d���0�R+�\��z8���w��Ppv����uZ/��2n#�����{�\Z>�z�-|��[�+ e\�<��ld؁2����O!N���t�h8��S�Tۗ�!S�;+�h���e�p���͍&�<��{�#�ʸ�I~e��܂}�pI��I�����"�UF��1���Q
��0�s�!��I� �D��L�
u����5��JU��U��RZw}
����.WoUq�	|��h}n������5��8�PefPD(�F��dT�P�Z���������:�"kp�>��c��:�դ�^|G��@x	��p�.ծ8�B�� ҽ��u�Ɖ��#��Z�B�O1 Уָi�}?��<OFU�y��W�ִ�q�W���Y�lU%9�ʕk�{�_d�ڛM��_�EB)���S��"���1q��,��'px�E$6,��ڊ��	3���_��~z��*~�>sv��Jj��	,�0��	=�in�ġ"OZ��yeфP�ȗ�_@�,0!���>yP���?>��h{=P�I��L{O�M$��B�gd�پ1�&��k>ʔ�������Ѱ�0��- �U�=�|y%C��+�N�F���K�*�>�\ڲ2��t�/kb�P�N�&��҇�����F";���'Sн^n_!b�ϥ�.��[.��K��?A�R!h��7F�0�_dh�I�U�}#�5ҝ�A�~/!ux�	���.���D�B��b|�Gu����5�B�wK�m�p�?���m�b�twx�Et>qP��� )Ǫ	#Mː.=�|��<?&��Les���K��S�ϗf�B�O��2�@��U�}���+c��O/^g��K����_"��OXǞ����0�����ex�G�
3 ���x_]Ge6۲������Zة���Gv�^@ʁ�h�c��e��"�ME���|��f�)����ǚ��j��4Aw�M�źV/&:҉��ؔ�$d=�ؤ�>���ߦ���X�Y����?��	v���G&'z�)���4��M~�i��zq"�LP�����W��~4@���Q`��\�(�L�Eì��}h@��&u��쮸�Ӡ:z�L�K�u)�H�¿b��c���X���gb�c�u��;X���6b�=r1Ze��%DD	�@��<L� �(�~��_�{�.�p�pS��m�3�S�ɲ���mZ� v�+6xi�,bC����q���B�	�v�l0B���g�d��נpҥ�]5�I��#��	�����}=7�A-�-�4-, GY���b��[�f�-��-����u�G[���>v��R��và�Q����7�8J���[ك��h������S}�0���md%��2v?ѵ����%��%\0/�_�t�A!W���Hg��W��EW�F�̕E�*�@)K�����jr'% �a1��q��R�v�0��X��:��*dH���d.����8�4<�n�~�Kj�I�����E�̐���rB��Tet�[���"��t�"k�e��_/��UD8�%�LN6@���d�׮�D�iGQ�'�r�t\�.�=�&u�xc�x,�����Fa�?��D�2?�Ǚ�X�I#�rK]��N:�ƤJ�����\���-���I���H��Dml�2�&u�	���.��G��&����\42J/l2r�,�.%�rl���9��g�J����p����֥���ِ�i6���*�8�%N������������=ڬ��}+Ke ��X%����g�>��������\���E�݂K�5ُ�LOR�>B�.��r�2l��r�"n�{��07p&�ߟ���ұS�=�
C�eo@�����r��Ȫ�:+^���%n���+�E��6�q~�]��m]YI2����d����f>ASqV&4������.؝j�c�RnC�zs�5��o��.%J/�1;ʙ�\�Sr�o�6iN�s#����a���n
Ӫg	����_(��E�C�d)�Mʤm��b;k�{�c 돈p��D�~l�� =?A�㱹�����[<,/�|��4v/7B*m���>��dx[?��D�u��5����
�Cu�=28��M�랏��OˑE��$O	�ע17����JjRY�fhm��>s�d�kC�k3l2��^���|�e	��^�a�o�T�3�6F�9~����R�Oq1���"�eG&ԕ��*����2�'Q�J	c�H��q{[Nk�gU\BL�A���Y^�ֈ=5�r�ޚ�U3�-	IT��x�`ڄ���&��B~ͩF<�Ҋ���    ���~��ڨX���1�{dY`�P�01�<�n��j���]��=S�Y�G_lO��a�׼���ܑܵ�4w�_�`���&�%�v��KX�����b)���C�9�\'XXs��
��U��B�ij`,�iD�p{�CHF0�9�M?	"�����n��j�oK�\�OD�U�Rz1A:�@����e`a4|��.�[X���rfG��Lg,j���=$�^�fCrX�|�I�(
3a;k
eHNxV�%��/5ۙ��	�]X����/��=�LB����&�����S�C�q.�D��|�J�(��� ���q[= ��Ү8�=0���~���9��rS��=%H�"���X�`V5��қ<�����뚃��Kp��#]��\���a̵%T1/��T3�󺋟���b�MKyv<m�w��Q��JC��i�l��,e�C��>5o+�`7�VB�9AРU�)l�mA����ɭ���-��z�])��y�3!�x<o�m����@��{�V~�fP}�xY�4���W��o�~�.���J���������ruVH+x�y�&x�(� T�+��e�4�����;xt����a��	��Ԕ��z+6�|s��+�B�[��OWoݼQ;���#}�ۿH�r���s�)�4T��o(��9��Kَ�,�;<��X�������}��w�f�Í�Wo}��IK��5�ʯQ�,��:���Gv��ׅ�a��q=@> ȸW�Q�[7�~t��uGbV5��W��@�}���M� t��}����#�_�/��=�����LH�|
L�d����	��@8�6ࠂ��In�3@6:��I�����h<#�Z�Ӱ�^Y ����|MEv�
�*�_��i��9N�u�=@&�f=�VN�=����^&y�L�ra�_�:�r��g0!��c|w� ��V��:H���.�Q鶫6Xu��d�]DǢ=Q��#���}�v����8��K@A��⅐ʲ�(�������ș�q@�����ʧk7d��h�_��,p��I؀�'W4�@eTj�a5�`b;�S���+�(^����k	:2
1}��pɍ�C���$� �'�9��jS]Q�^6ľ��3!,nr�E�7J�<N��מ��6���fT�Ł9�?�r��~� ӦMn�LR��Y:KG.��Ϥ����NC2%��]�wn5�!���$�f���������u�(ø�7P,9�5����O(*B���zQ��γ�B��մI3ꂱ�EQl���[��ױxF�o̕f�0��4~Q�Ph���rD��a1�$�e�|쬧.5跦�ce�i�Q%E�IB���!�����X�J�s����k'�6H��_��ͫ.����@�`��W��w�#�����<賁#��PY�����,q��K1�,�_G��a@��ҴCv�� �p@���R�V���q-9@��/떛���vKp �8~m���m�"Zj(\D�^��Y�&Ф�蠟NTj�
H��p�����(��Gx]͎�o�έ�!�q���7>�lW9#�ٝS�p�w3Eh��)r09J�	�F��.2�yy�I�S3�[-�p���{��-��~�F<D��x��q�
s���o6O�ff�t
5��B��6'qzl����A�\K\�tu�nX��YN
i��dZz3Ar�,*T���j68vzM�U����4^J[�,��u�j��:9�A��� k�]���_�?��Oe�@`�9I��cB�X�3�E�&wN������H��ť���d޺�c9����xlB����B�RB�������[埗3IFIljU=��2�ƚ6��d�� 1��hڋ������ږ�cT�������۲�a��������t��7�2r�3��5�]1ѾˏfV-D�T4���t:~�̵z�:n��{SP�¬��?K�7� 9K�0IR�:%�1�I�&���Z��$< �nK��i)N^D�����XJX5��]	ѥ[��jL~{'�Z�����y�j�9�K\�$4Dj3��=��%��h�O�XFP�u�
��WW0X!���zSl�^z��QdR�o3w�^����+�Ne���hܓ	.x��1e����ܠ]�}Y�-J0����]�
�k�7'O0H�ڒ��.���r�s4�t0�2C��^���Fj�z���,-�(�8��%Oe�Qnx��.l���@�ĥ���D��8f�N��z�NG��N.��^w���\|��!�Ӱ6���Nng8�
>�E�E�r2�^�c�ғ�u�̔��1.��oG�;�Iu��\fgS��K��e>�A�ĕă<�.iq���=�e�M��CrW�w7��x
�}��=�c��ls]�[ȁ,�J����ӟ T	^q�L�Dv�S�@��xǥAt�c<ɠ�&O��ϡ,�ڄ�Pv�����S�eck����?�����ʟriÂ$5�!|�~��K��Z�n�@��d�+�02�5�� ���j{�SXJ�Lh�^�f�|�����O�+��3?�CDd�,��!3�Y�u'���*�D~](�>�l�Ѯ����ck�aバ��������s��{�~�H��&�?̻��ej$�[��Y��y�g3fp�)�(��+�#�I�G���#?��*�3���&��*�O`��<�)pQ�R}bR�;	x��	�튪�?-X1'�w������~��u$|S�}L����#>�r��S�Ð�#D�����"�ط��Ҋ�`���h������GNT�2ͼ�pDnC��_bu��k=�������3����A��d�Չ�\��P'ߗ&C:(�m�k��}UA�ڑ�Gڶ#ey*��{�>�=^��(;>hN��}$�C2�Y�8@(�q�x�W�J!��*���nt�D��$�ᰣQ��r��ԛ2���C�1`�FS.;s�}9uO����%7n2n��U�Pi�o��UjF(7Z{͈��p��A����^�&?'��'���A-�d�G|yc��v��ч��A,M�3��Ә蘯�W�,�u� !t8�^j�����S��O1e��:i�\tl���4\�C��z� ��։J�����x�pҬAbҩ�8K�`���f����e��w8�e�I�M�p�1-�)�.�!��6r�%�u�+'u��k�/�m�E��!rx+g�P؍�,o+<��70��L��èg���[�z<r ����E\(��2�o5�~Tz�#W`�⧪�7��_�lEvA��|#@f>�C���M�c-�6�.�@�ۜȄ�L����TnS�IսX��`6���^[4|OA�8^&��3o�6��]*�����cDrQd|�t�V�����ڎ�3�9Մ@Q�@����E�ro���U�i`h$��ѳ%�*I����r�)�����_+�Е��L`+-e����+B����N���Y��ك]Ae������a�>���TdpZj<��v~�-\�!СF�֚�C��n�鞴�C�b�Zc4�!�j���L�tG��XƩ�&�CH�:�%�N�.���!�|B�����m�T��T��U@Iڑ1ZP���Iэ<���0FZ44�>��S��֟�"�)��#i}���|1f�(_�&��=P��N2��2~F5tF���G!iO�,������t"���	Δ09�tn��;�Kb؉6�Ãz{���Ǎ�@i�ۥ�)���2Y2\_��Z��M9b���'��<�43��gͫhڠ�be~�7yLT�s
L�\U֗�JoP y�S����=v~2����в�s����E^@c�*y��/�U�<
T�d�O���~+AQ s��p�q�c@?	�%���?˺�uD"�U	9C��G ��W	���{���XHG0��H
>��LR�T.XG���Un�^��Es�x�#���^b�K�V�V�6 .D��QV���Q��y�S0/�������Έ��I0�gY14d���,P"�|9AX&n�ۥ<6ra��x�����Xɭ�DV���Z��Cn#Z��4��g��E�d��%���Zf�ѹ��7�\� N�    	*�{,��M���ō���ڒ����և.9Ж��M�;���y�!
ʃC�60
�󓰌w1���܊��Ql�2�m�Q懱Y�veo��c�'��i�*�[���Gq
r�PE�2�v�`�	e6��dB��H�2� .�r��W$r���C�r���`[4Ѩ�Q`�Z�G����0k+]�[�%(x7Q\)X}L�|I��c�.����0m%�,� �D	�d,���`����a��6CĀ��dq#ė�x5��y�����x��������6"�u;��9�w��/��F�A7 h��$��U�?a�tkfQy�X�t���0B^:�&(�b�!���Ň�S�Q2�y�=��X�z�9ૣT�zܣ9kpa���"�3ȱ��%�����|f��n��4DS�H���E��0�4vF�H;�]� �Ѳ��f��Ψ�O�7&.`�u(#�n�"��K��9kw5��8b�#%�!�q�i|�s�	"r��`���.K7؉�b��&�*�� ���%����!?a:ҽ58�i��w�so,N�A�����|7A�Y�Z��|�"�ڠ��v5�j�5�x.8Ԉ %�n������eCG�h��2c��yn8�h��?ͷ��C�)u	�㓵�PC>�g�:�f�M����y�dj4�F�o�����lЪ��A��N�A;�������bn�up	k�q�t��Sm�#t\6�d�{�t бµ�Q]Ϛo�'�@Oھd0��]�cY�G��1�og�0��4�ձ��6�tT��Չ������}7�~�f���N!!�5��[�կ������o~|C�=���F�g7S��Ka}'�:�r�ڎ�ĳ�gh��|�M:�(�78T�wӢC<1�sIG8��uhU�328cM��L���r-�����i�H�;�z�q8���eh�zݸW�;�RL�=�s��'�v��lg� 6�.ޚ&�M^�/�Dya�\6`��3E�	p���'Bt����E5S*C�'j&M��ᾚO@�O� C�^�b�8��7ـ��ӥB���\F2�Y�B%� �)�� $���U+��JҐ����.�����C�ckWo���!_ȝ��6���&�ǒ5�Q$���jfS`'����M�D���&�8�vt��L�^�c��+u����^����^N��Q�}���N�ag�-'3.��t��-���^^�?��������o�5�`+D$~<�ܑܚ�D|pv�x/�(��N^}0���4*�t[]\�d�P�v�*�+�6Y��2S	U���i6A�j7�4i5P��7Q��dؘ��3N��׭2�+�N�������!N�+xw���bw!d�`��E��#<��MC�8�g��l{.�.
�����	3zzj�������9B��Ή=��9$�B��	��Pg��3;�гJDPY��j��ڞ��B�n��+u>�0$��/*�~ʗ"2�k�}fv��[����W[���ڀ�����[B��5�H��<ErΎ�{�sB��9�~>(��\�Mv�x�d�ٵ����q&�ی���Н'�	�u�����p5vY>p�\��K=>�lFNSB�&0`���ѡ�Dʛ�dT�
J��)=4 �K�Qj2/<�6i�N�N��z�&m�ga���K�v ���>m!t`8��_ͽ%; N�B���=�B������I�s�Y�	��L��鿡���W�<�ޥ@�N� �>�~ê��p�N��k��?~ɷ���!5,ݏf�}q| �5�X�nu~\�9�rx���q��ڊU��[���<��B)�AV��NR�,�>��Tx-�H¿\�~몾� .�/0�����U͠UKxV�J�����l�.tj�^�{d��U�(���+�<��{'t�r�s_�r��+�Q�K(�;P2�c�ܫ'^JF���o����#�i.��z����x�>�/�����I� �,� �ꅍ������l��ǚZ�vfq?�˅1Hl�7�9�C�T����u�NL�mO��u�v_�O����Ԡ�a�=Y)k Y�5����a�Ø���~N%�F+�f�sG,U��L+5���r����,H��6�1��`�giȣ��\�~��\�Iv��O�^�O]5�9VE!��졘X��ܪ���.\B:�O�B�,�Ip'��b4�R���ϱ6��A���X�t�
�����g��A�O��nGv-1��AbI����{�w K�&�l��Q{a�p?�i���F�xM��0���ȫ�.|"����� }�ɒA0p_n�̪q6���JG�:z0�.+\����%n��l5����l��'�G���H��)ۤx]��P��a9��	Ʀ���"(D��Wj�Q�5w:��0��H���ڬ&.+�J���<�o�:W,n�W�{�"J�%/� P�����K������nǦ�{�ܜ�Y�b�ef�]�!�����D�C	�nBɈ0|w1�5�kq G�`L�nK�B9��b����U	�b�#�w�J���ӌ�����g� T�墆͆�H.`*���mBH�����%b9*NZ���[Pn7k({W�0`I�}��8����kI4����=���7J���[����_����S�]l�a�ն� 9���p����Y�/� ����������!�Zu㩚����b�C!�N�O��~��"��x�*�>�o"����l�i�?"�&�'�Q?I�!���5�ʽnYK&��c�����L�Dͮ)�o}��]�y�s[V��"�1򛋶���'��E&_Ժ:לκE~>*ؐ�!!�p�(`+0ܛ�e�6��r�����CԵ*N�M��7�C���Q��+�"�}C����pQ�y�01�YKL��e]_H3�y��p��>�?oY7�8�٠���z�[�>C��T�.��[LܶV�F�
nC��Ea���V�;,҇�p����ژ.�&�wl�ѣ)>����'X[Z����u)�n� 	�@��FT��,gX�K�ueF�0� �vAL!�B����H��K섾�^̒�B����aI�m?�B�.~�լ՟�2�n��E���S��R�t���Q#>�E�ޅ9�v�ށ�-H`�ؙzg���/��ڡ�7Q���6Q;�!k����� \i��%jO"���ǻ���p�Dm����W��m~��	�OԶ�m���!Dx.p:���a��mY��}�!<G0Q;���p�6!2a2Q;� ��#��B�6p��CL��v$�#��V��M�?-v�=tG
.�C'j[�v� |i�vĹ%�n���LԶ�1=n�W��M�����#t֝�M�MtOԎ б�7�<Q;����&j����2��5'jGÐL�&އ]����f�I������`�r�<Tw��;|�r�2K��҆��0|y��ZV0�V*y�l�s��٨ ϒeK)_��\i.��4�7��ӗ�z�6�/'��������rax����d��m�wa���Q�v�ӵ&�$�\�9���O�T������*�/�
[u�6�L��v�:����&'��T� �>4�)�a�K@T���K�m�Ҭ=W�u�K�Z�B�9��=���No��Nğb�&8{�=������<:ڣ5����Ò������҈���tO�4���j�r� ��,��ѼLb�˩��.��N�H2����4����G-��-�.�l���(��`⑬��R�uB�'*���ə��Ȭ߻�51���ҕqؘXL��� gˏ�"����W��{Z��'�:�ƫ��Ws���Jj��aI���"�L�A�����k(`7��/���W���^��̴Wx�G�Q��?8�n�dst�.��["��d��I�z`�~.�8����j���O�Ś����ݕ�|b$�X�`�ϲ��pɒD�r��o���8^#g&lL	vb����x�[ �C��� 9��@6b���ƍ�P���[=�"0ln{-S������e.�Gnu�w����N�(�P�z��QbxM�/��miOK���*S�3R��Oj&s�`R��U���0�����p͠���	 �  F@;��ɒ���~Hk���Jcp�؇o�����6��S��@|����^쎧��_'��u�@2�k2:+9����:�w1�s���	�\`	}!��bW�s��n����%��Ҩ������b/2��ϱG>X#����$ 4�aF`V�,v���0mά! 4�H$�*�1�BV���B���y(� �����.��XP��Ac��nP�K7e]� ���$���ؑb)�+\B����$ �&�3HZ됈��QV/
��5�=�������ڑ�0���3o�;uR����(��sF3��*[����Dֈ�,�����A�����4�ְA�#�
��}�!��##�q�.[F��C�m#�K:1R"��U�U7�Ơ����	��P�\~�GlIW+�����C�s�7o�n��I]��"1�]�1��0���bw�\��j1 �r��z{�`�����6�%���zX�&Edtd��OJ��B
�D�Ld$d_a�Zjh������"U��:;-.�Qd���x?vr���^�� M��\"+ed�Q:NW˺�uY�$.Ӥ�{H� ����B�)EVX�4J�2�A|D��b�-}wK4g�F�]|eԞY�d�S�8�
�2�~=Ղ�)D_�D���s!� �U�'H�7>����>�|ջ�JQ_	���<O�(m�<��C�k�Ó�b��-�1�p��Ps��&sL����-x��9�\���p�����W
�ب4N6��C���K�dM��kB�����ڈn��}��y���|��=���)���Ki&�Y�@�X&��+��m�'F�ϋ�?�F%"�e���*Q<Í?]�u�Fi��A�x("T�ޖ�� �Z��M���xE܁e��H�w)�>᎓i��MO�hd!������b� z���
�peVТ������>��$�z���a���iêu����u�	���#��/.j{b��Տ�ݸ����tZЖ���	����`��8����+��\`�z4�؆x?P�� S���=��.�z*�8:��/y^�(R�\��x)[�#6Y�%�M:Q����,�j2f����"(��鱶f�P�h�FU�-��)�4��pwG ��K��J�[���p��0�_���(�lP�(8��hƩ�$ʘyܐ�p� �x�J�{�>�@W�onZJ���}��j�މO�73����U���=�]
�FE�~ y�o2Ց/�9�
re�瘛 T˙���){��^����?O�� )�_���o���"�)�ʗ��T���lLx�+۠�׍��2��n�-9/����;a0�Q:��4�C��g��uU恗J�"5kN��K,��+e �c}�b4/�_톙l\�2��r�f��N`c�>R��2��+b�a����z��)�Y�<�����K<��Q{�H�� Ƽį
8F��������?*m����ņ�5�OD�O*�jN�3�b!0`���ڦ�+�[���r����¿_��
�ky����s����I��0ܺ󠍍X����d���F���O.oN���ܸ�Ƌ���V�Tۛ4�[�Ω�>���?$�8�D���[5ֻ�S����^��<�^�������2����g�x��R6�٦&��8NXv�Kԗ8��$���u�8������!�7�O���.�H}��t(՝���#&K���"�Ŝ��y@ ����kGԒD�lFY��[�����oԗ�m�?��-F"�V�5=C�|m=��'�S�t�p
	��ˍ�6�5M�U�c�}U=�5�jt�������Z�T4k� :�]���p*�\�C���{�B�2�`�)��K�'�Ӫ$ꚍ�g�2	��B��[Y?�Bi@}jouR���x!T9���}����D�&�a�x�,�;��=.oEȡ�P;�Ν9��V�|�6��MP�ݸ�kWل6k�(���'۪487I�h������r�`��i#��}�m2�㓉H���M�1��]D�J���V՜;
�5m��ˁ麧$���}Z]��UA���_���[:έ&3f+�e8z��QԔ���=��y{��q�̑��i���PG����g�[�Gz��s��Y�sp6K<ǒ0�)7��L�Pč�|�6f
�N�g,�҇�h�K�G�\O���x�o�x��ԝ1_U&�씹���PP��1T������~r���7?����R��            x������ � �            x���i�-Mj$�����Z�7��̈�Rj�HKU�>"b{�a�=j�[}�s�Z���>��_�M�ÿVZ����V�Y��W�����:��v�_�k�ʿ
��Z������V���V�|�}�j�V{�'|Y��=�^���u�Q������_���>`����Ŷ��x�Y�j�V��d�Zہ���զ|�:��'�o_�V۬�)?W���k��~[K���LbU��U��5�WkVV��ː,O�m���9���^�����h��ݩ�k�7�kد|�<'�{m��s���.k1�O�ū�b��V|�x��c���Q߾���k6����ec'˯�#y�2��Ǒw�ua��V��:e��_��ug�E���1O�:�Ӎ�����P\����V���ɤ?�}2v�J�t9\�~�Q��Lw�^H���V���kL�L����N���_���Y��#_�Ն~n]�{%ޫ붪���Y����+@vk�_gN�W�$~��t_�����)����+[�ݎ�K�ꂃ�����ʎ�ٛmY��%��،�_+�l�ؗ����ieVr���Z��7��qrL�q�J|qd����EZ���A�N]k�u��)A��4:�C��)����:~	_��~Z][wm�A������,_���;��;��Z�wH��}B��̪-�,��_���7�%��Dۿ�ƒ�W}i�$VUN��~�U�fũ�d/��
}Ն���V;ើ������K�L~��/{/���fl���7�x�ɘD�sI�jx/=�4N�{!�^ﵱ6�lȖ���������nE���eZӓB7����$�d3V�@f��Sn]�fu�fG��K6N�ם�������v�[��k����`�#�k�*��|�Sx���CNn՗$Lb_87N��%��1����>ؖ\rrm�7�Wkw$�<��*g!�ղJ��>�����%=8E���뗕��^ǲ��T<tu{��l�񒳪%�n�?������i����5Ԫ��%�//��o�fu_��dͷΘ_ϼ�V]�������$�����e�=�Jb%�n�^Vv�"�`��KԎ�5~�a�Ю~}¾y�ƾ��[/ yB�w�E>���b7��z�w�f?����"p���SV�J�+�@$a��Ʋ'l���%��v%����Ց��W�@M��~�&�p��}��J����?� q�s��ɶ-G��k^Ҧ�x#~���L�ag����:\��Vo��L��W�=��W`u,��zM�\c����5�� zx6$�ᷓ�kb��:�E>�����X�)+�>����(�����}!�X�"�G5�`q�i@g�e��75O~����J*r���bV���[-!l�T۾��Q����/]��;)�cɌ]EO+��jYl}$>�o_�E�檶�5><	��H(1��a�����Ȫ�D+���`�[<D�p�Ql76��}mDV��D�0Ϧ���a�P�L�S�]g�,e�+��\\-��F49����g��J�Y�.Y�]��Y��4M%y�g��5'����������U˳�A�+v�l�t9��.���E��=5��	�xaE4D�`w��C_۠�������6���x�Xk�%;�٧���V��8a�Q��p��'�F=�}j�!�j]dv�y>��FT3�k���*��NPНXnK�S�/YMw[�6��.	�E�1������&�,^�bV�2Nx�i���'�x����\9�$@)�t ��<Sh(au���0P�j���8c��5���6���X�@�ѭ� �,;��'�[���X�$�g��=�òb�!?Oė^_�Y���q����6�X�@ 3�`9� мְ��W�׵_�kX�k��EX�� b,Y��r�/�n6_�Fԗ�U�	�CNfI��	��9�{iu��]�����e�j�JV[	_�S%���]�p5�k\D0sd��Ԫ;߲K�������g������z@z��]�^��Z;}[��#Y�?w�&|Y�_��tϚ'a5_�����z��Py�5*D���&�V�M�f�O��֘�WU���������(����qs�JR9릞?ra�u�������h�|�T�:��$��EV}�8%$��#a���=s�^MH �m��,�}�)�Ӛ!7��{��5�k*"%g�<��X��w�0����0��ᶜ�ee�&�	���W���~[�JVt���×�^}��˶���A1慬�S�$���|kck/g����mU***��{E(�m�����o�S��P�תz��	��c8B[����e!�
�r_Բf��� Ui84�����׵%n��ů<����4�;K3L�g�0���[��I�3NU��~�F����r�"@+k�N�ݐ��$5�E ζ�!k�B�>
�a�O���k�o����S��┟k����(c�l�����%x�3y`7ؽ:�}�ε��JH��O��� ��%����)��q�f˼�e0�4��^�k�
�����{5���s���n���
�k�_+�{5��2�l���mDV�`� �.�+�ƒ���	u��{� m7 ���P�I+>�*2�H��k�6嚎�=ARD�b�r����FHlDvѭz�d'��OS�ޖ z`���`��G�p,6DqDM��UO��Dq+��%�j-�k�q�ax%��!�C�q8�6�'��<���A�+?qq<ၡ���$�/J������� �ie���/>\�=�k�Εl�X�R	'C�*�}G��y)1��M�8O���X���	�,U٘@[���"�:��x8}�	҇�( ܏ųo+����QJ�h+�5� 6�4����!I�׸�$���d���3kKYm�4nH,���x�8��^��T<�\^
���Y,�֚Gr8�2͇U|�>�CVWƇ����?=m���!4?�Ė����x�i��?b����&%T�4ZzY�� �z�b	�)��=��5C���1uO~�v�4"HU�6C���f�'�{YϏ�f��cK�	�t��R�fS⎤�Jǒ�7I�NZYy�VOª�q��ܟ�����4,
X���_#��8��⃤fADFz��:�;�SN�&(;���a��dmj�9z�p6�N&��� ����c��G��it̎6�}f �eOx�ŗ�̏��7e~�U�b��j*md�/ ��Y�1z�`.X�-���-�C�p;8i��-/iY��c9�j�J�[����;�n/����h%,����%|]+~����"�b�(� ��	����M��J���]w2r���������������%�YLM�Ǜ�JP�J �����nƠOK�K���ԉ©�� ��L@� N_$���H�b���4���W�u��ͣ���{���;|)O0�^P癠ĮzO�~�+aO�0�W����3p1H'WYf�3_��z�J����T���@:9+D�����k�����}}<`bP�E�U+�;C<�d�Vke���e-��F_�����Զ��7���F_(��a`�6���n#+��\sP� r�����x嗪���
�JP�W�s����2�"@���B�_��ҭ�Hk ��!��e
�h�L��И7pj�^��G`�m:�lP.������
"\_v��1��IJ��ieOX����������
��-󎄕�U�֍�l����%��Şr]�]X��^u#�-y�՞V�0$yo��s,kFE��"�Nf�+��I��N��К�}EzVV����iOt�
n,��@3F+^݈�J�COsd����1<�h�Sb����-�<��V��f1Z��n;Ţ���	��w�����yvoi��[.�ak]cF����g�?���Vm쫲�Ij�����#j�����d%x�*$d�u���0�Q}Z���+Ǣ�QJƊ�����yy�h;謅����� ,�J,��;��)�訴�R&����l�o����5
D�r�J�-	��ՙy�˪!��K�7��:����zn�{'�i�#SQk/[DPc_8�%!�R���?�Ld�����U�c�@+c�W)�|2G)��+��9�K�h�ٴQL���X�v�M͚0�S�Dƴ�5�-�P�
X�0    ���Ҭ,b8z-$� ���~�#�KЍ l ���:<N�	���Aˑ��Ih���~=Ϫ-e�v���*��G",���A���@u6�<�`�s��Hl�KEsdC��[@�<*�|�$=��4d��x�\hոS�j�B�
��!�3�i����9{[@k��CI�����k�x�s^��>3��
�al�H��}A�f����i�஌�洢4$}�fFq)�G�k�a=��m�g|M�]�~M���w��l��x������8jm���=N���h��F_���oRhT���P�z-@�������^Q��2�;y=���ղغO��ّ�ή7Hچ� қ�xC���é���U�N�BH�.���eY��ٚB�r�T��.8%���m�����?eQj�Y֕��3����c3<l�$_���'W�r�2.H�D�Y5�\)l��sUdv�:J�� �/p�;�X���ֽK_^c	����I�3hdz5�2$)�vI��	��']�V �vr�S�'V��p�#j��Ϙa�A��B����h<���c>N�b��K+��ɹ���8�:�qJXQ${Qsr�$�U+�u!��Ĩ��Zڎ�W��]Y��M@#�V�H��?+��M�����vn/?���d�"4QZ�c b\�1�9��V�[<�6�,!����X�Xwr�Je�[!}RF�=��Y�������Z�?��$pa��(a9��a�XMD�l�~<�V״���B�ުq���"dQ�wm�hڌ��3A/��PY�D��g��Q[���tU)�"S�N�� �s��"{�G$_ �i���/;�d-ܿ��,ԥ����i��O�㴗��^����j
�푰�W��V�}�V�>,�V�dq�U%hY�����I��N�����b��ނU?�>����l
��:��G���8�a�!ۡ��'�޸32���U*`�}��i��}�?k�o��\���g������S� �T�)U�Oa�7��D9���z�ULo��⼏OJ&Y,���R޾&*}�vʨ�E�W�?�4;cIU�T��.Y������ �m�piL毯"���Ve͗����>*7i�z��b�
2W5=g2m�'4�m�ʟ���'���S��)`ڼ�q���h��Π����(`ފQ��p��z:�7w��z)3T������D��E��zg�7!t7��$[��]�[��ts�خ���o^Jju
�ܚ���7R@�7�5��W�IX�(D/V5�J.���plŠ�AH�\�W?����V���PZ	����_ݿ<��g�y8ȴ)�}tg�<��7!_�����v9ٍy�|�L��d�	���X���]�U��>�_;Չm�#�</v�=���Z��(�/SK0^�lep�Oq鳘h�a%������`�;+Xe��3�����
F@�'W ���lJF����e��Zu�JI�U�N������'�y��q?HQ%K�v��׆/E��g8�vRY2��Q������YI�dm�M�~���#��������fx��k����)���˲��Hi}J�]*����J�Ҝ12�F���iV\��@\��[m� ?�H1�J�����c��޵�A�cjw:+Z�!:r'��)	)�}��/�HK���7
���1�Y�*���:`��K�E��a�� t����B�4�Ǻ|_̝?�^�+ԯq1�<���i���؝F)�Z�u8b�J�x���_9�
��Xې"Τ|]S�S�����x�5���sC&�!A��k�S?Y�З랣�� ��C_�p������!��FF����
18���2�=�FW�s�� dU '��L�8�)U*KBk�o��i�D=V�Ì�����Ͳɣܻ��S�����M��c�M��-��0�s�C_�G�ڧU5�l��+B���6��ƇĠ�a��������0u盱�6SEK
C�#�1�\�� e�$��Ǫ\�����V/Q$��B.���?q�ؗv*������3S��doH���/r��ȱ�������~�Mf��ne	o�_�C3�?��ne���k����
\�Y���������f�+v��/��<�ّu1�u{Y��eu߯��;���{Hմ?i���ε�Lb�au����l��pKq�:�95җ]y��y�
E�K���}�{�e�M+W%G�������mL�<�x/��kQ9���7�]��M)�_���M�����/�z�ʉ|��~�(LNeU��1[���Kai�\����k�v��߄�����YS�?��]����e=yF�:.�[y��jX���f��/+���>�F�*2��^�d؂�a��2��"|]
��$K w]��Ij��'4�ɨ��`!}-~y�6�����KR/��V�=��QS���u�V~Z5���ʭ�Gl[��K����wvh���@�9���;��	��-��.���7���S�/��I�e��댏�փ_y28T���_�{Ao��D�z[Ph�t^�H8D9)�e�=�^���=�'ܼ�1�G%yW�kl�h��Ê�}��%����H$��f�����j)s@��]�9尙M�y��A�)�jh��Wy[��Y�f���KEV��f�o�}��]I��,��>��^;!T9h;Ϧ)h��
*�l�SU��W� �[MGI��{���?/�c���	����5�L=����e�9T���M�9^��Ȋ�1t����Y1���VG5G4��r+v��;��g ��!I��&	['`�:����-�����qF��1Z��������yq�[`�)*���s�m�x�Zy1�2Ek����_YSMk::�	R���R)Dwoۧń�"K5B���|�Ny��I��r�"�;(������u	H����࿩�Q��ݟ�hh�t�ΕŻu��m�Y4I"�	��Vr(^w�N)'�3�zp�4�P�5��xXY:k��C�yj�<T6m�Km(�NrJ<���Zi��X���� o*!L�����y���L��������,Pv8�2�Z��K	���ǫ��Q���v5;����'.��v�M��2 �*H-?���E��fD�< 40�S�u-�)箛 �lr�%�:N��0۷т�,��!D1��=��Z�Տ�'�Ym��t�)�ge�#���N��,���x�2~��`[A.���~p�����K~���BANLq�k���]=�YN�r�]�"}��B��"����\�/J��-���x/��}@�J��O��1�7��{�����Ǿп"G�<W9��jl�>�8g;_��
���J�)_�P�C��,���9�by�.��+���9�w�E�'h��o�̚��@Q�ZƗG����l��\�&�\Ć٠6�"����R�&#�i4�l�D�=�ltB�vBꄠ�,�7R�2��N�jX;�T-�� �r�G���-��KJ�7�����},���������jail,���Ǉ|ľH���9�?c�gT�S��alŉ�����ֽ�+8,,-l#ҭѿI�!�\Yrl��ubL�TA�Zn!Zq��7���Nt�]/H�� !�4xd��1������lc�<{�w��^����֭mA,���ių_^����@4G�K1�ԣn7���[~k_����O�Z%��f��
rf]I��PH�aE���`~��M}bj:�l�:LSYB��ﴼhJYU�Gg���D2�`�8��cuD�8���9$�E �+4=$f����ݫ��d���t�{)w��;�K�E�M�(�zrŏ���
�K1	�64�+�Ig�*\�a�ݝ�SCl�����r����`{Ձ��H�E_�
'�	W��h"_V��]����f�X���#�A%0c.�a�>�� F_����T��}cYC�E C��^%��͹�nϰ�_ySa:��d@�́�s�R�/֊Bߘ��tWI|����P��&�mڎ@�S��r@ݧ~E�U���&���Z)_K}�nz�����/(�\p���k��RoH���*Gf&|��yѣ�(�H�՗�k�z�X;���ĐZ9�c��{9TS��I@����S�CH�F�����4SW�m��0[�odW���j��	�.��*Xsm�^yz�H��ɱ    R��rA��[�G�j"*Ū��ğ���-���������&|����E�5��Bmy��䳯!��D��+��r�4J�{F��P?2��G�7�7P�c�{�'+��<�s>���&�l��!����1�ȸ
sG�B+�m�ܭW^��Y�&�0�����|A��`�G�.�����{�ps{��bt��'4�s]���������Jl7b.�Y��
�|S�LXQrz�i2[+���^��g��{��V����kL�}!(Y�DJ���[G�i4n�ud0F�����+M3�1�Жi�P�@T`3îN[:�?��A�(�2Y����8C��Y�|�D7AP[D�):_�G6������%�7N&���i�����Ɨ���NG�<��O�d_֭=z���e���J�l��d'^b|Xi����*�Qڊ��:��P�YD�	9L<�0�*>�U�2���ICx{����q��t�T�|�ԵI�����(� b��fK<�2�&!聓X��b3�c��P�
u����}�P#�"��`b��a=�0�f�%���^�$ћz�E��5��l�����v)�yN��("5�}�g���h#����� �]VI���&4�o(g_O��(���7���+�u8��yY��1��P8��'�[��}9Z�c����Af�*�	�B����}�;S�9ȇ�YO��;��h�v)Vamr�4�)�Y	�YoEQ��5�=2�@4��|;��:�z֌�,&vW��3vL�V�V���qJKX���m<:=�\"4���'gQ�m'���Va�|N��v{�A���[�O1|X��)�ӽn[q�D#���:�EXԖ��=�_**Ɓ�fZfO_~��\�����+��TZ9�%Y�h��X�V>bFdU9��"2.�Č���A�q��h�b/ksz.��J��1*N��7A粁�(;$��x��9Jh �ݙ�/���[yL���(Y��Ⱦ}	Ɲ�m����e;�s-��b_ '~����l/��S_�o��8�2�2����(�G����!:alEE��3���}���Z��,s�O���f�ظ+�f����3����!zR���,+��;7�lel�|ڹ��J��%EC��T|�k__�<�O�u�����^��S������ �MҼ]3��	=�$j+y~�m��PY1�H��|�5C���@b��k8�b��?J;C�QK�]oڔe}X!G��D�m]�Ή�� V��f�F-�,�\q�:�B+��D��D҇��&!��=�O�:����
��P�ve��k��"GRE駝��k�k�&,�\ۇa<|�o3)�㬏�!�H\D%�#�|6��F	if��\�Y�a��ΰC�q٭5�K]�}�^h�fz���L�=���2(�S��R�)���$�u��M.��Lr��;+�13�����ƃ:ӊl���<��R��E��2�����.*p��=,�o���'auy�v
�n�p��%Gf�M��y�V��p9*Ψ5�	#f�)���P/�d%��Wañ��ײ���L�$��m�L0��ԝ�i�V����0W/�6h�$|���1�3zB����87��\(8~B��u���房�M�K���U&�4��p���x�:�ݠ&��o8��^?|yt�Ñ���������'7ⴛ#�c�e�l�c�Y�����Y���[[[ʊ�����?N`�Y�5O�AO�O!<X�,�)[u>ʸ��p�����+��݇<�-&��\q�N���=������������a0T�%|Q��Rr�ܑ�3�5:���L�h'�g��'+c����v���eH��@�V�=�G�?PF���H/AC�����2���tL���'"dz��mó��iC��`CޯMS4�s�N��O���p�-����!�mq�Q]<����{*�JQ���qL@{VE]�*d�x3[3�5C�8���Ҵ����A�:�u�i�<}��8����ϗձ�h%F!�5~��������#&(�����cr��,2;y�������8]��ʣ�j��9&a[$GW��Xf�T��B&Du��δ���?���h>F0�E^y�����q�7\�N$B;	�q0�\(�����h^�������R�;���;DŇ~[y���'t<��НqLj���6���
#�O_�pϹ�Y#w�	_��kS�M`���a9��93�����wZ��Ǔb��q,6��w
R��;�6P�(7��V�QmԚf��n�&��o�$�vj�Si��w�j����j�0gV�����qC4��Q��3�<���8pYR��&値�-�E�cN$�� X+�hf����7�S�\f� ��J�K���F�L��C�ڔɍ���`B��1t��e�XI[��֬]��H^Gۊ��bO������k�y}���WՇ{��
�&[.�s8b+N���X��)+W0C���yB�b�Cݳ53Ҍ��aHN*�3�5t�����\;B0���br>y���&�f;��\�Z���
M���BT�C�VT����#�@E�fz��/������.9��s�=<�1z�V�5��k؈�L�j���ސUl���f���X�pl��:Fn���M�t	�؊�&��z
b�iB*���x2�������\��X�p4��*JްZwI��,]T�Ԓhf�?#�É�k���J��uϓ�{7�&��0 �;0+s���>�"�
�9��3�,�7|��_�K� ���4�З��zAb���sXca@@�$,�q���^�@X�X�j�}�����qԜs�C#�&��@|F=O�Q\�6�A���.`5��k��Z����0�Ȳ�߻2���^�iS33`9
��v�����Vh�չ�	�!Z��2��T���@5&�r{_�1˓]����l���/�£��>�n+�|+���Խ�)҂�j�8Ը�d�d�v;g�f)a�#a�Q`*�Ӫ�h׉�Q��&��H�K�����	)�nς�ɇ��`�&a�}b+��E�n( �u��߼�Go�%>�&⪯�I�������洭��I�V�پ����H��)B�VF�X��VjnWy6�i��x]�+8�
��pU����sC"��da'#^�V�|�CuN[BF��o:�gy�i̱k��!��n���̚0�Z���x/�Z|����������0�o��6C�wS?l�ج�X�{�@���X��V�<_S8{�	��q�l �8����a�v(��\�_F ��r�֠Ʋ��z���gg?C�)<u⨽���D�<�8���}3	��vS�Qb�ͪ|q���
��BYI[zN�Xm��c�e�Z�]�Z.6�Z+3k�4S9���2�M���V���z;�;|�o�]�R"냵�h���gP!���nj0�u�~W�
\A�h昞���$:�V�x������z�t���B�_g[��-���ڸ�M��m��q��c�k���yMVF�zV���[e|�I��cov�崺}�dd�*�2?�������ޱC��c�<P��Y�_�AFM�S�7$�\<�1�Ùљ�4����pwt���V�Xv
�p��V�p�>�����v��؊0Ѻ�u�@����t���� ^���E6u��FE�~Z�N67X�
�:k�7>'V��9��ؖ�/�@���DAVx/��R��~���}�vਦ�o����؊���n񾾻1���vE���
#c����=�'�k��7�~[�
��=g�|V�)�xT�n���ŝ2y���U�~�L�~�^�cn�o��ߚ�w�}ћ��)+� f�j�H:����ԣ��Ǿt���e��yj1��XmQWᶦD���m�/v�O�j����0�C�d	��F��H>�ͼ�Ɓ�;�ä����|J�� R�5�,�z����AӐ�R�=
�u�$�M?ݙg���a	R����|K=�⶚܌������U�fYif|A�~}C �����X�����W_��+���=��ˣ�G~.\��{)5zBS(�� Ӣ�*���pr�G��D�b�]��m����t
m`�ug1��}bZ��s�N�����V�w�)
�|�I<!X+�n    t����g
n��84�
6�� }��e)��1��v?}��sA�b�����Z�#$�WN�V���2k�}[�G��U��׭�V���){����X��O�����>�=bց��Уn��~V�G����b�6ŞPQ��V�o;���ԣ>�$9��ٵ�\S��ޘ�i�ż�"@�<}m*�����[�Ƭ/<�r4?�����-�ȋ��ʏ�ŴZ鑫I�̶�����:��m��?�W�|3CN0ɧ�ػ��Ue���l�k��L�Y�����#B�i��%P����Ƈ�bf����i'��Y?Fp���E��t��*<Z⽀�U�'˶�L�|��{������<���9 Z-d����%����g�����Y�֭�$Q��7��.'�v��%����%P�oZ��Ho:�R>�f������tP��qY�AiA��S ]S��z�O�B�Ҵ�7��N�t�g��+ �=ͤܪh����I��b~��L�Vۜ
[����$�oR�m�N�m�±�Wg���{50:'�I �au�t��F]ՙ:��7�hN����L�����S�&�e��ZPD�R����9~�O6��ԃx�r
�����u�h�UW���=Ie)��~�]g9Ll�$^P�=��"�E�v#���:��6�GUF�>�M��~[1�^!LDp��th��2_��F�N0׈m3�0�Z�<�]�U����֠he|Q��Կ����J����?�����I#�0m�vԿVV+��'A���Zi��l��%$�7��s~��=���^::6��6�oTӦ1sF��d6o_�Z�x�f����2��n��|����Z����IXaf�	]ʟ�x�̷�jN�$`��
�G�յ[b+ꐐ�W�3_�'$�=��۟�YI���[��Ͽ\8s��r�ז���8���v�>|/�\����׫��d��`�h���:��zO�����e-@Y�I: �n҉s�"��~��Њ�W>i����
�aFQ�I���k1�h�7�e�~ӋA47_T���,|/��S���I��,<x-�G�ٸc�\�l�.&18����:�=���Z�ks����B�r��V��?	��	FgW��:�����v֠2JT��o���K��m�dO�#�m�k�,K�SM;�4~�W���sN�B�r$�a����=6hCr�~��/R+.xh
ŕ�"�S:c�H䚿�E��} ������e��`#��� @T|�s����wGn(����
o5�tfԫY ���+�Fn8���$��L�16�4��]gP~$�u��k�uz�{ȏ�Z>������2���~y�B�F��S�:\{��d�������V�l#�T��3�E='�c,��u<�ƚ�[,y�@ի�d\ߑ��kY�tRVx/
+i߁ﯨ�ײ�i�=��w��U@,�d�#�T�h�%7����,���ڬ��C��Ғ�u�����	M�j��n��y?�:p��!LU�r[hO����B_��Wc@����@�:�$|Pp�r�7*Io�V����u���}s����%|u����{����jy6��V��Q��Rz�p�/$3��]ߪ��&e	�ܺ3k�'�̀z����om&�2S?>*�z���V��)��{"����a��7���;HU���ҕ��Z�+�u�Z�tE���!����q�ӈ�I`�<5�����j} Ř7ex�d���c�â�n`9fhz�Edu�\@1Ǥ3�����=�.�Bo+ 	L!�����c~�hg��������������&�u/o<|�1���P�u�ň�!NϪ�h�E>\����C�����+Ǐ*M��Z���NKu�e�pB7�VW�<l��IV�� �=���F���X::4ۥ@��q���h�Z������ǩY�e{�������>�d!�����t>���f���
Jeo�3E�����~�%l��=�s;}�ȯ��o��SXW>z�!�w��+�{�m�;D2o��כ>�,�j���6�L���$� �;�?+�gJ��F2�����V���~k�d����`�g{X-ZA^T�XVd���{�X����[瓃���Fы`f���(US�[�o+����r�bp�1�~y�2�A�a�;��dT��5��d͵1��=�1L_�c����� �eI鿥1c_(��A�d�/��@�B4�~/ɔ�t<���p�V�{��&�&Q:f����o��A��+#,��gY.���j����7~#D.m�"����y�,3D.ˍ���� ��_�C��n$��	��A����q��@k+�2��_���Ō�o��|�����0�f��B�(U�{���,�B�h�(��F��� v���V(1�
��q�O���о�1�z�� �����^��<�
��oT���c��ޙ������j��f��g�:� 5'i����1��'��	���CA��A禬6�ư�n*���Zsl��CO�v�y9B	ڽD�OS����9B�s-6M��A�P	8���O�
�9-%hp� �KA�<C}�5�f�f|����E�}FrE�q��p�XV��O�_4�؊��+�#��YFq
q�l�QU0�ƿ�ୱ�5������Rc:l�m������Lui�T��R9���1�&%uy+_��]H��������*į6^ ��|�)�d�(}�d�w�}e ��Yk	y#c�t���ے�g|A]�T���7�7LߩVV��0�s��t���,�N6<q��|ޮ�����N�aRk�|G��'�U��!�n�!���b}#<[�pE,�+�P�z�#+����s�[��=�ޤ�U/BFp�'�FPn�4�[�1*��ȓ�ԣnZ�V��	�0�o�휯�+���3ր�*=�4�\���ʒ*��3J����gy�-��R��ĀaY�ӑO�����z�5&)�C�	I���8��`~�8omhF1,wꐆ�7#W�����Ց/�j���hK��̬]�u�lD�b|c�Yzx֝!�����v�k�B�#�g&3���j6|ɺ:^a	z�hl��jz��X�1<DQ5��)��%�\+DK�Q�u�%(���ٕ#j[�B��f-�"��2��AJ��h�4������9B���U��F[�o8k�ZNn�h��.��UC���s���������+�q��<l9ZN�����?�Y�N���Mѭv?��s 3����7rc佽�:g5t n��ы�g�
4:rd	�#W�&EV>x��ݳ?U��V#j�����}\��2;�OtR��08��֔մ�X*�odE�^�:��38A�-��/4S����:���ks�#.s%�eދ��?�����v62z�H׀�l��V���[�tF!�2��+�T���Ark~/Gm�l�����~�1%VYW���/�`*�����#_h�l�S�Nk/��b_lDA5d��c_8�:I�k���u(��!ȡ��4�*�P��F	{S��.VC�=�h�ƬT)���͘����2�V��ٽ�Zo7c��25T��x������ oʹ s �3oο[<�T�fK�v�'|!���Z����1B��z�Z��s�ۤ�y�-�Y,h�9{ie���<ȍl����'$ϤZoq�H1�f�HU���i�_qs������*������� �Ն� �[<�u �(�����[�_⯡�*�*���!�)�Bt<c��U��W�|���n�wġVM/�Tu<1����U�����,�S1�@�k�!��C��.��?��ȗN��阚o}�i�F(��˼O�2��X��?S>���p)ǫ�!��T��Z
�q��Ve[�s]f!��5k��E�Se|17��\���9t���19�_�w��̞j�`�]���'�o��Mf
�s&^c+5��M9�r����%T�W��Vg���u����W];�z3��Z�o����Z0({j�~y3�MH��{��+X������٦ �둇�0�Ш�����E��z���s�f��Ld�UQq�f�j{�_�\���F���/��9O��9ƒ��D/�d�j���.�Q7�?�̜�a�R��i �j����V`�4����Q    �k����\�,�bIZ��Q�ʾ"������6�*����I�>K�ZL�?�U3�ְI�k�3��{-�?*I�ȼ�(��tE-�l��GD���B+<a�)�+�'(�c�����wȧ�ط�<��y�����7bY�Eb_��������������BiI�~X�^���㤓�g�B��g�ٛ���^����L��&�wo���!��:n5���0���vg��fA��F����0�u(�<��+ce|Q�}B�ϒ򅜆b\E|�W,b|���;#���i2��>��!}L:�A�u��"��x`O�3wV20�Ae`�����/m5l��9[q�Eq'Tr�h��=υ�3�¨r��.�s�6�_��l|6Q_f����������E�^����(�mϟV��&=;���s�_ s{>�n�����nY���ށ���?�Ec�b��1�����w��p�^tA�}]�3sFL�<��cI�F����]E�k]��3ȝ���j &;f~����8$�$tz�N�i��ֶ�&�U3V�e=KSG�9�3�B�O|cWTKY�zS-k:�=�5�_�?�����Vߑ���Ȓ;��r���N[>`�p���lř;k�`��t���mY�3� /֩
|w��O)�����ڬ���1��+�5��/Sy��u�5�9��(+��b��z�~�t��TH�J-j6�T����/��#9$�i�)�z$ǈcr����Cta��j���O֩P��P��{�n�?�l��4��7òQmux"�*���+��@٩<u&Ka>� �N�Ki�cG�خ�+$o�V��ہ��J�4MlzsYňrg0>s{-�d\؇V��͵<���"kXu��S$��y����5�u�=��6��RH}U���$N���s}�OrnBp\Hk�A�S]�'���C"�����c�;V��&�m��@�|7Ŝ�����o0ɋ�w����m5~Mn����wg��oD�5l���Q}�k�XF6�c3�d3mȹ�1�X��|I"��p�s���?�N��2�0��rXi�ɶ	��y+�?w9s-��%8M�2��_�c۠s[n�%�X@'�o����1~���y��r̓Xԏ�kF}��S��Y�Q{������$�Ρ��e�#��"��;||W>�6sf�ii��D�m��R�m��j췌����[�@��}��M4��3]��P�M>)�����#��!�:�>�ヲ��Y����KB_x��!}*�<|���w������6�P���Z�����Q�><3B������¼NI���-\7t�x����ro�ȓ�e������s�̯�8�z���fO�}�c�~M���V�քf��wz7�x:s��}�f����F($���c%A�G{t�A"���4����ƬF�ؗR�s��R{�$�ih��.��}h^S����c�򶂪���E�>Vz]E��w�8�l���E��N����r�(�ӓ��3|¨�ܟ�m��[�Y<���au��~�Q�h�.pL�j�y�|xRTޠ�_a��=`�}�|�I->�p�Fj�QFu�J��JBŀ�u����L���F�IP��(V��/ŊW$�o��j.�ۊ͔��d�^>_$�
ʲ��h�T5����V��BB_���{������_����ź�v8%~�a��Ѡ����%bߠO�'� ^V�>,�p^Klu(s|Hu��.`B�?��	�Q�U������{����9?��\�a��Ě�|��"�e����dr�j���@��j���l��L�=ݿeU��΃R��6Fૹ�4���g��}P��o�ߋd��8}��7�O�LZ��>}-P�+�EK5��
�����v>����`�4���JD�F�i@�����F���q��V�KǾ�DT���T��8���+��VY��Z�e��:Υ�����fw�ר.��hRf{Y_h��ũ���K���^��@_��e����������DC����tH_`��f�J	���GV6[O΍k��lG�l��.���`ҭ���'�ݠ�|Y�r'�����C_�ws1�؆(�fpF]�j�|�VQn����jq8�����=� �PRY���}.�~���Ê�}�U��������|������
d�f��r#�4*���w�Q���7��Q�f�E� �Y�@�����#_�S�1I&n._��o+��!_zllD}���_��c_�T ȗ�i:3� z�I��e��$8m�2����/OZ����>
^d5]��e�Y	_l��B��f��ښ�)�����T\�k�����������o�ŒL�N�2���ڔe5��/ެm�qҧ�>|���T�N+���{�v�1��4o�|U���}LDk���k���'�T*J�{ff��-��\��5��V�X�( e�)��(C'3ޤE�bm5KYYs%����U�V� Zq��*�n$H[�\U� �r
[8�ޅ�r�jq� Ɩ��i��;�勥����N	}��f@�/6ž(��A.QB�=�m|�	����58ݍ�����$;�܇��}��eX����1��`����Nڊ�+H;�mV���������<SAS?��;2��Z�%e��/Ο�D��Ҏ�7DO;��<l.���B�]U�,���7��p6�F������$}�~yr�5�NY��A�hi�zq"�E���8�f
����ߦ�*��A���,$�����js()��z��d�ڦ]�Q5}+O,S���̮��?�<���X�wQbw�r1�^�����r�ƙ;GRL[y �7���2�ƥ��^'l	b)�|R�w�v��Uuި�M���&����2�{M����Co����/|����)�������s��0�E��]Iǿ.���)gίVx�>|���\Rx�{���_� �}/I�ר��M��R������0��&�2FƊQ���l(=�G�8ɴ�d%�L�m-��4���ܗ�h�Z�����o���zС���Isgk�g�`��d�S�焤�܍�������S�(⣁�Ԇ��Z��m��S>l�װv�i�7�c���������U���r��z(���µ
��
�r�Pfډ�8t���7�tߑ����D��.��B��4Ll�?��u�O�q�=>�'�Ŧ��)��9���Rh���]�,�u�B��v[��^��lJPI�-��^R��#ݩ|!���=$�Z{��NZ�6�2s��d�8B�K���ECL`�{Sذ��%��;C�5���b�Đ�DF���9ա��WHɗs�H|��	��)�T�VYH�f���	+��&a����O�)���9؂;�J<�� զ0k�7�pZ�o��؄�]�Ε�Ҿ,%�2ZSUqx�z���e�'m�T�s$PyHk�fm�Eҩ����Á�bJXY_��T��G���Qr'LP�jy�[
����(1�<��l�P��������Mg�N���V��I�L@d�Ch��j�Vv�Ms��V_���S:[1�8�Fq%�D,�[_�����]�|}C2pÖ������*g{�X�}#��}�ʼ�e����I��2}0`le��r�ϕ��/hhڈ=���p�n0B�Q��^^:q�e���*������A��1����ja6�����zH��<���ז��)
���zܑ/�������y����r�����υP����o����Awo��=�[�/65����F�[�?I������!�����ǰ��o�wʊ�����'E�䘈�<V[=Ӏ�v��?��}V�O��Ni���4[�d�#)hZ���!���tM�r��	���U.������2>S+�Bٔo��YŴAY��5�U���VJ���������¬mS��S�3'�T>(��I�n����`�{ߨaW�"o�z.�$#m0���Y\�6� DTrZ1�Ė�޾\�����*��-�4dSN�<�ue����y�_�����l��RuN`Ɨ�D���5�������:֫#�p������/���5��]�㭶��1�J/�k���f3�f�u�� �،i�T]�7��S�n^.��`Z��sf}���P&�R ���U�O�)_�O��q��    +i��#B!��'�#遦S�2LR4�\4�i"?��(a�8�����W�J*`��zF�1����]r5^�(� ���S��18aA�����ė��Ki�K���	ܯ.
�Vc��oi�_�Dk���A����U�������j��K����Vu���(ɵ�OM<������F����j�m%�r����i��69L4�b��z�E�Uer���}B9�����AK��־'c_#�U R��Ug潴���k���.�3�����
��ϼ�x�q ��^c$�x�i��9.Q[Q�zo�_Ę5�s��,��� ����dpd�Rdc�VK����M��%�L��ﰑ5Ǵ,h�^�U�	ս��B?�N12��dv��LMr��m��i�)�6[
��D��}gPZ4iε���[�\�s�IS� c&7���	+�?�u�ˠ)�Z3V`��ϼt���X��nyu�[�Ƭ�0]e�p��K��^�k�8豛[y����E�Ǻ��Q�/H�U��M�;�Te�o�^�1"�g��u;%�V�{�n�����^O(�|��^����ˏ�����P�X�����6��[V_�	�x�{q�������D<���P9�Ɏ��/�.�v�ĉmg��ID���'�X���0J�&Nb�I�S���C�#�/��-ߨ��ݝA��u/��~#PB��������]����c�N���/vkV�����B�)��Cο���;�ʮ�e����Dr�%qh+�6\5�uGͰ�QMH��������K	_�@ԵR�~jQ����/�d9����:\�|���:���dv�^Gb~beՊ��_���$3�]æ��>�]te�4{���(KV��$�Z*�� 5����f9�$`�]A,D^�@V�Bl{��Qle�쥀v��H�k7<�6m����%᫹
�m���P"���K�
/	|���B�};M6"m�f I�|%-�O�f�����^^V ���[6^���|:C����S>oɵ���kjvC�@�JoQ�����Qx�630�f���U�<Ѡ�|�H�垁��%\{H���J�+
D�5|���$ӧ$�w������E�R\�6��
Ճm6�,�y�Q�(�濅I�M��4׭4�6F�v��Fػ����\��a`5�����^PzXa/υ���C+��*�}.l�{M�'ހ׍g���&��'�.)bsl��3�X�|Yٗ������Lӈ��"J5�{��U�-��C)1AJcJS�z�pcV�v�Ox�">�+�G5�t�49�mΨjؕ��*f�vt��asc䝩iY�ת���ƻ����[����_��UI�gG�>p�c�q�eZ�2�[��L�PA~oQ��c0貨D�:o&���֝�f�{Z�-��P��(�	C�S��٬��}m�݅yE�B� \�J�h���N�U,���Z��]��b|ޯ�<�:�Aksߧ�-����4�U��'��&N�V�iu�D׸	O��P��*�w
p{�L�EI%^	侪7@�p6��h��d|�Q�9�!Mΰ�//J�L. g�4�հ&����$�����O[�}�eq.�i�7;���aېY��f �A��|�����G%���pW�\�!_O/m	�tT�~�q�Q��-�z��������C���!s`�Ox�j�َ~���R	�����xl�z����C�^���9�kG%񄗃y�ZTe��~�Z���̪b,���B��d�**�#҇�ƬE�d���YX'����S-�"L�p�n��=%b#��4$�]L�^�]��5:o��ur�['��,���;{a��^�/V>�������t��F�;�E�F��S�)brG�7DPr�k��V��ֱ�=�]����C�P�WL���X��qt���O�����|� a/�:�����<�	1E�ԍ'�Miy�TJP��7�o	ҳ�OT]�Es��¨��^�c��T�:p/@�es����Fծ[-B�l�_#�П�:�j7u�N|k�JZgЬ��mL_�^s&�6�G3�n�����t�u�*��]uO�͐��$��M"ǣ��7��.C/��7׿�<_*�lWx�R2͘PK�k���ؗ�%F}���<�|)�g(C!�,>�8�L]K���}�/Ӏl+J���%�U-3ѡ�%��`�F������%�HԷ���=��M���ۡ����E��3��jɃ9J踲ߪ�I�V������s�c�M�9��2zqI��$� 'vZ%�xG*���j��$��b�5�+�랍��D�˸���a�u#j��@댌l&�$J@�Z�I�g�o��:��A[�6�Yc��<?���f����i���M�1D�`�fx�,�}�k�l�G�6�,���B�2-!n))h��'��y�
K'(m�ỷE���:�>�P�6��ʂ����~�F���	�<|`bu������؇��1�����TZ�-�6kڒ�[n��em�Zh/����t�K!>�?9ɞ��O��V(��*CA������T�2�KMt��YMغ�T�}d\ݿ-�6�??|.r����UJp�Zd#ڛM�2�rW��k-4B��&i�:3�Z-�Z̐]�b�V�e)YYr�ߌ��*�}v��g�x2���1Ŏty��z4]cv�~g��u�I>lA�>�K��+�͚O�[�p��-&R(G������i+�90�1��6)�hY��-�M�?��[@�퓒�x�kh�x�mȴ�����	�+��h��r�Ugra�������%��Y{�*JH^�����N�3T�����,��9H���缭 5\9��A��mřA ��D/
�F��R2��Ÿ����>_2&�q0i�w���^���2�u3֢�Sc+B9���M*���&k���:��#����L�\
�d��F�;9������ �k��f��	��NPŊg�	�O��m�U��C(�˥�޾:���/�Ͽ�M� ~H�����\��P�HE��+?��=g����퉦��+k~w�u����H)�ʂ¨X�����̇�s*�0��v�D!��wUFhs�8D�^���G�6s�����.D��GDۻ-���I�c�x�zUo��Z��r�`G˽�����������#��uw�(ZTV��@7��QU��O�<z/�VnW��!A��>�o+P��))k-xIm��wi��ӗD2rC��r��98�	��[ypTF�|2�e��v��q��%aE>T�<���"~ݓ����`��@�wm����y���������{]��q^�@Q����fQыT�#�Y��)�)�O^��8���"p����;�h��TE��[�}�L���F���J�/
��y`��~/�u~Z�0�meO�wN ���d\~��ܥ��/;؆��ZK�6��r����h�m|4W�W��X�i��xC�-=Z����B��/�J,ԴX]F�����{y"�r ��Dr��)�.�B:[T)�k�̵���Jm!.	_�_��,EYO�2G��uP�}e
����>�֞x���t{��	@a0����M�}�	�Ĺ���X�q,Y
��~�h�K���g)_����fJ���`i�-}]�t���f"����e�9��F!�9�dYr�	�8t�0u��8���lm6pAsf���b�,�ߒ��uҮ�*֛�mP mÖ'T|3�!M��v�4Nz~PyʓC"�W��.�p���2�6�|vx=jZmG�̴�S3M�aD���N����V�ǄZ�
i;�����e*��ǔ	#���_������/2���/?r��Q
��,��O�-� *y��Eˑ�&R�X[�N)$��C�A,:]豺�LE��U)��K���/T*�<m����c�
��}U�G� ŉox��|��fࢇ'��׆�cj{�w��V���#��������	��{@䨎jȺ��.����vy9��=�Z}%���m�^]��x��A�N"_G� C���~�]v!�sڤ��V'��[I�wd�^���������꒵&�Pk�/n*8���h՛C���#ᚷ��X���7��c�tr�>���sh�*�	��p���[�Y;|/��K�&�����J    �w=�-��{��vCg�!1��;��IC�-�^�$3�t�ʈXK�1d�CRFU�Zm����(���U�5L��*��n�F�q~�Rl�@+�N��3����}P{d�?d3��[)]%{-��n�52�1Eo�p1��p�������x���<���S15�D���V�TD�i��|54���Dn7H(j�x��~bL�E�v!`7��X��8{�9,B�w�[��w;�u���y��V������fQ�_E����M�a5�ƅp���N�� ���~=;��4a�c�e�O+�TX����{��>�6.�f2����s�3�1/t�O?5����j ��j��w�;��ל��/S���ȩ����b_x��,��Ģ�פRN�\��a�8��$�x����V��]���*h�,�U��{}�W�k�2����nucP���ed��}��?�?�P@�бڜ �6���Lp��}4�$�E_���7�b���D8H=������1V��\�3I2ӝ��/Kʺ\$�E�V�T���Y��W������UQ��"�Fl��aW���&�>,AC���V�-�n�dL�H�4����_k�$��1�e��ɬ�?8�IejM$-�J��	ڪ�щ'�h�(w�� ]�RrF��^��̓I���s��ք9�ߵ^/%c&��X'�����_��ز���T�&�A�݆���4j.�'S�y~�����$�5�작�5p���̱�JYټ�^���zmmdR'��ÊNz�o+��4	:&
�%�D��:m��W_��|��`_�c�b�N|�>����	+Y6�%ٚ����q�(K��5�(�9��] ��a�=e~��E;P���wFh��FHP$���8uŵ��3�6�S�6E+B�aSJ�H��KhC��S��a	����W��H�R��h:�FO����Zu�q��^/_�^��b���g�����*N[���8�rڈBy�����K�&'����B�j���T��$���J\�h�7���)�-	����F�=cO������.ԛ)�kٮ��1MP��3�P�;����HA�h�X���}ň�Y0�>�z6B��9+����Α��(rtj����u�~a���F:i�@�X����\k)�@���u6.&��8�w����~�v(cw��/��ʱLu��;+�eC;
AB�L�	_�U+�m$(;����̴j,ⓓw'�wЃkŬ)9_�ݏ�/Pv�E�c�oNM�h�է<ߛ��v�P�g��{�B���� ��Lp����)z˨K�m���@NŜ ���J��!0^0�����e���DQ���7��m�kugd�ם��+B��M>�#��������&�[ KK$�Mo���/����V3��j��)b��EdC�bٵ���f���������N�2=����'�%�/^��2/5��QZ�i_��.�.�L�ew[�Ԟ�N�7iO/-�L�� ����v�b��pL���e�
k�?�@��������`�l�S$�t����I��L%�2���F�k:K���x��������:��L�m����.��e}DS%�Z�*a|*�7S���N07�>V-����"��Z'�� k��9)��^6Z�u֧���adUy�zZ�7���Ke�5O���$|}/�HLY�����xX�>=�SN���vO�
��W����Ƶ�LT�Q�%��.9C�z��;;o����@=��L��1��7��]���J���A�Rk�7�n���N 96�/���TІ�x�Ԫ������n{lOż���vko4���5]�7�f�����%�^
l5\��Pqc�S��d���	�Wm�E���ҩ��
�r���$�����q����R�ﾁU��ΊXr������_�����q��E��q�v�^(���a�JЧD�
�{�(�����������:�և�u�S`�X��S�#�ZҞ�d�/Uɟ����ĄE�o�V1RWJZ�ҏf���b+��
q�o�J��(3i9|�ZK�
h�8����@	�B�K"�e)�<���V��$}�
b���}2m�Y-XB�h����E�f3)�V��m����5��^�o}�������S^^k�z[Ɨs(�#�K��fr��	ޮ�B;u��Y���%`lV�[�ޫ��y/PO%�Eۚ�s����B�X�U��S���|��r��I뺾HhFw)�ijI�#�B�$�T�����
��w,F�e����H��������Pe�_V��/7�����X�o�����d5�&9���KU^Rhe��բ��LWM��/y9`�=K2��;���.��F�۰�tz�7��ߧe�mz��jfgRZQ��],ʭ<><d��'��]u���̓�}���%%��=|-
%],�^�Q[-�:ZS.��U㷔ӅD��Z�,���&��\�د,� (ڪ��:p�L`˒����a�2�(,*�&V �)�C-��̸�����pʪ�MM��F7��t�������/_�2�h^wf|�G�%�0�#a_����MXYo����6G�t
��6��Tf2�^�H��6�V����5Z�U+h�L�_)�:��a��@�P�\E�~�=)�er��,��qe/5�3:��iв�Dr�:�쎌++����y�*�h��0��Shgxv̪r	 ���y�/���XZ����8���x8�Q�v���S��֩��~�/��u�|��Ɋ����WէΥ
`����ܦl?|�n�Қ�{,@��uq]�P	�KV}�4�{@�i�	��0���1�bi�t��2��������0��$)W��j�(V�ƥ�D���}[�$���w��\������:�@@Y�t����N��r�A�e�,��4�����Al�m�M6E�^��������'�,c�u��UJwG-��S��O�͋rh�p�����(�1]fŞ��q}��cP���W�_\�4oV��%��z����\l����;�f���蘽���3�M,Fߪb���Z�:�?/稹M>����-�䤩�B3�V�$%��C�e.{��̸=�!ߒ����"���<Fd��p��b��E�� $�����J֨\���ᣓ�}�"�r��ݹ�^�2��*��\�/����m.���\�	_P��QJe�L+��;i���= �Qj�G��O9o�t�@�G��)���b���W��<�5�(J��;j�޽�{�d7E��G�_�+�5�|�W�۝��E@G�y	}��6Wvk�Ѯt��T��z��	��&7���D��~fH'J�e���<{�yi95ֲ#sM\Z��Q{������U$�_k 5���|���2�18P��ğ���Kp��B�~3�m�!��s�����Y������Sk�ՠ�^{,�T.^���<��Ƙ����
�Jɻ � �M)#�7g����sf���F��xt6^�&Jr��6�ɣ�o���(�L��Ep�J`�sVo��:�YVS�v��#�N���]a�~��Q�)�����"P4ڐ����9	]�}�.��L�bm�K@��jpNoux^^����QT��� ѓ}���"��H�͏�(���o�2H򟰐��I��a��s� �euT�cf���꽀��֎�r�������9VQDX"�w���G���>0��s5v��}X��w"w�r�G˟K1�8j���k�V˂�����0o@�?��|�~�-oDZ�G�j}��_R�/���[`�"Ҳ�����CrG�#��M�ЗP�7ʠ�9M�����?r�>���u^��;�* �UZ��{�DC��Ȥ>��·b��?v�mkԵe~��FҀ"����������(���ծtEfА�:��b��L�sO6y��OHٴQ�%��G�������㗤^���?�j�T��_n��o�z�)K�\��Nd� 	3ΕM�k�e�NBXM#�{�pX�s���u;���lhKF�In��dv'��l�rB7��G��;��f]�%,t��.��� +�3�˻������l2�4�2����
��Gj�%3UC6�}#����;��w���M�OqPW�&�Ȕ�r��r6ULs    X��Ƞ�r�X0z�Ef��?���W�̅j-�/Q�]'��0��� 1��l'&!��Qg�rnW�P̨�� d�$�y�ܤ]#hU�&�ո��y�����=c
Y�X�{��{�^�W����^�\�@kS�L�"(/s�Z;.N�r��:�&��ZJԔ��FP@<�֌`wu�ΐ�+�*��_T��Q���"���5Hy�u���Q~u>�G��cL�>*4ͣ��^n���[�G��h�%�)��N����MҔ���X�4=4+/�˙v�p��(�������}�.OQ�Y�M1����(	�־�{��HO��Mk�h\�� b�k�Psy�kJiy6i�V�j/��R �kq�4�i�2��>,Cojl���|m��9�˼!�e��^+>y��&�TK�����N	Ԯ�S�0c��B�N��~����q�f!ꮴ���R����;vQ�;[`�M9iP�������i�8��bc.[��6v���{��>w��BA�wb*M��D�@W~ՠ���U�Y�ϻտ��s\�kw@��b�	��І�q�Fm����n�Ȩ�cV�[�?���k#;�Ern��OqH��[/�Ky���h�2-S���T�\�r��|M�(4����*�<h�O���4q6�W 'Q�K:s�o/���v��敉v�&!j�*Ů}�6w���+�>�Ҟ&S�!�J��X�0��1����(r1f
1/��aew��mC�90N+:��k�e� �-QWd��"���X>w"��J�=�柹{��%�����Lxo���@��s���vD�\g|dMEh����gX���og`d�3�f�t&ws�Z������Ra�1�}�ʾ�#��yo˵K�5�R��8��J������*��6��T=���Y�X�d���3�~��=���DL��7u����3�8:q��n�W�\��<����"K�0���oT�\=����Eo�269ҫ?�Ԯr6悾>�e*Fܼ�G<�{�������X�#�7�`Q��c�+�!�ޣ��xx״�_ww�rB��d���xu��5����Wɧ6�!��sUj��sQM�C`2*���ʖl��*_V��A��x�����V-o ��Γ��Iʣo�Ő�(�,����&;O�1���-�Q,3�|:�=-�A�#�`����u$���gB&!��6�qYe�s�A�bf}w��vF]-�Q�.�
j��r�]߹B��D-ҋ�n�̯�!z�R�f�A���Y��l�cW�nMvaO#�֐WF=��fH��7T�=�s�E�D�S�Ho��dpI��L�ז�c����kK�e_Mx�e��tK����� ���jw\b�����æ�x�����U��'$�QIB)W��_�!����v�8W쐟W8�ػ�Q�A�:;el��{��~e�����t�<W~�̱�^�^�VF�$��j��,��6O��=�ʪ���9#�0�q��,3 #Tú�dG󹶮��?���B�s���(�*K��g�� �H�J�]K'�Qaן�o��g+�e,{�1�7_��?�f˵Yꔓ1έ��7N����x�Stz���25�s��(|�';�l�P�鸔5�e��Z��ˎ��rvb��"�"�S�eW`�ym8H>��ڹ�"�MH���~a��#a4�Erq)�	�w��{��G�:����6.2`�e^V0,����Ih/��m�v����*�-�����2���ri�o �����l�h�/,&@�*��[B�C`T��X�$���-4Jn$]vD���b������ϯ�����ز�8_���$h�ߖd��a��4p�٤���`̦��E4��ҽ�m$�}�\����k佘r���u�xV�[�z���>Ix��x�<_�0�$�C��J�e1A@�`�L���p���
������}��R7��ld�{�-K��MO�(|��ʒM*��j�]~�ͬ¤)��Q{���y�-��9��������b��j�.�����@�<J��"e��z�a��d��iIh�����,��2
9(]Us�Z�_���Q��Q��WX�ب5CsY]��΢T,������l�j:�g'"�I#N��fC}�G���-�k��L�;��O+���7�h��~�w}��n�x����Ԏ�v	],�즐u)�ȭ�kщ�}��>dʚ/��E�03~b%���)U�)���'�~�Sftt@�)��u�^ <n�\UT�����8�/7p���$\�Y2��9�_��|��h�洭���"ߥ���؂��ȨeȨe���<~����WT�9��a�� �s(�d�1�#��2�s-������9�$$U�u�>ZIB�h	 ���?a����k��gj�e��[�N���+����;<D�e�V󪷍ەJ���yiR�ob�4����%о�sؿX�9"���11k�6���/��~�j�뇯i�Z�gb��7��=�W;7/̋@ۅ�~*�Ƴ��Ȉݰ�Q�ԑQ�63=�xnS&s�-6��|���,��� �җ��kv� L��3�ɨ�/R�;��|��G�ݥt��.�;��U���/�.��.A=�rK�o�)��7�U�N�)��"s�&^��5:��(5�SC�]��^깟�l���{m�U.\#P:�Yt�/��z ��~1Y�ܒ�/��QV�n�*�����d�i��T������C$����Sb��k���?o�d��'�
c^h��c�j�#��*c&|�۩���u�mi��r)!�Q�u]�_ϯ�1Q����Fy����DG�R���Ni�b���Bp�O������ĥ_1��%vA���J�a��ͫ�飐*C�,0��L
w����b�<|'��hvxG�ak�Ӊ��ݮ��~��]�L�z�s��a�����R���'7-�;;�,D`.2%��D�n�?W��0S�q���ůl�fϙ�"x[�t5�3 B�;�^��P����*9��I�s�Y�ܿ��ȟk0�ekN֤$��b�RQ�@K!1>��($U�׷|S���l�鑬wG)���Po����MĪ"��QؽÚ�q��U���ihJ<���2ѡՀ
�)�X���mza�|f�}Q��u��e���tGI����1o/����]�ڗ��c`�:c=�%�C.�.Z���g��u����j"��������L��zh.�0:[�Uμ.2�~����[M.]�G�P"�����!�]����Z)��W_�5��Y��d.�n�s�Eg:xw�vhsʑ�:X,6�IHd��Gt����Uoۼ" ~m�7���_4����L���������`_�Y"WV��n�P�p>r�R��5�|�J^���#e�".	i_-�
`�*lO��KْmN����s~��*��2) $�N������,���*�M�~!���$�U�O���~��Ǧ�`J�"��۫�J��І»��ǗZ`.���+�"E�)iy�@��k$ܠ�B�׍g^R�2��ۜ%P�-2[�2��s�[% 0�ޫq�v��L�)�`��/����1�_�0_���`���A��W��k��w5�"5S|jj�y%��fm;P��QY�u�|QpGp�h�p��s0���O��z���+�t�qN�a���}h(��ol��M-A���QF�j�2�|z�Z����Q�Mw���8E�Bm���Ys�2��y�2�4ĥpu��X�������#�&_!,�ڐ���� A]�w�4��ɲ�1P���`���H�T��^���E�A�5mQe���h?:�i��mg.P�6^S:�r�	q���5������E��̃�.m#ǷT4��(n�����toTf+�ͱ�B\��"F1@C	L���.���v�0[b��\��+�4wX_G�����r�=�'���P-e���IA�a��eu��&T�l˟���(�@e"��˅@�}3U��#�m����5%����g^FA`$��fk8�E��[�}Y^D1Nb����;�,�fk%,�=��>J�X����X 	0����z�*ݹ����xD��}.`�����b��\����l^y֗��UE��ۧ����ż:w^��Z�D7����rབ��    ]i�N��,�9��d�0�;M4�/����s��e<�r��Ǝ�k��@&�V� .��ri�78�H�N������������π�4�]��~�Z/����E� !$�����t�Q��Ő�g�
 F��n�į7v�)0O�ޫT��K;~����`��\`(�CI#H�B�ww�- ��ec���m4�j�ޓ�� �6�e*�6�4�*�iTѦe�m��H'����EA�s��	��5�Ԓ̨|�ϫD��rJ��p��;�0ImO��ǘ���8����T+{�����w2'v[�ş�u��(�����@^g��`��~!×:Z�)zgr�����[�3vH/�9��z?�&�ћ��j'�,h���^�u�%���684��	�>�Y�T���yG��m�u��r�,-��pa�9?���]?�+U#ؙ�.I���y�S�}�l�O�G����.���]ʿdAI%Im���K9���wқ�;2�֤�������H�Q�zv����>�����M�v�����ٿ_�I�DH"#�6�$���n��+�T��]�-2J6������ăh���A5?m�\r� ��%h��\L�·!��E�}�J��r�OJx���4U����Ȩ!��R�{A� ��ƀZH]��Bw0ɗ�ml��F]o��D��_C�\ڐ�Ը�L�\d�+Q��n��Q�P[�Η�q1'�N�]?��h�E��.4�$IF��i>�`S���C�' ��#s��2�S�37�_�?�2�%�7���4��$Ꝥ�𴨹�����K����vW��]�t0f>j�ި�ĸ���{BV��"�ܓ���[�a�wj�ܢ�.ɹ����|N��͖��>�����O:y3��fj�,p2�r��x�kx��E��y���E�������0��]S��w�A�B@sLw�n��A�h�.rd�es��{��j`'Y�z�6����VN��c�Pa��\�c�o��s/�K�Z�Ιk�Zo�_�ZJ`.��&;���dR$��4nߗ?�
^[����{�Ď�I��#�e�E��嫓)�`�
y�J�0x
���A>4���S�!^�6��M !�2Pt_��b�-�'b�\���pȽ�6���� x��I-A����g�(��½ѯđ��]NO�7b��j���{i�&y�������mQF{L����j��lB��ag;�1ȢB�+�90���<�T��\c�Qs1,�����(���A��]��B���uyy�_%�����tӬ�m��)K�O��uu6ڧQ�y��� +�@�3�yoX�	kb�E�
�F�$%�ܨ���s����u��5��c���֛K�f�m��7=b`�װ�Bue�4�:�}��9�H�n2,,c��T6�e"�`<I�����~U:�4g}�~eUV�P���(%P�!f]P�;�ᅂdVVҪ���Źz4g	��Q���==�nJ^L� �RD��N�İ�bT�N�kP��^p���k�.�0Aœr��=f�'��$��,rx�K=.��s�ր�C!�V��ItKd.�� Xz~�w-��5��cEދpM�q�(}D�w�M�"���V\&u�6����0¤�}�����=��w��V��#2��������O8B�y�r�k-�G����4��E�r]!4����ems5�NO��}B��<٠�;#+oY ����5K�����p!x��xj,.�۞��P�<%/����r���ȵ����}��}+Y>�4��0�6!2��l�{U;�N���k�c�<!���.ghr� �9�*=cb�x�C�w���lz�rE��Ql��tLs^��_G5^�K�M�ن�\h�0'&k�km�XJ��v��ǳ5�'�tIYl�J;�X�m���o�_�"(�=_�vrGy�Ŗ�J}�aU����;��n@���(�K��v�P��{��#Q��1��^뻼R�dl&R=�+��=��C#B�p<��匚:�mo�H�S<�^o��E�����`sFe��a@�g>:�ߟ�e~�������,^���x������^_3��{]T�oy=���F�P$�/j ����t�0[o�Ԩ�}G5�6�Y���t�ͥ�2�ˈ>�sn|�*[��P՝3E�|���J�ޫ�2�1"�	"O8n�K��x�F�d#]�'<����|{xΧG̭;s�푣�sb��n_��#�FF-���?��˼�hkЋ��u���_��m~Ӊ=o���:�R�R֊<�-ě{c?�[�v�l���qO���Q��y�ʝ�g����"s�*�+��p��y;wF)g�G��5i�k2����s�Wy>��d�gdo��_9�g�Q<����p�~�_�Q&P;��|_)�6_���Lx�#:�_FI8�1�K34O�B*����(6aH�T�E�}��\Z� B�(h��<u9X��#��=j���hl�Q]u�0ۯQt�Y�T�9,�<�i-���DF��_��̥�Z*I��R����}^��ۉV�9��
���w�O(����F0�`�	���m�_Q5��A�A�fԧW��C����$ɾ��'mFXGP��$������˸ ���fc_7O�+DM�)��m�`�15,�w�����0E�z~ѡ���V1�r �,�N\��_�����Sy�k���C��J���`K�^�%���9�-u�E��� mE ����<qTiO���0(��K?�����t��X�" ��ng)%������z�X�r�j���Fӓi�H:<�H[#������D6�2eS$���/8�fF�=��Bw�_&�=a���[u�*Uɯ������M1�	��I�� �jխY��\�{/|�0�NV):k�o �>b�W�`i߮.w.b�@+�V�Xt�Iڻ��lxs���.��.c߅6�PbC`n�'pA%J-Y8�BO T�{��BG�����
�2��9�ٗ�x��p����<Ȇ�|b'�9�?+�=4�2/Y:���ث1����_h�W �^�I��Qܵ{) �O(�B6\�MTڸ!(
F)h��$�#Wy)�p�����\�p���\����gϻ����Rͩ��{��S&Ӽ�WM�'d���6Ղ� ��s��I�]��	 �	�>i��0�f�9
+�^�B Y��#+�3��8X� =꧁^�]!륎�'�޹;�յ4�T���;����+�Psm�ݾ�h&�m��p�ω�=��d:Es���0nj�L�9 �4j"����W�i�9��j��e$�ܙ@`���jt������b`�F���Q�p��ĳ��L�^i��w���q�m:� ��BYg��0��/D���厲�t��c��w���/eA�O�����4�������q�i��v�b���/`ߋr�#A�+2�}����J��&���W�>4��S�"�̍�|A��[{�6Ɣ��AY�w����JW�҅�С��t��o��23���<&zB���C3�5X��*$˻����$).��QK��{�!�qG�yV<.t��Z~J66>"��R�3
�R��Z�K�"c0Z�>�q��;V��ߌ̅\n�blا���~%V���fݣ���yӊ����,�-o��,!D�C D���:��߹��vS�k�crx�l��m�$��ڳZ�i�X;�d��;dFz~�r�Q��}FQ�vQpi�zg�n��QΏ��7W�ӱ���p��%����Y�/餞Y�D�(�+K����i�]qF�qW�DҜQ@����
�����H��G��@�-m�s�1Ee��}x8�b��fJ�.[�,��r`�3�^*�f��u�g.=�ҥ���:�^�w�Wͤ��\[y�I���ׇ��a�7��Qz����޾��ޅǌ�ƾ����E�
�[4��`�ȹ�\�O1��q�Y�?+_���=a���׶��ʰ�h[�A�q1G�n��W�!�":��_�7\�%p�[���;�hN���+��k���m�YC�ME����H%B��:6�|�O��RӲ���W}0b���iDS�s��T8\�ٲ�����RU�@�'^!Qأ��>�L�C��*R���F��G+��q�f�KO���    ������mSf�oO��E����C4�Ѯ��O��Yy`}�ϨaJ�`݇m��Q'��t����HT���}5�$ ~/�Hwe�M4>���t;0rHs?�\��XܲA������ʼuW~0p1��O�6���{u~_8�{K)��Xi�K��jω�5�u؏Dp�r��z�ϞwG-#-��[ �C�%���D�s�z�.��6�QvW��;��ܟ����	� �RΗ<$������v���(��}3"�f����x�+b4nDD�S�]�>zlO��+/.��@��'�A�)4c�K�TWWh��g�lg_��Uj���:H
6۔����uEQm(.e1
@�w���u0�p�)d��l�d��^��dHՀ�GŨ7����&?N�ߣ��Q�A���W�k�Av�'�ˠq	����GQ��p(�Κ#��4��e�m�u�f�<?�4��0�Z��6[{���s��eܾ��m�ͩ}�f�~�'6�sG�"�_&�7z�,8�wR A2ℵ���T�nĈ��8�]�s���*�~N5+?ujhF�t(�Gѝ�Eթ�sݦ��߷�9g��	7(xyB�W[~}�>'I��S)�Gw#�Ck���Bghs�������(�eT������wKmm���S �cֻ��؁��w��G�9E,�5�O,��6�i�gDv��;cQ�h���2W'�Jǩ�Ԑ�&F�	f6g��#�E^ߐ�=��_�2G��c��U�ԧ����L��s)W����5�6.{/ȓ� �TT3�U���7JmA�ku���oD!E�[y�{S���ٴ�{=��~�'[	&���i�b��<�2�$�؞���}BƼ���+YiN��Li�A�x}Uj�b5��;�Ӵ�;��i}$!�!;��Q<8�ې�.|ڤ�Q\�Mj$�cb㭼����·��?�7�͢�T(����F�`Y#XV�պ@��'��fW ��"��I_]�?��䰮O�7�R�Ab@���vG1�_�s.)���ޯ�`�%�����@rA@�ut���P�\�{B+�{g<ac�TO�e����%J��g�\z����~�F�,F��"P#S��}��&�l��G������	���\��ⵌ����K�S��
& ��J
��X/l�/��'��פD팪#E 6)I`tZu=s9t��"V�<��K�S)��ig�|�Ӝ'�m�DOʎ���+p���{5^�F
r/��T.�F��|� ��!���!��R
�b�P�j�gϻ�aV�����)�z�D=�}�7U�S����9]�Q����@ p̂_���to���g1"�Ɉ���_��Lps�����e߫
��38�߅��QザU���r�D����4��d�)-���L�t�d&�E��/O�Ջh�B�){�8E�(~e�32��l��B�.l��6��7�˚p��QL�N�)xC`�x��ξN
�"�O��T.�=��kY���;l".��ΥSt3������s����L s�o�T�{��澒X��s�d%sk4�'���IeQڿ�k�����Q k��i�����o���ݹ�)�� �_y|)\|3�"Qrp�{RS�$���S��2�j.ҕЄŹ*	U���>�Uk%k���5zqQ��3�<�l�1����H��� ^Qڶ(�ᕍt!/I9���+���jf����S�3��Z��j�/�碷J�x��q��e�G)G��+0�bɦK\㊞����q�;|�j�2՞�y�XrC�����������j��\''xU�r����~�x�*����������_k.ި�-���E�{T�s����69qqq�א���Ձ�"�4c�f���^g�$P�D061����vx�{��>4�k��G�;aE�<�	v�d��~�<��)7u١)�P����X>��kG�D�
�o����Y2�	�q�VC�y���9gA�}���{	��Q�Vz`�}Xv�"Et9����>���>���	���~E���[щXfy�m5s�Gn�[�zU�$RY?4Vg@a���q�/e�~)��������Z&A��c��5�� �#q���W�]��B��]A�	-��ܵ]?}��*0<�[���	��S�����M|j� 7�%jr�F��+����uQ���hN��o���sW�ީ��m��P���m#�FVCN����ՠ������jlsO��b2��jt�&(�
y�!���y�Ջ�.�=!�*��B������7V���^�浛��j��-w�� ß*����f�2�ފ|�]���*�Gw�]�EN�y���S�Oo�!ŗ(;�1�7�o��j�����a��{/�4.%�	=���Y��0���|_("VC����&�i����t�A������kI��!���bf�a��&p�Xv�Z�w�4�ݓ�>:1�jH�D��t�]�t�8@W9�X��WĨ�J�<4_h������9���l�E�Y佔s��$����kɠ�[����(�c4�VC{�K��Gy�[�I�Jݪ��Y�ɍJ����R����K`5�Vm�Cvb����ƺ{�%�<G�<\R�8sVa��M5�s�>)��
,��1%���8��`"ؗfx��Z���G=�$
c���"M.z�`R��c	��n�g��
�?�g]P�EBw�2�*��C�{/�`'c�DSA�e������� %��$ZG��sbw���Nc����D��j9g5Vh5�*���*̤���
��̗B�DA�����2:}873-{EW>ыܠ���>���T�
����J�.|�����g"o��f0)"��q;��w麐�5�#>���_��t*�}/���Й��ЮzV�yB˔N8P�հ?���;�7oF�S�/0JE������՝'�D��Ϗ��7�`<�T+Io5���b���Z���� W�
�����jF���'B�J?xտ��7g��_H�t�xﳤ0�Kh��SR��O��?��9z���ZT���7��N��z�z��ʕ;��TQ��G_��gF��o,���\�湓D+Y��u�@��K[|�|�l���pQYcM[����@<�X8(@�{~�2����Ԕ�����E`� OR�ϝc��o�Y"��%�G����}`�*�oߑ�>{p�69��na�V�$p�#��>��_�>��hCJe^#���3e���V~��O�,��� �����|;� ��3MV�1
�QO��Mu�(����&�u-���5��!X7"S�?�Qi(�	�O�7ՖBe�����F���y�S��0T�J���C,���¸�sm����b.��K��d��b��8���먫^J��ʱ7
��r̡yt���"?)(pz�yj�B*�s���*���W ��+�R`^������L��������Uқ��o���YqX�׳��s����nFLF�H�3��T�(�Xj<߿����p��l���;v�"�����\ {�M��.�v�C.c��<�O��e�'��_K�F�m/��B�f���G����?�'�H�;�1$H 3���dWGK\dʐL	���$k�z%�/s��m��h�ǻ˛���uJfy��l�7j	nghm�@��S�
LY��5�װD�i�7�s8I��XY=y�"~�G��	8��Ej�*�u��!pF��O��ܟ�7��X��O��"�ï\J����=Uˊ�F/�@��DW�\�yr�!y/�_����)"v��:�O���/�J	�9�ɞ_/�* ��	�@�n��$Ⱥ$��g5�'�i�Y��%o��x+RUحE��"iӊ�e [�,怸VB���ױĹV�e�x�\�QO<�H�y� W#IL{��*�Ȓ�������!�,�јU�1��l�@�:��y���+ӽ�|��ǛK��,��6?��3W�}3V�y�'o���=�$������Y�F���)!�Ԩ�R�.h%���4T�n�]8Ӎ�ߡ��8I(�OPA�	�"�@]3�{zl�] ��+��r>��>ג1.��a����΍�`��a�[�*m�
����qe����;�����՝�ލ�_?��kEpYĂ    O��=?n�b���V��.��ls.����Iz��(���=��(�0 k��?N2�(�@�`�T#���X�`�?6t>dD�A��(�M$ٷQ� �u�V�\�+ �X��٣��]nF��\(�A��3.�J�����2�4)?��ި�S�%�h#��Z�t�{45�<�+��YE�f�p���ϵUf�AC�h��f���q��4=���o��k�բa����y J�ή@���y��8so��ЯQ"�cġsV[W��g����Q�J=>h���Ț�}���o�_��k{����8�ᮑ��A���{}��c	���H�|n跷>=?e���V�R������_K.}򑿖�w����B���|��#���G|�Z�-۾r�O0����Y���d�(�ׯ)Ѿ� �VB���Y!0��r#��O?��5l�f`#+�)PYd�Kd��\�TeIY�JO�'��ؔ+�SD�A�B���?׮�rt�y>��^��1�0�>Z	�(�L�T�W�F�CU�Fi֐	�b���ďwH�u����]�k$�A� ��������7^�_�g��E{?���\D�qF�rFtz��-�I�|��<��KU/������(�+�5|�9��O�B'z��B�<:�DO�{=��^W���%��o-O���E����^����z���չ��zpm�$bv��|Ճ�8��_��|@��|1O�H�5UCp������I�Va�y���Q~��чN�G�uɗ�㏚hq��`Y�f���!c����m�Z�m��CG?���_���c_�KR�{���!���*�:������MTK����(Y��_�Gq�����.�ȇ����(�X���~��!nQ��&+喳�W�v��qcQ�gvɑ'��.�F�	G�(��m��k!6�ֺ�9��z�)A}���Q�P1CC�Z�P�Ŕ�h��%�1�`���C5ї�`nӀ+F�8�F��&�@:��:���v��gHH��Љ�;�G:�ǵ�Ɂ�i!l�b���F�F>vi��ɴmᤱF����h�����y�!��-P0��"�Q2�ڬ�@�Q����0#��dj7�5�ͅ�Pf̅j[!����3QCkب���X��*�f��Ԁ;g�,�&�YU��O��Ń(Ue��D��1��1m�o��T��J��,�!P >�T�ɨ�g���߼����g�nM���JZ޽E�����΃��7�yl�nd�E;��#�������O�n�A�2�F�kqk�qu�}��PZ�ٗ_�5�wG�q��W�)�#[�eYH|����9����?6?�(�Ù-�����@.C־Z�M�W���0ϟ�sUF��}�)�,ƻGYdܔ{oDU8�T��|0wFYe���Q#*����QA�M��ũM��5a֥�� ӢY�J� p�|�鶩;~��.g�ϰ �/2�֏M�.�c6��LL�p��Q6>�?�����������;*��+�x��OM�a�嫴jy�U50J�p2�8yoK�Q"���'��R��J6y�I��k\��ϒ�oг{���w�����l���n<n�^���o��;Yٜq3p�[mv�~^�m�]��"��(s�����'W�}@��4`��`l�B/�F�-2�f�b��������yٗ�j�i�?�6��u��Ӫ��\�gf��f��kp�l��k��Ѡ R�9�ݪ���c��05 NZ�k*u��A�j�&2tf����TFE&�u����A�*�����T�L�*���T�~��7��� �ՕCS��z��E#�K�*���YwY��(�<�FAU,�k�z� �aW�t��;rꓬ����vkq<�k�y���mYt(�G��\�P��Ҡ
8��,	f����#΢±�_�_<�^+���؃�� �Ļ�Ԯ:[�T���P�9'��!>���\l2�\�~�02����s-E��ɕ`�M8�.0w.������;su)�"s��e���\�i��G��Eɚ^e�2�x�5~7��ɭ���%��ͧ�K.c^�������i�1�wq��@.Cz�n�mT�[�%��#sXæ�o��J��i��مW")�s<_BGM���Sמ�&J(�T��V��
�hV��?�Jŉ ^u�o�(3;���.˅"|���T����g Xa���p�.��#7�L5L����K�w���B�1�뎼��l�fX�]S��_T(ˢ,�K��x�Ot�-�s��������a|�y���X�Q���~4�?p���qok_�X�C�/��~��z]�&��^{�{!"bK2��߶jXÚ��C_X��^oITNzš��;��~d�'��F�yU�6]+��gC]֠?���yM��H�;��>�>���:��`ۂ?�'�I�^Rʞ���Z�Vs5��=�WB��$V(_5���>�>4����9�ʑYQ��Z>UK��jL)7׶#�3k��yi�� �K<.�ax���{�Xk��uM�h�vFmU~�b��C�8���k�����p�^��e;��V2���}���7�t��=�~������a�4�?Z q>M���_���o[e�T���m���+�#g
�wN�H: qc5��{��������M@_�Y�1_rS��<(����7��Q�����Q�Gu�"��$?+0� ��2s�K5��Q�驞����9�Z�_M^}���q5��xa�(�yx����b1|����s��MaP([�II����%�>,ח"շ^{�N�!|���j� �Z�m��(��:�~�Z�'g%�!��P����ćN0~�][�t�d�m�����<8��&�s��s�9�7g��ŀe��~��[����j��4и6#�tn��z��%	?[k�@�c�E�5�v�������E��qˠ%_�����D��aC;��H-�P;O�'�GF���[�Ҩ��)��^����͉a�F�݋��Zl:��sF1��WÂE����6޴�oBd`������c遚��-=�:#T�ٗ��x	�f�Fr3ջѶRl���I���i�r��r5�Z+�^��1�̹>vo�.�U��c��**ZRW�3�}�Н�AS���%��U�TU�Yw�g�h�M�0�(�\���-xr�&�IQَ��X�,�;�d�6G��jޮDBЮ�c�㵛[�m�O�R@N�
������=fU�a�# �"�M���K@�B��o�g���*�E �_��@u�V��M�ʚm_�&[Z>��k;	�����7��2W���-��{IZ�<��\dY��<m@�(&U8wF�&�cC�Ź�Ҩj�M���ZK~���(A\�hP��P�r_؀}� nEj0ň�5! �~e�ܹ'��DNg��P�6�c�.&���s!�O�v��l`���?Uʷg׮�\" -5k�Z�K鑾�-�'�r&�8j�H���4!,�{>e?n�7��Q��j�2?~m��v��_7u�A!�FD_�Q��Y�-R��H�^IT'������_I�X�r��Z�>k���?��-$gG�(����wpw$��O
���Ȩ��@PC�ߩ�#I<�޼�����Wm����{����[m#��bb�H��s�p1��í~�k	K����X�i��F�Z�Q����0�����?jܺ�X"��T[$�7�r��a,ϒ��	/��/��Bu��� �)�.^z�� ��zV��S�|�	��V{�L%�>ʂ0G�7�i^�p����)o�C}�#�Q�����#d���b(9�� ���|%I�8q��3�98+zN4�����Ǩ	�:0�ɺ^
�����3:������Y
�}�k�t��,���ڕ��h��L�hW����!_e{������ɇ1�� y뜮31v�*���t��מ0��g�dXפ��`�k�ϭۗ����`�M��^"sիy7D%2�K�J絒VÝK_|��p�%�'��"�@�>�\��"���bJOү|E nQ�<	�F�h}tԣPTgFb�ټS_�u1.B�N5��7���k��b���p5[h�͵	q���Ox�F�    �5�fgL�_0Sf�"��;\�;J�<�gzN�����z�Yx~�U2��8�_G儢
�S'W(�J)Bo����L�<|ަR�S^3�����Ѣ?5H��#+�<��Z��F�`���+�=�!u�zVۑ�M|38���(�x0Z�=w�'d��J��4o�ȝ�\�5��+�Ź֠����3qG�T3��'��b(?�L6�˯+���w�������Ʀu���2���,rn{eK����-UV�T�,Ҳ|Yrm�t��*�|�ި��m�'+������� �j�@�a^�d���āy"�6oO�;�)v9 ��>���9�����*�g�!��Ol����Vg���E5����s�����߯�-e/�c7�Ԯs��wn��B>��7��~oP�s�k*�c3��N�ݦ��/�i*��(~�+���gJq��娿W^ы3��:�
����%}w5�N%& ��r8*}_��`�d���Q.f[�X�>��p���C��y�7w.��9�DR`G�bK�}�2���bC�N�V{�^�KuM
so})�:�ņ��sM(�׹��"��%�V��u�M���s#=�2���˾�mt�>_p� ������;��ޡ�X�ܾ�jL��N(���)�a�9��6��
/(vT���`�>Lz��ͯ��$���\�Z��O�:OH�!��ڵ�O�5U���/$�Y.O�Ť[N����2�⃠.��=62�sUۼ��ݑ�&L�A%[�Ql�/qq�r��Yg�9z�_y�i�?���K�/���8@�����-ί�2Ӟ�-h/�im��~�Q�Df�\��_��h� b
]t��z>��w�q�&c�_T�}GEg��ƜT9C�?��=Nu�装F)��:������+	E�y�St�G�NfѶ�[����6��k�_�xzq�Q�e������j 9*`��������A>q�0��G��S>��ѐ�l�n^o��Æ��+���%�H���3�sQ�tv�< ��˚��Un�bvH������_�E��w��_���_�����`�=K�� (K���>����0(��c�	���}T��=nH�^�k��5��d��W,���w��\���v�~ <?.����k},]x0��1�O���2�A��ʾa�Y�[��q��lћ
_IB���L�-z+Z�N��Y�r��Z�mb`.���Q�I͛Qzs�5 �N"b-��kK3@Tc:�7$ҔK��l8*�����Ԋ���� ��eJ��5@��מ�ť*OJf��H�?��f+�^��h��d�IJ�l#�>箂>�vyѵ����4ļ��Ƭ�+������v��vGYi8�n�V����%��߷�00Je��#���4Ȯ��z�m�(f?ru��y���m�oq<+��t��h�k��;�Z�����"s]��gp^oF⍺�NUs�v��n����C�.2�Z8^����n�s�sB��>�ډ���$
U�i��|�'�>m�[��ms�b�fv�\�,�����JP��~��� �dm�s|��]89�}�k��h(�����5ԗ�)2���|)�iD��ޕ<{	 �]B��J�&� %}o>]G�'��~5��n;1���_G��@5��-��5U��B��.F���͢��'��c�Yt��;j�- �B�����J�;J��M��d\���Ɣ��,6��m���������M�; ��xN�_ ��^��4�H�( B�X��oH!Y��}IT;}G��*U*��Ed�j���񽗝�kK�'��c}@d�7�W�^���W�� �鮏r�	7-��^��`GR���x��N���d'(�^|R��7�7T79+�J`���U�>h������	`~�"�)&d))��UL�]�QO���:�\��ρp�&�;��^���}4�jj��R�+�ÊU�(��2�QKm��b~�Yyg�/Q[k8���C%ovL��l?8���o�� ��\-����V 7%W��~G��j���EO��!j�t����ą��-gɃ~���2s5�
����/�=�)����Z"�����,�^�s��O��{�;�=5P�	I�#봙�i����
/�4���/=)*�������2�(�;��h=�b�'ظ��%F@���؟5S ��G
~��A+
�$i��h4����N��z�BD��S����H�A}?+L��MF@B��(����O��L�N(��<�o#6�$��سV��wG1��s�^�B�"�� 1�Rx$����u%u����.���l $�`0�g�;ڌ�jN2�ΝB�HW�3!�=�\���PE�:P�OãF���B�;�b�T�5���e���H�+EF!;(f�f��I�"��F���������/%�D�.cS�x��d'�X�Q��Z���\{ߨ�e�����A�������2.�h:<���j�8��Vk]<8Ep�%&%L�EM^��� I,2�xT���̱�f%D\��`��R�e_Z�μ����C!��¶��Y���E�tՂ�Γ$�x�䫩��L��	� 9��%s�U�썢a�h*��������)Ew��t	�D��]�{G�o-��(�+���(I�s��6UHH�F�o�)>�PQ�d�#0�)��{����"Z�x�e�\f�� �ߠ۝�l�̤ޒ���u��I�)����u��!��<YOe���;���M0�D��To��E�Ӧ1[[I)����ޅ�(�g�C����A��|v����	�Kظ��p�D�_�� ��B����!����g�Z��	�ZOlc����9��R�&B�9A��\�沍oE�Z#sMv+����%1�$5�ŀE���TKk��W�Z���!���ıv6q����ۼ��s�������
H�lI����S�hb��6nْq�?�`��}T�
b��Dɞ�A.˨�R0�N�QHCΕe�>g���:�I(�z�k����kQ��a�
��N.VG���-�"�S#�#�Z���>}�uhP¿����C�QN�fqJ�m�GMA�%N�1��u��� h�"��^�R0)t���R���iA`�l^s�.$�K���7����ˮ�lͧ#�;*"�!�^��e`�v'��g�l����+�՜ﵯ���V�u�ea��?����v���&��\B$a�׆/��F%۸��N�;z;�>R9�t��rD:��-��7�!H���Fm�)� `���6���þvG��R����!2�s]I��q��Fq�����mu�q�/3�y��{�7d~��׵�f�I��'\%��B} >��b����M�/�������;�����}
q�	�5��Lc�}e��n��w>M�(��y�'���;��U����(R��� 9V����L��eOm
�*NFo��^_W�þ8�>"XQ�FGv�`=�@~�n��0
�^SQ
d7�-��uۛj�d5d�\[h���?!>��z���@�_�]�h�5�5��8��s��x��\
$g��~N�^q2��	�������Q�����6��ۙ�Ec�L?ՙ�^)�jM��婄x>�p��M�e�G����5\Ri�uOh�G�U|B;(�V�����q�L���}�4��4:�h/f�9D��&����js�9��S}�s�F�o�����WN@�1�����?�6>�<~��k+�� ���C��C��V]rב�k+��5�Iw<N���V����������e�'�7T�G�\����ϑQ��ƽo��]5����_�����\F	��OY�3W��(�,�F�1���A���zж�^1���ցy��i���Hb���P9A"�jⵐ�|w}��K!Jlr7�i�ur�ܹH`.��<��no�?�6꫶!�d�}����Rzd.�$�n�{玚���v�s�y©�����v;wԺ��۽��\�P�5D��G�N���CM�^�,9�O��R[���d磕��I"^�J�� X��DR�.{����?��=��(�ҵ�E�����Յ
��8�r@{PDo.^��bȢ�    ����$ĕ\���������H*���5d&k&�����Q*�+C_�G~���&�$��!������`����%��R.�o�u`�����b�_�J�d!Px{ÑxBVE�x�<��DW�J��u��!��U<�̊��&����"�\~��Dr���r�3�#��j�V��
 wOR��+�<�y��%�'�5~b�5y����������,JI�p��z�;����}�P��60j �����V`TS��0pȽ��:�S��|ӡFK��%U�iܙw��(�v�V}Z�Q����O��鿸�{�O���^�� �m]Ǡ��'�cM�:j�X꽭���Q�:<�M�� ��1�����k+�a�=���S��D%Y��B�o.�;��r�/3�7P��*~Ϩ��y�%`�>����hb���X+q4�})7�\bf���IR}�s.�!��?Z`�8�*c�[8��Ǻ��,������Z[�+{o�={��`x�++2�?�q�k�"��<���đ`m��( ����1�p�V6�Z��1�sqC��y=��n+'��o������tM��דX�4�7�R�+ٝ0���-��~u��v]�f�[F�|�
� ��aט��/����2��ݮJ�?�z����I'2�2>�5D�c[ڃ�U"���EE�|4�����)�i>�qo.�Rue֧ѝ�=t緲��������K����{����q��)�ECg����O&�����%�����kIW���{Q�h6=υF��5|tD��pFD��;X�B`q��{��Ө�Y�k�@%���t��L�5�QPWF^׮!��}����8���'�R�����z�X}�A����u���ݹ�X3��Q�S�>_}0��j�3�]��/�3�=0�i�ε�7�;ys���>�4����� (�(r�_�FK��jH@���f���
"��TFd�&!1�+uӦȨ����J�w����T~�>l&[�>����}sّ�n�K9څҽ��p��mqo�k3��9�`rG��q/_�Y+�9@�^{I!A�ʉ,�^� ^E���2rTS �+���6�y�:��{O>^M=p�m����Q�Q���������֖�[y�m�'����`p�Q0�P���|�x�.�-�����������̣�t��̳;���b�1o��̐S
�,T޹�0�FWzc�tn�꛿�[D���߭Ţc�6�	��U���ۗ��J���E真?o�]�2�k�]x�k��̩8��T�aMb�vwݦֲ*��~�f��?����vҎ�;�+��X�+զ!A@��(Zo�����R���}��p����Z{�Q4o4cT���C����P�<�L�2���.�l¨�����i��{�����[��h!�6��7�6���Z�N��~�{�G��2��	wS�Q��|�sޝ�2�s-S8��+y�8���'l����Qc�5��	w��Uԝ��eu�o�p���G���K~�.5ʗ'��b�hF�\Wk%��R�&�>������)Sd�y��e��}�U� �fk�8C�r��{��TwG�x�y���������H��l��I�?��WY�r� \���ڿ��J�y�Ź�	�$��\%ɏR��s^�wo.�f8\lG�}��F��>��k#Q
X��{���CZ �(�?W6�h���w;�/�u�5L�ZU����)�F�������ӓ�-��J߿i�d0�,���Q�\�Bq�,�ƋyB�*ϭ�u�<��}B˳�ŕ�I1����@g�}�#o53'����l��8��T�{���+�R�:{��0�S3��a���>��"S�
�++�^F�,G����C����:�Q����Zϭ��3�O��َBõ�s�kq����(r���p�v���?�1��x������Ds�=��2����4[#�Gٹ1���:W��W�Ӧ��x��%T�6�1��4[�r6��V��
��Q�kY���6��,.��O�(��(*��������9_��<�ѷ�0S��n�����K�a��	+�+0�*tfb���LR}&]Y~��$>��7E��*���e3�"Ӑe��m�O֮��[~XOޓ�;�PGGX��#�Z�W90d�(X��sH�H�d��	���Qvs +yV�##}���g�ƀ���,�ֿ���2�!g�m�++���f��s�u�^��sK�#�����)3f9�0�p�p��H`�Xd�~�ħ�{-&Y��F�m�z���QJr��wⒾ�!wT�5�$4`Y�������O�g5���>xC��lOJ*��2)3�]EH\�2�:
ʡ�HCR�"�Ygp�ܮ1oR<������,�O�e��{�T�ը�l_�#4���-?�ʦ#��(�W����`��g�,t<��m7�߫3YV[g?��T�f]�#֊��$F�:	X �@x ��č��o��J����t=Jͽ���V?�k�Ҭ� ��Ib�K����|_���Gi����8w���nv�2�2�@h{!ȟ�������"q+%$%�a]�N���[�U ��y��ww�� ɀ}���z�-��.��Y�	�
��f_��#0w�R�Vz�X�R�F�*����g�{�T�Z�^Wx F�"�ra��ȇ �s���숌�	f��p{����J��i���B!�����{4���9ޭym�%g�7|�>�JF�zG`�|'�	{��p"�L�R_�×U��G�$|��g.���U������:�W�]L�EL��]��[fI}v��>h�7�ͮF�ı�.�_ݿ/�wT��(s>1��-Z��(6��0�u�Gؗ�<���р�J��M��`˵�\�xT/�1z� Xp���|�ճ3P��o�Vg��s�!5{��V�'�MA�Έ�Dp��!����f���8W��M���Q�r��[˒8��ڙ�p������T*����2�����=e^W��O�V��|��xK�	W�Bnz	����S��Y��=P5f~d�읭(�ӗ`?�\'��Qy/�)���Z�_�}�+UV`7�>߃}�dc��%�q�Y��D҃��.���H�-�Gj"���j��\�)ߺ�4P*y��F�T�
:\��%V��v<���@�PM��|�l�<�jD�\�a�������Ӂ(�P;ݛ��{�^"j���bH��t���\9m����Pl�tD� �f���4�s���W%���y�E<�v�_=��v�KǑU��f��?��v�P�AR
�E���h��1��H+�����ɖ�Ժ"�ZU~������)cu�o�������M��Y����{�a��s��֚V�y��ֿ_���{]�&mv���y�e�5�\\x/ �+�^C��K��^��r��(N&V[��#�E��
&5������Μ�X�W�#yy/������-�^��#���#{�e:ʐB��[Q1���H�����V���wd"M/��4��n��yB�N �um,Y�f`��	L����$��y��=��h��*��,��Z+Iܘ��+�גTM���@��Z������^�/���1v�@������T���RՌ�l�f�.	��婞�ߋ������tXO����Oy�ІZr�)����g��l�:%�q�/GrpKňB��6#[�]y�J���9��)�d�*���	el��5����z1[但jA�@:�z/F��Q�t[+�&y����r�O_��^"�S�<���UYO�L�%_e��=T��@�3p���^B��������(�DN�F��%��ɻ��"���M!~[+3��c����M����qD֐{#�!���{Y����Qgk���{B��.y[V�#�<���D�.A");��Vc�9Ee�;���s��C���~�RDfi�ڡNt)�/O(�x&c�'.w�P��u�5��'T�U�a"�COH��������zĔ��Y{OH���ys�*_�i��G�����hCO��No�	n�q�ާ�}Bf)E4���^��ܐ�{M��p�PZ�걯s��P������YCe)�R��#k�p���s̏y�*/m������OX%R�S�}�U�F��L�}�ޒO�:�ۊ<�2X���|�Co��ߚ# �  �R��g5z�ϝ��%�D���éڛ�{c��L�FNѪ��"��"s��ڣ��"sQ�k�����\�`�H)rn�z�L}�7VU`����棝��=�kx}ƶ��\"-J���;p���2��zOk�;cѿ�C��\D"o|4M�(Eڳ�t�VG��������kH1�X	���#sMŢ��e|a����&�:9�n���c����ݛ1�ah�l�%�^9�����uFm��fj�E����(Ƣ��D5��La�:�1���M;�{D��&��m��˨��m ZNt���poT�g��%S�B�G�<�G�曊�{���kV�j��"����h��j����V5r�J�#(���=�.��W�DC%�������z��߻j�m7~��s�i�D���Tl�@C5�	J��Ĺ�^�\W��ޣ�I��ٶ�"��{*U�JR#uy���)ʛh\ɶ��6�)�Qb*h\���w�r.������q*p���K��+pN�E�[*9EF���D�9����k=�_��<���=�'�FQN�X|xB��J��H�BO�+��٫��,~ܯg��{f��#�㜽���4��˞�(rx��w���S`�bQĿ�5����¹u������;���#�����l�I�w�e�us �C�@�F?�R4)��Q?y������)}�<���v�V�|n�O>���Z7ݗ@�DT.'�=��7LZ�Xe��×QCX����7�5\r>�u���{5Š�#C�~��^g��W֪#��s�j����"_>����es=�S���I���ӕ�z��oV���/�D%ɚ�<S�[f㧙���>�l�lsM�2|���Q�^������U�;,�=y��1k���%���
����e�n
l�E5E��+�g�(���Ϩ)��_��	��Z���/x���r��{k�F�;@\
��[��m��D�L��[�Uu�:�oK ��\E�˞����.�:>�r�	P�[��)���1�}{����%�[������I+�`2"�ɶ[Y�����=�s�ͅ�����K'�ȑ���cY����!������dV�!�1mU���e$aC���x��h
�Ǔ��_e%�`�W-"4j!R�{�-�UJ� �dk%v,>a�]yvq�[fM�K�9�б��e�!GMK_%y��_�a膭�J�*���"_�x�4T.c��[�qu5��m��H�|B4���������X�?m     