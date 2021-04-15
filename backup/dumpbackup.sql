--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE redmine;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md532e12f215ba27cb750c9e093ce4b5127';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "redmine" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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
-- Name: redmine; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE redmine WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE redmine OWNER TO postgres;

\connect redmine

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachments (
    id integer NOT NULL,
    container_id integer,
    container_type character varying(30),
    filename character varying DEFAULT ''::character varying NOT NULL,
    disk_filename character varying DEFAULT ''::character varying NOT NULL,
    filesize bigint DEFAULT 0 NOT NULL,
    content_type character varying DEFAULT ''::character varying,
    digest character varying(64) DEFAULT ''::character varying NOT NULL,
    downloads integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    description character varying,
    disk_directory character varying
);


ALTER TABLE public.attachments OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_sources (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    host character varying(60),
    port integer,
    account character varying,
    account_password character varying DEFAULT ''::character varying,
    base_dn character varying(255),
    attr_login character varying(30),
    attr_firstname character varying(30),
    attr_lastname character varying(30),
    attr_mail character varying(30),
    onthefly_register boolean DEFAULT false NOT NULL,
    tls boolean DEFAULT false NOT NULL,
    filter text,
    timeout integer,
    verify_peer boolean DEFAULT true NOT NULL
);


ALTER TABLE public.auth_sources OWNER TO postgres;

--
-- Name: auth_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_sources_id_seq OWNER TO postgres;

--
-- Name: auth_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_sources_id_seq OWNED BY public.auth_sources.id;


--
-- Name: boards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boards (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying,
    "position" integer,
    topics_count integer DEFAULT 0 NOT NULL,
    messages_count integer DEFAULT 0 NOT NULL,
    last_message_id integer,
    parent_id integer
);


ALTER TABLE public.boards OWNER TO postgres;

--
-- Name: boards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_id_seq OWNER TO postgres;

--
-- Name: boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boards_id_seq OWNED BY public.boards.id;


--
-- Name: changes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.changes (
    id integer NOT NULL,
    changeset_id integer NOT NULL,
    action character varying(1) DEFAULT ''::character varying NOT NULL,
    path text NOT NULL,
    from_path text,
    from_revision character varying,
    revision character varying,
    branch character varying
);


ALTER TABLE public.changes OWNER TO postgres;

--
-- Name: changes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.changes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changes_id_seq OWNER TO postgres;

--
-- Name: changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.changes_id_seq OWNED BY public.changes.id;


