--  AUDIT PROCEDURE  --
create or replace procedure prc_audit (v_tb_name in tb_audit.tb_name%type, v_id in tb_audit.id%type, v_action in tb_audit.action%type) as
begin
	insert into tb_audit values (seq_audit_id.nextval, v_tb_name, v_id, v_action, current_timestamp);
	--update v_tb_name set v_act	
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



-- Data
insert into tb_province values(seq_province_id.nextval, 'Jawa Barat');
insert into tb_province values(seq_province_id.nextval, 'Jawa Tengah');
insert into tb_province values(seq_province_id.nextval, 'Jawa Timur');

insert into tb_city values(seq_city_id.nextval, 'Kota Bandung', 1);

insert into tb_district values(seq_district_id.nextval, 'Sukasari', 1, 1);

insert into tb_user
(user_id,user_name,user_phone,user_email,user_alamat,username,password,district)
values
(seq_user_id.nextval, 'Ahem', '088','ahem@gmail.com','surabaya','ahemm','ieunaminapassword','1');
insert into tb_user
(user_id,user_name,user_phone,user_email,user_alamat,username,password,district)
values
(seq_user_id.nextval, 'Teddy Koerniadi', '085321870515','teddykoerniadi@gmail.com','Negla','admin','adminadmin',1);



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
CREATE OR REPLACE TRIGGER payment_status_trig
	AFTER INSERT ON tb_payment FOR EACH ROW
begin
	--untuk mengurangi stok produk ketika sudah dilakukan pembayaran
	update tb_product pr set pr.product_stok = pr.product_stok - (select ord.qty from tb_order ord where ord.product = pr.product_id and ord.cart = :new.cart);
end;
/


