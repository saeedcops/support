PGDMP                          y            support3    13.4 (Debian 13.4-4.pgdg110+1)    13.4 (Debian 13.4-4.pgdg110+1) ?   ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    41611    support3    DATABASE     \   CREATE DATABASE support3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE support3;
                postgres    false            ?            1259    41643 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            ?            1259    41641    auth_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    207            ?           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    206            ?            1259    41653    auth_group_permissions    TABLE     ?   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            ?            1259    41651    auth_group_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    209            ?           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    208            ?            1259    41635    auth_permission    TABLE     ?   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            ?            1259    41633    auth_permission_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    205            ?           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    204                       1259    41920    core_adminprofile    TABLE     L  CREATE TABLE public.core_adminprofile (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone character varying(15) NOT NULL,
    "position" character varying(20) NOT NULL,
    image character varying(100),
    branch_id bigint,
    pc_id bigint,
    user_id bigint
);
 %   DROP TABLE public.core_adminprofile;
       public         heap    postgres    false                       1259    41918    core_adminprofile_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.core_adminprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.core_adminprofile_id_seq;
       public          postgres    false    261            ?           0    0    core_adminprofile_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.core_adminprofile_id_seq OWNED BY public.core_adminprofile.id;
          public          postgres    false    260            ?            1259    41700    core_apppermission    TABLE     r   CREATE TABLE public.core_apppermission (
    id bigint NOT NULL,
    permission character varying(50) NOT NULL
);
 &   DROP TABLE public.core_apppermission;
       public         heap    postgres    false            ?            1259    41698    core_apppermission_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.core_apppermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.core_apppermission_id_seq;
       public          postgres    false    213            ?           0    0    core_apppermission_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.core_apppermission_id_seq OWNED BY public.core_apppermission.id;
          public          postgres    false    212                       1259    41909    core_backup    TABLE     ?  CREATE TABLE public.core_backup (
    id bigint NOT NULL,
    data character varying(100) NOT NULL,
    descreption character varying(50),
    internal_path character varying(70),
    internal_schadule character varying(50),
    internal_agent character varying(50),
    external_path character varying(70),
    external_schadule character varying(50),
    external_agent character varying(50),
    branch_id bigint,
    server_id bigint NOT NULL
);
    DROP TABLE public.core_backup;
       public         heap    postgres    false                       1259    41907    core_backup_id_seq    SEQUENCE     {   CREATE SEQUENCE public.core_backup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.core_backup_id_seq;
       public          postgres    false    259            ?           0    0    core_backup_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.core_backup_id_seq OWNED BY public.core_backup.id;
          public          postgres    false    258            ?            1259    41708    core_branch    TABLE     e   CREATE TABLE public.core_branch (
    id bigint NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE public.core_branch;
       public         heap    postgres    false            ?            1259    41706    core_branch_id_seq    SEQUENCE     {   CREATE SEQUENCE public.core_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.core_branch_id_seq;
       public          postgres    false    215            ?           0    0    core_branch_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.core_branch_id_seq OWNED BY public.core_branch.id;
          public          postgres    false    214            ?            1259    41716    core_category    TABLE     g   CREATE TABLE public.core_category (
    id bigint NOT NULL,
    name character varying(20) NOT NULL
);
 !   DROP TABLE public.core_category;
       public         heap    postgres    false            ?            1259    41714    core_category_id_seq    SEQUENCE     }   CREATE SEQUENCE public.core_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.core_category_id_seq;
       public          postgres    false    217            ?           0    0    core_category_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.core_category_id_seq OWNED BY public.core_category.id;
          public          postgres    false    216            ?            1259    41724    core_department    TABLE     i   CREATE TABLE public.core_department (
    id bigint NOT NULL,
    name character varying(20) NOT NULL
);
 #   DROP TABLE public.core_department;
       public         heap    postgres    false            ?            1259    41722    core_department_id_seq    SEQUENCE        CREATE SEQUENCE public.core_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.core_department_id_seq;
       public          postgres    false    219            ?           0    0    core_department_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.core_department_id_seq OWNED BY public.core_department.id;
          public          postgres    false    218                       1259    41899    core_dvr    TABLE     ?  CREATE TABLE public.core_dvr (
    id bigint NOT NULL,
    host_name character varying(15),
    ip character varying(20) NOT NULL,
    switch_port integer NOT NULL,
    cams integer NOT NULL,
    vlan integer NOT NULL,
    model character varying(50) NOT NULL,
    serial_num character varying(20),
    username character varying(20),
    password character varying(20),
    location character varying(50) NOT NULL,
    branch_id bigint NOT NULL
);
    DROP TABLE public.core_dvr;
       public         heap    postgres    false                        1259    41897    core_dvr_id_seq    SEQUENCE     x   CREATE SEQUENCE public.core_dvr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.core_dvr_id_seq;
       public          postgres    false    257            ?           0    0    core_dvr_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.core_dvr_id_seq OWNED BY public.core_dvr.id;
          public          postgres    false    256            ?            1259    41891    core_fingerprint    TABLE     8  CREATE TABLE public.core_fingerprint (
    id bigint NOT NULL,
    ip character varying(15) NOT NULL,
    switch_port integer NOT NULL,
    vlan integer NOT NULL,
    model character varying(30) NOT NULL,
    serial_num character varying(17),
    location character varying(30),
    branch_id bigint NOT NULL
);
 $   DROP TABLE public.core_fingerprint;
       public         heap    postgres    false            ?            1259    41889    core_fingerprint_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.core_fingerprint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.core_fingerprint_id_seq;
       public          postgres    false    255            ?           0    0    core_fingerprint_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.core_fingerprint_id_seq OWNED BY public.core_fingerprint.id;
          public          postgres    false    254            ?            1259    41883    core_firewall    TABLE     }  CREATE TABLE public.core_firewall (
    id bigint NOT NULL,
    host_name character varying(15) NOT NULL,
    ip character varying(15) NOT NULL,
    port_numbers integer NOT NULL,
    gatewaies character varying(255) NOT NULL,
    model character varying(20) NOT NULL,
    serial_num character varying(17) NOT NULL,
    role character varying(30) NOT NULL,
    branch_id bigint
);
 !   DROP TABLE public.core_firewall;
       public         heap    postgres    false            ?            1259    41881    core_firewall_id_seq    SEQUENCE     }   CREATE SEQUENCE public.core_firewall_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.core_firewall_id_seq;
       public          postgres    false    253            ?           0    0    core_firewall_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.core_firewall_id_seq OWNED BY public.core_firewall.id;
          public          postgres    false    252            ?            1259    41734    core_message    TABLE     ?   CREATE TABLE public.core_message (
    id bigint NOT NULL,
    sender integer NOT NULL,
    name character varying(50) NOT NULL,
    text text NOT NULL,
    date date NOT NULL
);
     DROP TABLE public.core_message;
       public         heap    postgres    false            ?            1259    41732    core_message_id_seq    SEQUENCE     |   CREATE SEQUENCE public.core_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.core_message_id_seq;
       public          postgres    false    221            ?           0    0    core_message_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.core_message_id_seq OWNED BY public.core_message.id;
          public          postgres    false    220            ?            1259    41873    core_network    TABLE     ?  CREATE TABLE public.core_network (
    id bigint NOT NULL,
    device character varying(20) NOT NULL,
    model character varying(30),
    ports character varying(20) NOT NULL,
    location character varying(30),
    ip character varying(20) NOT NULL,
    username character varying(20),
    password character varying(20),
    serial_num character varying(50),
    branch_id bigint
);
     DROP TABLE public.core_network;
       public         heap    postgres    false            ?            1259    41871    core_network_id_seq    SEQUENCE     |   CREATE SEQUENCE public.core_network_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.core_network_id_seq;
       public          postgres    false    251            ?           0    0    core_network_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.core_network_id_seq OWNED BY public.core_network.id;
          public          postgres    false    250            ?            1259    41745    core_pc    TABLE     ?  CREATE TABLE public.core_pc (
    id bigint NOT NULL,
    host_name character varying(50) NOT NULL,
    ip character varying(50) NOT NULL,
    switch_port integer NOT NULL,
    vlan integer NOT NULL,
    ram character varying(50),
    cpu character varying(50),
    hard_disk character varying(50),
    os character varying(50),
    mac character varying(50),
    model character varying(50),
    serial_num character varying(50),
    branch_id bigint,
    department_id bigint,
    user_id bigint
);
    DROP TABLE public.core_pc;
       public         heap    postgres    false            ?            1259    41743    core_pc_id_seq    SEQUENCE     w   CREATE SEQUENCE public.core_pc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.core_pc_id_seq;
       public          postgres    false    223            ?           0    0    core_pc_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.core_pc_id_seq OWNED BY public.core_pc.id;
          public          postgres    false    222            ?            1259    41849    core_permission    TABLE     }   CREATE TABLE public.core_permission (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    user_id bigint
);
 #   DROP TABLE public.core_permission;
       public         heap    postgres    false            ?            1259    41857    core_permission_apps    TABLE     ?   CREATE TABLE public.core_permission_apps (
    id integer NOT NULL,
    permission_id bigint NOT NULL,
    category_id bigint NOT NULL
);
 (   DROP TABLE public.core_permission_apps;
       public         heap    postgres    false            ?            1259    41855    core_permission_apps_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.core_permission_apps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.core_permission_apps_id_seq;
       public          postgres    false    247            ?           0    0    core_permission_apps_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.core_permission_apps_id_seq OWNED BY public.core_permission_apps.id;
          public          postgres    false    246            ?            1259    41847    core_permission_id_seq    SEQUENCE        CREATE SEQUENCE public.core_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.core_permission_id_seq;
       public          postgres    false    245            ?           0    0    core_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.core_permission_id_seq OWNED BY public.core_permission.id;
          public          postgres    false    244            ?            1259    41865    core_permission_share    TABLE     ?   CREATE TABLE public.core_permission_share (
    id integer NOT NULL,
    permission_id bigint NOT NULL,
    share_id bigint NOT NULL
);
 )   DROP TABLE public.core_permission_share;
       public         heap    postgres    false            ?            1259    41863    core_permission_share_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.core_permission_share_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.core_permission_share_id_seq;
       public          postgres    false    249            ?           0    0    core_permission_share_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.core_permission_share_id_seq OWNED BY public.core_permission_share.id;
          public          postgres    false    248            ?            1259    41839    core_printer    TABLE     o  CREATE TABLE public.core_printer (
    id bigint NOT NULL,
    ip character varying(30) NOT NULL,
    switch_port integer NOT NULL,
    vlan integer NOT NULL,
    mac character varying(30),
    model character varying(50),
    serial_num character varying(30),
    office character varying(50),
    scan_share character varying(150),
    branch_id bigint NOT NULL
);
     DROP TABLE public.core_printer;
       public         heap    postgres    false            ?            1259    41837    core_printer_id_seq    SEQUENCE     |   CREATE SEQUENCE public.core_printer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.core_printer_id_seq;
       public          postgres    false    243            ?           0    0    core_printer_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.core_printer_id_seq OWNED BY public.core_printer.id;
          public          postgres    false    242            ?            1259    41831    core_request    TABLE     ?   CREATE TABLE public.core_request (
    id bigint NOT NULL,
    valid boolean NOT NULL,
    date date NOT NULL,
    file_scan character varying(100),
    branch_id bigint,
    category_id bigint,
    user_id bigint NOT NULL
);
     DROP TABLE public.core_request;
       public         heap    postgres    false            ?            1259    41829    core_request_id_seq    SEQUENCE     |   CREATE SEQUENCE public.core_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.core_request_id_seq;
       public          postgres    false    241            ?           0    0    core_request_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.core_request_id_seq OWNED BY public.core_request.id;
          public          postgres    false    240            ?            1259    41755    core_server    TABLE     *  CREATE TABLE public.core_server (
    id bigint NOT NULL,
    host_name character varying(30) NOT NULL,
    ip character varying(50) NOT NULL,
    switch_port integer NOT NULL,
    vlan integer NOT NULL,
    ram character varying(50) NOT NULL,
    cpu character varying(50) NOT NULL,
    hard_disk character varying(50) NOT NULL,
    os character varying(50) NOT NULL,
    mac character varying(50) NOT NULL,
    model character varying(50) NOT NULL,
    serial_num character varying(50),
    role character varying(30) NOT NULL,
    branch_id bigint
);
    DROP TABLE public.core_server;
       public         heap    postgres    false            ?            1259    41753    core_server_id_seq    SEQUENCE     {   CREATE SEQUENCE public.core_server_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.core_server_id_seq;
       public          postgres    false    225            ?           0    0    core_server_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.core_server_id_seq OWNED BY public.core_server.id;
          public          postgres    false    224            ?            1259    41823 
   core_share    TABLE     ?   CREATE TABLE public.core_share (
    id bigint NOT NULL,
    path character varying(100) NOT NULL,
    branch_id bigint,
    server_id bigint NOT NULL
);
    DROP TABLE public.core_share;
       public         heap    postgres    false            ?            1259    41821    core_share_id_seq    SEQUENCE     z   CREATE SEQUENCE public.core_share_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.core_share_id_seq;
       public          postgres    false    239            ?           0    0    core_share_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.core_share_id_seq OWNED BY public.core_share.id;
          public          postgres    false    238            ?            1259    41815 
   core_stock    TABLE     ?   CREATE TABLE public.core_stock (
    id bigint NOT NULL,
    status character varying(20) NOT NULL,
    qty character varying(20) NOT NULL,
    item character varying(100) NOT NULL,
    branch_id bigint
);
    DROP TABLE public.core_stock;
       public         heap    postgres    false            ?            1259    41813    core_stock_id_seq    SEQUENCE     z   CREATE SEQUENCE public.core_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.core_stock_id_seq;
       public          postgres    false    237            ?           0    0    core_stock_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.core_stock_id_seq OWNED BY public.core_stock.id;
          public          postgres    false    236            ?            1259    41805    core_storage    TABLE     ?   CREATE TABLE public.core_storage (
    id bigint NOT NULL,
    model character varying(20) NOT NULL,
    capacity character varying(20) NOT NULL,
    ip character varying(50) NOT NULL,
    serial_num character varying(50),
    branch_id bigint
);
     DROP TABLE public.core_storage;
       public         heap    postgres    false            ?            1259    41803    core_storage_id_seq    SEQUENCE     |   CREATE SEQUENCE public.core_storage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.core_storage_id_seq;
       public          postgres    false    235            ?           0    0    core_storage_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.core_storage_id_seq OWNED BY public.core_storage.id;
          public          postgres    false    234            ?            1259    41794    core_switch    TABLE     ?  CREATE TABLE public.core_switch (
    id bigint NOT NULL,
    host_name character varying(15) NOT NULL,
    ip character varying(15) NOT NULL,
    port_number integer NOT NULL,
    vlan integer[] NOT NULL,
    trunk_ports integer[] NOT NULL,
    model character varying(20) NOT NULL,
    serial_num character varying(17) NOT NULL,
    role character varying(30) NOT NULL,
    branch_id bigint
);
    DROP TABLE public.core_switch;
       public         heap    postgres    false            ?            1259    41792    core_switch_id_seq    SEQUENCE     {   CREATE SEQUENCE public.core_switch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.core_switch_id_seq;
       public          postgres    false    233            ?           0    0    core_switch_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.core_switch_id_seq OWNED BY public.core_switch.id;
          public          postgres    false    232            ?            1259    41775    core_ticket    TABLE     n  CREATE TABLE public.core_ticket (
    id bigint NOT NULL,
    status character varying(10) NOT NULL,
    open_date timestamp with time zone NOT NULL,
    closed_date timestamp with time zone,
    description text NOT NULL,
    admin_id bigint,
    branch_id bigint NOT NULL,
    category_id bigint NOT NULL,
    pc_id bigint NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.core_ticket;
       public         heap    postgres    false            ?            1259    41773    core_ticket_id_seq    SEQUENCE     {   CREATE SEQUENCE public.core_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.core_ticket_id_seq;
       public          postgres    false    229            ?           0    0    core_ticket_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.core_ticket_id_seq OWNED BY public.core_ticket.id;
          public          postgres    false    228            ?            1259    41786    core_ticket_messages    TABLE     ?   CREATE TABLE public.core_ticket_messages (
    id integer NOT NULL,
    ticket_id bigint NOT NULL,
    message_id bigint NOT NULL
);
 (   DROP TABLE public.core_ticket_messages;
       public         heap    postgres    false            ?            1259    41784    core_ticket_messages_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.core_ticket_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.core_ticket_messages_id_seq;
       public          postgres    false    231            ?           0    0    core_ticket_messages_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.core_ticket_messages_id_seq OWNED BY public.core_ticket_messages.id;
          public          postgres    false    230            ?            1259    41687 	   core_user    TABLE     ?  CREATE TABLE public.core_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    phone character varying(20) NOT NULL,
    ip character varying(20) NOT NULL,
    image character varying(100),
    department character varying(15),
    branch_id bigint,
    pc_id bigint,
    language character varying(10) NOT NULL
);
    DROP TABLE public.core_user;
       public         heap    postgres    false                       1259    41935    core_user_groups    TABLE     ~   CREATE TABLE public.core_user_groups (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.core_user_groups;
       public         heap    postgres    false                       1259    41933    core_user_groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.core_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.core_user_groups_id_seq;
       public          postgres    false    263            ?           0    0    core_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.core_user_groups_id_seq OWNED BY public.core_user_groups.id;
          public          postgres    false    262            ?            1259    41685    core_user_id_seq    SEQUENCE     y   CREATE SEQUENCE public.core_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.core_user_id_seq;
       public          postgres    false    211            ?           0    0    core_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.core_user_id_seq OWNED BY public.core_user.id;
          public          postgres    false    210            	           1259    41948    core_user_user_permissions    TABLE     ?   CREATE TABLE public.core_user_user_permissions (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.core_user_user_permissions;
       public         heap    postgres    false                       1259    41946 !   core_user_user_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.core_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.core_user_user_permissions_id_seq;
       public          postgres    false    265            ?           0    0 !   core_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.core_user_user_permissions_id_seq OWNED BY public.core_user_user_permissions.id;
          public          postgres    false    264            ?            1259    41765    core_userprofile    TABLE     :  CREATE TABLE public.core_userprofile (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(200) NOT NULL,
    department character varying(15),
    phone character varying(15),
    image character varying(100),
    branch_id bigint,
    pc_id bigint,
    user_id bigint
);
 $   DROP TABLE public.core_userprofile;
       public         heap    postgres    false            ?            1259    41763    core_userprofile_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.core_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.core_userprofile_id_seq;
       public          postgres    false    227            ?           0    0    core_userprofile_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.core_userprofile_id_seq OWNED BY public.core_userprofile.id;
          public          postgres    false    226                       1259    42220    django_admin_log    TABLE     ?  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            
           1259    42218    django_admin_log_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    267            ?           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    266            ?            1259    41625    django_content_type    TABLE     ?   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            ?            1259    41623    django_content_type_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    203            ?           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    202            ?            1259    41614    django_migrations    TABLE     ?   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            ?            1259    41612    django_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    201            ?           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    200                       1259    42285    django_session    TABLE     ?   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false                       1259    42244    notifications_notification    TABLE     ?  CREATE TABLE public.notifications_notification (
    id integer NOT NULL,
    level character varying(20) NOT NULL,
    unread boolean NOT NULL,
    actor_object_id character varying(255) NOT NULL,
    verb character varying(255) NOT NULL,
    description text,
    target_object_id character varying(255),
    action_object_object_id character varying(255),
    "timestamp" timestamp with time zone NOT NULL,
    public boolean NOT NULL,
    action_object_content_type_id integer,
    actor_content_type_id integer NOT NULL,
    recipient_id bigint NOT NULL,
    target_content_type_id integer,
    deleted boolean NOT NULL,
    emailed boolean NOT NULL,
    data text
);
 .   DROP TABLE public.notifications_notification;
       public         heap    postgres    false                       1259    42242 !   notifications_notification_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.notifications_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.notifications_notification_id_seq;
       public          postgres    false    269            ?           0    0 !   notifications_notification_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications_notification.id;
          public          postgres    false    268                       2604    41646    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207                       2604    41656    auth_group_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209                        2604    41638    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205                       2604    41923    core_adminprofile id    DEFAULT     |   ALTER TABLE ONLY public.core_adminprofile ALTER COLUMN id SET DEFAULT nextval('public.core_adminprofile_id_seq'::regclass);
 C   ALTER TABLE public.core_adminprofile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260    261                       2604    41703    core_apppermission id    DEFAULT     ~   ALTER TABLE ONLY public.core_apppermission ALTER COLUMN id SET DEFAULT nextval('public.core_apppermission_id_seq'::regclass);
 D   ALTER TABLE public.core_apppermission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213                       2604    41912    core_backup id    DEFAULT     p   ALTER TABLE ONLY public.core_backup ALTER COLUMN id SET DEFAULT nextval('public.core_backup_id_seq'::regclass);
 =   ALTER TABLE public.core_backup ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    259    259                       2604    41711    core_branch id    DEFAULT     p   ALTER TABLE ONLY public.core_branch ALTER COLUMN id SET DEFAULT nextval('public.core_branch_id_seq'::regclass);
 =   ALTER TABLE public.core_branch ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                       2604    41719    core_category id    DEFAULT     t   ALTER TABLE ONLY public.core_category ALTER COLUMN id SET DEFAULT nextval('public.core_category_id_seq'::regclass);
 ?   ALTER TABLE public.core_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217                       2604    41727    core_department id    DEFAULT     x   ALTER TABLE ONLY public.core_department ALTER COLUMN id SET DEFAULT nextval('public.core_department_id_seq'::regclass);
 A   ALTER TABLE public.core_department ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219                       2604    41902    core_dvr id    DEFAULT     j   ALTER TABLE ONLY public.core_dvr ALTER COLUMN id SET DEFAULT nextval('public.core_dvr_id_seq'::regclass);
 :   ALTER TABLE public.core_dvr ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    257    257                       2604    41894    core_fingerprint id    DEFAULT     z   ALTER TABLE ONLY public.core_fingerprint ALTER COLUMN id SET DEFAULT nextval('public.core_fingerprint_id_seq'::regclass);
 B   ALTER TABLE public.core_fingerprint ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254    255                       2604    41886    core_firewall id    DEFAULT     t   ALTER TABLE ONLY public.core_firewall ALTER COLUMN id SET DEFAULT nextval('public.core_firewall_id_seq'::regclass);
 ?   ALTER TABLE public.core_firewall ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252    253                       2604    41737    core_message id    DEFAULT     r   ALTER TABLE ONLY public.core_message ALTER COLUMN id SET DEFAULT nextval('public.core_message_id_seq'::regclass);
 >   ALTER TABLE public.core_message ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221                       2604    41876    core_network id    DEFAULT     r   ALTER TABLE ONLY public.core_network ALTER COLUMN id SET DEFAULT nextval('public.core_network_id_seq'::regclass);
 >   ALTER TABLE public.core_network ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    251    251            	           2604    41748 
   core_pc id    DEFAULT     h   ALTER TABLE ONLY public.core_pc ALTER COLUMN id SET DEFAULT nextval('public.core_pc_id_seq'::regclass);
 9   ALTER TABLE public.core_pc ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223                       2604    41852    core_permission id    DEFAULT     x   ALTER TABLE ONLY public.core_permission ALTER COLUMN id SET DEFAULT nextval('public.core_permission_id_seq'::regclass);
 A   ALTER TABLE public.core_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245                       2604    41860    core_permission_apps id    DEFAULT     ?   ALTER TABLE ONLY public.core_permission_apps ALTER COLUMN id SET DEFAULT nextval('public.core_permission_apps_id_seq'::regclass);
 F   ALTER TABLE public.core_permission_apps ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    247    247                       2604    41868    core_permission_share id    DEFAULT     ?   ALTER TABLE ONLY public.core_permission_share ALTER COLUMN id SET DEFAULT nextval('public.core_permission_share_id_seq'::regclass);
 G   ALTER TABLE public.core_permission_share ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248    249                       2604    41842    core_printer id    DEFAULT     r   ALTER TABLE ONLY public.core_printer ALTER COLUMN id SET DEFAULT nextval('public.core_printer_id_seq'::regclass);
 >   ALTER TABLE public.core_printer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243                       2604    41834    core_request id    DEFAULT     r   ALTER TABLE ONLY public.core_request ALTER COLUMN id SET DEFAULT nextval('public.core_request_id_seq'::regclass);
 >   ALTER TABLE public.core_request ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            
           2604    41758    core_server id    DEFAULT     p   ALTER TABLE ONLY public.core_server ALTER COLUMN id SET DEFAULT nextval('public.core_server_id_seq'::regclass);
 =   ALTER TABLE public.core_server ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225                       2604    41826    core_share id    DEFAULT     n   ALTER TABLE ONLY public.core_share ALTER COLUMN id SET DEFAULT nextval('public.core_share_id_seq'::regclass);
 <   ALTER TABLE public.core_share ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239                       2604    41818    core_stock id    DEFAULT     n   ALTER TABLE ONLY public.core_stock ALTER COLUMN id SET DEFAULT nextval('public.core_stock_id_seq'::regclass);
 <   ALTER TABLE public.core_stock ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237                       2604    41808    core_storage id    DEFAULT     r   ALTER TABLE ONLY public.core_storage ALTER COLUMN id SET DEFAULT nextval('public.core_storage_id_seq'::regclass);
 >   ALTER TABLE public.core_storage ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235                       2604    41797    core_switch id    DEFAULT     p   ALTER TABLE ONLY public.core_switch ALTER COLUMN id SET DEFAULT nextval('public.core_switch_id_seq'::regclass);
 =   ALTER TABLE public.core_switch ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233                       2604    41778    core_ticket id    DEFAULT     p   ALTER TABLE ONLY public.core_ticket ALTER COLUMN id SET DEFAULT nextval('public.core_ticket_id_seq'::regclass);
 =   ALTER TABLE public.core_ticket ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229                       2604    41789    core_ticket_messages id    DEFAULT     ?   ALTER TABLE ONLY public.core_ticket_messages ALTER COLUMN id SET DEFAULT nextval('public.core_ticket_messages_id_seq'::regclass);
 F   ALTER TABLE public.core_ticket_messages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231                       2604    41690    core_user id    DEFAULT     l   ALTER TABLE ONLY public.core_user ALTER COLUMN id SET DEFAULT nextval('public.core_user_id_seq'::regclass);
 ;   ALTER TABLE public.core_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211                       2604    41938    core_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.core_user_groups ALTER COLUMN id SET DEFAULT nextval('public.core_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.core_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    262    263                       2604    41951    core_user_user_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.core_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.core_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.core_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    264    265                       2604    41768    core_userprofile id    DEFAULT     z   ALTER TABLE ONLY public.core_userprofile ALTER COLUMN id SET DEFAULT nextval('public.core_userprofile_id_seq'::regclass);
 B   ALTER TABLE public.core_userprofile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227                       2604    42223    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    266    267    267            ?           2604    41628    django_content_type id    DEFAULT     ?   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            ?           2604    41617    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            !           2604    42247    notifications_notification id    DEFAULT     ?   ALTER TABLE ONLY public.notifications_notification ALTER COLUMN id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);
 L   ALTER TABLE public.notifications_notification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    268    269            ?          0    41643 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    207            ?          0    41653    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    209            ?          0    41635    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    205            ?          0    41920    core_adminprofile 
   TABLE DATA           q   COPY public.core_adminprofile (id, name, email, phone, "position", image, branch_id, pc_id, user_id) FROM stdin;
    public          postgres    false    261            ?          0    41700    core_apppermission 
   TABLE DATA           <   COPY public.core_apppermission (id, permission) FROM stdin;
    public          postgres    false    213            ?          0    41909    core_backup 
   TABLE DATA           ?   COPY public.core_backup (id, data, descreption, internal_path, internal_schadule, internal_agent, external_path, external_schadule, external_agent, branch_id, server_id) FROM stdin;
    public          postgres    false    259            ?          0    41708    core_branch 
   TABLE DATA           /   COPY public.core_branch (id, name) FROM stdin;
    public          postgres    false    215            ?          0    41716    core_category 
   TABLE DATA           1   COPY public.core_category (id, name) FROM stdin;
    public          postgres    false    217            ?          0    41724    core_department 
   TABLE DATA           3   COPY public.core_department (id, name) FROM stdin;
    public          postgres    false    219            ?          0    41899    core_dvr 
   TABLE DATA           ?   COPY public.core_dvr (id, host_name, ip, switch_port, cams, vlan, model, serial_num, username, password, location, branch_id) FROM stdin;
    public          postgres    false    257            ?          0    41891    core_fingerprint 
   TABLE DATA           m   COPY public.core_fingerprint (id, ip, switch_port, vlan, model, serial_num, location, branch_id) FROM stdin;
    public          postgres    false    255            ?          0    41883    core_firewall 
   TABLE DATA           w   COPY public.core_firewall (id, host_name, ip, port_numbers, gatewaies, model, serial_num, role, branch_id) FROM stdin;
    public          postgres    false    253            ?          0    41734    core_message 
   TABLE DATA           D   COPY public.core_message (id, sender, name, text, date) FROM stdin;
    public          postgres    false    221            ?          0    41873    core_network 
   TABLE DATA           y   COPY public.core_network (id, device, model, ports, location, ip, username, password, serial_num, branch_id) FROM stdin;
    public          postgres    false    251            ?          0    41745    core_pc 
   TABLE DATA           ?   COPY public.core_pc (id, host_name, ip, switch_port, vlan, ram, cpu, hard_disk, os, mac, model, serial_num, branch_id, department_id, user_id) FROM stdin;
    public          postgres    false    223            ?          0    41849    core_permission 
   TABLE DATA           <   COPY public.core_permission (id, name, user_id) FROM stdin;
    public          postgres    false    245            ?          0    41857    core_permission_apps 
   TABLE DATA           N   COPY public.core_permission_apps (id, permission_id, category_id) FROM stdin;
    public          postgres    false    247            ?          0    41865    core_permission_share 
   TABLE DATA           L   COPY public.core_permission_share (id, permission_id, share_id) FROM stdin;
    public          postgres    false    249            ?          0    41839    core_printer 
   TABLE DATA           x   COPY public.core_printer (id, ip, switch_port, vlan, mac, model, serial_num, office, scan_share, branch_id) FROM stdin;
    public          postgres    false    243            ?          0    41831    core_request 
   TABLE DATA           c   COPY public.core_request (id, valid, date, file_scan, branch_id, category_id, user_id) FROM stdin;
    public          postgres    false    241            ?          0    41755    core_server 
   TABLE DATA           ?   COPY public.core_server (id, host_name, ip, switch_port, vlan, ram, cpu, hard_disk, os, mac, model, serial_num, role, branch_id) FROM stdin;
    public          postgres    false    225            ?          0    41823 
   core_share 
   TABLE DATA           D   COPY public.core_share (id, path, branch_id, server_id) FROM stdin;
    public          postgres    false    239            ?          0    41815 
   core_stock 
   TABLE DATA           F   COPY public.core_stock (id, status, qty, item, branch_id) FROM stdin;
    public          postgres    false    237            ?          0    41805    core_storage 
   TABLE DATA           V   COPY public.core_storage (id, model, capacity, ip, serial_num, branch_id) FROM stdin;
    public          postgres    false    235            ?          0    41794    core_switch 
   TABLE DATA           |   COPY public.core_switch (id, host_name, ip, port_number, vlan, trunk_ports, model, serial_num, role, branch_id) FROM stdin;
    public          postgres    false    233            ?          0    41775    core_ticket 
   TABLE DATA           ?   COPY public.core_ticket (id, status, open_date, closed_date, description, admin_id, branch_id, category_id, pc_id, user_id) FROM stdin;
    public          postgres    false    229            ?          0    41786    core_ticket_messages 
   TABLE DATA           I   COPY public.core_ticket_messages (id, ticket_id, message_id) FROM stdin;
    public          postgres    false    231            ?          0    41687 	   core_user 
   TABLE DATA           ?   COPY public.core_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, phone, ip, image, department, branch_id, pc_id, language) FROM stdin;
    public          postgres    false    211            ?          0    41935    core_user_groups 
   TABLE DATA           A   COPY public.core_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    263            ?          0    41948    core_user_user_permissions 
   TABLE DATA           P   COPY public.core_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    265            ?          0    41765    core_userprofile 
   TABLE DATA           p   COPY public.core_userprofile (id, name, email, department, phone, image, branch_id, pc_id, user_id) FROM stdin;
    public          postgres    false    227            ?          0    42220    django_admin_log 
   TABLE DATA           ?   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    267            ?          0    41625    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    203            ?          0    41614    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    201            ?          0    42285    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    270            ?          0    42244    notifications_notification 
   TABLE DATA             COPY public.notifications_notification (id, level, unread, actor_object_id, verb, description, target_object_id, action_object_object_id, "timestamp", public, action_object_content_type_id, actor_content_type_id, recipient_id, target_content_type_id, deleted, emailed, data) FROM stdin;
    public          postgres    false    269            ?           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    206            ?           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    208            ?           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 116, true);
          public          postgres    false    204            ?           0    0    core_adminprofile_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.core_adminprofile_id_seq', 1, false);
          public          postgres    false    260            ?           0    0    core_apppermission_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.core_apppermission_id_seq', 1, false);
          public          postgres    false    212            ?           0    0    core_backup_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.core_backup_id_seq', 6, true);
          public          postgres    false    258            ?           0    0    core_branch_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.core_branch_id_seq', 5, true);
          public          postgres    false    214                        0    0    core_category_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.core_category_id_seq', 8, true);
          public          postgres    false    216                       0    0    core_department_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.core_department_id_seq', 11, true);
          public          postgres    false    218                       0    0    core_dvr_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.core_dvr_id_seq', 1, false);
          public          postgres    false    256                       0    0    core_fingerprint_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.core_fingerprint_id_seq', 1, false);
          public          postgres    false    254                       0    0    core_firewall_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.core_firewall_id_seq', 1, false);
          public          postgres    false    252                       0    0    core_message_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_message_id_seq', 7, true);
          public          postgres    false    220                       0    0    core_network_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.core_network_id_seq', 101, true);
          public          postgres    false    250                       0    0    core_pc_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.core_pc_id_seq', 142, true);
          public          postgres    false    222                       0    0    core_permission_apps_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.core_permission_apps_id_seq', 1, false);
          public          postgres    false    246            	           0    0    core_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.core_permission_id_seq', 1, false);
          public          postgres    false    244            
           0    0    core_permission_share_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.core_permission_share_id_seq', 1, false);
          public          postgres    false    248                       0    0    core_printer_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.core_printer_id_seq', 98, true);
          public          postgres    false    242                       0    0    core_request_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_request_id_seq', 4, true);
          public          postgres    false    240                       0    0    core_server_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_server_id_seq', 78, true);
          public          postgres    false    224                       0    0    core_share_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.core_share_id_seq', 1, false);
          public          postgres    false    238                       0    0    core_stock_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.core_stock_id_seq', 60, true);
          public          postgres    false    236                       0    0    core_storage_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.core_storage_id_seq', 12, true);
          public          postgres    false    234                       0    0    core_switch_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_switch_id_seq', 1, false);
          public          postgres    false    232                       0    0    core_ticket_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.core_ticket_id_seq', 9, true);
          public          postgres    false    228                       0    0    core_ticket_messages_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.core_ticket_messages_id_seq', 7, true);
          public          postgres    false    230                       0    0    core_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.core_user_groups_id_seq', 1, false);
          public          postgres    false    262                       0    0    core_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.core_user_id_seq', 7, true);
          public          postgres    false    210                       0    0 !   core_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.core_user_user_permissions_id_seq', 1, false);
          public          postgres    false    264                       0    0    core_userprofile_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.core_userprofile_id_seq', 1, false);
          public          postgres    false    226                       0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 33, true);
          public          postgres    false    266                       0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 29, true);
          public          postgres    false    202                       0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);
          public          postgres    false    200                       0    0 !   notifications_notification_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.notifications_notification_id_seq', 44, true);
          public          postgres    false    268            /           2606    41683    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    207            4           2606    41669 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    209    209            7           2606    41658 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    209            1           2606    41648    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    207            *           2606    41660 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    205    205            ,           2606    41640 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    205            ?           2606    41925 (   core_adminprofile core_adminprofile_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.core_adminprofile
    ADD CONSTRAINT core_adminprofile_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.core_adminprofile DROP CONSTRAINT core_adminprofile_pkey;
       public            postgres    false    261            ?           2606    41927 /   core_adminprofile core_adminprofile_user_id_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.core_adminprofile
    ADD CONSTRAINT core_adminprofile_user_id_key UNIQUE (user_id);
 Y   ALTER TABLE ONLY public.core_adminprofile DROP CONSTRAINT core_adminprofile_user_id_key;
       public            postgres    false    261            @           2606    41705 *   core_apppermission core_apppermission_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.core_apppermission
    ADD CONSTRAINT core_apppermission_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.core_apppermission DROP CONSTRAINT core_apppermission_pkey;
       public            postgres    false    213            ?           2606    41917    core_backup core_backup_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.core_backup
    ADD CONSTRAINT core_backup_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.core_backup DROP CONSTRAINT core_backup_pkey;
       public            postgres    false    259            B           2606    41713    core_branch core_branch_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.core_branch
    ADD CONSTRAINT core_branch_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.core_branch DROP CONSTRAINT core_branch_pkey;
       public            postgres    false    215            D           2606    41721     core_category core_category_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.core_category
    ADD CONSTRAINT core_category_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.core_category DROP CONSTRAINT core_category_pkey;
       public            postgres    false    217            G           2606    41731 (   core_department core_department_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.core_department
    ADD CONSTRAINT core_department_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.core_department DROP CONSTRAINT core_department_name_key;
       public            postgres    false    219            I           2606    41729 $   core_department core_department_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.core_department
    ADD CONSTRAINT core_department_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.core_department DROP CONSTRAINT core_department_pkey;
       public            postgres    false    219            ?           2606    41906    core_dvr core_dvr_ip_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.core_dvr
    ADD CONSTRAINT core_dvr_ip_key UNIQUE (ip);
 B   ALTER TABLE ONLY public.core_dvr DROP CONSTRAINT core_dvr_ip_key;
       public            postgres    false    257            ?           2606    41904    core_dvr core_dvr_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.core_dvr
    ADD CONSTRAINT core_dvr_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.core_dvr DROP CONSTRAINT core_dvr_pkey;
       public            postgres    false    257            ?           2606    41896 &   core_fingerprint core_fingerprint_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.core_fingerprint
    ADD CONSTRAINT core_fingerprint_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.core_fingerprint DROP CONSTRAINT core_fingerprint_pkey;
       public            postgres    false    255            ?           2606    41888     core_firewall core_firewall_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.core_firewall
    ADD CONSTRAINT core_firewall_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.core_firewall DROP CONSTRAINT core_firewall_pkey;
       public            postgres    false    253            K           2606    41742    core_message core_message_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.core_message
    ADD CONSTRAINT core_message_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.core_message DROP CONSTRAINT core_message_pkey;
       public            postgres    false    221            ?           2606    41880     core_network core_network_ip_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.core_network
    ADD CONSTRAINT core_network_ip_key UNIQUE (ip);
 J   ALTER TABLE ONLY public.core_network DROP CONSTRAINT core_network_ip_key;
       public            postgres    false    251            ?           2606    41878    core_network core_network_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.core_network
    ADD CONSTRAINT core_network_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.core_network DROP CONSTRAINT core_network_pkey;
       public            postgres    false    251            P           2606    41752    core_pc core_pc_host_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.core_pc
    ADD CONSTRAINT core_pc_host_name_key UNIQUE (host_name);
 G   ALTER TABLE ONLY public.core_pc DROP CONSTRAINT core_pc_host_name_key;
       public            postgres    false    223            R           2606    41750    core_pc core_pc_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.core_pc
    ADD CONSTRAINT core_pc_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.core_pc DROP CONSTRAINT core_pc_pkey;
       public            postgres    false    223            ?           2606    42106 Q   core_permission_apps core_permission_apps_permission_id_category_id_92156b6e_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.core_permission_apps
    ADD CONSTRAINT core_permission_apps_permission_id_category_id_92156b6e_uniq UNIQUE (permission_id, category_id);
 {   ALTER TABLE ONLY public.core_permission_apps DROP CONSTRAINT core_permission_apps_permission_id_category_id_92156b6e_uniq;
       public            postgres    false    247    247            ?           2606    41862 .   core_permission_apps core_permission_apps_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.core_permission_apps
    ADD CONSTRAINT core_permission_apps_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.core_permission_apps DROP CONSTRAINT core_permission_apps_pkey;
       public            postgres    false    247            ?           2606    41854 $   core_permission core_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.core_permission
    ADD CONSTRAINT core_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.core_permission DROP CONSTRAINT core_permission_pkey;
       public            postgres    false    245            ?           2606    42120 P   core_permission_share core_permission_share_permission_id_share_id_323cda6b_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.core_permission_share
    ADD CONSTRAINT core_permission_share_permission_id_share_id_323cda6b_uniq UNIQUE (permission_id, share_id);
 z   ALTER TABLE ONLY public.core_permission_share DROP CONSTRAINT core_permission_share_permission_id_share_id_323cda6b_uniq;
       public            postgres    false    249    249            ?           2606    41870 0   core_permission_share core_permission_share_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.core_permission_share
    ADD CONSTRAINT core_permission_share_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.core_permission_share DROP CONSTRAINT core_permission_share_pkey;
       public            postgres    false    249            ?           2606    41846     core_printer core_printer_ip_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.core_printer
    ADD CONSTRAINT core_printer_ip_key UNIQUE (ip);
 J   ALTER TABLE ONLY public.core_printer DROP CONSTRAINT core_printer_ip_key;
       public            postgres    false    243            ?           2606    41844    core_printer core_printer_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.core_printer
    ADD CONSTRAINT core_printer_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.core_printer DROP CONSTRAINT core_printer_pkey;
       public            postgres    false    243            ?           2606    41836    core_request core_request_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.core_request
    ADD CONSTRAINT core_request_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.core_request DROP CONSTRAINT core_request_pkey;
       public            postgres    false    241            W           2606    41762 %   core_server core_server_host_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.core_server
    ADD CONSTRAINT core_server_host_name_key UNIQUE (host_name);
 O   ALTER TABLE ONLY public.core_server DROP CONSTRAINT core_server_host_name_key;
       public            postgres    false    225            Y           2606    41760    core_server core_server_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.core_server
    ADD CONSTRAINT core_server_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.core_server DROP CONSTRAINT core_server_pkey;
       public            postgres    false    225            {           2606    41828    core_share core_share_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.core_share
    ADD CONSTRAINT core_share_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.core_share DROP CONSTRAINT core_share_pkey;
       public            postgres    false    239            x           2606    41820    core_stock core_stock_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.core_stock
    ADD CONSTRAINT core_stock_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.core_stock DROP CONSTRAINT core_stock_pkey;
       public            postgres    false    237            s           2606    41812     core_storage core_storage_ip_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.core_storage
    ADD CONSTRAINT core_storage_ip_key UNIQUE (ip);
 J   ALTER TABLE ONLY public.core_storage DROP CONSTRAINT core_storage_ip_key;
       public            postgres    false    235            u           2606    41810    core_storage core_storage_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.core_storage
    ADD CONSTRAINT core_storage_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.core_storage DROP CONSTRAINT core_storage_pkey;
       public            postgres    false    235            o           2606    41802    core_switch core_switch_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.core_switch
    ADD CONSTRAINT core_switch_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.core_switch DROP CONSTRAINT core_switch_pkey;
       public            postgres    false    233            i           2606    41791 .   core_ticket_messages core_ticket_messages_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.core_ticket_messages
    ADD CONSTRAINT core_ticket_messages_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.core_ticket_messages DROP CONSTRAINT core_ticket_messages_pkey;
       public            postgres    false    231            l           2606    42030 L   core_ticket_messages core_ticket_messages_ticket_id_message_id_429a211d_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.core_ticket_messages
    ADD CONSTRAINT core_ticket_messages_ticket_id_message_id_429a211d_uniq UNIQUE (ticket_id, message_id);
 v   ALTER TABLE ONLY public.core_ticket_messages DROP CONSTRAINT core_ticket_messages_ticket_id_message_id_429a211d_uniq;
       public            postgres    false    231    231            e           2606    41783    core_ticket core_ticket_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.core_ticket
    ADD CONSTRAINT core_ticket_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.core_ticket DROP CONSTRAINT core_ticket_pkey;
       public            postgres    false    229            ?           2606    41940 &   core_user_groups core_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.core_user_groups DROP CONSTRAINT core_user_groups_pkey;
       public            postgres    false    263            ?           2606    42190 @   core_user_groups core_user_groups_user_id_group_id_c82fcad1_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_user_id_group_id_c82fcad1_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.core_user_groups DROP CONSTRAINT core_user_groups_user_id_group_id_c82fcad1_uniq;
       public            postgres    false    263    263            ;           2606    41695    core_user core_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.core_user DROP CONSTRAINT core_user_pkey;
       public            postgres    false    211            ?           2606    41953 :   core_user_user_permissions core_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.core_user_user_permissions DROP CONSTRAINT core_user_user_permissions_pkey;
       public            postgres    false    265            ?           2606    42205 Y   core_user_user_permissions core_user_user_permissions_user_id_permission_id_73ea0daa_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_user_id_permission_id_73ea0daa_uniq UNIQUE (user_id, permission_id);
 ?   ALTER TABLE ONLY public.core_user_user_permissions DROP CONSTRAINT core_user_user_permissions_user_id_permission_id_73ea0daa_uniq;
       public            postgres    false    265    265            >           2606    41697     core_user core_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.core_user DROP CONSTRAINT core_user_username_key;
       public            postgres    false    211            ]           2606    41770 &   core_userprofile core_userprofile_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.core_userprofile
    ADD CONSTRAINT core_userprofile_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.core_userprofile DROP CONSTRAINT core_userprofile_pkey;
       public            postgres    false    227            _           2606    41772 -   core_userprofile core_userprofile_user_id_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.core_userprofile
    ADD CONSTRAINT core_userprofile_user_id_key UNIQUE (user_id);
 W   ALTER TABLE ONLY public.core_userprofile DROP CONSTRAINT core_userprofile_user_id_key;
       public            postgres    false    227            ?           2606    42229 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    267            %           2606    41632 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    203    203            '           2606    41630 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    203            #           2606    41622 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    201            ?           2606    42292 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    270            ?           2606    42252 :   notifications_notification notifications_notification_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notification_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notification_pkey;
       public            postgres    false    269            -           1259    41684    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    207            2           1259    41680 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    209            5           1259    41681 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    209            (           1259    41666 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    205            ?           1259    42186 $   core_adminprofile_branch_id_6d569e61    INDEX     g   CREATE INDEX core_adminprofile_branch_id_6d569e61 ON public.core_adminprofile USING btree (branch_id);
 8   DROP INDEX public.core_adminprofile_branch_id_6d569e61;
       public            postgres    false    261            ?           1259    42187     core_adminprofile_pc_id_018d6905    INDEX     _   CREATE INDEX core_adminprofile_pc_id_018d6905 ON public.core_adminprofile USING btree (pc_id);
 4   DROP INDEX public.core_adminprofile_pc_id_018d6905;
       public            postgres    false    261            ?           1259    42169    core_backup_branch_id_4937ad2a    INDEX     [   CREATE INDEX core_backup_branch_id_4937ad2a ON public.core_backup USING btree (branch_id);
 2   DROP INDEX public.core_backup_branch_id_4937ad2a;
       public            postgres    false    259            ?           1259    42170    core_backup_server_id_e1240838    INDEX     [   CREATE INDEX core_backup_server_id_e1240838 ON public.core_backup USING btree (server_id);
 2   DROP INDEX public.core_backup_server_id_e1240838;
       public            postgres    false    259            E           1259    41955 "   core_department_name_44a68fd4_like    INDEX     r   CREATE INDEX core_department_name_44a68fd4_like ON public.core_department USING btree (name varchar_pattern_ops);
 6   DROP INDEX public.core_department_name_44a68fd4_like;
       public            postgres    false    219            ?           1259    42158    core_dvr_branch_id_f11a9b61    INDEX     U   CREATE INDEX core_dvr_branch_id_f11a9b61 ON public.core_dvr USING btree (branch_id);
 /   DROP INDEX public.core_dvr_branch_id_f11a9b61;
       public            postgres    false    257            ?           1259    42157    core_dvr_ip_545f52b0_like    INDEX     `   CREATE INDEX core_dvr_ip_545f52b0_like ON public.core_dvr USING btree (ip varchar_pattern_ops);
 -   DROP INDEX public.core_dvr_ip_545f52b0_like;
       public            postgres    false    257            ?           1259    42151 #   core_fingerprint_branch_id_c3582e5c    INDEX     e   CREATE INDEX core_fingerprint_branch_id_c3582e5c ON public.core_fingerprint USING btree (branch_id);
 7   DROP INDEX public.core_fingerprint_branch_id_c3582e5c;
       public            postgres    false    255            ?           1259    42145     core_firewall_branch_id_055a4bb0    INDEX     _   CREATE INDEX core_firewall_branch_id_055a4bb0 ON public.core_firewall USING btree (branch_id);
 4   DROP INDEX public.core_firewall_branch_id_055a4bb0;
       public            postgres    false    253            ?           1259    42139    core_network_branch_id_7254fea6    INDEX     ]   CREATE INDEX core_network_branch_id_7254fea6 ON public.core_network USING btree (branch_id);
 3   DROP INDEX public.core_network_branch_id_7254fea6;
       public            postgres    false    251            ?           1259    42138    core_network_ip_13f96045_like    INDEX     h   CREATE INDEX core_network_ip_13f96045_like ON public.core_network USING btree (ip varchar_pattern_ops);
 1   DROP INDEX public.core_network_ip_13f96045_like;
       public            postgres    false    251            L           1259    41972    core_pc_branch_id_a8f1a32d    INDEX     S   CREATE INDEX core_pc_branch_id_a8f1a32d ON public.core_pc USING btree (branch_id);
 .   DROP INDEX public.core_pc_branch_id_a8f1a32d;
       public            postgres    false    223            M           1259    41973    core_pc_department_id_293e76b9    INDEX     [   CREATE INDEX core_pc_department_id_293e76b9 ON public.core_pc USING btree (department_id);
 2   DROP INDEX public.core_pc_department_id_293e76b9;
       public            postgres    false    223            N           1259    41971    core_pc_host_name_0ab30605_like    INDEX     l   CREATE INDEX core_pc_host_name_0ab30605_like ON public.core_pc USING btree (host_name varchar_pattern_ops);
 3   DROP INDEX public.core_pc_host_name_0ab30605_like;
       public            postgres    false    223            S           1259    41974    core_pc_user_id_94629ab6    INDEX     O   CREATE INDEX core_pc_user_id_94629ab6 ON public.core_pc USING btree (user_id);
 ,   DROP INDEX public.core_pc_user_id_94629ab6;
       public            postgres    false    223            ?           1259    42118 )   core_permission_apps_category_id_67c2f9d6    INDEX     q   CREATE INDEX core_permission_apps_category_id_67c2f9d6 ON public.core_permission_apps USING btree (category_id);
 =   DROP INDEX public.core_permission_apps_category_id_67c2f9d6;
       public            postgres    false    247            ?           1259    42117 +   core_permission_apps_permission_id_e8846558    INDEX     u   CREATE INDEX core_permission_apps_permission_id_e8846558 ON public.core_permission_apps USING btree (permission_id);
 ?   DROP INDEX public.core_permission_apps_permission_id_e8846558;
       public            postgres    false    247            ?           1259    42131 ,   core_permission_share_permission_id_9e88f154    INDEX     w   CREATE INDEX core_permission_share_permission_id_9e88f154 ON public.core_permission_share USING btree (permission_id);
 @   DROP INDEX public.core_permission_share_permission_id_9e88f154;
       public            postgres    false    249            ?           1259    42132 '   core_permission_share_share_id_02f6af84    INDEX     m   CREATE INDEX core_permission_share_share_id_02f6af84 ON public.core_permission_share USING btree (share_id);
 ;   DROP INDEX public.core_permission_share_share_id_02f6af84;
       public            postgres    false    249            ?           1259    42104     core_permission_user_id_863744fa    INDEX     _   CREATE INDEX core_permission_user_id_863744fa ON public.core_permission USING btree (user_id);
 4   DROP INDEX public.core_permission_user_id_863744fa;
       public            postgres    false    245            ?           1259    42098    core_printer_branch_id_d0c140ed    INDEX     ]   CREATE INDEX core_printer_branch_id_d0c140ed ON public.core_printer USING btree (branch_id);
 3   DROP INDEX public.core_printer_branch_id_d0c140ed;
       public            postgres    false    243            ?           1259    42097    core_printer_ip_c8858a1b_like    INDEX     h   CREATE INDEX core_printer_ip_c8858a1b_like ON public.core_printer USING btree (ip varchar_pattern_ops);
 1   DROP INDEX public.core_printer_ip_c8858a1b_like;
       public            postgres    false    243            }           1259    42089    core_request_branch_id_8f99b98f    INDEX     ]   CREATE INDEX core_request_branch_id_8f99b98f ON public.core_request USING btree (branch_id);
 3   DROP INDEX public.core_request_branch_id_8f99b98f;
       public            postgres    false    241            ~           1259    42090 !   core_request_category_id_a6e30452    INDEX     a   CREATE INDEX core_request_category_id_a6e30452 ON public.core_request USING btree (category_id);
 5   DROP INDEX public.core_request_category_id_a6e30452;
       public            postgres    false    241            ?           1259    42091    core_request_user_id_ed8c288a    INDEX     Y   CREATE INDEX core_request_user_id_ed8c288a ON public.core_request USING btree (user_id);
 1   DROP INDEX public.core_request_user_id_ed8c288a;
       public            postgres    false    241            T           1259    41981    core_server_branch_id_d9de3d0b    INDEX     [   CREATE INDEX core_server_branch_id_d9de3d0b ON public.core_server USING btree (branch_id);
 2   DROP INDEX public.core_server_branch_id_d9de3d0b;
       public            postgres    false    225            U           1259    41980 #   core_server_host_name_8d0f91d1_like    INDEX     t   CREATE INDEX core_server_host_name_8d0f91d1_like ON public.core_server USING btree (host_name varchar_pattern_ops);
 7   DROP INDEX public.core_server_host_name_8d0f91d1_like;
       public            postgres    false    225            y           1259    42072    core_share_branch_id_d5af6f72    INDEX     Y   CREATE INDEX core_share_branch_id_d5af6f72 ON public.core_share USING btree (branch_id);
 1   DROP INDEX public.core_share_branch_id_d5af6f72;
       public            postgres    false    239            |           1259    42073    core_share_server_id_2cb3f628    INDEX     Y   CREATE INDEX core_share_server_id_2cb3f628 ON public.core_share USING btree (server_id);
 1   DROP INDEX public.core_share_server_id_2cb3f628;
       public            postgres    false    239            v           1259    42061    core_stock_branch_id_57d6f3ef    INDEX     Y   CREATE INDEX core_stock_branch_id_57d6f3ef ON public.core_stock USING btree (branch_id);
 1   DROP INDEX public.core_stock_branch_id_57d6f3ef;
       public            postgres    false    237            p           1259    42055    core_storage_branch_id_bff8f5e8    INDEX     ]   CREATE INDEX core_storage_branch_id_bff8f5e8 ON public.core_storage USING btree (branch_id);
 3   DROP INDEX public.core_storage_branch_id_bff8f5e8;
       public            postgres    false    235            q           1259    42054    core_storage_ip_c48b1a2b_like    INDEX     h   CREATE INDEX core_storage_ip_c48b1a2b_like ON public.core_storage USING btree (ip varchar_pattern_ops);
 1   DROP INDEX public.core_storage_ip_c48b1a2b_like;
       public            postgres    false    235            m           1259    42048    core_switch_branch_id_40110c66    INDEX     [   CREATE INDEX core_switch_branch_id_40110c66 ON public.core_switch USING btree (branch_id);
 2   DROP INDEX public.core_switch_branch_id_40110c66;
       public            postgres    false    233            `           1259    42024    core_ticket_admin_id_776010df    INDEX     Y   CREATE INDEX core_ticket_admin_id_776010df ON public.core_ticket USING btree (admin_id);
 1   DROP INDEX public.core_ticket_admin_id_776010df;
       public            postgres    false    229            a           1259    42025    core_ticket_branch_id_b665cf98    INDEX     [   CREATE INDEX core_ticket_branch_id_b665cf98 ON public.core_ticket USING btree (branch_id);
 2   DROP INDEX public.core_ticket_branch_id_b665cf98;
       public            postgres    false    229            b           1259    42026     core_ticket_category_id_92e9b9fd    INDEX     _   CREATE INDEX core_ticket_category_id_92e9b9fd ON public.core_ticket USING btree (category_id);
 4   DROP INDEX public.core_ticket_category_id_92e9b9fd;
       public            postgres    false    229            g           1259    42042 (   core_ticket_messages_message_id_e1edd78c    INDEX     o   CREATE INDEX core_ticket_messages_message_id_e1edd78c ON public.core_ticket_messages USING btree (message_id);
 <   DROP INDEX public.core_ticket_messages_message_id_e1edd78c;
       public            postgres    false    231            j           1259    42041 '   core_ticket_messages_ticket_id_bba7ff2e    INDEX     m   CREATE INDEX core_ticket_messages_ticket_id_bba7ff2e ON public.core_ticket_messages USING btree (ticket_id);
 ;   DROP INDEX public.core_ticket_messages_ticket_id_bba7ff2e;
       public            postgres    false    231            c           1259    42027    core_ticket_pc_id_0bb84919    INDEX     S   CREATE INDEX core_ticket_pc_id_0bb84919 ON public.core_ticket USING btree (pc_id);
 .   DROP INDEX public.core_ticket_pc_id_0bb84919;
       public            postgres    false    229            f           1259    42028    core_ticket_user_id_6cc7dfb2    INDEX     W   CREATE INDEX core_ticket_user_id_6cc7dfb2 ON public.core_ticket USING btree (user_id);
 0   DROP INDEX public.core_ticket_user_id_6cc7dfb2;
       public            postgres    false    229            8           1259    42188    core_user_branch_id_90a0c1d9    INDEX     W   CREATE INDEX core_user_branch_id_90a0c1d9 ON public.core_user USING btree (branch_id);
 0   DROP INDEX public.core_user_branch_id_90a0c1d9;
       public            postgres    false    211            ?           1259    42202 "   core_user_groups_group_id_fe8c697f    INDEX     c   CREATE INDEX core_user_groups_group_id_fe8c697f ON public.core_user_groups USING btree (group_id);
 6   DROP INDEX public.core_user_groups_group_id_fe8c697f;
       public            postgres    false    263            ?           1259    42201 !   core_user_groups_user_id_70b4d9b8    INDEX     a   CREATE INDEX core_user_groups_user_id_70b4d9b8 ON public.core_user_groups USING btree (user_id);
 5   DROP INDEX public.core_user_groups_user_id_70b4d9b8;
       public            postgres    false    263            9           1259    42203    core_user_pc_id_2a60c0b8    INDEX     O   CREATE INDEX core_user_pc_id_2a60c0b8 ON public.core_user USING btree (pc_id);
 ,   DROP INDEX public.core_user_pc_id_2a60c0b8;
       public            postgres    false    211            ?           1259    42217 1   core_user_user_permissions_permission_id_35ccf601    INDEX     ?   CREATE INDEX core_user_user_permissions_permission_id_35ccf601 ON public.core_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.core_user_user_permissions_permission_id_35ccf601;
       public            postgres    false    265            ?           1259    42216 +   core_user_user_permissions_user_id_085123d3    INDEX     u   CREATE INDEX core_user_user_permissions_user_id_085123d3 ON public.core_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.core_user_user_permissions_user_id_085123d3;
       public            postgres    false    265            <           1259    41954     core_user_username_36e4f7f7_like    INDEX     n   CREATE INDEX core_user_username_36e4f7f7_like ON public.core_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.core_user_username_36e4f7f7_like;
       public            postgres    false    211            Z           1259    41997 #   core_userprofile_branch_id_6bf6e1f8    INDEX     e   CREATE INDEX core_userprofile_branch_id_6bf6e1f8 ON public.core_userprofile USING btree (branch_id);
 7   DROP INDEX public.core_userprofile_branch_id_6bf6e1f8;
       public            postgres    false    227            [           1259    41998    core_userprofile_pc_id_7fab25d2    INDEX     ]   CREATE INDEX core_userprofile_pc_id_7fab25d2 ON public.core_userprofile USING btree (pc_id);
 3   DROP INDEX public.core_userprofile_pc_id_7fab25d2;
       public            postgres    false    227            ?           1259    42240 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    267            ?           1259    42241 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    267            ?           1259    42294 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    270            ?           1259    42293 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    270            ?           1259    42273 >   notifications_notification_action_object_content_type_7d2b8ee9    INDEX     ?   CREATE INDEX notifications_notification_action_object_content_type_7d2b8ee9 ON public.notifications_notification USING btree (action_object_content_type_id);
 R   DROP INDEX public.notifications_notification_action_object_content_type_7d2b8ee9;
       public            postgres    false    269            ?           1259    42274 9   notifications_notification_actor_content_type_id_0c69d7b7    INDEX     ?   CREATE INDEX notifications_notification_actor_content_type_id_0c69d7b7 ON public.notifications_notification USING btree (actor_content_type_id);
 M   DROP INDEX public.notifications_notification_actor_content_type_id_0c69d7b7;
       public            postgres    false    269            ?           1259    42279 +   notifications_notification_deleted_b32b69e6    INDEX     u   CREATE INDEX notifications_notification_deleted_b32b69e6 ON public.notifications_notification USING btree (deleted);
 ?   DROP INDEX public.notifications_notification_deleted_b32b69e6;
       public            postgres    false    269            ?           1259    42280 +   notifications_notification_emailed_23a5ad81    INDEX     u   CREATE INDEX notifications_notification_emailed_23a5ad81 ON public.notifications_notification USING btree (emailed);
 ?   DROP INDEX public.notifications_notification_emailed_23a5ad81;
       public            postgres    false    269            ?           1259    42281 *   notifications_notification_public_1bc30b1c    INDEX     s   CREATE INDEX notifications_notification_public_1bc30b1c ON public.notifications_notification USING btree (public);
 >   DROP INDEX public.notifications_notification_public_1bc30b1c;
       public            postgres    false    269            ?           1259    42275 0   notifications_notification_recipient_id_d055f3f0    INDEX        CREATE INDEX notifications_notification_recipient_id_d055f3f0 ON public.notifications_notification USING btree (recipient_id);
 D   DROP INDEX public.notifications_notification_recipient_id_d055f3f0;
       public            postgres    false    269            ?           1259    42284 ;   notifications_notification_recipient_id_unread_253aadc9_idx    INDEX     ?   CREATE INDEX notifications_notification_recipient_id_unread_253aadc9_idx ON public.notifications_notification USING btree (recipient_id, unread);
 O   DROP INDEX public.notifications_notification_recipient_id_unread_253aadc9_idx;
       public            postgres    false    269    269            ?           1259    42276 :   notifications_notification_target_content_type_id_ccb24d88    INDEX     ?   CREATE INDEX notifications_notification_target_content_type_id_ccb24d88 ON public.notifications_notification USING btree (target_content_type_id);
 N   DROP INDEX public.notifications_notification_target_content_type_id_ccb24d88;
       public            postgres    false    269            ?           1259    42283 -   notifications_notification_timestamp_6a797bad    INDEX     {   CREATE INDEX notifications_notification_timestamp_6a797bad ON public.notifications_notification USING btree ("timestamp");
 A   DROP INDEX public.notifications_notification_timestamp_6a797bad;
       public            postgres    false    269            ?           1259    42282 *   notifications_notification_unread_cce4be30    INDEX     s   CREATE INDEX notifications_notification_unread_cce4be30 ON public.notifications_notification USING btree (unread);
 >   DROP INDEX public.notifications_notification_unread_cce4be30;
       public            postgres    false    269            ?           2606    41675 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    209    205    3116            ?           2606    41670 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    209    207    3121            ?           2606    41661 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    203    3111    205            ?           2606    42171 H   core_adminprofile core_adminprofile_branch_id_6d569e61_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_adminprofile
    ADD CONSTRAINT core_adminprofile_branch_id_6d569e61_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.core_adminprofile DROP CONSTRAINT core_adminprofile_branch_id_6d569e61_fk_core_branch_id;
       public          postgres    false    3138    261    215            ?           2606    42176 @   core_adminprofile core_adminprofile_pc_id_018d6905_fk_core_pc_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_adminprofile
    ADD CONSTRAINT core_adminprofile_pc_id_018d6905_fk_core_pc_id FOREIGN KEY (pc_id) REFERENCES public.core_pc(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.core_adminprofile DROP CONSTRAINT core_adminprofile_pc_id_018d6905_fk_core_pc_id;
       public          postgres    false    3154    223    261            ?           2606    42181 D   core_adminprofile core_adminprofile_user_id_87afbbad_fk_core_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_adminprofile
    ADD CONSTRAINT core_adminprofile_user_id_87afbbad_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.core_adminprofile DROP CONSTRAINT core_adminprofile_user_id_87afbbad_fk_core_user_id;
       public          postgres    false    3131    261    211            ?           2606    42159 <   core_backup core_backup_branch_id_4937ad2a_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_backup
    ADD CONSTRAINT core_backup_branch_id_4937ad2a_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.core_backup DROP CONSTRAINT core_backup_branch_id_4937ad2a_fk_core_branch_id;
       public          postgres    false    3138    215    259            ?           2606    42164 <   core_backup core_backup_server_id_e1240838_fk_core_server_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_backup
    ADD CONSTRAINT core_backup_server_id_e1240838_fk_core_server_id FOREIGN KEY (server_id) REFERENCES public.core_server(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.core_backup DROP CONSTRAINT core_backup_server_id_e1240838_fk_core_server_id;
       public          postgres    false    225    3161    259            ?           2606    42152 6   core_dvr core_dvr_branch_id_f11a9b61_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_dvr
    ADD CONSTRAINT core_dvr_branch_id_f11a9b61_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 `   ALTER TABLE ONLY public.core_dvr DROP CONSTRAINT core_dvr_branch_id_f11a9b61_fk_core_branch_id;
       public          postgres    false    257    215    3138            ?           2606    42146 F   core_fingerprint core_fingerprint_branch_id_c3582e5c_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_fingerprint
    ADD CONSTRAINT core_fingerprint_branch_id_c3582e5c_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.core_fingerprint DROP CONSTRAINT core_fingerprint_branch_id_c3582e5c_fk_core_branch_id;
       public          postgres    false    255    215    3138            ?           2606    42140 @   core_firewall core_firewall_branch_id_055a4bb0_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_firewall
    ADD CONSTRAINT core_firewall_branch_id_055a4bb0_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.core_firewall DROP CONSTRAINT core_firewall_branch_id_055a4bb0_fk_core_branch_id;
       public          postgres    false    253    215    3138            ?           2606    42133 >   core_network core_network_branch_id_7254fea6_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_network
    ADD CONSTRAINT core_network_branch_id_7254fea6_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.core_network DROP CONSTRAINT core_network_branch_id_7254fea6_fk_core_branch_id;
       public          postgres    false    3138    215    251            ?           2606    41956 4   core_pc core_pc_branch_id_a8f1a32d_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_pc
    ADD CONSTRAINT core_pc_branch_id_a8f1a32d_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 ^   ALTER TABLE ONLY public.core_pc DROP CONSTRAINT core_pc_branch_id_a8f1a32d_fk_core_branch_id;
       public          postgres    false    3138    223    215            ?           2606    41961 <   core_pc core_pc_department_id_293e76b9_fk_core_department_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_pc
    ADD CONSTRAINT core_pc_department_id_293e76b9_fk_core_department_id FOREIGN KEY (department_id) REFERENCES public.core_department(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.core_pc DROP CONSTRAINT core_pc_department_id_293e76b9_fk_core_department_id;
       public          postgres    false    219    223    3145            ?           2606    41966 0   core_pc core_pc_user_id_94629ab6_fk_core_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_pc
    ADD CONSTRAINT core_pc_user_id_94629ab6_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;
 Z   ALTER TABLE ONLY public.core_pc DROP CONSTRAINT core_pc_user_id_94629ab6_fk_core_user_id;
       public          postgres    false    3131    223    211            ?           2606    42112 R   core_permission_apps core_permission_apps_category_id_67c2f9d6_fk_core_category_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_permission_apps
    ADD CONSTRAINT core_permission_apps_category_id_67c2f9d6_fk_core_category_id FOREIGN KEY (category_id) REFERENCES public.core_category(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.core_permission_apps DROP CONSTRAINT core_permission_apps_category_id_67c2f9d6_fk_core_category_id;
       public          postgres    false    217    247    3140            ?           2606    42107 M   core_permission_apps core_permission_apps_permission_id_e8846558_fk_core_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_permission_apps
    ADD CONSTRAINT core_permission_apps_permission_id_e8846558_fk_core_perm FOREIGN KEY (permission_id) REFERENCES public.core_permission(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.core_permission_apps DROP CONSTRAINT core_permission_apps_permission_id_e8846558_fk_core_perm;
       public          postgres    false    3209    247    245            ?           2606    42121 N   core_permission_share core_permission_shar_permission_id_9e88f154_fk_core_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_permission_share
    ADD CONSTRAINT core_permission_shar_permission_id_9e88f154_fk_core_perm FOREIGN KEY (permission_id) REFERENCES public.core_permission(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.core_permission_share DROP CONSTRAINT core_permission_shar_permission_id_9e88f154_fk_core_perm;
       public          postgres    false    245    249    3209            ?           2606    42126 N   core_permission_share core_permission_share_share_id_02f6af84_fk_core_share_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_permission_share
    ADD CONSTRAINT core_permission_share_share_id_02f6af84_fk_core_share_id FOREIGN KEY (share_id) REFERENCES public.core_share(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.core_permission_share DROP CONSTRAINT core_permission_share_share_id_02f6af84_fk_core_share_id;
       public          postgres    false    239    3195    249            ?           2606    42099 @   core_permission core_permission_user_id_863744fa_fk_core_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_permission
    ADD CONSTRAINT core_permission_user_id_863744fa_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.core_permission DROP CONSTRAINT core_permission_user_id_863744fa_fk_core_user_id;
       public          postgres    false    211    3131    245            ?           2606    42092 >   core_printer core_printer_branch_id_d0c140ed_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_printer
    ADD CONSTRAINT core_printer_branch_id_d0c140ed_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.core_printer DROP CONSTRAINT core_printer_branch_id_d0c140ed_fk_core_branch_id;
       public          postgres    false    3138    215    243            ?           2606    42074 >   core_request core_request_branch_id_8f99b98f_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_request
    ADD CONSTRAINT core_request_branch_id_8f99b98f_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.core_request DROP CONSTRAINT core_request_branch_id_8f99b98f_fk_core_branch_id;
       public          postgres    false    241    3138    215            ?           2606    42079 B   core_request core_request_category_id_a6e30452_fk_core_category_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_request
    ADD CONSTRAINT core_request_category_id_a6e30452_fk_core_category_id FOREIGN KEY (category_id) REFERENCES public.core_category(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.core_request DROP CONSTRAINT core_request_category_id_a6e30452_fk_core_category_id;
       public          postgres    false    3140    241    217            ?           2606    42084 :   core_request core_request_user_id_ed8c288a_fk_core_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_request
    ADD CONSTRAINT core_request_user_id_ed8c288a_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.core_request DROP CONSTRAINT core_request_user_id_ed8c288a_fk_core_user_id;
       public          postgres    false    241    211    3131            ?           2606    41975 <   core_server core_server_branch_id_d9de3d0b_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_server
    ADD CONSTRAINT core_server_branch_id_d9de3d0b_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.core_server DROP CONSTRAINT core_server_branch_id_d9de3d0b_fk_core_branch_id;
       public          postgres    false    3138    225    215            ?           2606    42062 :   core_share core_share_branch_id_d5af6f72_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_share
    ADD CONSTRAINT core_share_branch_id_d5af6f72_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.core_share DROP CONSTRAINT core_share_branch_id_d5af6f72_fk_core_branch_id;
       public          postgres    false    3138    215    239            ?           2606    42067 :   core_share core_share_server_id_2cb3f628_fk_core_server_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_share
    ADD CONSTRAINT core_share_server_id_2cb3f628_fk_core_server_id FOREIGN KEY (server_id) REFERENCES public.core_server(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.core_share DROP CONSTRAINT core_share_server_id_2cb3f628_fk_core_server_id;
       public          postgres    false    239    3161    225            ?           2606    42056 :   core_stock core_stock_branch_id_57d6f3ef_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_stock
    ADD CONSTRAINT core_stock_branch_id_57d6f3ef_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.core_stock DROP CONSTRAINT core_stock_branch_id_57d6f3ef_fk_core_branch_id;
       public          postgres    false    215    237    3138            ?           2606    42049 >   core_storage core_storage_branch_id_bff8f5e8_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_storage
    ADD CONSTRAINT core_storage_branch_id_bff8f5e8_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.core_storage DROP CONSTRAINT core_storage_branch_id_bff8f5e8_fk_core_branch_id;
       public          postgres    false    3138    235    215            ?           2606    42043 <   core_switch core_switch_branch_id_40110c66_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_switch
    ADD CONSTRAINT core_switch_branch_id_40110c66_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.core_switch DROP CONSTRAINT core_switch_branch_id_40110c66_fk_core_branch_id;
       public          postgres    false    3138    233    215            ?           2606    41999 9   core_ticket core_ticket_admin_id_776010df_fk_core_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_ticket
    ADD CONSTRAINT core_ticket_admin_id_776010df_fk_core_user_id FOREIGN KEY (admin_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.core_ticket DROP CONSTRAINT core_ticket_admin_id_776010df_fk_core_user_id;
       public          postgres    false    211    229    3131            ?           2606    42004 <   core_ticket core_ticket_branch_id_b665cf98_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_ticket
    ADD CONSTRAINT core_ticket_branch_id_b665cf98_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.core_ticket DROP CONSTRAINT core_ticket_branch_id_b665cf98_fk_core_branch_id;
       public          postgres    false    215    3138    229            ?           2606    42009 @   core_ticket core_ticket_category_id_92e9b9fd_fk_core_category_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_ticket
    ADD CONSTRAINT core_ticket_category_id_92e9b9fd_fk_core_category_id FOREIGN KEY (category_id) REFERENCES public.core_category(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.core_ticket DROP CONSTRAINT core_ticket_category_id_92e9b9fd_fk_core_category_id;
       public          postgres    false    217    3140    229            ?           2606    42036 P   core_ticket_messages core_ticket_messages_message_id_e1edd78c_fk_core_message_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_ticket_messages
    ADD CONSTRAINT core_ticket_messages_message_id_e1edd78c_fk_core_message_id FOREIGN KEY (message_id) REFERENCES public.core_message(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.core_ticket_messages DROP CONSTRAINT core_ticket_messages_message_id_e1edd78c_fk_core_message_id;
       public          postgres    false    3147    231    221            ?           2606    42031 N   core_ticket_messages core_ticket_messages_ticket_id_bba7ff2e_fk_core_ticket_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_ticket_messages
    ADD CONSTRAINT core_ticket_messages_ticket_id_bba7ff2e_fk_core_ticket_id FOREIGN KEY (ticket_id) REFERENCES public.core_ticket(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.core_ticket_messages DROP CONSTRAINT core_ticket_messages_ticket_id_bba7ff2e_fk_core_ticket_id;
       public          postgres    false    3173    231    229            ?           2606    42014 4   core_ticket core_ticket_pc_id_0bb84919_fk_core_pc_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_ticket
    ADD CONSTRAINT core_ticket_pc_id_0bb84919_fk_core_pc_id FOREIGN KEY (pc_id) REFERENCES public.core_pc(id) DEFERRABLE INITIALLY DEFERRED;
 ^   ALTER TABLE ONLY public.core_ticket DROP CONSTRAINT core_ticket_pc_id_0bb84919_fk_core_pc_id;
       public          postgres    false    3154    229    223            ?           2606    42019 8   core_ticket core_ticket_user_id_6cc7dfb2_fk_core_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_ticket
    ADD CONSTRAINT core_ticket_user_id_6cc7dfb2_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.core_ticket DROP CONSTRAINT core_ticket_user_id_6cc7dfb2_fk_core_user_id;
       public          postgres    false    211    229    3131            ?           2606    41928 8   core_user core_user_branch_id_90a0c1d9_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_branch_id_90a0c1d9_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.core_user DROP CONSTRAINT core_user_branch_id_90a0c1d9_fk_core_branch_id;
       public          postgres    false    211    215    3138            ?           2606    42196 D   core_user_groups core_user_groups_group_id_fe8c697f_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_group_id_fe8c697f_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.core_user_groups DROP CONSTRAINT core_user_groups_group_id_fe8c697f_fk_auth_group_id;
       public          postgres    false    3121    207    263            ?           2606    42191 B   core_user_groups core_user_groups_user_id_70b4d9b8_fk_core_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_user_id_70b4d9b8_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.core_user_groups DROP CONSTRAINT core_user_groups_user_id_70b4d9b8_fk_core_user_id;
       public          postgres    false    263    3131    211            ?           2606    41941 0   core_user core_user_pc_id_2a60c0b8_fk_core_pc_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_pc_id_2a60c0b8_fk_core_pc_id FOREIGN KEY (pc_id) REFERENCES public.core_pc(id) DEFERRABLE INITIALLY DEFERRED;
 Z   ALTER TABLE ONLY public.core_user DROP CONSTRAINT core_user_pc_id_2a60c0b8_fk_core_pc_id;
       public          postgres    false    3154    223    211                        2606    42211 S   core_user_user_permissions core_user_user_permi_permission_id_35ccf601_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permi_permission_id_35ccf601_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.core_user_user_permissions DROP CONSTRAINT core_user_user_permi_permission_id_35ccf601_fk_auth_perm;
       public          postgres    false    205    265    3116            ?           2606    42206 V   core_user_user_permissions core_user_user_permissions_user_id_085123d3_fk_core_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_user_id_085123d3_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.core_user_user_permissions DROP CONSTRAINT core_user_user_permissions_user_id_085123d3_fk_core_user_id;
       public          postgres    false    3131    265    211            ?           2606    41982 F   core_userprofile core_userprofile_branch_id_6bf6e1f8_fk_core_branch_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_userprofile
    ADD CONSTRAINT core_userprofile_branch_id_6bf6e1f8_fk_core_branch_id FOREIGN KEY (branch_id) REFERENCES public.core_branch(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.core_userprofile DROP CONSTRAINT core_userprofile_branch_id_6bf6e1f8_fk_core_branch_id;
       public          postgres    false    215    227    3138            ?           2606    41987 >   core_userprofile core_userprofile_pc_id_7fab25d2_fk_core_pc_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_userprofile
    ADD CONSTRAINT core_userprofile_pc_id_7fab25d2_fk_core_pc_id FOREIGN KEY (pc_id) REFERENCES public.core_pc(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.core_userprofile DROP CONSTRAINT core_userprofile_pc_id_7fab25d2_fk_core_pc_id;
       public          postgres    false    223    227    3154            ?           2606    41992 B   core_userprofile core_userprofile_user_id_5141ad90_fk_core_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.core_userprofile
    ADD CONSTRAINT core_userprofile_user_id_5141ad90_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.core_userprofile DROP CONSTRAINT core_userprofile_user_id_5141ad90_fk_core_user_id;
       public          postgres    false    211    3131    227                       2606    42230 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    267    3111    203                       2606    42235 B   django_admin_log django_admin_log_user_id_c564eba6_fk_core_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_core_user_id;
       public          postgres    false    211    267    3131                       2606    42253 Z   notifications_notification notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co FOREIGN KEY (action_object_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co;
       public          postgres    false    203    3111    269                       2606    42258 Z   notifications_notification notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co FOREIGN KEY (actor_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co;
       public          postgres    false    269    3111    203                       2606    42263 R   notifications_notification notifications_notifi_recipient_id_d055f3f0_fk_core_user    FK CONSTRAINT     ?   ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_recipient_id_d055f3f0_fk_core_user FOREIGN KEY (recipient_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notifi_recipient_id_d055f3f0_fk_core_user;
       public          postgres    false    3131    211    269                       2606    42268 Z   notifications_notification notifications_notifi_target_content_type__ccb24d88_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_target_content_type__ccb24d88_fk_django_co FOREIGN KEY (target_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notifi_target_content_type__ccb24d88_fk_django_co;
       public          postgres    false    269    203    3111            ?      x?????? ? ?      ?      x?????? ? ?      ?   +  x?e?[??0E??UdE?????F??u4#?u<3??+??xi?E?r???t?~?á????~?2?s????q???LH???`(?R?J?-<?bA?R?N?W??n(t?fS???׫W&5??g?3 ?{A?ò ?WU4dr?ɖ?y??\??g_QN?ً??aFJU Y?q??qX?owX?M??I???_Ԩ?????'t???h???n??k?K?~?mOI?W????2왱c=?ʣ?)??2Rd?a\???k?;'-???IĆfA{?$cs?U?H?O?֤|???.?x??K>eCL&`# |??P???&?59?M?Jeⰻ?Z?;&?;l?????H?^?gn???5ɞ?2???
d??!???$$??"???>?m?HA浯L0?g?dI	??5?9?m?4!?0?????
zZ莯M<,ʎH?lX?=??`X6?"????o????९M8 b?̙? ?z??? ??2???:W??b???d???OM
?TY?????!O??c\?bz??????'Sڊ?&K??m?r?%
?[n?D\L?:L?????ot???????[HC??m??????h????eX+??G?G?Z???xEXT(S?J??PP??$%!??_???HA-?V?l?Z?W?2U????LAM+C?*Zѯe?S?S?祿??H??3U?(	?I	S?U?pE#N??_????2??1??2gcB?x??0強sp%5???;? ???F?H??!Ȃεz???3?WR?楿???]2g*8???0P?)30??}?gW?tOK???B???s?r?"?Ù^)j??@???ھv4?_t?????m???G??ܰ????!,???p%5x^??T:@2?
g?8?N?????Ra????9|?ϧ+????7??c1%M?d?LG?????w?T?<?㺗?"[ZO?gW?QY_{#;???-??Hknn_????Ǐ???Oe?J?I
2d% "??4W?C?Ɵ?{?ђ=?⻬	?22*fҠ?˂A?qY??????!^R?O??/????;&?;??a?@Fv7???_?????jܠ      ?      x?????? ? ?      ?      x?????? ? ?      ?   ?   x?ՏMk?@@ϳ?b??A?U?Bom??5JS
ec?P???	???G?	?aN3<? ???}m<""!???8>ѹ?~I}TNd??K?\m?clzD?=p???? q??2mg??3a?s}N?ΜLk9?,,?
>BR??J???T#?&?h' f???u??H???T?M?&nA?`?X?s?k??????h?|??8u???K-?}?V?{??r???
???????4ɢp?N??0rc?>?T?      ?   &   x?3???2????2?w?2?t?2?t
?????? Q/?      ?   5   x?3?JM??2?t?2?t?2??2??H,J???(??+I-?????? ?H
?      ?   c   x?3???2???2?t??K?KN?2??IMO??2?t?2?t??+)JL.)???(??J1-9?R?K2????8?=??9]sS??S??+?b???? ?B?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?   k   x?u?=
?0@?9??Pl????K!Ac???X?
??9p0???z???Xd??&W:*???@???#?&??g?o?c???U?f?K???0`?n^??.EN?_3U?x??/      ?     x????r?6?????E.ҙ?Ƒ{E֩?%ETm7?Fal5???z??]? R??????????b?P?_??v?-??#?$??d?(???OJ?<m?h???+=?I??G?????)\?????????:??????C??K?Xt??[??^0???t0<A?;مHo5???t1o ?? ?5?D?&b0\4J?T*?~????;??|???e?M?]J?)?u?b???-?4y??Z?z?fy??L7?F?]???|L?--si;~?7??tl6hi?K#??1???_?Jѣ???????:U??P??㟛d?<???R???????GZe/G?q2?????"zw%f(N?Wx?eO?F?Oᇐ3+a?)????.???*+Dm"˱?'?Lʏ????BjN????;?r?T?g"r?)???5????x?'??skʁ??_??1VC?Ko?b1ƋC?HQ??C????k/?x+	??>?|{y??=?z??????N?7???u?Ik0??t?w??7Y?????b?̔+?Y?F??_??ERP??|???X
?]
?ʇ=???NWA?t?*RX???U4????k?}???ao?s<N??k???)*?"???z譇??1??F{V*?|Y??.R?U$?c???ۊ\?ƚ????????Re?ˤ+(?K?K?	???~??????g?????	?f2؍@iqz8?'???????O ??OH????*HG????w?+?YXSX??}?q?????֩??d#ê-??8#???jف*?R}?Z??z??0t?مF?????/p?"?n???r?#?E?x?a??? Ս?Cz?3??C??O?M???#??Ѓ??4?s\?v?-??C;???#????????ՄM?W{?!կ?mBpCf`?Z??8?]*i?Z??t??Z5I_w????p%?/???@??(??I?煎ǘ1??By?????ev8??K~̞??_??Vy?ػ7?A(???YP?[~k????$Kk?2???'O?,?_?R???ci`?? {ni$K?>?ؘ?%?v'ɺ?"???Jy??sS~???>l6?8ٻ??'K?sw???
G??7.B??WF?F?L??bl`.??>#}?12+z?v? ?k<d;|?j???????>?I??f?k??fhG?Zs)??e..?Ie?*????C??ÒD??}+V???}8????<æ??I?g?????	??5C?(??????n?V?rXəgͨ??:? bV
/)??9?n?G?Ϡ??:y?e?	??OxMS?,YD??h?I?X?5(?P0e??^t)pe$v??"?Ď	??(??	?e?H?k"????G???????lh`x/$??,?nP?? eq7??[c?P??l????bnjww??,??[0vS&?*?l????cm ?t???hIU?Tdkq??h8p??V*??V????рav??????"???h@E??v???d?ŏ???wuJE??????"V?mܒ_??+Z?'>?????n????:?? ??Q?R??k=??Ǆ?7?jS??t=$T??{{\mQ9-חd?????|˦Xf?&???? ??.f??'?????a??????-?IQ??Q?aQw???*\[%.?"ҨV?k?????????PB??u?κvD?*m?eO???????^????$8????h???^???{?ޱDU?Յ?ܗ???*??K-???k???օ?????aJ2????VqB???B!W??WruA~??%Qz8?j?tN?׷ʩE/K?.?y W?k????[?,??z?Kkt?]o),ݤ"+????L`e?O~???v?x?      ?   ?
  x????r9??????W??]W???]n&b???v???L?<?<?<٪?T?R??n?7 ?????*%?y{y???_?j?9U朝3?????????y???????h%!ͧ????oO-%?Ϗ??????G??g?;??L?3?ϸi???o??O??h??+?agWsH,#?w?7-k?????WN0ݮo?~?i?6_???Ub?%????I??v?n??<?~ݵ??iN{?8'?????k?$?@??9K??8e?\ 4??9J?A?i>}??????3;	6̱??q??r?;??9??s<???T,?;?rJ?!w?cK?V?X?c???)?U?f?Q??pR!???ڂ?}????pf????ri??%?F??3?gk!L?0?`?1Ch<?&?%$??R?"NX'???դp)?XJW?\?? Ì??r?I??9<??????g?6#?!fNv?,?1?0?RPy??|˨?v??n???Ƭ???l?yb?81??Kpb?????Ȓ??qz?f???&$?E?????'?I９?U	??
5??e??A?????????z?c??v[??6n?]'?????׼???&?) ?i????=?n?o*<3wT9!????-i???[??????u斅??????<sRd????N??s??+???X:???GBlxʞ?;Ɖ???=?%Z?;? a?]՘*?1?c?FtZ;??h<???W ??=????	G?w}??b??"q?͐?cܼ?؟f?}?e1?L\?d???Ŵƭf?vN-??j???H*????9f?-|s???4	۷??ѣ?(??ΊmdR?????p???c>?v0?????O?v?^^?A??TPg???Co?*?2?pS???????Y툯??͋FQ?ѡ?ׄ??N!5??ԙ;c?O?._F?_?? ?N$\^?ċ?Tv??d???d?[?SzS?/???S??r?'p?:??+?Rn?S?8'\??7?\??f?_͙#34 ?d,i?yʮ,???>L????6????ʡ|??5?c?|?HM?7?L???9?l?`(2OZ)??S???
?K?? %?j^???^??%F????????ĳ`/AN ϱ??E?"?R?ĭ???,w?V???'n\3????????+??%?j?(?;?E??݂???%[?VK*G?&s?(?X>?	0]c%XѾ??V	|??}@*<??ՕHɣM}1?qޑ????^??????C?6E???t{?>????:ҕ???J?Q ??a?N??S䱽?S?]?ù#???p?+AeC7??}Q?lK뺙c?%o>????4?l?n??}???c??2qj??22Ѽ??r6?w$,[??????!0Q? ?pg???$?و ??[?\???T?b?*??XW???Y6ôu????רMӸ1q???L??h(Ϊ?"0m?i?m?6?\"????)??Eu??M?6ő?-???f٤?>?R??????ٜ?[Pʠ?n?^yx?-&??7:?8???r2̛*?&8?S?Mj???;U?N
?I?;?Ъ??=UfO
??B{??=fO?y???B?Ѱ??⬖-????xWjC{??=fO??????????=Y՞????k?:Π=Y?'&??S?L>?Bw??U?????8|;???Cc?<}??2̞:????E9r?o??qN?y?M????47??Xe-9ŴU??ɠ5yݚ?a?zH?}QIȠ5??j??v?q2Pk?89?\`?v|?"P:?bԮ;?g???J?6?[h???´iԆ0)?e][c?,jëZZhם??a=????um?i?????B??k
?i˨Z??L???&|R?UԆ?5	?Eݘ?a?:j?s?v???-SpL?ć`8'?Ю?RL;?^????K???F_R?߃/???G??3?L?	{?p??ןi?uo
̛6y??????{S`޴?ax3\E??]????i?7a[(?dV?;mp??VqQ?S??)w??ҋ?(??*?)????Qf??s.???7Q$?(*???Qf?)F^w???8%$?????zݡR??tT???P?;Tj\?ű??+?ʺG???y;HGY젲?Riqu???+?PYw?"?z????Rx?h?|ݨ?0???QQ??,?Uݩ???????ƄW??(_??*??y?????qORu?*??ۨ*Ax	K?u?*??S???!m9?u?*??Ө2R?R?nV?Qu?A?	/?ib?^U?Q4v??<zݫʢ?"??2?8,b?nUMPq?AuWŎ??F?W?8?;SŎ??>?>?|}^?8??u??¦vP7QT0??%?u?j??ۨl?L?^????:#Q~?Z?T?}??N?:(`?????TkT??G405?l?8??????w?#Ӊ?a?~&?"<?? ,?seZL???@??+!??a?c"A:hY????3^%ʓ??J?i5????8䅏?U???{??
8?L?1?? 9???\?$???gh'?????䄧P?M<???Lxr?6?T??x?$HP3?|???wh>ʣ???e??&?7?y?7??i?3? ??b)??9??[|0?MΛ7?7???v???h?V?I??P?۫??
??y?{???????c????? ??n?o????_o?6l? ??0k?Q?@)?y?t???~? ť??1?D?y??~???yj?n?m>Hq+?Gy?P??????-??? ?4F??+???}??? ????1?A?Y??<~?|??/N?~t??-*Ϛ??????~? ?8???!??"?????o??Q??Gm?_WL???z????      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?   O  x????n?8?????U?^8????8M6u?F?mX?????@r6u?~G??E?2?pR??8???!?????:?9??Ȁ?nG???oל??mL?????$??ܭ??2M?%O?x?Θ@p4?a?=??r??Y ??wP???p̰z8?6?kR??) |??,?e{BG<j?????$Jma4?f??f???-m<wS3?iP;????? B?"?6h?y6?53?}?"?'??>??3?R1?<??aV-"v??:h>???jz1%Էlr1???LA?????ϯ?c???_??X?A??J?*)???2?安?ۻD???%?	?M`].?Ofq??,?????{???ǌ??jQp=?sy???J?y?nx?????o?|?@P? l2???z->?I=??l	??Z0c?^????2}Iv?z>?uJ]N?[~??;p???Mƿ?<??[!???e?qr?)5???H???g??][?Y??>??3ö?x???pB?	??>?,???0^?E?Iۣ???-???@?^?V3?j?>c??|?BX??|+?t? ̇?x??羏???׻??~BN?tA??[?????p>??4Q:??1???)?.ux??l?e?֣Y?A`???E^W??~?YOG???*???<???A:?u?e??-7<?b?????y??^t??y?r?{?<1?CDgHR???2???th??e#:?%?98<???FG?M9U?A.?pǡ?(?Q?h?Б mv=?=f??#??t ??{?7Q<??f?=? ?t?/a??$?M?'.?hC??%??MJ????kG???2<?o#>??ɳ??=O_?_?????n $F[*????`??W??DX???YY??V????+??:Z???>???K???F%?0T????m?????8}Q/??)b˛`????)Pm???W]`T?E?????D?4;$??q:[?mη?I?ؐ?`Z7?e??? m?}`?]?<F)'?A8&?5??R??0??Q5? OU?????g?uH9???pY?Ekd!1I'?LL?.w?c#??~??z72??TcJM??b"?0}?Rs/`S%7???Q0?dt?AT???6???^?F?1?;6??[???????:M ?g?
?$dj=????!T?
?3?Mw?s??ř?U?d&;دm?NL???_ѓ??$eJSR?wT7?U$??HUT???!?b??)??3?<??????HZ??Q`??p?P??+?E.?^?V????wr*Twra!V???@}ӈJ?ޤ1??>#???}?ޝZPhM1?l?-#??,?7͉?<??g?%Ьߤ٘淋?t8s?0ht??d?Q?m?9??"23|???idO????Zv]E?e·k?? }l??????`^?K(???
?E?$????3?(??B?Y?B?T??P2???l
????????????L?}LƊ;P?e?Y?5ֆ????ݗr???&???&5+?j?y&?ΡF?~?g"??XbL(?.f???ۿf??????b???Ǿ&4W??۾?Z@M???X?+)\P???nu?ƷsAMP???]????d??Q?r?G??q?a=8??]?>?)(͑??U}G0Pf? ???nC"???NA
{?/???????-?q????;ˡLGX/??z?=Cn+j??Mu??$UlAv???a???ZZ????UXz?r??k???)	2?W?x??????
?_???xb-lQ?(?+4)?:?i??NǄ.?.?|W_?)n ?jXq?{?x?,?/?|Gڋ4?DT??EA???.?[^m?XU?e????UP{?V?m?????݉ow????ⵥ?t:
*A:?D????ݫ
?"?Z?lz|?i??&??h??l<?l?뷃k=???????S??Z      ?   d   x?M?K
?0E???^lM??b?(F???|??^\?)??Bj????!~?????????ޞ???U͹?Y3j⿗?o:vLZCz????l????"z 2- ?      ?     x????r?Z???S?j??^'-?Ɣ??LUn????B?????m?	?!??M/????gj?+q??_}?V?e
???tP"d??????Q8??!߄?w????w?D?????T?????i??K????|??LEg??tz????Y??4?l?/7??p?????$*D??u?Q?z9?XV??<????"*/?~ +#T??F6??j???*?/???,G????"?h?>$N7???K?R?a2?$Xa?p????]???K????jv3%_??_?n??.?6??????>R?5E??@??6Z?\??UN????{x??????z?32?϶???cP/)??gˈ|????)??{~.~=???=?a??΅?C?B??#Q;?_;??"LGN?<m?kD[??B?E?=\,???ĕ/?q~?Ҩ?숇?a???Y???[Ј~?2?UY(??:`???\o?T??ĨԢ.?1L?q???N?v,j?T?Hw?V??7M2?1??R?????q?~???m6b???1???(#??\,]E??lG???'@ ??
H??Ie?8?{?x??ǿ[??@8?/"?bQF?????s??b?Cv???!r?H?0?5????X(??$?L?(e???w?%/???~?A?@?(e??|?c?]m<?on?????B?i???f?b??<?*??k?u???*?A?j?? ?Э?|Ou,A?a:j???4?ɟW?????kBtL@?`Hj?2>2Q??"n?9???1iPLJ???f:?On????W?9ǥ??A?)kn??p???޺???i:???f?4L9?&Ĺ?
NU??PbI?f?N;9?&Is??KEͅ;Պ??y淂?d??e??X?o!E#/=yhjb??AA???????? "τ4(!?zK޸????5@{???Ǘ/au/??c???!?BSU?<???𥉒
???"??I?bR5C?z??v?_ū??<??K?0"?HU#2??ׇ??)??&m'K?|0'c???z?l{?r0?o??\?ݥ?(U?3/?տ???eR?^<6̨*?]S1?|Uǿp?Tf????|`??5?Fݠq?/ݖ)
B??ǠjT????[9ԡ???xԟut?+vG????a?>??0Ac??Z??????'6???a??:+??2??.;????!?Q?j??|?~?=?w???y?[=9'?r?v?s>V?r?3?(FQ?C?q?jk?????z)???2WޯxT???X?Q?jsb?~W	??????P???ÐM-????*?z_?ѧ:???1
b?Xv??p??)5S???v??I?KcLf??Y?c?y?????KS?"?-ş?????-?l??x*ύzAnKG^;??.ZK%??dQ????'???&??????<?Hs0+ɢ??????8;?3?FYg???:?Zc1b??oQ?????Hl?JC?X?E??!?L?(???l???n{??6?"i??D???̯-e?IoQқzp?????ݤ??,?o&K?TP93?-?t>?J?e?h??CY;?'S'SfY????/W/\/?9?;G???A?g[?Ǧ?????iӶ?_??=,b???6???`?};???S????????7?m?_???AE??b|ʲiQS0???r:?%?b??[줢???fv;_?6??4.?(Fc:jP?35?O??4??Rƽ?f?.5?5??-???????kpz?.?lvs?9?b???
??eܬb?Y?~޷???
#ԁҧ?!JPjƺ5?.fN\5?Z2?1?(A?O??????z"p?=(V??[h????e&g??e'{2?'G??+h???/OĶ???v\i_?y??"?+??5*?Q?I?R?=??$?dF??P<ڨ3?8???>?]q!?׍?VG?h??=??q?
????CA??P?z?????&??<?????? ??=?????+<? թu??4@	hU;?9]?g?m?Kl??0?=??????8??????h??l??5^??姛XPԍ????6>???e?j?ձ"`?
<k?E??]?I?xLA(?lC??u?`}???:?G0??^???*E?e????Z*K4      ?      x?????? ? ?      ?   ?  x?}??r?@???)?t
2Z]???l??8E????B??Dl??q?q?.I?W??&笤?d2.????\??e?*K??D????~?
?2ɥ???(:P?????N?t|?X??n??RL2
?@?I?f??^Ιi\???3??{f?F?'m??|???@t\P{??V?{??A?y?:?.??>CȌ?????bw#y?D?)?$s?d-c??lR{??fK?m2s?)?a????:?IƹHi?3?~9M3Lt9??RImU>?c???f??-Vw?!:?u#L???=CT??!???A?":d???? \(????-?Ϳ#??"?4?y?ӝ?u???&	㕢NCǐu?????????jF?۔y)a?	??;h??}=IꔅXq??????^?5?+H???(?;=?1p?,?J??ԫ??6I?
?V????򑖏????x.?X??x??=)?A|*~??G?<??}?T>??Eo??4?u???+??zW?????f??Ug?????>?h??Y?d`?'?M?$y?SA1??t?#?Z9?U???4?[??)?W???ߋj???0ִ??4'V?֭?????la?i??%??p????@7?K?A~x*N/>???a???fĕW???=;-?x1??WCo@=???"Cb?e?T?`*r?ōpZ=F?;?tq?U/?u?j?译?$???t?ק??'?n9?? (??^??P=???m?Z?`?      ?   ?   x?m??j!F?ǧ?"Ψ?z??I?إ??I/??????;?&?lˠ??9?#®?^??}?j^
QCW?}?v????=??4??????b??&??H?ȑpyb ??W??a?ܘ?.?ʩiŏ?[B*?W#ٲ#?_?P??;,1?y?	?L?r?t??^???r?yL|?o6c??]??5???)C|B??/??*????y9??z?>͹?e???An?i6??hFNubPB?me?      ?      x?????? ? ?      ?   1  x?m?Mn? ????? x????U=?7?`ǒ"#????MR?l??<I>?-?H??8	8P?^I/9V[?/]U0??FW??9???9?"ʒD '?S???8??o^S!??^3 ?????H?1l?#?O`آ܃aRj	??p???!l?c??l?Ъug?V????B??1??+???E?l?:??H'z_?^??9-tZ???R?ݐug??M??ƃeBp@y?|?e?Yp??u?tI??0F????^???? ???~?\y?(?6?q8V?????C?U?Wh:?*ۧ?C9?ÿ???m|??׳???v.??      ?   .   x??I 0???J?U.口?æ???j?'?TѺjf?>?A?      ?   ?  x?u??r?@??ۧ?멐^ٮƅ?q??K*US@ETp???qN?z?? 眏?
j??xmƤ3n+]Gn?f^?????s6?5w???)2m?!FO?aREXǲ??`i?/???т????Z_d?K,????M,?Q(?????IE2?qVjV	V??a	ɪ?	a@???
|?/?UPs??????r??̭?yԫ7?-?cLf?MÀ?Ϟu????X?"E?P???Ȑjy????&=^???7??'?(%??``FX?Q΀?"????? ?Z????"?Z???/?#94??KK????[χ??M?`?????I?["?U"*?D?L?l?A???_?!???????Np&?"???U%?Ϳ?Es?>?%????Y{70!?	O???M??,0?WJ??ն?G	????c0?{?ƨFu?u?$?^?퀕Œ,y????PD+h??1?'/v???u????ȱ??:?q;????<?V??,L'??p;??p1J???}???<4?i?|-???DȦI
T??tu'??~,Z$????B??c? ?vt?Uu?u
o????Ԩ$???P3?ֱ1M?J??O??u?)???{n:??c??7?􉬻?)?ߚĠ!*^???W?b??dÙ?????l?dTe??E??w)??<Ԗ?=?G?<:??͠3?N6sx?F???ٙ3?_??Z3M?ObH??<?9F?7?%?X1??S?]?~??????
?B?/?R?????      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?   ?  x????N1???SD??X?????$$T?@9??-?"?j?K?x??ㅒx?D?~??ofAh?? ???cP???h????(-@\5͒??>M????O?????? %`?h+=?|??8?.?8?zi??-??dZBM?Z?Z{I#.????(mBd??~?????}?V`?	????NL?E?i?R ?H?Z??
f?>?*?$j?gO/??h@??D!???????3@Z?Bj??a???K.?O?:?)??[T? ??.????\?ܢJ{Iθ?2?Hu?L'>?MQ????ُRS 3?*4҂G?=>?*O?V???}???l??m@?U?H"e?ME:o???"?9E?!D??$??>Bf??TCcHG?????t?l?.e??.'J[Pi <O??w?^D&Y?5@ol?@???,Vm9d?6?ɪJ$k??-<'g?Rh????Q.-B>?m?t?M;?[????"??I??	?TZ6??????n?S??עy???????c]&w1?b??3?8*?~?kѬ???s?n 4H?wo???r?.???ͪ?\8??c??{?7Va:{???<?+?w???o?v???{????????ˏn?u??67?7??1ĪŽ?O?ibN???F	!??&JJ?RӁ??q?m???qO??~?^?GleH?=?L?;?7?????S??      ?     x?M??r? D??c:?$N?/?,یm?B?'_???7??}?V??}PS?10=?(?????s?1??8=?%?Y?X??3a>
????F?hT??;?,o?Q?U?	Ւ????6?C???w??????m죐j]??%??)?,??GЧ??}.??=?P_>??b?'9???Q?*`^=??+c?H[??????????h?fS?yy/?s}.k*_@^#I`?<?j?	L??1K???>$??ݭ??L?۾w??? ??{??      ?   f  x????j?0?'O??????ϲ D???V?K??+ɉ?????????q?n??kr???>z?? ??!???:?N?Js???7J4????3?&?1??]??Q?`????8rEDY?U?E??B??ُCY????tn????(?????E??eN?[??Q(aLf???
ɗ??q?s??B"?Y???9?n??T?ҵ}?? ?Q"R3?->?n?6???7?h1DW??o??v?b?fc/?B???<ۛ??,?????T?jZ?c1#???J??~?B?U??䎺?q?~?a??????eJ93????%?m?К?¨Q|????O?????i&??$
'??r,???K??}?????`?fJW?z?f?1iB?D????'$?˞c?kgo??>?s+d	Ɓ3Qb?0??_?????n5?
?6?V?kH?Df (kb?B?z?j^o??ۤ(N)? n)?e3
??M??Ht	?-?W? <A??ʷ<%??*??-F$[/???<?V???|????ѧ?#?~ZIM?"Mk??-G?JSj?{???~??????V?0?E?2?av???IJ??YU?(CU?G?p[?!??,?X?!$?"?{:??r?	?      ?   K  x???G??F????7$4??cR)?A?`@`N͜yzK?ذǰ?<?CU?8????,L?z?]C?f????up??T??1?/?u?_??Qf?رG???PEB??bR?cy$?Nu???UWͣ?nyo??? ?
^ZM??
?C???P??0???r???.?HU??w?z???t+??!?+>???.^*R?f ???f?H8,*%hx?6D??l????*??Wg?W?2??N???????&??>k?~? ? V??N??l Z3???_???l?G?͐WR.?l??8[??gH????@ʶݐ??fT?Ay??$j??B!&/E*?@??z?Ƥ0?????4bi????7?1?N(j?(r?zIB??a0?U?oB?W?v?%?v?%?????Q	????e?s?V?,l???q?څU?\u?L+?"???Ƕ?H?????"'4N??k??ou????N??????????\ ?yD?!???r=S9??K?Fz?hH?m7??>?????,?D?M??N0?-ĭ)???ȡk?q??o?? ǥ?;?<3mҁ?!??:d\?|?F8
N??G??:??D??w?(xd???????)?=?MG???)-'??}2Z??:?ޖ?t?^J7????k??f?:?e?G??{??En?Q?%xg?? !*ٜ^??DC?aSON˗ʡ???m?a߱?s?O???G?(nC?5E}???KJn?g"hi?????'c????a???s7Չ??ʄW
?"?\N1?????;?7.?Z??A?T?? m ??(?e??Ҥc?΋???];?e??>?X?mˮ??߄^?/???{?4N??B???M??????\BePJ??>?/??h???k&
??7??t??~	??/b?FR?+4?*H^????d[?D"0Jٸ???^?R5?RK'1?O]?8U??c???xܰ??_&M?k??q_?Y:??<y7'????H5??>p?!b??$?>ջOd?-u?̃7s??g?dCG6,|?O??G????8?N?t?Ƭ??=???з??	>??+?B?5`?j攟?>m?f??tyΕ?}2y????qp????
=#???>W???oE?t??B(??$?-Y?VA??t?s;Z8??v_s?S|?g??A??lb??Ĥ?$?w???mꕖb=???P@Gܵ??ؚ????????" 1u?x????Ӿ???0?]QVջM?1??H?W??? .???ǝ?????W?a?W??uo?r?Y???Kt>?%	.??mX?Rp֜_;?3W??G^?|}?????3??D״??f??K???N墻??#YPe?b???Z3,i?!?U7?ݿ?ɾ?,???'?f?uЄ&45Le????̭ȵ???;AĆ?׈%!??Ǣx? .|'A?????!?қ??????K??d?j??q"46???!on?Vҁ?'?@????O??켦???????????gyT̯?5?L????Z??e??ʼ??v???̖<W?b???el??&r??η????7?p??|???1??	???U|=20o??x^ D]???t?m?z???????|?]??n???ɮ?K???۷o?Z?G.      ?   ?  x?͗ͮ?8?׹O?v??c??1ۻ?L?Ph?NS،X??/????7i?????sբ???܏?????lH&?q?,?</?*?/??dZ??"?G?d>+Hn?&?2x?!c)H˕??????M?OT???=??γevm??Q?W?Y3Z?.?e3???W??h?D?hHV??Rwy???q?>]}Z?_??^?V_????F?#?I?\d?zqJ!?e?p??2[
????l???{򌼜?N)?Iz6-??H_???\?J?唀?Bu?	䮒???W??Y\?'Ȳ????p???r??	臫6?????W?J?W???/???????????s
?*83 ?MA????`)R ??"#
h?tH??g?SL8????3???.ӭ-c?)?r??1???g?X6???g{?d▽S*??'u=?W???????ywFLCݝ????x????,?7
Ҹ+C???ۆ,Nu?eV??:M??q^???]7r????ٓ??2E?@??I?]??ϯ.E?s?@f???v????Du??;???x˺??
\?s[D?C????ӌc??H??Ő??\?W}ZՋ?k?e:I_do?t??cZT?d?.?u?9jW??H?\)R?d??W^?????&,hR?_S_?M???L?b????t??c*?4.???)?o.??[%??E?}?x?(^??o?R7???????????????u\??.?1?eܢ )??5?w?|k7W?o7???8o?M??~?޲0???M?gM??~?c??~??o????Spb?????L'Y}?c?pqO??e<??Tx????
ﳑ \?u?׳?Ar??B?%?آ77}E{$i)?A??4֒<i?%????A15$:?r?ǿ??kE:?G??Ǥ?Ftb;}p????|̘Y`??1c????c?
=??\]]}?pI     