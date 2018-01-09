--  AUDIT PROCEDURE  --
create or replace procedure prc_audit (v_tb_name in tb_audit.tb_name%type, v_id in tb_audit.id%type, v_action in tb_audit.action%type) as
begin
	insert into tb_audit values (seq_audit_id.nextval, v_tb_name, v_id, v_action, current_timestamp);
end;
/


--  TRIGGER AUDIT USER  --
create or replace trigger user_trig
	after insert or update on tb_user for each row
begin
	case when inserting then
		prc_audit('tb_user', :new.user_id, 'CREATED');
	when updating then
		prc_audit('tb_user', :old.user_id, 'UPDATED');
	end case;		
end;
/


--  TRIGGER AUDIT STORE  --
create or replace trigger store_trig
	after insert or update on tb_store for each row
begin
	case when inserting then
		prc_audit('tb_store', :new.store_id, 'CREATED');
	when updating then
		prc_audit('tb_store', :old.store_id, 'UPDATED');
	end case;
end;
/



insert into tb_user
(user_id,user_name,user_phone,user_email,user_alamat,username,password,district)
values
(seq_user_id.nextval, 'Ahem', '088','ahem@gmail.com','surabaya','ahemm','ieunaminapassword','1');



--  TRIGGER CATEGORY  --
create or replace trigger CATEGORY_trig
	AFTER INSERT OR UPDATE ON tb_category for each row
begin
	case when inserting then
		prc_audit('tb_category', :new.CATEGORY_id, 'CREATED');
	when updating then
		prc_audit('tb_category', :old.category_id, 'UPDATED');
	end case;
end;
/


--  TRIGGER AUDIT PRODUCT  --
CREATE OR REPLACE TRIGGER product_trig
	AFTER INSERT OR UPDATE ON tb_product FOR EACH ROW
begin
	case when inserting then
		prc_audit('tb_product', :new.product_id, 'CREATED');
	when updating then
		prc_audit('tb_product', :old.product_id, 'UPDATED');
	end case;
end;
/


--  TRIGGER AUDIT CART  --
CREATE OR REPLACE TRIGGER cart_trig
	AFTER INSERT OR UPDATE ON tb_cart FOR EACH ROW
begin
	case when inserting then
		prc_audit('tb_cart', :new.cart_id, 'CREATED');
	when updating then
		prc_audit('tb_cart', :old.cart_id, 'UPDATED');
	end case;
end;
/


--  TRIGGER AUDIT SHIPMENT  --
	CREATE OR REPLACE TRIGGER shipment_trig
		AFTER INSERT OR UPDATE ON tb_shipment FOR EACH ROW
	begin
		case when inserting then
			prc_audit('tb_shipment', :new.shipment_id, 'CREATED');
		when updating then
			prc_audit('tb_shipment', :old.shipment_id, 'UPDATED');
		end case;
	end;
/
	

--  TRIGGER AUDIT PAYMENT METHOD  --
CREATE OR REPLACE TRIGGER payment_method_trig
	AFTER INSERT OR UPDATE ON tb_payment_method FOR EACH ROW
begin
	case when inserting then
		prc_audit('tb_payment_method', :new.payment_method_id, 'CREATED');
	when updating then
		prc_audit('tb_payment_method', :old.payment_method_id, 'UPDATED');
	end case;
end;
/


--  TRIGGER PAYMENT PADA STOK  --
CREATE OR REPLACE TRIGGER payment_stok_trig
	AFTER INSERT ON tb_payment FOR EACH ROW
begin
	--untuk mengurangi stok produk pada tb_barang ketika sudah dilakukan pembayaran
	update tb_barang br set br.stok = br.stok - (select ord.qty from tb_order ord where ord.barang = br.barang_id and ord.cart = :new.cart);
end;
/


--  MENGUBAH STATUS CART KETIKA PAYMENT BERHASIL  --
create or replace trigger payment_status_trig
	after insert or update on tb_payment for each row
begin
	update tb_cart set status = 1 where cart_id = :new.cart;
end;
/




-- --  FUNCTION PERSEDIAAN KESELURUHAN PRODUK  --
-- create or replace function hitung_stok (v_product in number) return number as
-- 	v_total tb_barang.stok%type;
-- 	v_stok tb_barang.stok%type;
-- 	v_barang tb_barang.barang_id%type;
-- 	c_barang is select barang_id from tb_barang where product = v_product;
-- begin
-- 	v_total := 0;
-- 	open c_barang;
-- 		loop
-- 			fetch c_barang into v_barang;
-- 			exit when c_barang%notfound;

-- 			select stok into v_stok from tb_barang where barang_id = v_barang;

-- 			v_total := v_stok + v_total;

-- 		end loop;
-- 	close c_barang;
-- 	return v_total;
-- end;
-- /


--  PROSEDUR REKAP PERSEDIAAN PRODUK  --
create table rekap_stok(
	rekstok_id number not null,
	product number not null,
	total_stok number not null,
	CONSTRAINT pk_rekap_stok PRIMARY KEY (rekstok_id),
	CONSTRAINT fk_product_rekstok FOREIGN KEY (product) REFERENCES tb_product(product_id)
);
create sequence seq_rekstok_id increment by 1;