--
-- Name: changeset_parents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.changeset_parents (
    changeset_id integer NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE public.changeset_parents OWNER TO postgres;

--
-- Name: changesets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.changesets (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    revision character varying NOT NULL,
    committer character varying,
    committed_on timestamp without time zone NOT NULL,
    comments text,
    commit_date date,
    scmid character varying,
    user_id integer
);


ALTER TABLE public.changesets OWNER TO postgres;

--
-- Name: changesets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.changesets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changesets_id_seq OWNER TO postgres;

--
-- Name: changesets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.changesets_id_seq OWNED BY public.changesets.id;


--
-- Name: changesets_issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.changesets_issues (
    changeset_id integer NOT NULL,
    issue_id integer NOT NULL
);


ALTER TABLE public.changesets_issues OWNER TO postgres;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    commented_type character varying(30) DEFAULT ''::character varying NOT NULL,
    commented_id integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    content text,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: custom_field_enumerations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_field_enumerations (
    id integer NOT NULL,
    custom_field_id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "position" integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.custom_field_enumerations OWNER TO postgres;

--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.custom_field_enumerations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_field_enumerations_id_seq OWNER TO postgres;

--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.custom_field_enumerations_id_seq OWNED BY public.custom_field_enumerations.id;


--
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_fields (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    field_format character varying(30) DEFAULT ''::character varying NOT NULL,
    possible_values text,
    regexp character varying DEFAULT ''::character varying,
    min_length integer,
    max_length integer,
    is_required boolean DEFAULT false NOT NULL,
    is_for_all boolean DEFAULT false NOT NULL,
    is_filter boolean DEFAULT false NOT NULL,
    "position" integer,
    searchable boolean DEFAULT false,
    default_value text,
    editable boolean DEFAULT true,
    visible boolean DEFAULT true NOT NULL,
    multiple boolean DEFAULT false,
    format_store text,
    description text
);


ALTER TABLE public.custom_fields OWNER TO postgres;

--
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.custom_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_fields_id_seq OWNER TO postgres;

--
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.custom_fields_id_seq OWNED BY public.custom_fields.id;


--
-- Name: custom_fields_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_fields_projects (
    custom_field_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_projects OWNER TO postgres;

--
-- Name: custom_fields_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_fields_roles (
    custom_field_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.custom_fields_roles OWNER TO postgres;

--
-- Name: custom_fields_trackers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_fields_trackers (
    custom_field_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_trackers OWNER TO postgres;

--
-- Name: custom_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_values (
    id integer NOT NULL,
    customized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    customized_id integer DEFAULT 0 NOT NULL,
    custom_field_id integer DEFAULT 0 NOT NULL,
    value text
);


ALTER TABLE public.custom_values OWNER TO postgres;

--
-- Name: custom_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.custom_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_values_id_seq OWNER TO postgres;

--
-- Name: custom_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.custom_values_id_seq OWNED BY public.custom_values.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    description text,
    created_on timestamp without time zone
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: email_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address character varying NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    notify boolean DEFAULT true NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.email_addresses OWNER TO postgres;

--
-- Name: email_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_addresses_id_seq OWNER TO postgres;

--
-- Name: email_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_addresses_id_seq OWNED BY public.email_addresses.id;


--
-- Name: enabled_modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enabled_modules (
    id integer NOT NULL,
    project_id integer,
    name character varying NOT NULL
);


ALTER TABLE public.enabled_modules OWNER TO postgres;

--
-- Name: enabled_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enabled_modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enabled_modules_id_seq OWNER TO postgres;

--
-- Name: enabled_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enabled_modules_id_seq OWNED BY public.enabled_modules.id;


--
-- Name: enumerations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enumerations (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    is_default boolean DEFAULT false NOT NULL,
    type character varying,
    active boolean DEFAULT true NOT NULL,
    project_id integer,
    parent_id integer,
    position_name character varying(30)
);


ALTER TABLE public.enumerations OWNER TO postgres;

--
-- Name: enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enumerations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enumerations_id_seq OWNER TO postgres;

--
-- Name: enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enumerations_id_seq OWNED BY public.enumerations.id;


--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups_users (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.groups_users OWNER TO postgres;

--
-- Name: import_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.import_items (
    id integer NOT NULL,
    import_id integer NOT NULL,
    "position" integer NOT NULL,
    obj_id integer,
    message text,
    unique_id character varying
);


ALTER TABLE public.import_items OWNER TO postgres;

--
-- Name: import_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.import_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.import_items_id_seq OWNER TO postgres;

--
-- Name: import_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.import_items_id_seq OWNED BY public.import_items.id;


--
-- Name: imports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imports (
    id integer NOT NULL,
    type character varying,
    user_id integer NOT NULL,
    filename character varying,
    settings text,
    total_items integer,
    finished boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.imports OWNER TO postgres;

--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imports_id_seq OWNER TO postgres;

--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- Name: issue_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_categories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    assigned_to_id integer
);


ALTER TABLE public.issue_categories OWNER TO postgres;

--
-- Name: issue_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_categories_id_seq OWNER TO postgres;

--
-- Name: issue_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_categories_id_seq OWNED BY public.issue_categories.id;


--
-- Name: issue_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_relations (
    id integer NOT NULL,
    issue_from_id integer NOT NULL,
    issue_to_id integer NOT NULL,
    relation_type character varying DEFAULT ''::character varying NOT NULL,
    delay integer
);


ALTER TABLE public.issue_relations OWNER TO postgres;

--
-- Name: issue_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_relations_id_seq OWNER TO postgres;

--
-- Name: issue_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_relations_id_seq OWNED BY public.issue_relations.id;


--
-- Name: issue_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_statuses (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    "position" integer,
    default_done_ratio integer
);


ALTER TABLE public.issue_statuses OWNER TO postgres;

--
-- Name: issue_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_statuses_id_seq OWNER TO postgres;

--
-- Name: issue_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_statuses_id_seq OWNED BY public.issue_statuses.id;


--
-- Name: issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issues (
    id integer NOT NULL,
    tracker_id integer NOT NULL,
    project_id integer NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    description text,
    due_date date,
    category_id integer,
    status_id integer NOT NULL,
    assigned_to_id integer,
    priority_id integer NOT NULL,
    fixed_version_id integer,
    author_id integer NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    start_date date,
    done_ratio integer DEFAULT 0 NOT NULL,
    estimated_hours double precision,
    parent_id integer,
    root_id integer,
    lft integer,
    rgt integer,
    is_private boolean DEFAULT false NOT NULL,
    closed_on timestamp without time zone
);


ALTER TABLE public.issues OWNER TO postgres;

--
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issues_id_seq OWNER TO postgres;

--
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issues_id_seq OWNED BY public.issues.id;


--
-- Name: journal_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journal_details (
    id integer NOT NULL,
    journal_id integer DEFAULT 0 NOT NULL,
    property character varying(30) DEFAULT ''::character varying NOT NULL,
    prop_key character varying(30) DEFAULT ''::character varying NOT NULL,
    old_value text,
    value text
);


ALTER TABLE public.journal_details OWNER TO postgres;

--
-- Name: journal_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journal_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_details_id_seq OWNER TO postgres;

--
-- Name: journal_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journal_details_id_seq OWNED BY public.journal_details.id;


--
-- Name: journals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journals (
    id integer NOT NULL,
    journalized_id integer DEFAULT 0 NOT NULL,
    journalized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    notes text,
    created_on timestamp without time zone NOT NULL,
    private_notes boolean DEFAULT false NOT NULL
);


ALTER TABLE public.journals OWNER TO postgres;

--
-- Name: journals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journals_id_seq OWNER TO postgres;

--
-- Name: journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journals_id_seq OWNED BY public.journals.id;


--
-- Name: member_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member_roles (
    id integer NOT NULL,
    member_id integer NOT NULL,
    role_id integer NOT NULL,
    inherited_from integer
);


ALTER TABLE public.member_roles OWNER TO postgres;

--
-- Name: member_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.member_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_roles_id_seq OWNER TO postgres;

--
-- Name: member_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.member_roles_id_seq OWNED BY public.member_roles.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    mail_notification boolean DEFAULT false NOT NULL
);


ALTER TABLE public.members OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    board_id integer NOT NULL,
    parent_id integer,
    subject character varying DEFAULT ''::character varying NOT NULL,
    content text,
    author_id integer,
    replies_count integer DEFAULT 0 NOT NULL,
    last_reply_id integer,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    locked boolean DEFAULT false,
    sticky integer DEFAULT 0
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    project_id integer,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    summary character varying(255) DEFAULT ''::character varying,
    description text,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    comments_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.news OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: open_id_authentication_associations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.open_id_authentication_associations (
    id integer NOT NULL,
    issued integer,
    lifetime integer,
    handle character varying,
    assoc_type character varying,
    server_url bytea,
    secret bytea
);


ALTER TABLE public.open_id_authentication_associations OWNER TO postgres;

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.open_id_authentication_associations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_associations_id_seq OWNER TO postgres;

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.open_id_authentication_associations_id_seq OWNED BY public.open_id_authentication_associations.id;


--
-- Name: open_id_authentication_nonces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.open_id_authentication_nonces (
    id integer NOT NULL,
    "timestamp" integer NOT NULL,
    server_url character varying,
    salt character varying NOT NULL
);


ALTER TABLE public.open_id_authentication_nonces OWNER TO postgres;

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.open_id_authentication_nonces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_nonces_id_seq OWNER TO postgres;

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.open_id_authentication_nonces_id_seq OWNED BY public.open_id_authentication_nonces.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    homepage character varying DEFAULT ''::character varying,
    is_public boolean DEFAULT true NOT NULL,
    parent_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    identifier character varying,
    status integer DEFAULT 1 NOT NULL,
    lft integer,
    rgt integer,
    inherit_members boolean DEFAULT false NOT NULL,
    default_version_id integer,
    default_assigned_to_id integer
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: projects_trackers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_trackers (
    project_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.projects_trackers OWNER TO postgres;

--
-- Name: queries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.queries (
    id integer NOT NULL,
    project_id integer,
    name character varying DEFAULT ''::character varying NOT NULL,
    filters text,
    user_id integer DEFAULT 0 NOT NULL,
    column_names text,
    sort_criteria text,
    group_by character varying,
    type character varying,
    visibility integer DEFAULT 0,
    options text
);


ALTER TABLE public.queries OWNER TO postgres;

--
-- Name: queries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.queries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queries_id_seq OWNER TO postgres;

--
-- Name: queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.queries_id_seq OWNED BY public.queries.id;


--
-- Name: queries_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.queries_roles (
    query_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.queries_roles OWNER TO postgres;

--
-- Name: repositories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repositories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    url character varying DEFAULT ''::character varying NOT NULL,
    login character varying(60) DEFAULT ''::character varying,
    password character varying DEFAULT ''::character varying,
    root_url character varying(255) DEFAULT ''::character varying,
    type character varying,
    path_encoding character varying(64) DEFAULT NULL::character varying,
    log_encoding character varying(64) DEFAULT NULL::character varying,
    extra_info text,
    identifier character varying,
    is_default boolean DEFAULT false,
    created_on timestamp without time zone
);


ALTER TABLE public.repositories OWNER TO postgres;

--
-- Name: repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repositories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repositories_id_seq OWNER TO postgres;

--
-- Name: repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repositories_id_seq OWNED BY public.repositories.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    assignable boolean DEFAULT true,
    builtin integer DEFAULT 0 NOT NULL,
    permissions text,
    issues_visibility character varying(30) DEFAULT 'default'::character varying NOT NULL,
    users_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    time_entries_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    all_roles_managed boolean DEFAULT true NOT NULL,
    settings text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roles_managed_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_managed_roles (
    role_id integer NOT NULL,
    managed_role_id integer NOT NULL
);


ALTER TABLE public.roles_managed_roles OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value text,
    updated_on timestamp without time zone
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: time_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_entries (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    issue_id integer,
    hours double precision NOT NULL,
    comments character varying(1024),
    activity_id integer NOT NULL,
    spent_on date NOT NULL,
    tyear integer NOT NULL,
    tmonth integer NOT NULL,
    tweek integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    author_id integer
);


ALTER TABLE public.time_entries OWNER TO postgres;

--
-- Name: time_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.time_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_entries_id_seq OWNER TO postgres;

--
-- Name: time_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.time_entries_id_seq OWNED BY public.time_entries.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    action character varying(30) DEFAULT ''::character varying NOT NULL,
    value character varying(40) DEFAULT ''::character varying NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: trackers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trackers (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_in_chlog boolean DEFAULT false NOT NULL,
    "position" integer,
    is_in_roadmap boolean DEFAULT true NOT NULL,
    fields_bits integer DEFAULT 0,
    default_status_id integer,
    description character varying
);


ALTER TABLE public.trackers OWNER TO postgres;

--
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trackers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trackers_id_seq OWNER TO postgres;

--
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trackers_id_seq OWNED BY public.trackers.id;


--
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_preferences (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    others text,
    hide_mail boolean DEFAULT true,
    time_zone character varying
);


ALTER TABLE public.user_preferences OWNER TO postgres;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_preferences_id_seq OWNER TO postgres;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_preferences_id_seq OWNED BY public.user_preferences.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying DEFAULT ''::character varying NOT NULL,
    hashed_password character varying(40) DEFAULT ''::character varying NOT NULL,
    firstname character varying(30) DEFAULT ''::character varying NOT NULL,
    lastname character varying(255) DEFAULT ''::character varying NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    last_login_on timestamp without time zone,
    language character varying(5) DEFAULT ''::character varying,
    auth_source_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    type character varying,
    identity_url character varying,
    mail_notification character varying DEFAULT ''::character varying NOT NULL,
    salt character varying(64),
    must_change_passwd boolean DEFAULT false NOT NULL,
    passwd_changed_on timestamp without time zone,
    twofa_scheme character varying,
    twofa_totp_key character varying,
    twofa_totp_last_used_at integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.versions (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying,
    effective_date date,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    wiki_page_title character varying,
    status character varying DEFAULT 'open'::character varying,
    sharing character varying DEFAULT 'none'::character varying NOT NULL
);


ALTER TABLE public.versions OWNER TO postgres;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_id_seq OWNER TO postgres;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: watchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.watchers (
    id integer NOT NULL,
    watchable_type character varying DEFAULT ''::character varying NOT NULL,
    watchable_id integer DEFAULT 0 NOT NULL,
    user_id integer
);


ALTER TABLE public.watchers OWNER TO postgres;

--
-- Name: watchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.watchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watchers_id_seq OWNER TO postgres;

--
-- Name: watchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.watchers_id_seq OWNED BY public.watchers.id;


--
-- Name: wiki_content_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiki_content_versions (
    id integer NOT NULL,
    wiki_content_id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    data bytea,
    compression character varying(6) DEFAULT ''::character varying,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_content_versions OWNER TO postgres;

--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiki_content_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_content_versions_id_seq OWNER TO postgres;

--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiki_content_versions_id_seq OWNED BY public.wiki_content_versions.id;


--
-- Name: wiki_contents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiki_contents (
    id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    text text,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_contents OWNER TO postgres;

--
-- Name: wiki_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiki_contents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_contents_id_seq OWNER TO postgres;

--
-- Name: wiki_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiki_contents_id_seq OWNED BY public.wiki_contents.id;


--
-- Name: wiki_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiki_pages (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying(255) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    parent_id integer
);


ALTER TABLE public.wiki_pages OWNER TO postgres;

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiki_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_pages_id_seq OWNER TO postgres;

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiki_pages_id_seq OWNED BY public.wiki_pages.id;


--
-- Name: wiki_redirects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiki_redirects (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying,
    redirects_to character varying,
    created_on timestamp without time zone NOT NULL,
    redirects_to_wiki_id integer NOT NULL
);


ALTER TABLE public.wiki_redirects OWNER TO postgres;

--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiki_redirects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_redirects_id_seq OWNER TO postgres;

--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiki_redirects_id_seq OWNED BY public.wiki_redirects.id;


--
-- Name: wikis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wikis (
    id integer NOT NULL,
    project_id integer NOT NULL,
    start_page character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.wikis OWNER TO postgres;

--
-- Name: wikis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wikis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wikis_id_seq OWNER TO postgres;

--
-- Name: wikis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wikis_id_seq OWNED BY public.wikis.id;


--
-- Name: workflows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workflows (
    id integer NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL,
    old_status_id integer DEFAULT 0 NOT NULL,
    new_status_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    assignee boolean DEFAULT false NOT NULL,
    author boolean DEFAULT false NOT NULL,
    type character varying(30),
    field_name character varying(30),
    rule character varying(30)
);


ALTER TABLE public.workflows OWNER TO postgres;

--
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflows_id_seq OWNER TO postgres;

--
-- Name: workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.workflows_id_seq OWNED BY public.workflows.id;


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: auth_sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN id SET DEFAULT nextval('public.auth_sources_id_seq'::regclass);


--
-- Name: boards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards ALTER COLUMN id SET DEFAULT nextval('public.boards_id_seq'::regclass);


--
-- Name: changes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changes ALTER COLUMN id SET DEFAULT nextval('public.changes_id_seq'::regclass);


--
-- Name: changesets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changesets ALTER COLUMN id SET DEFAULT nextval('public.changesets_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: custom_field_enumerations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_field_enumerations ALTER COLUMN id SET DEFAULT nextval('public.custom_field_enumerations_id_seq'::regclass);


--
-- Name: custom_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_fields ALTER COLUMN id SET DEFAULT nextval('public.custom_fields_id_seq'::regclass);


--
-- Name: custom_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_values ALTER COLUMN id SET DEFAULT nextval('public.custom_values_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: email_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_addresses ALTER COLUMN id SET DEFAULT nextval('public.email_addresses_id_seq'::regclass);


--
-- Name: enabled_modules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enabled_modules ALTER COLUMN id SET DEFAULT nextval('public.enabled_modules_id_seq'::regclass);


--
-- Name: enumerations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enumerations ALTER COLUMN id SET DEFAULT nextval('public.enumerations_id_seq'::regclass);


--
-- Name: import_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.import_items ALTER COLUMN id SET DEFAULT nextval('public.import_items_id_seq'::regclass);


--
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- Name: issue_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_categories ALTER COLUMN id SET DEFAULT nextval('public.issue_categories_id_seq'::regclass);


--
-- Name: issue_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_relations ALTER COLUMN id SET DEFAULT nextval('public.issue_relations_id_seq'::regclass);


--
-- Name: issue_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_statuses ALTER COLUMN id SET DEFAULT nextval('public.issue_statuses_id_seq'::regclass);


--
-- Name: issues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues ALTER COLUMN id SET DEFAULT nextval('public.issues_id_seq'::regclass);


--
-- Name: journal_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_details ALTER COLUMN id SET DEFAULT nextval('public.journal_details_id_seq'::regclass);


--
-- Name: journals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journals ALTER COLUMN id SET DEFAULT nextval('public.journals_id_seq'::regclass);


--
-- Name: member_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_roles ALTER COLUMN id SET DEFAULT nextval('public.member_roles_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: open_id_authentication_associations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.open_id_authentication_associations ALTER COLUMN id SET DEFAULT nextval('public.open_id_authentication_associations_id_seq'::regclass);


--
-- Name: open_id_authentication_nonces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.open_id_authentication_nonces ALTER COLUMN id SET DEFAULT nextval('public.open_id_authentication_nonces_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: queries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.queries ALTER COLUMN id SET DEFAULT nextval('public.queries_id_seq'::regclass);


--
-- Name: repositories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repositories ALTER COLUMN id SET DEFAULT nextval('public.repositories_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: time_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_entries ALTER COLUMN id SET DEFAULT nextval('public.time_entries_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: trackers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trackers ALTER COLUMN id SET DEFAULT nextval('public.trackers_id_seq'::regclass);


--
-- Name: user_preferences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preferences ALTER COLUMN id SET DEFAULT nextval('public.user_preferences_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: watchers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watchers ALTER COLUMN id SET DEFAULT nextval('public.watchers_id_seq'::regclass);


--
-- Name: wiki_content_versions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_content_versions ALTER COLUMN id SET DEFAULT nextval('public.wiki_content_versions_id_seq'::regclass);


--
-- Name: wiki_contents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_contents ALTER COLUMN id SET DEFAULT nextval('public.wiki_contents_id_seq'::regclass);


--
-- Name: wiki_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_pages ALTER COLUMN id SET DEFAULT nextval('public.wiki_pages_id_seq'::regclass);


--
-- Name: wiki_redirects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_redirects ALTER COLUMN id SET DEFAULT nextval('public.wiki_redirects_id_seq'::regclass);


--
-- Name: wikis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wikis ALTER COLUMN id SET DEFAULT nextval('public.wikis_id_seq'::regclass);


--
-- Name: workflows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workflows ALTER COLUMN id SET DEFAULT nextval('public.workflows_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2021-04-11 23:32:42.576421	2021-04-11 23:32:42.576421
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) FROM stdin;
\.


--
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_sources (id, type, name, host, port, account, account_password, base_dn, attr_login, attr_firstname, attr_lastname, attr_mail, onthefly_register, tls, filter, timeout, verify_peer) FROM stdin;
\.


--
-- Data for Name: boards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boards (id, project_id, name, description, "position", topics_count, messages_count, last_message_id, parent_id) FROM stdin;
\.


--
-- Data for Name: changes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.changes (id, changeset_id, action, path, from_path, from_revision, revision, branch) FROM stdin;
\.


--
-- Data for Name: changeset_parents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.changeset_parents (changeset_id, parent_id) FROM stdin;
\.


--
-- Data for Name: changesets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.changesets (id, repository_id, revision, committer, committed_on, comments, commit_date, scmid, user_id) FROM stdin;
\.


--
-- Data for Name: changesets_issues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.changesets_issues (changeset_id, issue_id) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, commented_type, commented_id, author_id, content, created_on, updated_on) FROM stdin;
\.


--
-- Data for Name: custom_field_enumerations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_field_enumerations (id, custom_field_id, name, active, "position") FROM stdin;
\.


--
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_fields (id, type, name, field_format, possible_values, regexp, min_length, max_length, is_required, is_for_all, is_filter, "position", searchable, default_value, editable, visible, multiple, format_store, description) FROM stdin;
\.


--
-- Data for Name: custom_fields_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_fields_projects (custom_field_id, project_id) FROM stdin;
\.


--
-- Data for Name: custom_fields_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_fields_roles (custom_field_id, role_id) FROM stdin;
\.


--
-- Data for Name: custom_fields_trackers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_fields_trackers (custom_field_id, tracker_id) FROM stdin;
\.


--
-- Data for Name: custom_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_values (id, customized_type, customized_id, custom_field_id, value) FROM stdin;
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id, project_id, category_id, title, description, created_on) FROM stdin;
\.


--
-- Data for Name: email_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_addresses (id, user_id, address, is_default, notify, created_on, updated_on) FROM stdin;
1	1	admin@example.net	t	t	2021-04-11 23:32:40.668218	2021-04-11 23:32:40.668218
2	5	dancankimani70@gmail.com	t	t	2021-04-12 00:28:48.338895	2021-04-12 00:28:48.338895
3	6	wanjao@example.com	t	t	2021-04-12 23:09:48.805178	2021-04-12 23:09:48.805178
4	7	jose@example.com	t	t	2021-04-12 23:12:53.62312	2021-04-12 23:12:53.62312
5	8	janew@example.com	t	t	2021-04-12 23:15:14.380287	2021-04-12 23:15:14.380287
6	9	kungu@example.com	t	t	2021-04-12 23:15:54.782145	2021-04-12 23:15:54.782145
7	10	alice@example.com	t	t	2021-04-12 23:18:38.062326	2021-04-12 23:18:38.062326
8	11	tharao@gmail.com	t	t	2021-04-12 23:19:21.542288	2021-04-12 23:19:21.542288
\.


--
-- Data for Name: enabled_modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enabled_modules (id, project_id, name) FROM stdin;
1	1	issue_tracking
2	1	time_tracking
3	1	news
4	1	documents
5	1	files
6	1	wiki
7	1	repository
8	1	boards
9	1	calendar
10	1	gantt
11	2	issue_tracking
12	2	time_tracking
13	2	news
14	2	documents
15	2	files
16	2	wiki
17	2	repository
18	2	boards
19	2	calendar
20	2	gantt
21	3	issue_tracking
22	3	time_tracking
23	3	news
24	3	documents
25	3	files
26	3	wiki
27	3	repository
28	3	boards
29	3	calendar
30	3	gantt
31	4	issue_tracking
32	4	time_tracking
33	4	news
34	4	documents
35	4	files
36	4	wiki
37	4	repository
38	4	boards
39	4	calendar
40	4	gantt
\.


--
-- Data for Name: enumerations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) FROM stdin;
1	High	1	f	IssuePriority	t	\N	\N	default
2	Development	1	t	TimeEntryActivity	t	\N	\N	\N
\.


--
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups_users (group_id, user_id) FROM stdin;
12	5
12	6
12	8
12	10
12	7
12	9
12	11
\.


--
-- Data for Name: import_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.import_items (id, import_id, "position", obj_id, message, unique_id) FROM stdin;
\.


--
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imports (id, type, user_id, filename, settings, total_items, finished, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: issue_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_categories (id, project_id, name, assigned_to_id) FROM stdin;
1	1	Bugs	7
2	1	Features	8
3	4	Bugs	5
4	4	Features	5
5	2	Bugs	5
6	2	Features	5
7	3	Bugs	5
8	3	Features	5
\.


--
-- Data for Name: issue_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_relations (id, issue_from_id, issue_to_id, relation_type, delay) FROM stdin;
\.


--
-- Data for Name: issue_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_statuses (id, name, is_closed, "position", default_done_ratio) FROM stdin;
1	on hold	f	1	\N
2	on going	f	2	\N
3	closed	f	3	\N
4	new	f	4	\N
5	recurring	f	5	\N
\.


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) FROM stdin;
1	2	1	Create the login page		2021-04-20	2	4	9	1	\N	5	0	2021-04-12 23:36:42.477235	2021-04-12 23:36:42.477235	2021-04-12	0	\N	\N	1	1	2	f	\N
2	1	1	Fix bugs on the registration page		2021-04-20	1	4	7	1	\N	5	0	2021-04-12 23:40:11.232203	2021-04-12 23:40:11.232203	2021-04-12	0	\N	\N	2	1	2	f	\N
3	1	1	Fix database queries issue		2021-04-19	1	4	11	1	\N	5	0	2021-04-12 23:41:04.399277	2021-04-12 23:41:04.399277	2021-04-12	0	\N	\N	3	1	2	f	\N
4	2	1	Create the dashboard UI		2021-04-21	2	4	10	1	\N	5	0	2021-04-12 23:41:45.113696	2021-04-12 23:41:45.113696	2021-04-12	0	\N	\N	4	1	2	f	\N
5	2	1	Create API endpoints		2021-04-29	2	4	6	1	\N	5	0	2021-04-12 23:42:13.59794	2021-04-12 23:42:13.59794	2021-04-12	0	\N	\N	5	1	2	f	\N
6	2	4	Crate CI/CD Pipeline		2021-04-20	4	4	10	1	\N	5	0	2021-04-12 23:48:17.439393	2021-04-12 23:48:17.439393	2021-04-12	0	\N	\N	6	1	2	f	\N
7	2	4	Setup the server		2021-04-21	4	4	8	1	\N	5	0	2021-04-12 23:48:52.296242	2021-04-12 23:48:52.296242	2021-04-12	0	\N	\N	7	1	2	f	\N
8	2	4	Setup cache strategies		2021-04-16	4	4	7	1	\N	5	0	2021-04-12 23:49:35.536495	2021-04-12 23:49:35.536495	2021-04-12	0	\N	\N	8	1	2	f	\N
9	2	4	Setup the data warehouse		2021-04-28	4	4	6	1	\N	5	0	2021-04-12 23:50:16.711655	2021-04-12 23:50:16.711655	2021-04-12	0	\N	\N	9	1	2	f	\N
10	2	4	Setup docker and kubernetes		2021-04-22	4	4	11	1	\N	5	0	2021-04-12 23:51:10.219191	2021-04-12 23:51:10.219191	2021-04-12	0	\N	\N	10	1	2	f	\N
11	2	4	make server optimizations		2021-04-15	4	4	9	1	\N	5	0	2021-04-12 23:51:50.839291	2021-04-12 23:51:50.839291	2021-04-12	0	\N	\N	11	1	2	f	\N
12	2	2	Design mobile UI/UX		2021-04-22	6	4	10	1	\N	5	0	2021-04-12 23:54:44.211645	2021-04-12 23:54:44.211645	2021-04-12	0	\N	\N	12	1	2	f	\N
13	2	2	Develop the UI/UX using kotlin		2021-04-27	6	4	8	1	\N	5	0	2021-04-12 23:56:02.221413	2021-04-12 23:56:02.221413	2021-04-21	0	\N	\N	13	1	2	f	\N
14	2	2	Integrate the mobile app with the API		2021-04-28	6	4	7	1	\N	5	0	2021-04-12 23:56:50.607916	2021-04-12 23:56:50.607916	2021-04-06	0	\N	\N	14	1	2	f	\N
15	2	2	Integrate Testing and insights		2021-04-23	6	4	7	1	\N	5	0	2021-04-12 23:57:43.842995	2021-04-12 23:57:43.842995	2021-04-21	0	\N	\N	15	1	2	f	\N
16	2	3	Design website UI/UX		2021-04-22	8	4	10	1	\N	5	0	2021-04-12 23:59:49.943226	2021-04-12 23:59:49.943226	2021-04-12	0	\N	\N	16	1	2	f	\N
17	2	3	Develop the UI/UX using vue js		2021-04-30	8	4	8	1	\N	5	0	2021-04-13 00:00:19.576314	2021-04-13 00:00:19.576314	2021-04-12	0	\N	\N	17	1	2	f	\N
18	2	3	Set up the website server and IP		2021-04-30	8	4	7	1	\N	5	0	2021-04-13 00:01:03.140769	2021-04-13 00:01:03.140769	2021-04-13	0	\N	\N	18	1	2	f	\N
\.


--
-- Data for Name: journal_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal_details (id, journal_id, property, prop_key, old_value, value) FROM stdin;
\.


--
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) FROM stdin;
\.


--
-- Data for Name: member_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.member_roles (id, member_id, role_id, inherited_from) FROM stdin;
1	1	3	\N
2	2	4	\N
3	3	4	\N
4	4	4	\N
5	5	4	\N
6	6	4	\N
8	8	4	\N
17	10	4	\N
18	11	4	17
19	12	4	17
20	13	4	17
21	14	4	17
22	15	4	17
23	16	4	17
24	17	4	17
25	18	4	\N
26	19	4	25
27	20	4	25
28	21	4	25
29	22	4	25
30	23	4	25
31	24	4	25
32	25	4	25
33	26	4	\N
34	27	4	33
35	28	4	33
36	29	4	33
37	30	4	33
38	31	4	33
39	32	4	33
40	33	4	33
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (id, user_id, project_id, created_on, mail_notification) FROM stdin;
1	5	1	2021-04-12 00:57:50.441952	f
2	10	1	2021-04-12 23:21:19.414475	f
3	8	1	2021-04-12 23:21:19.470438	f
4	7	1	2021-04-12 23:21:19.474326	f
5	9	1	2021-04-12 23:21:19.479269	f
6	6	1	2021-04-12 23:21:19.484102	f
8	11	1	2021-04-12 23:21:19.493169	f
10	12	4	2021-04-12 23:46:16.546744	f
11	5	4	2021-04-12 23:46:16.553369	f
12	6	4	2021-04-12 23:46:16.55823	f
13	8	4	2021-04-12 23:46:16.562572	f
14	10	4	2021-04-12 23:46:16.566582	f
15	7	4	2021-04-12 23:46:16.570386	f
16	9	4	2021-04-12 23:46:16.575451	f
17	11	4	2021-04-12 23:46:16.579295	f
18	12	2	2021-04-12 23:53:21.601844	f
19	5	2	2021-04-12 23:53:21.607861	f
20	6	2	2021-04-12 23:53:21.612562	f
21	8	2	2021-04-12 23:53:21.617539	f
22	10	2	2021-04-12 23:53:21.622215	f
23	7	2	2021-04-12 23:53:21.626815	f
24	9	2	2021-04-12 23:53:21.631894	f
25	11	2	2021-04-12 23:53:21.636623	f
26	12	3	2021-04-12 23:58:05.765347	f
27	5	3	2021-04-12 23:58:05.771978	f
28	6	3	2021-04-12 23:58:05.776953	f
29	8	3	2021-04-12 23:58:05.782066	f
30	10	3	2021-04-12 23:58:05.78711	f
31	7	3	2021-04-12 23:58:05.791336	f
32	9	3	2021-04-12 23:58:05.795715	f
33	11	3	2021-04-12 23:58:05.801033	f
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, board_id, parent_id, subject, content, author_id, replies_count, last_reply_id, created_on, updated_on, locked, sticky) FROM stdin;
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, project_id, title, summary, description, author_id, created_on, comments_count) FROM stdin;
\.


--
-- Data for Name: open_id_authentication_associations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.open_id_authentication_associations (id, issued, lifetime, handle, assoc_type, server_url, secret) FROM stdin;
\.


--
-- Data for Name: open_id_authentication_nonces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.open_id_authentication_nonces (id, "timestamp", server_url, salt) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members, default_version_id, default_assigned_to_id) FROM stdin;
1	Koopango Sales Dashboard	Should be insightful and able to drive business growth		t	\N	2021-04-12 00:35:27.196096	2021-04-12 00:35:27.196096	koopango-sales-dashboard	1	5	6	f	\N	\N
2	Koopango Mobile app			t	\N	2021-04-12 23:44:26.437992	2021-04-12 23:44:26.437992	koopango-mobile-app	1	3	4	f	\N	\N
3	Koopango Website			t	\N	2021-04-12 23:44:41.797244	2021-04-12 23:44:41.797244	koopango-website	1	7	8	f	\N	\N
4	Koopango Devops infrastracture			t	\N	2021-04-12 23:45:24.980448	2021-04-12 23:45:24.980448	koopango-devops-infrastracture	1	1	2	f	\N	\N
\.


--
-- Data for Name: projects_trackers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_trackers (project_id, tracker_id) FROM stdin;
1	1
1	2
2	1
2	2
3	1
3	2
4	1
4	2
\.


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.queries (id, project_id, name, filters, user_id, column_names, sort_criteria, group_by, type, visibility, options) FROM stdin;
1	1	Create the front end graphs	---\nstatus_id:\n  :operator: o\n  :values:\n  - ''\n	5	\N	---\n- - id\n  - desc\n- - assigned_to\n  - asc\n- - author\n  - desc\n		IssueQuery	2	---\n:totalable_names:\n- :estimated_hours\n- :spent_hours\n:display_type: list\n:draw_relations: \n:draw_progress_line: \n:draw_selected_columns: \n
2	\N	Example	---\nspent_on:\n  :operator: "*"\n  :values:\n  - ''\n	5	\N	---\n- - spent_on\n  - desc\n	created_on	TimeEntryQuery	2	---\n:totalable_names:\n- :hours\n:display_type: list\n
\.


--
-- Data for Name: queries_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.queries_roles (query_id, role_id) FROM stdin;
\.


--
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repositories (id, project_id, url, login, password, root_url, type, path_encoding, log_encoding, extra_info, identifier, is_default, created_on) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, "position", assignable, builtin, permissions, issues_visibility, users_visibility, time_entries_visibility, all_roles_managed, settings) FROM stdin;
1	Non member	0	t	1	---\n- :view_issues\n- :view_news\n- :view_messages\n	default	all	all	t	\N
2	Anonymous	0	t	2	---\n- :view_issues\n- :view_news\n- :view_messages\n	default	all	all	t	\N
3	Admin	1	t	0	---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_message_watchers\n- :add_message_watchers\n- :delete_message_watchers\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_issues\n- :view_news\n	all	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
4	Developer	2	t	0	---\n- :select_project_modules\n- :manage_versions\n- :add_subprojects\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_own_messages\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :view_files\n- :manage_files\n- :view_gantt\n- :view_issues\n- :view_news\n	all	members_of_visible_projects	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
\.


--
-- Data for Name: roles_managed_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_managed_roles (role_id, managed_role_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
20090214190337
20090312172426
20090312194159
20090318181151
20090323224724
20090401221305
20090401231134
20090403001910
20090406161854
20090425161243
20090503121501
20090503121505
20090503121510
20090614091200
20090704172350
20090704172355
20090704172358
20091010093521
20091017212227
20091017212457
20091017212644
20091017212938
20091017213027
20091017213113
20091017213151
20091017213228
20091017213257
20091017213332
20091017213444
20091017213536
20091017213642
20091017213716
20091017213757
20091017213835
20091017213910
20091017214015
20091017214107
20091017214136
20091017214236
20091017214308
20091017214336
20091017214406
20091017214440
20091017214519
20091017214611
20091017214644
20091017214720
20091017214750
20091025163651
20091108092559
20091114105931
20091123212029
20091205124427
20091220183509
20091220183727
20091220184736
20091225164732
20091227112908
20100129193402
20100129193813
20100221100219
20100313132032
20100313171051
20100705164950
20100819172912
20101104182107
20101107130441
20101114115114
20101114115359
20110220160626
20110223180944
20110223180953
20110224000000
20110226120112
20110226120132
20110227125750
20110228000000
20110228000100
20110401192910
20110408103312
20110412065600
20110511000000
20110902000000
20111201201315
20120115143024
20120115143100
20120115143126
20120127174243
20120205111326
20120223110929
20120301153455
20120422150750
20120705074331
20120707064544
20120714122000
20120714122100
20120714122200
20120731164049
20120930112914
20121026002032
20121026003537
20121209123234
20121209123358
20121213084931
20130110122628
20130201184705
20130202090625
20130207175206
20130207181455
20130215073721
20130215111127
20130215111141
20130217094251
20130602092539
20130710182539
20130713104233
20130713111657
20130729070143
20130911193200
20131004113137
20131005100610
20131124175346
20131210180802
20131214094309
20131215104612
20131218183023
20140228130325
20140903143914
20140920094058
20141029181752
20141029181824
20141109112308
20141122124142
20150113194759
20150113211532
20150113213922
20150113213955
20150208105930
20150510083747
20150525103953
20150526183158
20150528084820
20150528092912
20150528093249
20150725112753
20150730122707
20150730122735
20150921204850
20150921210243
20151020182334
20151020182731
20151021184614
20151021185456
20151021190616
20151024082034
20151025072118
20151031095005
20160404080304
20160416072926
20160529063352
20161001122012
20161002133421
20161010081301
20161010081528
20161010081600
20161126094932
20161220091118
20170207050700
20170302015225
20170309214320
20170320051650
20170418090031
20170419144536
20170723112801
20180501132547
20180913072918
20180923082945
20180923091603
20190315094151
20190315102101
20190510070108
20190620135549
20200826153401
20200826153402
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, name, value, updated_on) FROM stdin;
1	rest_api_enabled	1	2021-04-12 22:23:47.207099
2	jsonp_enabled	0	2021-04-12 22:23:47.303512
3	enabled_scm	---\n- Subversion\n- Mercurial\n- Cvs\n- Bazaar\n- Git\n	2021-04-12 22:25:43.766202
4	autofetch_changesets	1	2021-04-12 22:25:43.786979
5	sys_api_enabled	0	2021-04-12 22:25:43.796608
6	repository_log_display_limit	100	2021-04-12 22:25:43.808168
7	commit_logs_formatting	1	2021-04-12 22:25:43.819395
8	commit_ref_keywords	refs,references,IssueID	2021-04-12 22:25:43.829661
9	commit_cross_project_ref	0	2021-04-12 22:25:43.840784
10	commit_logtime_enabled	1	2021-04-12 22:25:43.852693
11	commit_logtime_activity_id	0	2021-04-12 22:25:43.86307
12	commit_update_keywords	--- []\n	2021-04-12 22:25:43.874172
13	default_projects_public	1	2021-04-13 22:16:25.996916
14	default_projects_modules	---\n- issue_tracking\n- time_tracking\n- news\n- documents\n- files\n- wiki\n- repository\n- boards\n- calendar\n- gantt\n	2021-04-13 22:16:26.02431
16	sequential_project_identifiers	0	2021-04-13 22:16:26.077604
17	new_project_user_role_id	3	2021-04-13 22:16:26.099348
18	project_list_display_type	board	2021-04-13 22:16:26.123257
19	project_list_defaults	---\n:column_names:\n- name\n- identifier\n- short_description\n	2021-04-13 22:16:26.146745
15	default_projects_tracker_ids	---\n- '2'\n	2021-04-13 22:16:39.700252
20	cross_project_issue_relations	0	2021-04-13 22:17:44.711434
21	link_copied_issue	ask	2021-04-13 22:17:44.727917
22	cross_project_subtasks	tree	2021-04-13 22:17:44.738791
23	close_duplicate_issues	1	2021-04-13 22:17:44.750251
24	issue_group_assignment	1	2021-04-13 22:17:44.760609
25	default_issue_start_date_to_creation_date	1	2021-04-13 22:17:44.772894
26	display_subprojects_issues	1	2021-04-13 22:17:44.78421
27	issue_done_ratio	issue_field	2021-04-13 22:17:44.799898
28	non_working_week_days	---\n- '6'\n- '7'\n	2021-04-13 22:17:44.825857
29	issues_export_limit	500	2021-04-13 22:17:44.846668
30	gantt_items_limit	500	2021-04-13 22:17:44.869856
31	gantt_months_limit	24	2021-04-13 22:17:44.891622
32	parent_issue_dates	derived	2021-04-13 22:17:44.912243
33	parent_issue_priority	derived	2021-04-13 22:17:44.934229
34	parent_issue_done_ratio	derived	2021-04-13 22:17:44.960332
35	issue_list_default_columns	---\n- tracker\n- status\n- priority\n- subject\n- assigned_to\n- updated_on\n	2021-04-13 22:17:44.9826
36	issue_list_default_totals	--- []\n	2021-04-13 22:17:45.005706
37	timelog_required_fields	--- []\n	2021-04-13 22:18:20.484881
38	timelog_max_hours_per_day	999	2021-04-13 22:18:20.49238
39	timelog_accept_0_hours	1	2021-04-13 22:18:20.510662
40	timelog_accept_future_dates	1	2021-04-13 22:18:20.531437
41	time_entry_list_defaults	---\n:column_names:\n- ''\n- spent_on\n- user\n- issue\n- comments\n- hours\n:totalable_names:\n- hours\n- ''\n	2021-04-13 22:18:20.555915
\.


--
-- Data for Name: time_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on, author_id) FROM stdin;
1	1	5	\N	10	\N	2	2021-04-13	2021	4	15	2021-04-13 22:22:06.239785	2021-04-13 22:22:06.239785	5
2	1	5	\N	5	\N	2	2021-04-13	2021	4	15	2021-04-13 22:27:52.731147	2021-04-13 22:27:52.731147	5
3	1	5	\N	5	\N	2	2021-04-13	2021	4	15	2021-04-13 22:41:40.897439	2021-04-13 22:41:40.897439	5
4	1	5	\N	0.5	\N	2	2021-04-13	2021	4	15	2021-04-13 23:26:40.320624	2021-04-13 23:26:40.320624	5
5	1	5	\N	0.5	\N	2	2021-04-13	2021	4	15	2021-04-13 23:55:38.074499	2021-04-13 23:55:38.074499	5
35	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 03:53:14.326569	2021-04-14 03:53:14.326569	5
36	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 03:57:42.208997	2021-04-14 03:57:42.208997	5
37	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 04:04:00.221436	2021-04-14 04:04:00.221436	5
38	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 04:08:51.563991	2021-04-14 04:08:51.563991	5
39	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 04:10:00.2358	2021-04-14 04:10:00.2358	5
40	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 04:11:21.098441	2021-04-14 04:11:21.098441	5
41	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 04:11:58.61344	2021-04-14 04:11:58.61344	5
42	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 04:12:33.633954	2021-04-14 04:12:33.633954	5
43	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 04:13:25.585689	2021-04-14 04:13:25.585689	5
44	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 04:13:25.606259	2021-04-14 04:13:25.606259	5
45	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 04:13:25.612246	2021-04-14 04:13:25.612246	5
46	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 04:14:01.747173	2021-04-14 04:14:01.747173	5
47	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 04:14:01.750347	2021-04-14 04:14:01.750347	5
48	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 04:14:01.753001	2021-04-14 04:14:01.753001	5
49	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 04:16:06.943152	2021-04-14 04:16:06.943152	5
50	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 04:16:06.942222	2021-04-14 04:16:06.942222	5
51	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 04:16:06.953694	2021-04-14 04:16:06.953694	5
52	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 04:34:10.484776	2021-04-14 04:34:10.484776	5
53	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 04:34:10.489038	2021-04-14 04:34:10.489038	5
54	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 04:34:10.490199	2021-04-14 04:34:10.490199	5
55	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 05:06:54.504399	2021-04-14 05:06:54.504399	5
56	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 05:06:54.518186	2021-04-14 05:06:54.518186	5
57	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 05:06:54.528491	2021-04-14 05:06:54.528491	5
58	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 05:06:57.478771	2021-04-14 05:06:57.478771	5
59	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 05:27:15.11615	2021-04-14 05:27:15.11615	5
60	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 05:27:54.96627	2021-04-14 05:27:54.96627	5
61	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 05:27:54.993179	2021-04-14 05:27:54.993179	5
62	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 05:27:55.003372	2021-04-14 05:27:55.003372	5
63	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 05:31:00.43046	2021-04-14 05:31:00.43046	5
64	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 05:31:00.434541	2021-04-14 05:31:00.434541	5
65	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 05:31:00.438242	2021-04-14 05:31:00.438242	5
66	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 05:42:53.591531	2021-04-14 05:42:53.591531	5
67	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 05:42:53.596687	2021-04-14 05:42:53.596687	5
68	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 05:42:53.597509	2021-04-14 05:42:53.597509	5
69	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:13:52.824024	2021-04-14 12:13:52.824024	5
70	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:15:29.472847	2021-04-14 12:15:29.472847	5
71	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:15:29.506715	2021-04-14 12:15:29.506715	5
72	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:15:29.509149	2021-04-14 12:15:29.509149	5
73	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:16:29.856071	2021-04-14 12:16:29.856071	5
74	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:16:29.863403	2021-04-14 12:16:29.863403	5
75	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:16:29.865545	2021-04-14 12:16:29.865545	5
76	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:17:52.952459	2021-04-14 12:17:52.952459	5
77	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:17:52.954811	2021-04-14 12:17:52.954811	5
78	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:17:52.953709	2021-04-14 12:17:52.953709	5
79	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:18:41.366543	2021-04-14 12:18:41.366543	5
80	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:18:41.365728	2021-04-14 12:18:41.365728	5
81	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:18:41.372198	2021-04-14 12:18:41.372198	5
82	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:20:45.933925	2021-04-14 12:20:45.933925	5
83	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:20:45.936656	2021-04-14 12:20:45.936656	5
84	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:20:45.942061	2021-04-14 12:20:45.942061	5
85	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:20:50.408641	2021-04-14 12:20:50.408641	5
86	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:20:50.410524	2021-04-14 12:20:50.410524	5
87	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:20:50.411331	2021-04-14 12:20:50.411331	5
88	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:35:29.549899	2021-04-14 12:35:29.549899	5
89	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:35:29.551056	2021-04-14 12:35:29.551056	5
90	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:35:29.554159	2021-04-14 12:35:29.554159	5
91	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:37:46.578823	2021-04-14 12:37:46.578823	5
92	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:37:46.579894	2021-04-14 12:37:46.579894	5
93	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:41:21.359632	2021-04-14 12:41:21.359632	5
94	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:41:21.36106	2021-04-14 12:41:21.36106	5
95	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:42:25.555214	2021-04-14 12:42:25.555214	5
96	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:42:25.556408	2021-04-14 12:42:25.556408	5
97	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:46:24.217391	2021-04-14 12:46:24.217391	5
98	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:46:24.21824	2021-04-14 12:46:24.21824	5
99	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:52:17.447519	2021-04-14 12:52:17.447519	5
100	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:52:17.451547	2021-04-14 12:52:17.451547	5
101	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:52:17.46616	2021-04-14 12:52:17.46616	5
102	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:54:42.025023	2021-04-14 12:54:42.025023	5
103	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:54:42.025937	2021-04-14 12:54:42.025937	5
104	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:54:42.027054	2021-04-14 12:54:42.027054	5
106	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:55:10.314331	2021-04-14 12:55:10.314331	5
108	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:55:27.424169	2021-04-14 12:55:27.424169	5
113	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:56:42.408934	2021-04-14 12:56:42.408934	5
116	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:06.843296	2021-04-14 12:57:06.843296	5
117	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:14.341046	2021-04-14 12:57:14.341046	5
122	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:28.202854	2021-04-14 12:57:28.202854	5
123	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:45.409769	2021-04-14 12:57:45.409769	5
128	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:59:22.225118	2021-04-14 12:59:22.225118	5
131	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 13:02:40.372889	2021-04-14 13:02:40.372889	5
133	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:05:21.617337	2021-04-14 13:05:21.617337	5
137	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:06:02.596161	2021-04-14 13:06:02.596161	5
105	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:55:10.312949	2021-04-14 12:55:10.312949	5
110	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:55:27.429004	2021-04-14 12:55:27.429004	5
112	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:56:42.408044	2021-04-14 12:56:42.408044	5
114	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:06.836805	2021-04-14 12:57:06.836805	5
119	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:14.344474	2021-04-14 12:57:14.344474	5
120	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:28.192241	2021-04-14 12:57:28.192241	5
124	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:45.408858	2021-04-14 12:57:45.408858	5
127	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:59:22.221966	2021-04-14 12:59:22.221966	5
129	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:02:40.370112	2021-04-14 13:02:40.370112	5
134	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:05:21.615994	2021-04-14 13:05:21.615994	5
135	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 13:06:02.590052	2021-04-14 13:06:02.590052	5
107	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:55:10.316229	2021-04-14 12:55:10.316229	5
109	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:55:27.427715	2021-04-14 12:55:27.427715	5
111	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:56:42.407044	2021-04-14 12:56:42.407044	5
115	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:06.839145	2021-04-14 12:57:06.839145	5
118	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:14.342114	2021-04-14 12:57:14.342114	5
121	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:28.199623	2021-04-14 12:57:28.199623	5
125	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 12:57:45.413669	2021-04-14 12:57:45.413669	5
126	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 12:59:22.215986	2021-04-14 12:59:22.215986	5
130	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:02:40.371667	2021-04-14 13:02:40.371667	5
132	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 13:05:21.609136	2021-04-14 13:05:21.609136	5
136	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:06:02.592561	2021-04-14 13:06:02.592561	5
138	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:06:58.591315	2021-04-14 13:06:58.591315	5
139	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:06:58.602291	2021-04-14 13:06:58.602291	5
140	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 13:06:58.610714	2021-04-14 13:06:58.610714	5
141	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:07:45.275565	2021-04-14 13:07:45.275565	5
142	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 13:07:45.276667	2021-04-14 13:07:45.276667	5
143	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:07:45.278528	2021-04-14 13:07:45.278528	5
144	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:09:59.091586	2021-04-14 13:09:59.091586	5
145	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:09:59.093772	2021-04-14 13:09:59.093772	5
146	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 13:09:59.092905	2021-04-14 13:09:59.092905	5
147	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:11:53.00653	2021-04-14 13:11:53.00653	5
148	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:11:53.012282	2021-04-14 13:11:53.012282	5
149	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 13:11:53.013668	2021-04-14 13:11:53.013668	5
150	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 13:12:39.595514	2021-04-14 13:12:39.595514	5
151	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:12:39.601412	2021-04-14 13:12:39.601412	5
152	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:12:39.602404	2021-04-14 13:12:39.602404	5
153	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:12:50.251067	2021-04-14 13:12:50.251067	5
154	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:12:50.255405	2021-04-14 13:12:50.255405	5
155	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 13:12:50.254191	2021-04-14 13:12:50.254191	5
156	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 13:15:21.232916	2021-04-14 13:15:21.232916	5
157	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:15:21.238397	2021-04-14 13:15:21.238397	5
158	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:15:21.237408	2021-04-14 13:15:21.237408	5
159	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:37:08.305219	2021-04-14 13:37:08.305219	5
160	1	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 13:37:08.319182	2021-04-14 13:37:08.319182	5
161	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 13:37:08.321719	2021-04-14 13:37:08.321719	5
162	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 21:43:02.844502	2021-04-14 21:43:02.844502	5
163	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 21:43:59.168619	2021-04-14 21:43:59.168619	5
164	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 21:45:33.017794	2021-04-14 21:45:33.017794	5
165	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 21:45:33.043455	2021-04-14 21:45:33.043455	5
166	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 21:45:33.06082	2021-04-14 21:45:33.06082	5
167	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 21:47:23.996218	2021-04-14 21:47:23.996218	5
168	2	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 21:51:58.658018	2021-04-14 21:51:58.658018	5
169	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 21:51:58.679587	2021-04-14 21:51:58.679587	5
170	3	5	\N	6	\N	2	2021-04-14	2021	4	15	2021-04-14 21:51:58.730797	2021-04-14 21:51:58.730797	5
171	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 21:52:10.552856	2021-04-14 21:52:10.552856	5
172	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 21:56:38.233469	2021-04-14 21:56:38.233469	5
173	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 21:57:06.75552	2021-04-14 21:57:06.75552	5
174	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 21:58:01.702248	2021-04-14 21:58:01.702248	5
175	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 21:58:36.251773	2021-04-14 21:58:36.251773	5
176	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 21:58:46.420506	2021-04-14 21:58:46.420506	5
177	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 22:01:27.878232	2021-04-14 22:01:27.878232	5
178	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 22:02:57.058674	2021-04-14 22:02:57.058674	5
179	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 22:02:57.095071	2021-04-14 22:02:57.095071	5
180	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 22:04:33.896498	2021-04-14 22:04:33.896498	5
181	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 22:04:34.024243	2021-04-14 22:04:34.024243	5
182	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 22:04:34.068486	2021-04-14 22:04:34.068486	5
183	1	5	\N	1	\N	2	2021-04-14	2021	4	15	2021-04-14 22:07:02.077125	2021-04-14 22:07:02.077125	5
184	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 22:07:02.125797	2021-04-14 22:07:02.125797	5
185	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 22:07:02.158915	2021-04-14 22:07:02.158915	5
186	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 22:07:02.191338	2021-04-14 22:07:02.191338	5
187	1	5	\N	2	\N	2	2021-04-14	2021	4	15	2021-04-14 22:07:32.861065	2021-04-14 22:07:32.861065	5
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (id, user_id, action, value, created_on, updated_on) FROM stdin;
8	5	api	b07fc24f57cdb7abfc00bb8e61ee4cc1f89a277d	2021-04-12 22:30:18.630661	2021-04-12 22:30:18.630661
11	5	session	b1174f55588b45f8db4ba3024788cc5d24f5f74f	2021-04-13 21:50:00.537145	2021-04-14 13:12:53.651436
4	1	feeds	182f39e2f02ae2a2e527d97bb2038dce321a9f3d	2021-04-12 00:33:47.719947	2021-04-12 00:33:47.719947
6	5	feeds	6a0146ddc46fa6b32f92b38bee3a9a5fd9a143bf	2021-04-12 00:34:10.08386	2021-04-12 00:34:10.08386
5	5	session	43510f7875a391034d6c6cae66071e7c59240ca9	2021-04-12 00:34:09.945228	2021-04-12 13:50:09.922933
10	6	feeds	d971ca185256e996b1af4b3ad0cf1a7880836db0	2021-04-13 21:46:04.482626	2021-04-13 21:46:04.482626
\.


--
-- Data for Name: trackers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trackers (id, name, is_in_chlog, "position", is_in_roadmap, fields_bits, default_status_id, description) FROM stdin;
1	Bug	f	1	t	0	4	
2	Feature	f	2	t	0	4	
\.


--
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_preferences (id, user_id, others, hide_mail, time_zone) FROM stdin;
2	1	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
3	6	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: '1'\n	t	
4	7	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
5	8	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
6	9	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
7	10	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
8	11	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
1	5	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:recently_used_project_ids: '1,3,2'\n:gantt_zoom: 2\n:gantt_months: 6\n:activity_scope:\n- issues\n- changesets\n- news\n- documents\n- files\n	f	
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, hashed_password, firstname, lastname, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd, passwd_changed_on, twofa_scheme, twofa_totp_key, twofa_totp_last_used_at) FROM stdin;
2				Anonymous users	f	1	\N		\N	2021-04-11 23:32:40.420089	2021-04-11 23:32:40.420089	GroupAnonymous	\N		\N	f	\N	\N	\N	\N
3				Non member users	f	1	\N		\N	2021-04-11 23:32:40.462713	2021-04-11 23:32:40.462713	GroupNonMember	\N		\N	f	\N	\N	\N	\N
4				Anonymous	f	0	\N		\N	2021-04-11 23:35:17.659194	2021-04-11 23:35:17.659194	AnonymousUser	\N	only_my_events	\N	f	\N	\N	\N	\N
1	admin	8d835af2431daa0e884e0f952e61d20dcdc20219	Redmine	Admin	t	1	2021-04-12 00:33:47.420137		\N	2021-04-11 23:32:26.95226	2021-04-12 00:31:43.637585	User	\N	all	b854fce641b12226a3677dd48645689d	f	2021-04-12 00:31:43	\N	\N	\N
8	jane	4804ea70d8310cff54809a1eaa4b8d38220cec0d	Jane	Wanjiku	f	1	\N	en-GB	\N	2021-04-12 23:15:14.372504	2021-04-12 23:19:31.046032	User	\N	only_my_events	b406b5cc5adda184239716f3291a3b0d	f	2021-04-12 23:15:14	\N	\N	\N
10	alice	8b6a09b1321854a14ffb38cf3cfa8e814e9316b2	Alice	Wahome	f	1	\N	en-GB	\N	2021-04-12 23:18:38.056132	2021-04-12 23:19:32.397782	User	\N	only_my_events	fb66a6a1a23ae9c7e600d1de0a06685d	f	2021-04-12 23:18:38	\N	\N	\N
7	jose	65bd7ecc64e2b87a7dbe1a105f9548fca8925a6a	Joseph	Karanja	f	1	\N	en-GB	\N	2021-04-12 23:12:53.619311	2021-04-12 23:19:33.557934	User	\N	only_my_events	3741f2dc92b971ee665edd9446089e8c	f	2021-04-12 23:12:53	\N	\N	\N
9	kungu	f0297476821d456b65f9b9419aa2fa5dc86bab8d	Kungu	Karumba	f	1	\N	en-GB	\N	2021-04-12 23:15:54.777658	2021-04-12 23:19:34.458265	User	\N	only_my_events	2204fc5d11d16062c16c9fe80e9eb7b5	f	2021-04-12 23:15:54	\N	\N	\N
11	tharao	4e64d4f257e1e10ac27e7a62572e041d9f8f3589	Tharao	Kihoto	f	1	\N	en-GB	\N	2021-04-12 23:19:21.538315	2021-04-12 23:19:35.495835	User	\N	only_my_events	f338f8ad309dd5b75bd8339c35262eb5	f	2021-04-12 23:19:21	\N	\N	\N
12				Software Team	f	1	\N		\N	2021-04-12 23:20:27.501987	2021-04-12 23:20:27.501987	Group	\N		\N	f	\N	\N	\N	\N
6	wanjao	d7f831d49abcf35075f98c26e4f8518c8ac8c515	Njao	wanjao	f	1	2021-04-13 21:46:04.197248	en-GB	\N	2021-04-12 23:09:48.730353	2021-04-12 23:11:40.623061	User	\N	only_my_events	86cf29589e6816369f33c59a42a1e8c4	f	2021-04-12 23:09:48	\N	\N	\N
5	Dancan	9679c47a061741627b85bb65eaaaacc3dc38e8ac	Dancan	Kimani	t	1	2021-04-13 21:50:00.495158	en-GB	\N	2021-04-12 00:28:48.152367	2021-04-12 00:34:02.259851	User	\N	only_my_events	c9ca2c52c0cbb2ceacc42d7fd15f129e	f	2021-04-12 00:33:16	\N	\N	\N
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.versions (id, project_id, name, description, effective_date, created_on, updated_on, wiki_page_title, status, sharing) FROM stdin;
\.


--
-- Data for Name: watchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.watchers (id, watchable_type, watchable_id, user_id) FROM stdin;
1	Issue	1	10
2	Issue	1	8
3	Issue	1	9
4	Issue	2	5
5	Issue	3	7
6	Issue	4	8
7	Issue	5	5
8	Issue	6	11
9	Issue	7	10
10	Issue	8	10
11	Issue	9	5
12	Issue	10	12
13	Issue	11	11
14	Issue	12	5
15	Issue	13	10
16	Issue	14	8
17	Issue	15	8
18	Issue	16	5
19	Issue	17	7
20	Issue	18	9
\.


--
-- Data for Name: wiki_content_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) FROM stdin;
\.


--
-- Data for Name: wiki_contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wiki_contents (id, page_id, author_id, text, comments, updated_on, version) FROM stdin;
\.


--
-- Data for Name: wiki_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wiki_pages (id, wiki_id, title, created_on, protected, parent_id) FROM stdin;
\.


--
-- Data for Name: wiki_redirects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wiki_redirects (id, wiki_id, title, redirects_to, created_on, redirects_to_wiki_id) FROM stdin;
\.


--
-- Data for Name: wikis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wikis (id, project_id, start_page, status) FROM stdin;
1	1	Wiki	1
2	2	Wiki	1
3	3	Wiki	1
4	4	Wiki	1
\.


--
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) FROM stdin;
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachments_id_seq', 1, false);


--
-- Name: auth_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_sources_id_seq', 1, false);


--
-- Name: boards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boards_id_seq', 1, false);


--
-- Name: changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.changes_id_seq', 1, false);


--
-- Name: changesets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.changesets_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custom_field_enumerations_id_seq', 1, false);


--
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custom_fields_id_seq', 1, false);


--
-- Name: custom_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custom_values_id_seq', 1, false);


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_id_seq', 1, false);


--
-- Name: email_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.email_addresses_id_seq', 8, true);


--
-- Name: enabled_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enabled_modules_id_seq', 40, true);


--
-- Name: enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enumerations_id_seq', 2, true);


--
-- Name: import_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.import_items_id_seq', 1, false);


--
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imports_id_seq', 1, false);


--
-- Name: issue_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_categories_id_seq', 8, true);


--
-- Name: issue_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_relations_id_seq', 1, false);


--
-- Name: issue_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_statuses_id_seq', 5, true);


--
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issues_id_seq', 18, true);


--
-- Name: journal_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_details_id_seq', 1, false);


--
-- Name: journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journals_id_seq', 1, false);


--
-- Name: member_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.member_roles_id_seq', 40, true);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_id_seq', 33, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.open_id_authentication_associations_id_seq', 1, false);


--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.open_id_authentication_nonces_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 4, true);


--
-- Name: queries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.queries_id_seq', 2, true);


--
-- Name: repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repositories_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 41, true);


--
-- Name: time_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_entries_id_seq', 187, true);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tokens_id_seq', 11, true);


