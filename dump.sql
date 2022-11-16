PGDMP     .                
    z            mymangalist %   12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)    14.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    106496    mymangalist    DATABASE     \   CREATE DATABASE mymangalist WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';
    DROP DATABASE mymangalist;
                postgres    false            t           1247    114689 
   genre_type    TYPE     o   CREATE TYPE public.genre_type AS ENUM (
    'shounen',
    'shoujo',
    'seinen',
    'josei',
    'ecchi'
);
    DROP TYPE public.genre_type;
       public          postgres    false                       1247    106498    genre_types    TYPE     p   CREATE TYPE public.genre_types AS ENUM (
    'shounen',
    'shoujo',
    'seinen',
    'josei',
    'ecchi'
);
    DROP TYPE public.genre_types;
       public          postgres    false            z           1247    114706    rating_type    TYPE     ±   CREATE TYPE public.rating_type AS ENUM (
    'empty',
    '0.0',
    '0.5',
    '1.0',
    '1.5',
    '2.0',
    '2.5',
    '3.0',
    '3.5',
    '4.0',
    '4.5',
    '5.0'
);
    DROP TYPE public.rating_type;
       public          postgres    false            w           1247    114700    status_type    TYPE     E   CREATE TYPE public.status_type AS ENUM (
    'unread',
    'read'
);
    DROP TYPE public.status_type;
       public          postgres    false            q           1247    106532    status_types    TYPE     d   CREATE TYPE public.status_types AS ENUM (
    'unread',
    'reading',
    'read',
    'dropped'
);
    DROP TYPE public.status_types;
       public          postgres    false            Λ            1259    114733    mangas    TABLE     ί  CREATE TABLE public.mangas (
    id integer NOT NULL,
    serie character varying(100) NOT NULL,
    author character varying(50) NOT NULL,
    genre public.genre_type NOT NULL,
    volume integer NOT NULL,
    status public.status_type DEFAULT 'unread'::public.status_type NOT NULL,
    image character varying(500),
    rating public.rating_type DEFAULT 'empty'::public.rating_type NOT NULL,
    avaliation character varying(500) DEFAULT 'empty'::character varying NOT NULL
);
    DROP TABLE public.mangas;
       public         heap    postgres    false    631    634    634    631    628            Κ            1259    114731    mangas_id_seq    SEQUENCE        CREATE SEQUENCE public.mangas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.mangas_id_seq;
       public          postgres    false    203                       0    0    mangas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.mangas_id_seq OWNED BY public.mangas.id;
          public          postgres    false    202            ό
           2604    114736 	   mangas id    DEFAULT     f   ALTER TABLE ONLY public.mangas ALTER COLUMN id SET DEFAULT nextval('public.mangas_id_seq'::regclass);
 8   ALTER TABLE public.mangas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203                      0    114733    mangas 
   TABLE DATA           e   COPY public.mangas (id, serie, author, genre, volume, status, image, rating, avaliation) FROM stdin;
    public          postgres    false    203                     0    0    mangas_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.mangas_id_seq', 5, true);
          public          postgres    false    202                       2606    114744    mangas mangas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.mangas
    ADD CONSTRAINT mangas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.mangas DROP CONSTRAINT mangas_pkey;
       public            postgres    false    203                  xΡγββ Ε ©     