create or replace procedure prc_rekap_stok as
	v_product tb_product.product_id%type;
	v_total tb_barang.stok%type;
	cursor c_product is select product_id from tb_product;
begin
	open c_product;
	loop
		fetch c_product into v_product;
		exit when c_product%notfound;
			select sum(stok) into v_total from tb_barang where product = v_product;
			insert into rekap_stok values (seq_rekstok_id.nextval,v_product,v_total);
	end loop;
	close c_product;
end;
/


--  PROSEDUR DAN FUNCTION REKAP PENJUALAN PER PRODUK  --
create table rekap_jual(
	rekap_id number not null,
	product number not null,
	qty number not null,
	price number not null,
	rekap_bulan date not null,
	CONSTRAINT pk_rekap PRIMARY KEY (rekap_id),
	CONSTRAINT fk_product_rekap FOREIGN KEY (product) REFERENCES tb_product(product_id)
);
create sequence seq_rekap_id increment by 1;

create or replace function hitung_rekap (v_product in number, v_qty in number) return number as
	v_harga tb_product.product_price%type;
	v_total tb_product.product_price%type;
begin
	select product_price into v_harga from tb_product where product_id = v_product;

	v_total := v_harga * v_qty;

	return v_total;
end;
/

create or replace procedure prc_rekap_jual as
	v_product tb_product.product_id%type;
	v_qty tb_order.qty%type;
	v_total number;
	v_harga tb_product.product_price%type;
	cursor c_product is select product_id from tb_product;
begin
	v_total := 0;
	open c_product;
	loop
		fetch c_product into v_product;
		exit when c_product%notfound;

		select sum(ord.qty) into v_qty from tb_order ord, tb_cart c, tb_barang br, tb_product pr where ord.cart=c.cart_id and c.status=1 and ord.barang=br.barang_id and br.product=pr.product_id and pr.product_id=v_product;
		select hitung_rekap(v_product,v_qty) into v_total from dual;

		insert into rekap_jual values (seq_rekap_id.nextval, v_product, v_qty, v_total, sysdate());
	end loop;
	close c_product;
end;
/ 


--  PROCEDURE PENGHITUNGAN PENJUALAN PER KATEGORI  --
create table rekap_cat(
	rekcat_id number not null,
	category number not null,
	qty number not null,
	price number,
	rekap_bulan date,
	CONSTRAINT pk_rekcat_id PRIMARY KEY (rekcat_id),
	CONSTRAINT fk_cat_rekcat FOREIGN KEY (category) REFERENCES tb_category(category_id)
);
create sequence seq_rekcat_id increment by 1;

create or replace procedure prc_rekap_cat as
	v_qty number;
	v_price number;
	v_bulan date;
	v_cat tb_category.category_id%type;
	cursor c_cat is select category_id from tb_category;
begin
	open c_cat;
	loop
		fetch c_cat into v_cat;
		exit when c_cat%notfound;

		select sum(rek.qty) into v_qty from rekap_jual rek, tb_product pr, tb_category cat where rek.product=pr.product_id and pr.category=cat.category_id and pr.CATEGORY=v_cat;
		select sum(rek.price) into v_price from rekap_jual rek, tb_product pr, tb_category cat where rek.product=pr.product_id and pr.category=cat.category_id and pr.category=v_cat;
		select rek.rekap_bulan into v_bulan from rekap_jual rek, tb_product pr, tb_category cat where rek.product=pr.product_id and pr.category=cat.category_id and pr.category=v_cat;

		insert into rekap_cat values (seq_rekcat_id.nextval, v_cat, v_qty, v_price, v_bulan);
		
	end loop;
	close c_cat;
end;
/




--  FUNGSI PENGHITUNGAN PENDAPATAN SATU BULAN  --
-- CREATE OR REPLACE FUNCTION monthly_income return number as
-- 	v_income tb_product.product_price%type;		--variabel utk menyimpan income
-- 	v_qty tb_order.qty%type;					--variabel utk menyimpan jumlah product
-- 	v_price tb_product.product_price%type;		--variabel utk menyimpan harga produk
-- 	v_ord_id tb_order.order_id%type;			--variabel utk menyimpan order_id
-- 	cursor c_ord_id is select ord.order_id from tb_order ord, tb_cart c where ord.cart=c.cart_id and c.status=1; --id order sebagai cursor
-- begin
-- 	v_income := 0;
-- 	open c_ord_id;

-- 	loop
-- 		fetch c_ord_id into v_ord_id;
-- 		exit when c_ord_id%notfound;

-- 			select pr.product_price into v_price, ord.qty into v_qty from tb_product pr, tb_barang br, tb_order ord where ord.order_id = v_ord_id and ord.barang = br.barang_id and br.product=pr.product_id;

-- 			v_income :=  v_income + (v_price * v_qty);
-- 	end loop;
-- 	close c_ord_id;
-- 	return v_income;
-- end;
-- /