--
-- Name: trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trackers_id_seq', 2, true);


--
-- Name: user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_preferences_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.versions_id_seq', 1, false);


--
-- Name: watchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.watchers_id_seq', 20, true);


--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wiki_content_versions_id_seq', 1, false);


--
-- Name: wiki_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wiki_contents_id_seq', 1, false);


--
-- Name: wiki_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wiki_pages_id_seq', 1, false);


--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wiki_redirects_id_seq', 1, false);


--
-- Name: wikis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wikis_id_seq', 4, true);


--
-- Name: workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workflows_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: auth_sources auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (id);


--
-- Name: boards boards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);


--
-- Name: changes changes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changes
    ADD CONSTRAINT changes_pkey PRIMARY KEY (id);


--
-- Name: changesets changesets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changesets
    ADD CONSTRAINT changesets_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: custom_field_enumerations custom_field_enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_field_enumerations
    ADD CONSTRAINT custom_field_enumerations_pkey PRIMARY KEY (id);


--
-- Name: custom_fields custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- Name: custom_values custom_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_values
    ADD CONSTRAINT custom_values_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: email_addresses email_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_addresses
    ADD CONSTRAINT email_addresses_pkey PRIMARY KEY (id);


--
-- Name: enabled_modules enabled_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enabled_modules
    ADD CONSTRAINT enabled_modules_pkey PRIMARY KEY (id);


