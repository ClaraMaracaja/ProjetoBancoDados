PGDMP      ;            
    |            loja_roupas     17.2 (Ubuntu 17.2-1.pgdg20.04+1)     17.2 (Ubuntu 17.2-1.pgdg20.04+1) ?    `           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            a           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            b           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            c           1262    16388    loja_roupas    DATABASE     w   CREATE DATABASE loja_roupas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt_BR.UTF-8';
    DROP DATABASE loja_roupas;
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            d           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16390    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nome character varying(100) NOT NULL,
    endereco character varying(255) NOT NULL,
    telefone character varying(20),
    email character varying(100)
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false    4            �            1259    16389    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public               postgres    false    4    218            e           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public               postgres    false    217            �            1259    16436    cliente_venda    TABLE     f   CREATE TABLE public.cliente_venda (
    id_cliente integer NOT NULL,
    id_venda integer NOT NULL
);
 !   DROP TABLE public.cliente_venda;
       public         heap r       postgres    false    4            �            1259    16430 
   fornecedor    TABLE     �   CREATE TABLE public.fornecedor (
    id_fornecedor integer NOT NULL,
    nome_fornecedor character varying(100) NOT NULL,
    contato character varying(20),
    endereco character varying(255)
);
    DROP TABLE public.fornecedor;
       public         heap r       postgres    false    4            �            1259    16429    fornecedor_id_fornecedor_seq    SEQUENCE     �   CREATE SEQUENCE public.fornecedor_id_fornecedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.fornecedor_id_fornecedor_seq;
       public               postgres    false    4    226            f           0    0    fornecedor_id_fornecedor_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.fornecedor_id_fornecedor_seq OWNED BY public.fornecedor.id_fornecedor;
          public               postgres    false    225            �            1259    16466    fornecedor_produto    TABLE     p   CREATE TABLE public.fornecedor_produto (
    id_fornecedor integer NOT NULL,
    id_produto integer NOT NULL
);
 &   DROP TABLE public.fornecedor_produto;
       public         heap r       postgres    false    4            �            1259    16406    funcionario    TABLE       CREATE TABLE public.funcionario (
    id_funcionario integer NOT NULL,
    nome_funcionario character varying(100) NOT NULL,
    cargo character varying(50),
    telefone character varying(20),
    email character varying(100),
    data_admissao date NOT NULL
);
    DROP TABLE public.funcionario;
       public         heap r       postgres    false    4            �            1259    16405    funcionario_id_funcionario_seq    SEQUENCE     �   CREATE SEQUENCE public.funcionario_id_funcionario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.funcionario_id_funcionario_seq;
       public               postgres    false    222    4            g           0    0    funcionario_id_funcionario_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.funcionario_id_funcionario_seq OWNED BY public.funcionario.id_funcionario;
          public               postgres    false    221            �            1259    16481    funcionario_venda    TABLE     n   CREATE TABLE public.funcionario_venda (
    id_funcionario integer NOT NULL,
    id_venda integer NOT NULL
);
 %   DROP TABLE public.funcionario_venda;
       public         heap r       postgres    false    4            �            1259    16397    produto    TABLE       CREATE TABLE public.produto (
    id_produto integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text NOT NULL,
    preco numeric(10,2) NOT NULL,
    tamanho character(1),
    cor character varying(50),
    estoque integer NOT NULL
);
    DROP TABLE public.produto;
       public         heap r       postgres    false    4            �            1259    16396    produto_id_produto_seq    SEQUENCE     �   CREATE SEQUENCE public.produto_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.produto_id_produto_seq;
       public               postgres    false    220    4            h           0    0    produto_id_produto_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.produto_id_produto_seq OWNED BY public.produto.id_produto;
          public               postgres    false    219            �            1259    16451    produto_venda    TABLE     �   CREATE TABLE public.produto_venda (
    id_produto integer NOT NULL,
    id_venda integer NOT NULL,
    quantidade integer NOT NULL
);
 !   DROP TABLE public.produto_venda;
       public         heap r       postgres    false    4            �            1259    16413    venda    TABLE     �   CREATE TABLE public.venda (
    id_venda integer NOT NULL,
    data_venda date NOT NULL,
    valor_total numeric(10,2) NOT NULL,
    forma_pagamento character varying(50),
    id_cliente integer,
    id_funcionario integer
);
    DROP TABLE public.venda;
       public         heap r       postgres    false    4            �            1259    16412    venda_id_venda_seq    SEQUENCE     �   CREATE SEQUENCE public.venda_id_venda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.venda_id_venda_seq;
       public               postgres    false    4    224            i           0    0    venda_id_venda_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.venda_id_venda_seq OWNED BY public.venda.id_venda;
          public               postgres    false    223            �           2604    16393    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    16433    fornecedor id_fornecedor    DEFAULT     �   ALTER TABLE ONLY public.fornecedor ALTER COLUMN id_fornecedor SET DEFAULT nextval('public.fornecedor_id_fornecedor_seq'::regclass);
 G   ALTER TABLE public.fornecedor ALTER COLUMN id_fornecedor DROP DEFAULT;
       public               postgres    false    226    225    226            �           2604    16409    funcionario id_funcionario    DEFAULT     �   ALTER TABLE ONLY public.funcionario ALTER COLUMN id_funcionario SET DEFAULT nextval('public.funcionario_id_funcionario_seq'::regclass);
 I   ALTER TABLE public.funcionario ALTER COLUMN id_funcionario DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    16400    produto id_produto    DEFAULT     x   ALTER TABLE ONLY public.produto ALTER COLUMN id_produto SET DEFAULT nextval('public.produto_id_produto_seq'::regclass);
 A   ALTER TABLE public.produto ALTER COLUMN id_produto DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    16416    venda id_venda    DEFAULT     p   ALTER TABLE ONLY public.venda ALTER COLUMN id_venda SET DEFAULT nextval('public.venda_id_venda_seq'::regclass);
 =   ALTER TABLE public.venda ALTER COLUMN id_venda DROP DEFAULT;
       public               postgres    false    223    224    224            Q          0    16390    cliente 
   TABLE DATA           N   COPY public.cliente (id_cliente, nome, endereco, telefone, email) FROM stdin;
    public               postgres    false    218   �N       Z          0    16436    cliente_venda 
   TABLE DATA           =   COPY public.cliente_venda (id_cliente, id_venda) FROM stdin;
    public               postgres    false    227   \O       Y          0    16430 
   fornecedor 
   TABLE DATA           W   COPY public.fornecedor (id_fornecedor, nome_fornecedor, contato, endereco) FROM stdin;
    public               postgres    false    226   �O       \          0    16466    fornecedor_produto 
   TABLE DATA           G   COPY public.fornecedor_produto (id_fornecedor, id_produto) FROM stdin;
    public               postgres    false    229   P       U          0    16406    funcionario 
   TABLE DATA           n   COPY public.funcionario (id_funcionario, nome_funcionario, cargo, telefone, email, data_admissao) FROM stdin;
    public               postgres    false    222   ,P       ]          0    16481    funcionario_venda 
   TABLE DATA           E   COPY public.funcionario_venda (id_funcionario, id_venda) FROM stdin;
    public               postgres    false    230   �P       S          0    16397    produto 
   TABLE DATA           \   COPY public.produto (id_produto, nome, descricao, preco, tamanho, cor, estoque) FROM stdin;
    public               postgres    false    220   Q       [          0    16451    produto_venda 
   TABLE DATA           I   COPY public.produto_venda (id_produto, id_venda, quantidade) FROM stdin;
    public               postgres    false    228   �Q       W          0    16413    venda 
   TABLE DATA           o   COPY public.venda (id_venda, data_venda, valor_total, forma_pagamento, id_cliente, id_funcionario) FROM stdin;
    public               postgres    false    224   �Q       j           0    0    cliente_id_cliente_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 2, true);
          public               postgres    false    217            k           0    0    fornecedor_id_fornecedor_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.fornecedor_id_fornecedor_seq', 2, true);
          public               postgres    false    225            l           0    0    funcionario_id_funcionario_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.funcionario_id_funcionario_seq', 3, true);
          public               postgres    false    221            m           0    0    produto_id_produto_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.produto_id_produto_seq', 4, true);
          public               postgres    false    219            n           0    0    venda_id_venda_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.venda_id_venda_seq', 2, true);
          public               postgres    false    223            �           2606    16395    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    218            �           2606    16440     cliente_venda cliente_venda_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.cliente_venda
    ADD CONSTRAINT cliente_venda_pkey PRIMARY KEY (id_cliente, id_venda);
 J   ALTER TABLE ONLY public.cliente_venda DROP CONSTRAINT cliente_venda_pkey;
       public                 postgres    false    227    227            �           2606    16435    fornecedor fornecedor_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (id_fornecedor);
 D   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT fornecedor_pkey;
       public                 postgres    false    226            �           2606    16470 *   fornecedor_produto fornecedor_produto_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.fornecedor_produto
    ADD CONSTRAINT fornecedor_produto_pkey PRIMARY KEY (id_fornecedor, id_produto);
 T   ALTER TABLE ONLY public.fornecedor_produto DROP CONSTRAINT fornecedor_produto_pkey;
       public                 postgres    false    229    229            �           2606    16411    funcionario funcionario_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id_funcionario);
 F   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_pkey;
       public                 postgres    false    222            �           2606    16485 (   funcionario_venda funcionario_venda_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.funcionario_venda
    ADD CONSTRAINT funcionario_venda_pkey PRIMARY KEY (id_funcionario, id_venda);
 R   ALTER TABLE ONLY public.funcionario_venda DROP CONSTRAINT funcionario_venda_pkey;
       public                 postgres    false    230    230            �           2606    16404    produto produto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id_produto);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public                 postgres    false    220            �           2606    16455     produto_venda produto_venda_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.produto_venda
    ADD CONSTRAINT produto_venda_pkey PRIMARY KEY (id_produto, id_venda);
 J   ALTER TABLE ONLY public.produto_venda DROP CONSTRAINT produto_venda_pkey;
       public                 postgres    false    228    228            �           2606    16418    venda venda_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (id_venda);
 :   ALTER TABLE ONLY public.venda DROP CONSTRAINT venda_pkey;
       public                 postgres    false    224            �           2606    16441 +   cliente_venda cliente_venda_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_venda
    ADD CONSTRAINT cliente_venda_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 U   ALTER TABLE ONLY public.cliente_venda DROP CONSTRAINT cliente_venda_id_cliente_fkey;
       public               postgres    false    3236    218    227            �           2606    16446 )   cliente_venda cliente_venda_id_venda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_venda
    ADD CONSTRAINT cliente_venda_id_venda_fkey FOREIGN KEY (id_venda) REFERENCES public.venda(id_venda);
 S   ALTER TABLE ONLY public.cliente_venda DROP CONSTRAINT cliente_venda_id_venda_fkey;
       public               postgres    false    227    224    3242            �           2606    16471 8   fornecedor_produto fornecedor_produto_id_fornecedor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fornecedor_produto
    ADD CONSTRAINT fornecedor_produto_id_fornecedor_fkey FOREIGN KEY (id_fornecedor) REFERENCES public.fornecedor(id_fornecedor);
 b   ALTER TABLE ONLY public.fornecedor_produto DROP CONSTRAINT fornecedor_produto_id_fornecedor_fkey;
       public               postgres    false    226    3244    229            �           2606    16476 5   fornecedor_produto fornecedor_produto_id_produto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fornecedor_produto
    ADD CONSTRAINT fornecedor_produto_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.produto(id_produto);
 _   ALTER TABLE ONLY public.fornecedor_produto DROP CONSTRAINT fornecedor_produto_id_produto_fkey;
       public               postgres    false    220    229    3238            �           2606    16486 7   funcionario_venda funcionario_venda_id_funcionario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionario_venda
    ADD CONSTRAINT funcionario_venda_id_funcionario_fkey FOREIGN KEY (id_funcionario) REFERENCES public.funcionario(id_funcionario);
 a   ALTER TABLE ONLY public.funcionario_venda DROP CONSTRAINT funcionario_venda_id_funcionario_fkey;
       public               postgres    false    222    230    3240            �           2606    16491 1   funcionario_venda funcionario_venda_id_venda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionario_venda
    ADD CONSTRAINT funcionario_venda_id_venda_fkey FOREIGN KEY (id_venda) REFERENCES public.venda(id_venda);
 [   ALTER TABLE ONLY public.funcionario_venda DROP CONSTRAINT funcionario_venda_id_venda_fkey;
       public               postgres    false    230    224    3242            �           2606    16456 +   produto_venda produto_venda_id_produto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto_venda
    ADD CONSTRAINT produto_venda_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.produto(id_produto);
 U   ALTER TABLE ONLY public.produto_venda DROP CONSTRAINT produto_venda_id_produto_fkey;
       public               postgres    false    3238    228    220            �           2606    16461 )   produto_venda produto_venda_id_venda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto_venda
    ADD CONSTRAINT produto_venda_id_venda_fkey FOREIGN KEY (id_venda) REFERENCES public.venda(id_venda);
 S   ALTER TABLE ONLY public.produto_venda DROP CONSTRAINT produto_venda_id_venda_fkey;
       public               postgres    false    3242    224    228            �           2606    16419    venda venda_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 E   ALTER TABLE ONLY public.venda DROP CONSTRAINT venda_id_cliente_fkey;
       public               postgres    false    3236    224    218            �           2606    16424    venda venda_id_funcionario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_id_funcionario_fkey FOREIGN KEY (id_funcionario) REFERENCES public.funcionario(id_funcionario);
 I   ALTER TABLE ONLY public.venda DROP CONSTRAINT venda_id_funcionario_fkey;
       public               postgres    false    3240    224    222            Q   �   x�M�=�0����)n���7]TDg��5ri!%~z/��~���c�@��[
,�pɄ-���!�X��S����ZkV<��v�˦��އh<�))w`�`��>���S~�8�/���R�Yj��>��?�j�1��.�      Z      x�3�4�2�4����� ��      Y   v   x�3���OITp�IMO�+I��04�T�442�5153�*MTHI,V�/-H,�Q0���2�t-.���WpK��������0i��0�5351�t,K��L�hI�K9�*/9���Ȑ+F��� ��!`      \      x�3�4�2�4����� ��      U   �   x�e�;�0��_ѱ7�anWQpr�� �6�$]����[��Ñ�9*�~z\��M�A)�شm�U������d~�#(�4
�R0;
����cs���%��g���un�?�wK��PVL��&*�a4�'��䟓�����k�Y�h�4*Ů�1���@      ]      x�3�4�2�4����� ��      S   �   x�E�K
1DםS�	$�Qt��� �+7ͤ�h>�dD���Ŝ�����V�ᔍ�7���#�ό��L�D:��ˎ�����,����V�{lK�����k�Qk/a9�Kу5¥��\��wd.���^�U$P�V���VYHQ����A�`��[M�t4�_A�����ێ��]J1      [      x�3�4�4�2�4�4����� 
      W   M   x�3�4202�5��54�460�30�tN,*9�8_!%U����ʔ̒|NCNC.#�Z3 ��%3/#5�(�(����� P��     