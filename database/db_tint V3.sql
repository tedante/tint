--Create database
create user db_tint identified by db_tint;

--Connect DB
grant connect to db_tint;
grant all privileges to db_tint;
disconn;
conn db_tint;
db_tint


--  CREATE TABLE PROVINCE  --
create table tb_province(
	province_id number not null,
	province_name varchar2(100) not null,
	CONSTRAINT pk_province PRIMARY KEY (province_id)
);
create sequence seq_province_id increment by 1;

--  CREATE TABLE CITY  --
create table tb_city(
	city_id number not null,
	city_name varchar2(100) not null,
	province number not null,
	CONSTRAINT pk_city PRIMARY KEY (city_id),
	CONSTRAINT fk_province_city FOREIGN KEY (province) REFERENCES tb_province(province_id)
);
create sequence seq_city_id increment by 1;

--  CREATE TABLE KECAMATAN  --
create table tb_district(
	district_id number not null,
	district_name varchar2(100) not null,
	city number not null,
	province number not null,
	CONSTRAINT pk_district PRIMARY KEY (district_id),
	CONSTRAINT fk_province_district FOREIGN KEY (province) REFERENCES tb_province(province_id),
	CONSTRAINT fk_city_district FOREIGN KEY (city) REFERENCES tb_city(city_id)
);
create sequence seq_district_id increment by 1;

--  CREATE TABLE AUDIT  --
create table tb_audit(
	audit_id number not null,
	tb_name varchar2(15) not null,
	id number not null,
	action varchar2(15) not null,
	exec_at timestamp
);
create sequence seq_audit_id increment by 1;


--  CREATE TABLE USER --
create table tb_user(
	user_id number not null,
	user_name varchar2(100) not null,
	user_phone varchar2(12),
	user_email varchar2(50) not null,
	user_alamat varchar2(255),
	username varchar2(35),
	password varchar2(50) not null,
	district number,
	deleted_at timestamp,
	CONSTRAINT pk_user PRIMARY KEY (user_id),
	CONSTRAINT fk_district_user FOREIGN KEY (district) REFERENCES tb_district(district_id),
	CONSTRAINT UniqueEmail UNIQUE (user_email), 
	CONSTRAINT UniqueUsername UNIQUE (username),
	CONSTRAINT MinimumPassLength CHECK (LENGTH(password) >= 8)
);
create sequence seq_user_id increment by 1;


--  CREATE VIEW LOGIN  --
create view v_login as select user_id, user_email, username, password from tb_user;


--  CREATE TABLE CATEGORY  --
create table tb_category(
	category_id number not null,
	category_name varchar2(35) not null,
	category_parent number,
	deleted_at timestamp,
	CONSTRAINT pk_category PRIMARY KEY (category_id),
	CONSTRAINT fk_parent_category FOREIGN KEY (category_parent) REFERENCES tb_category(category_id)
);
create sequence seq_category_id increment by 1;


--  CREATE TABLE PRODUCT  --
create table tb_product(
	product_id number not null,
	category number not null,
	product_name varchar2(100) not null,
	product_desc varchar2(4000),
	product_price number not null,
	photo varchar2,
	deleted_at timestamp,
	CONSTRAINT pk_product PRIMARY KEY (product_id),
	CONSTRAINT fk_store_product FOREIGN KEY (store) REFERENCES tb_store(store_id),
	CONSTRAINT fk_category_product FOREIGN KEY (category) REFERENCES tb_category(category_id)
);
create sequence seq_product_id increment by 1;


--  CREATE TABLE BARANG  --
create table tb_barang(
	barang_id number not null,
	product number not null,
	barang_size varchar2(10) not null,	
	stok number not null,
	CONSTRAINT pk_barang PRIMARY KEY (barang_id),
	CONSTRAINT fk_product_barang FOREIGN KEY (product) REFERENCES tb_product(product_id)
);
create sequence seq_barang_id increment by 1;

--  CREATE TABLE CART --
create table tb_cart(
	cart_id number not null,
	user_id number not null,
	status number not null,		--0 = belum lunas, 1 = sudah lunas
	deleted_at timestamp,
	CONSTRAINT pk_cart PRIMARY KEY (cart_id),
	CONSTRAINT fk_user_cart FOREIGN KEY (user_id) REFERENCES tb_user(user_id),
	CONSTRAINT BooleanCartStat CHECK (status = 0 OR status = 1)
);
create sequence seq_cart_id increment by 1;


--  CREATE TABLE ORDER  --
create table tb_order(
	order_id number not null,
	cart number not null,
	barang number not null,
	qty number not null,
	CONSTRAINT pk_order PRIMARY KEY (order_id),
	CONSTRAINT fk_cart_order FOREIGN KEY (cart) REFERENCES tb_cart(cart_id)
);
create sequence seq_order_id increment by 1;


--  CREATE TABLE SHIPMENT  --
create table tb_shipment(
	shipment_id number not null,
	cart number not null,
	address varchar2(255) not null,
	district number not null,
	status varchar2(35) not null,
	deleted_at timestamp,
	CONSTRAINT pk_shipment PRIMARY KEY (shipment_id),
	CONSTRAINT fk_cart_shipment FOREIGN KEY (cart) REFERENCES tb_cart(cart_id)
);
create sequence seq_shipment_id increment by 1;

--  CREATE TABLE PAYMENT METHOD  --
create table tb_payment_method(
	payment_method_id number not null,
	payment_method_name varchar2(100) not null,
	deleted_at timestamp,
	CONSTRAINT pk_payment_method PRIMARY KEY (payment_method_id)
);
create sequence seq_payment_method_id increment by 1;

--  CREATE TABLE PAYMENT  --
create table tb_payment(
	payment_id number not null,
	cart number not null,
	payment_date date not null,			--tanggal user melakukan pembayaran
	CONSTRAINT pk_payment PRIMARY KEY (payment_id),
	CONSTRAINT fk_cart_payment FOREIGN KEY (cart) REFERENCES tb_cart(cart_id)
);
create sequence seq_payment_id increment by 1;