--
-- Name: enumerations enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enumerations
    ADD CONSTRAINT enumerations_pkey PRIMARY KEY (id);


--
-- Name: import_items import_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.import_items
    ADD CONSTRAINT import_items_pkey PRIMARY KEY (id);


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: issue_categories issue_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_categories
    ADD CONSTRAINT issue_categories_pkey PRIMARY KEY (id);


--
-- Name: issue_relations issue_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_relations
    ADD CONSTRAINT issue_relations_pkey PRIMARY KEY (id);


--
-- Name: issue_statuses issue_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_statuses
    ADD CONSTRAINT issue_statuses_pkey PRIMARY KEY (id);


--
-- Name: issues issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: journal_details journal_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_details
    ADD CONSTRAINT journal_details_pkey PRIMARY KEY (id);


--
-- Name: journals journals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);


--
-- Name: member_roles member_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_roles
    ADD CONSTRAINT member_roles_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_associations open_id_authentication_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.open_id_authentication_associations
    ADD CONSTRAINT open_id_authentication_associations_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_nonces open_id_authentication_nonces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.open_id_authentication_nonces
    ADD CONSTRAINT open_id_authentication_nonces_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: queries queries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (id);


--
-- Name: repositories repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: time_entries time_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_entries
    ADD CONSTRAINT time_entries_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: trackers trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: watchers watchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watchers
    ADD CONSTRAINT watchers_pkey PRIMARY KEY (id);


