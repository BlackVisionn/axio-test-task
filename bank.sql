PGDMP     -                    {            bank    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25851    bank    DATABASE     x   CREATE DATABASE bank WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE bank;
                postgres    false            �            1259    25852    approved_credit_decisions    TABLE     �   CREATE TABLE public.approved_credit_decisions (
    id bigint NOT NULL,
    credit_maturity integer,
    approved_credit_amount bigint
);
 -   DROP TABLE public.approved_credit_decisions;
       public         heap    postgres    false            �            1259    25855     approved_credit_decisions_id_seq    SEQUENCE     �   ALTER TABLE public.approved_credit_decisions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.approved_credit_decisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    25856    clients    TABLE     �  CREATE TABLE public.clients (
    id bigint NOT NULL,
    full_name character varying(100),
    passport_serial character varying(100),
    passport_number character varying(100),
    marital_status boolean,
    registration_address character varying(100),
    contact_number character varying(100),
    company_name character varying(100),
    post character varying(100),
    work_period integer
);
    DROP TABLE public.clients;
       public         heap    postgres    false            �            1259    25861    clients_id_seq    SEQUENCE     �   ALTER TABLE public.clients ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    25862    credit_applications    TABLE     �   CREATE TABLE public.credit_applications (
    id bigint NOT NULL,
    desired_credit_amount bigint,
    credit_decision_id bigint,
    client_id bigint
);
 '   DROP TABLE public.credit_applications;
       public         heap    postgres    false            �            1259    25865    credit_applications_id_seq    SEQUENCE     �   ALTER TABLE public.credit_applications ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credit_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    25866    credit_contracts    TABLE     �   CREATE TABLE public.credit_contracts (
    id bigint NOT NULL,
    credit_application_id bigint,
    signing_status boolean,
    signing_date date
);
 $   DROP TABLE public.credit_contracts;
       public         heap    postgres    false            �            1259    25869    credit_contracts_id_seq    SEQUENCE     �   ALTER TABLE public.credit_contracts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credit_contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220                      0    25852    approved_credit_decisions 
   TABLE DATA           `   COPY public.approved_credit_decisions (id, credit_maturity, approved_credit_amount) FROM stdin;
    public          postgres    false    214   "                 0    25856    clients 
   TABLE DATA           �   COPY public.clients (id, full_name, passport_serial, passport_number, marital_status, registration_address, contact_number, company_name, post, work_period) FROM stdin;
    public          postgres    false    216   a"                 0    25862    credit_applications 
   TABLE DATA           g   COPY public.credit_applications (id, desired_credit_amount, credit_decision_id, client_id) FROM stdin;
    public          postgres    false    218   �'                 0    25866    credit_contracts 
   TABLE DATA           c   COPY public.credit_contracts (id, credit_application_id, signing_status, signing_date) FROM stdin;
    public          postgres    false    220   @(                  0    0     approved_credit_decisions_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.approved_credit_decisions_id_seq', 13, true);
          public          postgres    false    215                       0    0    clients_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.clients_id_seq', 26, true);
          public          postgres    false    217                       0    0    credit_applications_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.credit_applications_id_seq', 25, true);
          public          postgres    false    219                       0    0    credit_contracts_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.credit_contracts_id_seq', 8, true);
          public          postgres    false    221            u           2606    25871 8   approved_credit_decisions approved_credit_decisions_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.approved_credit_decisions
    ADD CONSTRAINT approved_credit_decisions_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.approved_credit_decisions DROP CONSTRAINT approved_credit_decisions_pkey;
       public            postgres    false    214            w           2606    25873    clients clients_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    216            y           2606    25875 ,   credit_applications credit_applications_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.credit_applications
    ADD CONSTRAINT credit_applications_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.credit_applications DROP CONSTRAINT credit_applications_pkey;
       public            postgres    false    218            {           2606    25877 &   credit_contracts credit_contracts_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.credit_contracts
    ADD CONSTRAINT credit_contracts_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.credit_contracts DROP CONSTRAINT credit_contracts_pkey;
       public            postgres    false    220            |           2606    25878 2   credit_applications fk_clients_credit_applications    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_applications
    ADD CONSTRAINT fk_clients_credit_applications FOREIGN KEY (client_id) REFERENCES public.clients(id);
 \   ALTER TABLE ONLY public.credit_applications DROP CONSTRAINT fk_clients_credit_applications;
       public          postgres    false    216    3191    218            ~           2606    25883 8   credit_contracts fk_credit_applications_credit_contracts    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_contracts
    ADD CONSTRAINT fk_credit_applications_credit_contracts FOREIGN KEY (credit_application_id) REFERENCES public.credit_applications(id) NOT VALID;
 b   ALTER TABLE ONLY public.credit_contracts DROP CONSTRAINT fk_credit_applications_credit_contracts;
       public          postgres    false    3193    220    218            }           2606    25888 :   credit_applications fk_credit_decision_credit_applications    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_applications
    ADD CONSTRAINT fk_credit_decision_credit_applications FOREIGN KEY (credit_decision_id) REFERENCES public.approved_credit_decisions(id);
 d   ALTER TABLE ONLY public.credit_applications DROP CONSTRAINT fk_credit_decision_credit_applications;
       public          postgres    false    218    214    3189               D   x�ʹ 1��,� �zq�u���l����"Z�ʳ�����������
�7�y�x?�?K��         M  x��VKR#G\W�� ���Ou�K����'��F���G#����n@BB�
�W�I���[O������|��N��4�M�?�������9�����O}�b�k�L�c����~�쫬��[����b���x��8��+��ǝf�m��gy�4����q����|Ջ�� �Լ�_wѶ��)�E�L��Gx�@�S���P~�ȵ_��
�T@Q�Es�t�L�,��`�W����9���`�(X���,q�S�δ�l�\I�'��A�"��c�'!���fA��V���w��$�Ta�Rk�?HH�H�ʿ��S�_�ڎP�}��Ì�0�c(�$&6.S�8�
���C�� ��8Ȇy�j�>ױvI.���V�X�8�:�q�����>*�e����X�j�}LD��Jx�ʓH#�O�A��%l��R�9��s���)o k�صN�{쾑/�;a ��v�3���ʐ��0Ժ�m�9WL�\�ImZj�5�JĊyI.|#�+d��3��J#mѼ"����~(�#�9�.b��8�@r�\�Q�7H�w��~A;��~`�S怫��=l��bc���M���r��c[H��cȲjsgt,��tV(�@2F\��͒GI�m[��=G�� [4�JBu���*��v`B�x���Z�-��ݳb>Ae�Vf ˔�)���$ p�����`��3��+F��ҬK���E�$�P�9�6����L$~3���M��W�Il��.PxV�->��;Q��� t�(`�ʹ+mj�u�o�Œ�
�8`O�+K*o[l��I֜�a��n����̢Po��eN�=U��p�-��T�-��[�Sg��st&����`�=��Z��K_�S1*6L0�y��i��{��W&����AC�K-��OvÂPt	M��%́��gf����ֵ�;����ij2��_}��������&2�ʪd���:�tG	ʔE��\nqg�<h��K�h��R�z�;'��=)��̓�b�t�ܖ!ݑ��[l>��۹.���2YĞ�H[uo�2"g4�/Xm��#��i�Ư����٫[����'��\����"t�%V� ���D$���?�}���e�n3#��K��j��"��O��.�?�̊N�o���m�`+y��%��ˮ[a7�vYͩ���d�]J�h�� ���Aݏ V�L�]�6����S�82��m��-ٲu��Vb�� �}�Պ$@�l�C�=/F78_�dl�i�NMZͱj���z~a�������+g�N&z;=����'O3(�[{�̚�zZ?�-�Q��̔��.�����C��L԰#�LG���(�����         r   x�E���0B�PLF�կ�T���$+���aVFK�p}�Le�o�PP1��� �T�^ݨ6Kw��~�Ɯ[Nt�.�ޢu�J�i����tF����9�1Å.��=Xy}H� ��%K         9   x�3�4��,�4202�5��56�2�42�LC1�42BUc�id��Ƃ��UM� �0     