--
-- Name: wiki_content_versions wiki_content_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_content_versions
    ADD CONSTRAINT wiki_content_versions_pkey PRIMARY KEY (id);


--
-- Name: wiki_contents wiki_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_contents
    ADD CONSTRAINT wiki_contents_pkey PRIMARY KEY (id);


--
-- Name: wiki_pages wiki_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_pages
    ADD CONSTRAINT wiki_pages_pkey PRIMARY KEY (id);


--
-- Name: wiki_redirects wiki_redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_redirects
    ADD CONSTRAINT wiki_redirects_pkey PRIMARY KEY (id);


--
-- Name: wikis wikis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wikis
    ADD CONSTRAINT wikis_pkey PRIMARY KEY (id);


--
-- Name: workflows workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- Name: boards_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_project_id ON public.boards USING btree (project_id);


--
-- Name: changeset_parents_changeset_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX changeset_parents_changeset_ids ON public.changeset_parents USING btree (changeset_id);


--
-- Name: changeset_parents_parent_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX changeset_parents_parent_ids ON public.changeset_parents USING btree (parent_id);


--
-- Name: changesets_changeset_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX changesets_changeset_id ON public.changes USING btree (changeset_id);


--
-- Name: changesets_issues_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX changesets_issues_ids ON public.changesets_issues USING btree (changeset_id, issue_id);


--
-- Name: changesets_repos_rev; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX changesets_repos_rev ON public.changesets USING btree (repository_id, revision);


--
-- Name: changesets_repos_scmid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX changesets_repos_scmid ON public.changesets USING btree (repository_id, scmid);


--
-- Name: custom_fields_roles_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX custom_fields_roles_ids ON public.custom_fields_roles USING btree (custom_field_id, role_id);


--
-- Name: custom_values_customized; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX custom_values_customized ON public.custom_values USING btree (customized_type, customized_id);


--
-- Name: documents_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_project_id ON public.documents USING btree (project_id);


--
-- Name: enabled_modules_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX enabled_modules_project_id ON public.enabled_modules USING btree (project_id);


--
-- Name: groups_users_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX groups_users_ids ON public.groups_users USING btree (group_id, user_id);


--
-- Name: index_attachments_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attachments_on_author_id ON public.attachments USING btree (author_id);


--
-- Name: index_attachments_on_container_id_and_container_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attachments_on_container_id_and_container_type ON public.attachments USING btree (container_id, container_type);


--
-- Name: index_attachments_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attachments_on_created_on ON public.attachments USING btree (created_on);


--
-- Name: index_attachments_on_disk_filename; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attachments_on_disk_filename ON public.attachments USING btree (disk_filename);


--
-- Name: index_auth_sources_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_auth_sources_on_id_and_type ON public.auth_sources USING btree (id, type);


--
-- Name: index_boards_on_last_message_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_boards_on_last_message_id ON public.boards USING btree (last_message_id);


--
-- Name: index_changesets_issues_on_issue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_changesets_issues_on_issue_id ON public.changesets_issues USING btree (issue_id);


--
-- Name: index_changesets_on_committed_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_changesets_on_committed_on ON public.changesets USING btree (committed_on);


--
-- Name: index_changesets_on_repository_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_changesets_on_repository_id ON public.changesets USING btree (repository_id);


--
-- Name: index_changesets_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_changesets_on_user_id ON public.changesets USING btree (user_id);


--
-- Name: index_comments_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_author_id ON public.comments USING btree (author_id);


--
-- Name: index_comments_on_commented_id_and_commented_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_commented_id_and_commented_type ON public.comments USING btree (commented_id, commented_type);


--
-- Name: index_custom_fields_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_custom_fields_on_id_and_type ON public.custom_fields USING btree (id, type);


--
-- Name: index_custom_fields_projects_on_custom_field_id_and_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_custom_fields_projects_on_custom_field_id_and_project_id ON public.custom_fields_projects USING btree (custom_field_id, project_id);


--
-- Name: index_custom_fields_trackers_on_custom_field_id_and_tracker_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_custom_fields_trackers_on_custom_field_id_and_tracker_id ON public.custom_fields_trackers USING btree (custom_field_id, tracker_id);


--
-- Name: index_custom_values_on_custom_field_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_custom_values_on_custom_field_id ON public.custom_values USING btree (custom_field_id);


--
-- Name: index_documents_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_documents_on_category_id ON public.documents USING btree (category_id);


--
-- Name: index_documents_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_documents_on_created_on ON public.documents USING btree (created_on);


--
-- Name: index_email_addresses_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_email_addresses_on_user_id ON public.email_addresses USING btree (user_id);


--
-- Name: index_enumerations_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_enumerations_on_id_and_type ON public.enumerations USING btree (id, type);


--
-- Name: index_enumerations_on_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_enumerations_on_project_id ON public.enumerations USING btree (project_id);


--
-- Name: index_import_items_on_import_id_and_unique_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_import_items_on_import_id_and_unique_id ON public.import_items USING btree (import_id, unique_id);


--
-- Name: index_issue_categories_on_assigned_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issue_categories_on_assigned_to_id ON public.issue_categories USING btree (assigned_to_id);


--
-- Name: index_issue_relations_on_issue_from_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issue_relations_on_issue_from_id ON public.issue_relations USING btree (issue_from_id);


--
-- Name: index_issue_relations_on_issue_from_id_and_issue_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_issue_relations_on_issue_from_id_and_issue_to_id ON public.issue_relations USING btree (issue_from_id, issue_to_id);


--
-- Name: index_issue_relations_on_issue_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issue_relations_on_issue_to_id ON public.issue_relations USING btree (issue_to_id);


--
-- Name: index_issue_statuses_on_is_closed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issue_statuses_on_is_closed ON public.issue_statuses USING btree (is_closed);


--
-- Name: index_issue_statuses_on_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issue_statuses_on_position ON public.issue_statuses USING btree ("position");


--
-- Name: index_issues_on_assigned_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_assigned_to_id ON public.issues USING btree (assigned_to_id);


--
-- Name: index_issues_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_author_id ON public.issues USING btree (author_id);


--
-- Name: index_issues_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_category_id ON public.issues USING btree (category_id);


--
-- Name: index_issues_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_created_on ON public.issues USING btree (created_on);


--
-- Name: index_issues_on_fixed_version_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_fixed_version_id ON public.issues USING btree (fixed_version_id);


--
-- Name: index_issues_on_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_parent_id ON public.issues USING btree (parent_id);


--
-- Name: index_issues_on_priority_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_priority_id ON public.issues USING btree (priority_id);


--
-- Name: index_issues_on_root_id_and_lft_and_rgt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_root_id_and_lft_and_rgt ON public.issues USING btree (root_id, lft, rgt);


--
-- Name: index_issues_on_status_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_status_id ON public.issues USING btree (status_id);


--
-- Name: index_issues_on_tracker_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_tracker_id ON public.issues USING btree (tracker_id);


--
-- Name: index_journals_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_journals_on_created_on ON public.journals USING btree (created_on);


--
-- Name: index_journals_on_journalized_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_journals_on_journalized_id ON public.journals USING btree (journalized_id);


--
-- Name: index_journals_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_journals_on_user_id ON public.journals USING btree (user_id);


--
-- Name: index_member_roles_on_inherited_from; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_member_roles_on_inherited_from ON public.member_roles USING btree (inherited_from);


--
-- Name: index_member_roles_on_member_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_member_roles_on_member_id ON public.member_roles USING btree (member_id);


--
-- Name: index_member_roles_on_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_member_roles_on_role_id ON public.member_roles USING btree (role_id);


--
-- Name: index_members_on_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_members_on_project_id ON public.members USING btree (project_id);


--
-- Name: index_members_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_members_on_user_id ON public.members USING btree (user_id);


--
-- Name: index_members_on_user_id_and_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_members_on_user_id_and_project_id ON public.members USING btree (user_id, project_id);


--
-- Name: index_messages_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_messages_on_author_id ON public.messages USING btree (author_id);


--
-- Name: index_messages_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_messages_on_created_on ON public.messages USING btree (created_on);


--
-- Name: index_messages_on_last_reply_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_messages_on_last_reply_id ON public.messages USING btree (last_reply_id);


--
-- Name: index_news_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_news_on_author_id ON public.news USING btree (author_id);


--
-- Name: index_news_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_news_on_created_on ON public.news USING btree (created_on);


--
-- Name: index_projects_on_lft; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_projects_on_lft ON public.projects USING btree (lft);


--
-- Name: index_projects_on_rgt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_projects_on_rgt ON public.projects USING btree (rgt);


--
-- Name: index_queries_on_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_queries_on_project_id ON public.queries USING btree (project_id);


--
-- Name: index_queries_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_queries_on_user_id ON public.queries USING btree (user_id);


--
-- Name: index_repositories_on_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repositories_on_project_id ON public.repositories USING btree (project_id);


--
-- Name: index_roles_managed_roles_on_role_id_and_managed_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_roles_managed_roles_on_role_id_and_managed_role_id ON public.roles_managed_roles USING btree (role_id, managed_role_id);


--
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_settings_on_name ON public.settings USING btree (name);


--
-- Name: index_time_entries_on_activity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_time_entries_on_activity_id ON public.time_entries USING btree (activity_id);


--
-- Name: index_time_entries_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_time_entries_on_created_on ON public.time_entries USING btree (created_on);


--
-- Name: index_time_entries_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_time_entries_on_user_id ON public.time_entries USING btree (user_id);


--
-- Name: index_tokens_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tokens_on_user_id ON public.tokens USING btree (user_id);


--
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_preferences_on_user_id ON public.user_preferences USING btree (user_id);


--
-- Name: index_users_on_auth_source_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_auth_source_id ON public.users USING btree (auth_source_id);


--
-- Name: index_users_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_id_and_type ON public.users USING btree (id, type);


--
-- Name: index_users_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_type ON public.users USING btree (type);


--
-- Name: index_versions_on_sharing; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_versions_on_sharing ON public.versions USING btree (sharing);


--
-- Name: index_watchers_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_watchers_on_user_id ON public.watchers USING btree (user_id);


--
-- Name: index_watchers_on_watchable_id_and_watchable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_watchers_on_watchable_id_and_watchable_type ON public.watchers USING btree (watchable_id, watchable_type);


--
-- Name: index_wiki_content_versions_on_updated_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_wiki_content_versions_on_updated_on ON public.wiki_content_versions USING btree (updated_on);


--
-- Name: index_wiki_contents_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_wiki_contents_on_author_id ON public.wiki_contents USING btree (author_id);


--
-- Name: index_wiki_pages_on_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_wiki_pages_on_parent_id ON public.wiki_pages USING btree (parent_id);


--
-- Name: index_wiki_pages_on_wiki_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_wiki_pages_on_wiki_id ON public.wiki_pages USING btree (wiki_id);


--
-- Name: index_wiki_redirects_on_wiki_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_wiki_redirects_on_wiki_id ON public.wiki_redirects USING btree (wiki_id);


--
-- Name: index_workflows_on_new_status_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_workflows_on_new_status_id ON public.workflows USING btree (new_status_id);


--
-- Name: index_workflows_on_old_status_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_workflows_on_old_status_id ON public.workflows USING btree (old_status_id);


--
-- Name: index_workflows_on_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_workflows_on_role_id ON public.workflows USING btree (role_id);


--
-- Name: index_workflows_on_tracker_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_workflows_on_tracker_id ON public.workflows USING btree (tracker_id);


--
-- Name: issue_categories_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX issue_categories_project_id ON public.issue_categories USING btree (project_id);


--
-- Name: issues_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX issues_project_id ON public.issues USING btree (project_id);


--
-- Name: journal_details_journal_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX journal_details_journal_id ON public.journal_details USING btree (journal_id);


--
-- Name: journals_journalized_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX journals_journalized_id ON public.journals USING btree (journalized_id, journalized_type);


--
-- Name: messages_board_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_board_id ON public.messages USING btree (board_id);


--
-- Name: messages_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_parent_id ON public.messages USING btree (parent_id);


--
-- Name: news_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_project_id ON public.news USING btree (project_id);


--
-- Name: projects_trackers_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_trackers_project_id ON public.projects_trackers USING btree (project_id);


--
-- Name: projects_trackers_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX projects_trackers_unique ON public.projects_trackers USING btree (project_id, tracker_id);


--
-- Name: queries_roles_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX queries_roles_ids ON public.queries_roles USING btree (query_id, role_id);


--
-- Name: time_entries_issue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX time_entries_issue_id ON public.time_entries USING btree (issue_id);


--
-- Name: time_entries_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX time_entries_project_id ON public.time_entries USING btree (project_id);


--
-- Name: tokens_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tokens_value ON public.tokens USING btree (value);


--
-- Name: versions_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX versions_project_id ON public.versions USING btree (project_id);


--
-- Name: watchers_user_id_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX watchers_user_id_type ON public.watchers USING btree (user_id, watchable_type);


--
-- Name: wiki_content_versions_wcid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_content_versions_wcid ON public.wiki_content_versions USING btree (wiki_content_id);


--
-- Name: wiki_contents_page_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_contents_page_id ON public.wiki_contents USING btree (page_id);


--
-- Name: wiki_pages_wiki_id_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_pages_wiki_id_title ON public.wiki_pages USING btree (wiki_id, title);


--
-- Name: wiki_redirects_wiki_id_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_redirects_wiki_id_title ON public.wiki_redirects USING btree (wiki_id, title);


--
-- Name: wikis_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wikis_project_id ON public.wikis USING btree (project_id);


--
-- Name: wkfs_role_tracker_old_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wkfs_role_tracker_old_status ON public.workflows USING btree (role_id, tracker_id, old_status_id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

