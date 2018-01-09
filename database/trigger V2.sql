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
insert into tb_province values(seq_province_id.nextval, 'ACEH');
insert into tb_province values(seq_province_id.nextval, 'SUMATERA UTARA');
insert into tb_province values(seq_province_id.nextval, 'SUMATERA BARAT');
insert into tb_province values(seq_province_id.nextval, 'RIAU');
insert into tb_province values(seq_province_id.nextval, 'JAMBI');
insert into tb_province values(seq_province_id.nextval, 'SUMATERA SELATAN');
insert into tb_province values(seq_province_id.nextval, 'BENGKULU');
insert into tb_province values(seq_province_id.nextval, 'LAMPUNG');
insert into tb_province values(seq_province_id.nextval, 'KEPULAUAN BANGKA BELITUNG');
insert into tb_province values(seq_province_id.nextval, 'KEPULAUAN RIAU');
insert into tb_province values(seq_province_id.nextval, 'DKI JAKARTA');
insert into tb_province values(seq_province_id.nextval, 'JAWA BARAT');
insert into tb_province values(seq_province_id.nextval, 'JAWA TENGAH');
insert into tb_province values(seq_province_id.nextval, 'DI YOGYAKARTA');
insert into tb_province values(seq_province_id.nextval, 'JAWA TIMUR');
insert into tb_province values(seq_province_id.nextval, 'BANTEN');
insert into tb_province values(seq_province_id.nextval, 'BALI');
insert into tb_province values(seq_province_id.nextval, 'NUSA TENGGARA BARAT');
insert into tb_province values(seq_province_id.nextval, 'NUSA TENGGARA TIMUR');
insert into tb_province values(seq_province_id.nextval, 'KALIMANTAN BARAT');
insert into tb_province values(seq_province_id.nextval, 'KALIMANTAN TENGAH');
insert into tb_province values(seq_province_id.nextval, 'KALIMANTAN SELATAN');
insert into tb_province values(seq_province_id.nextval, 'KALIMANTAN TIMUR');
insert into tb_province values(seq_province_id.nextval, 'KALIMANTAN UTARA');
insert into tb_province values(seq_province_id.nextval, 'SULAWESI UTARA');
insert into tb_province values(seq_province_id.nextval, 'SULAWESI TENGAH');
insert into tb_province values(seq_province_id.nextval, 'SULAWESI SELATAN');
insert into tb_province values(seq_province_id.nextval, 'SULAWESI TENGGARA');
insert into tb_province values(seq_province_id.nextval, 'GORONTALO');
insert into tb_province values(seq_province_id.nextval, 'SULAWESI BARAT');
insert into tb_province values(seq_province_id.nextval, 'MALUKU');
insert into tb_province values(seq_province_id.nextval, 'MALUKU UTARA');
insert into tb_province values(seq_province_id.nextval, 'PAPUA BARAT');
insert into tb_province values(seq_province_id.nextval, 'PAPUA');

insert into tb_city values(seq_city_id.nextval, 'Kota Bandung', 1);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SIMEULUE', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ACEH SINGKIL', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ACEH SELATAN', 11)
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ACEH TENGGARA', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ACEH TIMUR', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ACEH TENGAH', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ACEH BARAT', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ACEH BESAR', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PIDIE', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BIREUEN', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ACEH UTARA', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ACEH BARAT DAYA', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN GAYO LUES', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ACEH TAMIANG', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NAGAN RAYA', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ACEH JAYA', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BENER MERIAH', 11);
  insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PIDIE JAYA', 11);
  insert into tb_city values(seq_city_id.nextval, 'KOTA BANDA ACEH', 11);
  insert into tb_city values(seq_city_id.nextval, 'KOTA SABANG', 11);
  insert into tb_city values(seq_city_id.nextval, 'KOTA LANGSA', 11);
  insert into tb_city values(seq_city_id.nextval, 'KOTA LHOKSEUMAWE', 11);
  insert into tb_city values(seq_city_id.nextval, 'KOTA SUBULUSSALAM', 11);

  	  -- ('11', ACEH),

 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NIAS', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MANDAILING NATAL', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TAPANULI SELATAN', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TAPANULI TENGAH', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TAPANULI UTARA', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TOBA SAMOSIR', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LABUHAN BATU', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ASAHAN', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SIMALUNGUN', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN DAIRI', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KARO', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN DELI SERDANG', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LANGKAT', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NIAS SELATAN', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN HUMBANG HASUNDUTAN', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PAKPAK BHARAT', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SAMOSIR', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SERDANG BEDAGAI', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BATU BARA', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PADANG LAWAS UTARA', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PADANG LAWAS', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LABUHAN BATU SELATAN', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LABUHAN BATU UTARA', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NIAS UTARA', 12);
 insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NIAS BARAT', 12);
 insert into tb_city values(seq_city_id.nextval, 'KOTA SIBOLGA', 12);
 insert into tb_city values(seq_city_id.nextval, 'KOTA TANJUNG BALAI', 12);
insert into tb_city values(seq_city_id.nextval, 'KOTA PEMATANG SIANTAR', 12);
insert into tb_city values(seq_city_id.nextval, 'KOTA TEBING TINGGI', 12);
insert into tb_city values(seq_city_id.nextval, 'KOTA MEDAN', 12);
insert into tb_city values(seq_city_id.nextval, 'KOTA BINJAI', 12);
insert into tb_city values(seq_city_id.nextval, 'KOTA PADANGSIDIMPUAN', 12);
insert into tb_city values(seq_city_id.nextval, 'KOTA GUNUNGSITOLI', 12);
	
	-- ('12', 'SUMATERA UTARA'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEPULAUAN MENTAWAI', 13);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PESISIR SELATAN', 13);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SOLOK', 13);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SIJUNJUNG', 13);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TANAH DATAR', 13);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PADANG PARIAMAN', 13);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN AGAM', 13);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LIMA PULUH KOTA', 13);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PASAMAN', 13);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SOLOK SELATAN', 13);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN DHARMASRAYA', 13);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PASAMAN BARAT', 13)
insert into tb_city values(seq_city_id.nextval, 'KOTA PADANG', 13);
insert into tb_city values(seq_city_id.nextval, 'KOTA SOLOK', 13);
insert into tb_city values(seq_city_id.nextval, 'KOTA SAWAH LUNTO', 13);
insert into tb_city values(seq_city_id.nextval, 'KOTA PADANG PANJANG', 13);
insert into tb_city values(seq_city_id.nextval, 'KOTA BUKITTINGGI', 13);
insert into tb_city values(seq_city_id.nextval, 'KOTA PAYAKUMBUH', 13);
insert into tb_city values(seq_city_id.nextval, 'KOTA PARIAMAN', 13);

-- ('13', 'SUMATERA BARAT'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KUANTAN SINGINGI', 14);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN INDRAGIRI HULU', 14);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN INDRAGIRI HILIR', 14);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PELALAWAN', 14);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN S I A K', 14);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KAMPAR', 14);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ROKAN HULU', 14);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BENGKALIS', 14);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ROKAN HILIR', 14);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEPULAUAN MERANTI', 14);
insert into tb_city values(seq_city_id.nextval, 'KOTA PEKANBARU', 14);
insert into tb_city values(seq_city_id.nextval, 'KOTA D U M A I', 14);

 -- ('14', 'RIAU'),
  
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KERINCI', 15);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MERANGIN', 15);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SAROLANGUN', 15);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BATANG HARI', 15);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MUARO JAMBI', 15);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TANJUNG JABUNG TIMUR', 15);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TANJUNG JABUNG BARAT', 15);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TEBO', 15);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BUNGO', 15);
insert into tb_city values(seq_city_id.nextval, 'KOTA JAMBI', 15);
insert into tb_city values(seq_city_id.nextval, 'KOTA SUNGAI PENUH', 15);

-- ('15', 'JAMBI'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN OGAN KOMERING ULU', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN OGAN KOMERING ILIR', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MUARA ENIM', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LAHAT', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MUSI RAWAS', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MUSI BANYUASIN', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANYU ASIN', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN OGAN KOMERING ULU SELATAN', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN OGAN KOMERING ULU TIMUR', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN OGAN ILIR', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN EMPAT LAWANG', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PENUKAL ABAB LEMATANG ILIR', 16);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MUSI RAWAS UTARA', 16);
insert into tb_city values(seq_city_id.nextval, 'KOTA PALEMBANG', 16);
insert into tb_city values(seq_city_id.nextval, 'KOTA PRABUMULIH', 16);
insert into tb_city values(seq_city_id.nextval, 'KOTA PAGAR ALAM', 16);
insert into tb_city values(seq_city_id.nextval, 'KOTA LUBUKLINGGAU', 16);

  -- ('16', 'SUMATERA SELATAN'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BENGKULU SELATAN', 17);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN REJANG LEBONG', 17);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BENGKULU UTARA', 17);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KAUR', 17);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SELUMA', 17);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MUKOMUKO', 17);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LEBONG', 17);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEPAHIANG', 17);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BENGKULU TENGAH', 17);
insert into tb_city values(seq_city_id.nextval, 'KOTA BENGKULU', 17);

  -- ('17', 'BENGKULU'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LAMPUNG BARAT', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TANGGAMUS', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LAMPUNG SELATAN', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LAMPUNG TIMUR', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LAMPUNG TENGAH', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LAMPUNG UTARA', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN WAY KANAN', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TULANGBAWANG', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PESAWARAN', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PRINGSEWU', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MESUJI', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TULANG BAWANG BARAT', 18);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PESISIR BARAT', 18);
insert into tb_city values(seq_city_id.nextval, 'KOTA BANDAR LAMPUNG', 18);
insert into tb_city values(seq_city_id.nextval, 'KOTA METRO', 18);

  -- ('18', 'LAMPUNG'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANGKA', 19);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BELITUNG', 19);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANGKA BARAT', 19);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANGKA TENGAH', 19);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANGKA SELATAN', 19);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BELITUNG TIMUR', 19);
insert into tb_city values(seq_city_id.nextval, 'KOTA PANGKAL PINANG', 19);

  -- ('19', 'KEPULAUAN BANGKA BELITUNG'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KARIMUN', 21);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BINTAN', 21);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NATUNA', 21);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LINGGA', 21);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEPULAUAN ANAMBAS', 21);
insert into tb_city values(seq_city_id.nextval, 'KOTA B A T A M', 21);
insert into tb_city values(seq_city_id.nextval, 'KOTA TANJUNG PINANG', 21);

  -- ('21', 'KEPULAUAN RIAU'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEPULAUAN SERIBU', 31);
insert into tb_city values(seq_city_id.nextval, 'KOTA JAKARTA SELATAN', 31);
insert into tb_city values(seq_city_id.nextval, 'KOTA JAKARTA TIMUR', 31);
insert into tb_city values(seq_city_id.nextval, 'KOTA JAKARTA PUSAT', 31);
insert into tb_city values(seq_city_id.nextval, 'KOTA JAKARTA BARAT', 31);
insert into tb_city values(seq_city_id.nextval, 'KOTA JAKARTA UTARA', 31);

  -- ('31', 'DKI JAKARTA'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BOGOR', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUKABUMI', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN CIANJUR', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANDUNG', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN GARUT', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TASIKMALAYA', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN CIAMIS', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KUNINGAN', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN CIREBON', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAJALENGKA', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUMEDANG', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN INDRAMAYU', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUBANG', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PURWAKARTA', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KARAWANG', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BEKASI', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANDUNG BARAT', 32);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PANGANDARAN', 32);
insert into tb_city values(seq_city_id.nextval, 'KOTA BOGOR', 32);
insert into tb_city values(seq_city_id.nextval, 'KOTA SUKABUMI', 32);
insert into tb_city values(seq_city_id.nextval, 'KOTA BANDUNG', 32);
insert into tb_city values(seq_city_id.nextval, 'KOTA CIREBON', 32);
insert into tb_city values(seq_city_id.nextval, 'KOTA BEKASI', 32);
insert into tb_city values(seq_city_id.nextval, 'KOTA DEPOK', 32);
insert into tb_city values(seq_city_id.nextval, 'KOTA CIMAHI', 32);
insert into tb_city values(seq_city_id.nextval, 'KOTA TASIKMALAYA', 32);
insert into tb_city values(seq_city_id.nextval, 'KOTA BANJAR', 32);

  -- ('32', 'JAWA BARAT'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN CILACAP', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANYUMAS', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PURBALINGGA', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANJARNEGARA', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEBUMEN', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PURWOREJO', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN WONOSOBO', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAGELANG', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BOYOLALI', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KLATEN', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUKOHARJO', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN WONOGIRI', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KARANGANYAR', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SRAGEN', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN GROBOGAN', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BLORA', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN REMBANG', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PATI', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KUDUS', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN JEPARA', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN DEMAK', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SEMARANG', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TEMANGGUNG', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KENDAL', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BATANG', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PEKALONGAN', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PEMALANG', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TEGAL', 33);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BREBES', 33);
insert into tb_city values(seq_city_id.nextval, 'KOTA MAGELANG', 33);
insert into tb_city values(seq_city_id.nextval, 'KOTA SURAKARTA', 33);
insert into tb_city values(seq_city_id.nextval, 'KOTA SALATIGA', 33);
insert into tb_city values(seq_city_id.nextval, 'KOTA SEMARANG', 33);
insert into tb_city values(seq_city_id.nextval, 'KOTA PEKALONGAN', 33);
insert into tb_city values(seq_city_id.nextval, 'KOTA TEGAL', 33);

  -- ('33', 'JAWA TENGAH'),
  
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KULON PROGO', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANTUL', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN GUNUNG KIDUL', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SLEMAN', 35);

-- ('34', 'DI YOGYAKARTA'),
 
insert into tb_city values(seq_city_id.nextval, 'KOTA YOGYAKARTA', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PACITAN', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PONOROGO', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TRENGGALEK', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TULUNGAGUNG', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BLITAR', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEDIRI', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MALANG', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LUMAJANG', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN JEMBER', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANYUWANGI', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BONDOWOSO', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SITUBONDO', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PROBOLINGGO', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PASURUAN', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SIDOARJO', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MOJOKERTO', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN JOMBANG', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NGANJUK', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MADIUN', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAGETAN', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NGAWI', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BOJONEGORO', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TUBAN', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LAMONGAN', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN GRESIK', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANGKALAN', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SAMPANG', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PAMEKASAN', 35);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUMENEP', 35);
insert into tb_city values(seq_city_id.nextval, 'KOTA KEDIRI', 35);
insert into tb_city values(seq_city_id.nextval, 'KOTA BLITAR', 35);
insert into tb_city values(seq_city_id.nextval, 'KOTA MALANG', 35);
insert into tb_city values(seq_city_id.nextval, 'KOTA PROBOLINGGO', 35);
insert into tb_city values(seq_city_id.nextval, 'KOTA PASURUAN', 35);
insert into tb_city values(seq_city_id.nextval, 'KOTA MOJOKERTO', 35);
insert into tb_city values(seq_city_id.nextval, 'KOTA MADIUN', 35);
insert into tb_city values(seq_city_id.nextval, 'KOTA SURABAYA', 35);
insert into tb_city values(seq_city_id.nextval, 'KOTA BATU', 35);

 -- ('35', 'JAWA TIMUR'),
  
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PANDEGLANG', 36);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LEBAK', 36);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TANGERANG', 36);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SERANG', 36);
insert into tb_city values(seq_city_id.nextval, 'KOTA TANGERANG', 36);
insert into tb_city values(seq_city_id.nextval, 'KOTA CILEGON', 36);
insert into tb_city values(seq_city_id.nextval, 'KOTA SERANG', 36);

-- ('36', 'BANTEN'),

insert into tb_city values(seq_city_id.nextval, 'KOTA TANGERANG SELATAN', 36);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN JEMBRANA', 51);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TABANAN', 51);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BADUNG', 51);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN GIANYAR', 51);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KLUNGKUNG', 51);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANGLI', 51);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KARANG ASEM', 51);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BULELENG', 51);
insert into tb_city values(seq_city_id.nextval, 'KOTA DENPASAR', 51);

  -- ('51', 'BALI'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LOMBOK BARAT', 52);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LOMBOK TENGAH', 52);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LOMBOK TIMUR', 52);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUMBAWA', 52);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN DOMPU', 52);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BIMA', 52);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUMBAWA BARAT', 52);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LOMBOK UTARA', 52);
insert into tb_city values(seq_city_id.nextval, 'KOTA MATARAM', 52);
insert into tb_city values(seq_city_id.nextval, 'KOTA BIMA', 52);

-- ('52', 'NUSA TENGGARA BARAT'),
 
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUMBA BARAT', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUMBA TIMUR', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KUPANG', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TIMOR TENGAH SELATAN', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TIMOR TENGAH UTARA', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BELU', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ALOR', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LEMBATA', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN FLORES TIMUR', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SIKKA', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ENDE', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NGADA', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MANGGARAI', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ROTE NDAO', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MANGGARAI BARAT', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUMBA TENGAH', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUMBA BARAT DAYA', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NAGEKEO', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MANGGARAI TIMUR', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SABU RAIJUA', 53);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MALAKA', 53);
insert into tb_city values(seq_city_id.nextval, 'KOTA KUPANG', 53);

 -- ('53', 'NUSA TENGGARA TIMUR'),
 
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SAMBAS', 61);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BENGKAYANG', 61);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LANDAK', 61);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MEMPAWAH', 61);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SANGGAU', 61);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KETAPANG', 61);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SINTANG', 61);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KAPUAS HULU', 61);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SEKADAU', 61);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MELAWI', 61);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KAYONG UTARA', 61);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KUBU RAYA', 61);
insert into tb_city values(seq_city_id.nextval, 'KOTA PONTIANAK', 61);
insert into tb_city values(seq_city_id.nextval, 'KOTA SINGKAWANG', 61);

 -- ('61', 'KALIMANTAN BARAT'),
 
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KOTAWARINGIN BARAT', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KOTAWARINGIN TIMUR', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KAPUAS', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BARITO SELATAN', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BARITO UTARA', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUKAMARA', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LAMANDAU', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SERUYAN', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KATINGAN', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PULANG PISAU', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN GUNUNG MAS', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BARITO TIMUR', 62);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MURUNG RAYA', 62);
insert into tb_city values(seq_city_id.nextval, 'KOTA PALANGKA RAYA', 62);

-- ('63', 'KALIMANTAN SELATAN'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TANAH LAUT', 63);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KOTA BARU', 63);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANJAR', 63);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BARITO KUALA', 63);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TAPIN', 63);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN HULU SUNGAI SELATAN', 63);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN HULU SUNGAI TENGAH', 63);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN HULU SUNGAI UTARA', 63);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TABALONG', 63);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TANAH BUMBU', 63);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BALANGAN', 63);
insert into tb_city values(seq_city_id.nextval, 'KOTA BANJARMASIN', 63);
insert into tb_city values(seq_city_id.nextval, 'KOTA BANJAR BARU', 63);

  -- ('64', 'KALIMANTAN TIMUR'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PASER', 64);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KUTAI BARAT', 64);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KUTAI KARTANEGARA', 64);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KUTAI TIMUR', 64);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BERAU', 64);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PENAJAM PASER UTARA', 64);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAHAKAM HULU', 64);
insert into tb_city values(seq_city_id.nextval, 'KOTA BALIKPAPAN', 64);
insert into tb_city values(seq_city_id.nextval, 'KOTA SAMARINDA', 64);
insert into tb_city values(seq_city_id.nextval, 'KOTA BONTANG', 64);

  -- ('65', 'KALIMANTAN UTARA'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MALINAU', 65);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BULUNGAN', 65);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TANA TIDUNG', 65);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NUNUKAN', 65);
insert into tb_city values(seq_city_id.nextval, 'KOTA TARAKAN', 65);

  -- ('71', 'SULAWESI UTARA'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BOLAANG MONGONDOW', 71);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MINAHASA', 71);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEPULAUAN SANGIHE', 71);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEPULAUAN TALAUD', 71);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MINAHASA SELATAN', 71);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MINAHASA UTARA', 71);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BOLAANG MONGONDOW UTARA', 71);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SIAU TAGULANDANG BIARO', 71);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MINAHASA TENGGARA', 71);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BOLAANG MONGONDOW SELATAN', 71);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BOLAANG MONGONDOW TIMUR', 71);
insert into tb_city values(seq_city_id.nextval, 'KOTA MANADO', 71);
insert into tb_city values(seq_city_id.nextval, 'KOTA BITUNG', 71);
insert into tb_city values(seq_city_id.nextval, 'KOTA TOMOHON', 71);
insert into tb_city values(seq_city_id.nextval, 'KOTA KOTAMOBAGU', 71);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANGGAI KEPULAUAN', 72);

  -- ('72', 'SULAWESI TENGAH'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANGGAI', 72);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MOROWALI', 72);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN POSO', 72);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN DONGGALA', 72);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TOLI-TOLI', 72);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BUOL', 72);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PARIGI MOUTONG', 72);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TOJO UNA-UNA', 72);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SIGI', 72);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANGGAI LAUT', 72);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MOROWALI UTARA', 72);
insert into tb_city values(seq_city_id.nextval, 'KOTA PALU', 72);

  -- ('73', 'SULAWESI SELATAN'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEPULAUAN SELAYAR', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BULUKUMBA', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BANTAENG', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN JENEPONTO', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TAKALAR', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN GOWA', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SINJAI', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAROS', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PANGKAJENE DAN KEPULAUAN', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BARRU', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BONE', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SOPPENG', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN WAJO', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SIDENRENG RAPPANG', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PINRANG', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ENREKANG', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LUWU', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TANA TORAJA', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LUWU UTARA', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LUWU TIMUR', 73);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TORAJA UTARA', 73);
insert into tb_city values(seq_city_id.nextval, 'KOTA MAKASSAR', 73);
insert into tb_city values(seq_city_id.nextval, 'KOTA PAREPARE', 73);
insert into tb_city values(seq_city_id.nextval, 'KOTA PALOPO', 73);

  -- ('74', 'SULAWESI TENGGARA'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BUTON', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MUNA', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KONAWE', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KOLAKA', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KONAWE SELATAN', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BOMBANA', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN WAKATOBI', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KOLAKA UTARA', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BUTON UTARA', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KONAWE UTARA', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KOLAKA TIMUR', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KONAWE KEPULAUAN', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MUNA BARAT', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BUTON TENGAH', 74);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BUTON SELATAN', 74);
insert into tb_city values(seq_city_id.nextval, 'KOTA KENDARI', 74);
insert into tb_city values(seq_city_id.nextval, 'KOTA BAUBAU', 74);

  -- ('75', 'GORONTALO'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BOALEMO', 75);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN GORONTALO', 75);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN POHUWATO', 75);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BONE BOLANGO', 75);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN GORONTALO UTARA', 75);
insert into tb_city values(seq_city_id.nextval, 'KOTA GORONTALO', 75);

  -- ('76', 'SULAWESI BARAT'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAJENE', 76);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN POLEWALI MANDAR', 76);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAMASA', 76);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAMUJU', 76);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAMUJU UTARA', 76);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAMUJU TENGAH', 76);

  -- ('81', 'MALUKU'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MALUKU TENGGARA BARAT', 81);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MALUKU TENGGARA', 81);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MALUKU TENGAH', 81);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BURU', 81);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEPULAUAN ARU', 81);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SERAM BAGIAN BARAT', 81);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SERAM BAGIAN TIMUR', 81);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MALUKU BARAT DAYA', 81);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BURU SELATAN', 81);
insert into tb_city values(seq_city_id.nextval, 'KOTA AMBON', 81);
insert into tb_city values(seq_city_id.nextval, 'KOTA TUAL', 81);

  -- ('82', 'MALUKU UTARA'),
	
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN HALMAHERA BARAT', 82);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN HALMAHERA TENGAH', 82);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEPULAUAN SULA', 82);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN HALMAHERA SELATAN', 82);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN HALMAHERA UTARA', 82);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN HALMAHERA TIMUR', 82);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PULAU MOROTAI', 82);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PULAU TALIABU', 82);
insert into tb_city values(seq_city_id.nextval, 'KOTA TERNATE', 82);
insert into tb_city values(seq_city_id.nextval, 'KOTA TIDORE KEPULAUAN', 82);

  -- ('91', 'PAPUA BARAT'),

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN FAKFAK', 91);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KAIMANA', 91);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TELUK WONDAMA', 91);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TELUK BINTUNI', 91);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MANOKWARI', 91);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SORONG SELATAN', 91);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SORONG', 91);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN RAJA AMPAT', 91);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TAMBRAUW', 91);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAYBRAT', 91);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MANOKWARI SELATAN', 91);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PEGUNUNGAN ARFAK', 91);
insert into tb_city values(seq_city_id.nextval, 'KOTA SORONG', 91);

  -- ('94', 'PAPUA');

insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MERAUKE', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN JAYAWIJAYA', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN JAYAPURA', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NABIRE', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEPULAUAN YAPEN', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BIAK NUMFOR', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PANIAI', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PUNCAK JAYA', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MIMIKA', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN BOVEN DIGOEL', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAPPI', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN ASMAT', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN YAHUKIMO', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PEGUNUNGAN BINTANG', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN TOLIKARA', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SARMI', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN KEEROM', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN WAROPEN', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN SUPIORI', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAMBERAMO RAYA', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN NDUGA', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN LANNY JAYA', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN MAMBERAMO TENGAH', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN YALIMO', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN PUNCAK', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN DOGIYAI', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN INTAN JAYA', 94);
insert into tb_city values(seq_city_id.nextval, 'KABUPATEN DEIYAI', 94);
insert into tb_city values(seq_city_id.nextval, 'KOTA JAYAPURA', 94);

insert into tb_district values(seq_district_id.nextval, 'Sukasari', 1, 1);
insert into tb_district values(seq_district_id.nextval, 'TEUPAH SELATAN', 11, 1101);
insert into tb_district values(seq_district_id.nextval, 'SIMEULUE TIMUR', 11, 1101);
 insert into tb_district values(seq_district_id.nextval, 'TEUPAH BARAT', 11, 1101);
 insert into tb_district values(seq_district_id.nextval, 'TEUPAH TENGAH', 11, 1101);
 insert into tb_district values(seq_district_id.nextval, 'SIMEULUE TENGAH', 11, 1101);
 insert into tb_district values(seq_district_id.nextval, 'TELUK DALAM', 11, 1101);
 insert into tb_district values(seq_district_id.nextval, 'SIMEULUE CUT', 11, 1101);
 insert into tb_district values(seq_district_id.nextval, 'SALANG', 11, 1101);
 insert into tb_district values(seq_district_id.nextval, 'SIMEULUE BARAT', 11, 1101);
 insert into tb_district values(seq_district_id.nextval, 'ALAFAN', 11, 1101);
 insert into tb_district values(seq_district_id.nextval, 'PULAU BANYAK', 11, 1102);
 insert into tb_district values(seq_district_id.nextval, 'PULAU BANYAK BARAT', 11, 1102);
 insert into tb_district values(seq_district_id.nextval, 'SINGKIL', 11, 1102);
 insert into tb_district values(seq_district_id.nextval, 'SINGKIL UTARA', 11, 1102);
 insert into tb_district values(seq_district_id.nextval, 'KUALA BARU', 11, 1102);
 insert into tb_district values(seq_district_id.nextval, 'SIMPANG KANAN', 11, 1102);
 insert into tb_district values(seq_district_id.nextval, 'GUNUNG MERIAH', 11, 1102);
 insert into tb_district values(seq_district_id.nextval, 'DANAU PARIS', 11, 1102);
 insert into tb_district values(seq_district_id.nextval, 'SURO', 11, 1102);
 insert into tb_district values(seq_district_id.nextval, 'SINGKOHOR', 11, 1102);
 insert into tb_district values(seq_district_id.nextval, 'KOTA BAHARU', 11, 1102);
 insert into tb_district values(seq_district_id.nextval, 'TRUMON', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'TRUMON TIMUR', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'TRUMON TENGAH', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'BAKONGAN', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'BAKONGAN TIMUR', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'KOTA BAHAGIA', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'KLUET SELATAN', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'KLUET TIMUR', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'KLUET UTARA', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'PASIE RAJA', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'KLUET TENGAH', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'TAPAK TUAN', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'SAMA DUA', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'SAWANG', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'MEUKEK', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'LABUHAN HAJI', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'LABUHAN HAJI TIMUR', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'LABUHAN HAJI BARAT', 11, 1103);
 insert into tb_district values(seq_district_id.nextval, 'LAWE ALAS', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'BABUL RAHMAH', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'TANOH ALAS', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'LAWE SIGALA-GALA', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'BABUL MAKMUR', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'SEMADAM', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'LAUSER', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'BAMBEL', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'BUKIT TUSAM', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'LAWE SUMUR', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'BABUSSALAM', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'LAWE BULAN', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'BADAR', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'DARUL HASANAH', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'KETAMBE', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'DELENG POKHKISEN', 11, 1104);
 insert into tb_district values(seq_district_id.nextval, 'SERBA JADI', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'SIMPANG JERNIH', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'PEUNARON', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'BIREM BAYEUN', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'RANTAU SELAMAT', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'SUNGAI RAYA', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'PEUREULAK', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'PEUREULAK TIMUR', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'PEUREULAK BARAT', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'RANTO PEUREULAK', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'IDI RAYEUK', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'PEUDAWA', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'BANDA ALAM', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'IDI TUNONG', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'DARUL IHSAN', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'IDI TIMUR', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'DARUL AMAN', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'NURUSSALAM', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'DARUL FALAH', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'JULOK', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'INDRA MAKMUR', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'PANTE BIDARI', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'SIMPANG ULIM', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'MADAT', 11, 1105);
 insert into tb_district values(seq_district_id.nextval, 'LINGE', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'ATU LINTANG', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'JAGONG JEGET', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'BINTANG', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'LUT TAWAR', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'KEBAYAKAN', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'PEGASING', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'BIES', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'BEBESEN', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'KUTE PANANG', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'SILIH NARA', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'KETOL', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'CELALA', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'RUSIP ANTARA', 11, 1106);
 insert into tb_district values(seq_district_id.nextval, 'JOHAN PAHLAWAN', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'SAMATIGA', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'BUBON', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'ARONGAN LAMBALEK', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'WOYLA', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'WOYLA BARAT', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'WOYLA TIMUR', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'KAWAY XVI', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'MEUREUBO', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'PANTAI CEUREMEN', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'PANTON REU', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'SUNGAI MAS', 11, 1107);
 insert into tb_district values(seq_district_id.nextval, 'LHOONG', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'LHOKNGA', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'LEUPUNG', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'INDRAPURI', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'KUTA COT GLIE', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'SEULIMEUM', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'KOTA JANTHO', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'LEMBAH SEULAWAH', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'MESJID RAYA', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'DARUSSALAM', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'BAITUSSALAM', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'KUTA BARO', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'MONTASIK', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'BLANG BINTANG', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'INGIN JAYA', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'KRUENG BARONA JAYA', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'SUKA MAKMUR', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'KUTA MALAKA', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'SIMPANG TIGA', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'DARUL IMARAH', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'DARUL KAMAL', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'PEUKAN BADA', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'PULO ACEH', 11, 1108);
 insert into tb_district values(seq_district_id.nextval, 'GEUMPANG', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'MANE', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'GLUMPANG TIGA', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'GLUMPANG BARO', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'MUTIARA', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'MUTIARA TIMUR', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'TIRO/TRUSEB', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'TANGSE', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'KEUMALA', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'TITEUE', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'SAKTI', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'MILA', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'PADANG TIJI', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'DELIMA', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'GRONG GRONG', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'INDRAJAYA', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'PEUKAN BARO', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'KEMBANG TANJONG', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'SIMPANG TIGA', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'KOTA SIGLI', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'PIDIE', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'BATEE', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'MUARA TIGA', 11, 1109);
 insert into tb_district values(seq_district_id.nextval, 'SAMALANGA', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'SIMPANG MAMPLAM', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'PANDRAH', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'JEUNIEB', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'PEULIMBANG', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'PEUDADA', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'JULI', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'JEUMPA', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'KOTA JUANG', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'KUALA', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'JANGKA', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'PEUSANGAN', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'PEUSANGAN SELATAN', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'PEUSANGAN SIBLAH KRUENG', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'MAKMUR', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'GANDA PURA', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'KUTA BLANG', 11, 1110);
 insert into tb_district values(seq_district_id.nextval, 'SAWANG', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'NISAM', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'NISAM ANTARA', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'BANDA BARO', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'KUTA MAKMUR', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'SIMPANG KERAMAT', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'SYAMTALIRA BAYU', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'GEUREUDONG PASE', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'MEURAH MULIA', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'MATANGKULI', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'PAYA BAKONG', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'PIRAK TIMU', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'COT GIREK', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'TANAH JAMBO AYE', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'LANGKAHAN', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'SEUNUDDON', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'BAKTIYA', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'BAKTIYA BARAT', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'LHOKSUKON', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'TANAH LUAS', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'NIBONG', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'SAMUDERA', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'SYAMTALIRA ARON', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'TANAH PASIR', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'LAPANG', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'MUARA BATU', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'DEWANTARA', 11, 1111);
 insert into tb_district values(seq_district_id.nextval, 'MANGGENG', 11, 1112);
 insert into tb_district values(seq_district_id.nextval, 'LEMBAH SABIL', 11, 1112);
 insert into tb_district values(seq_district_id.nextval, 'TANGAN-TANGAN', 11, 1112);
 insert into tb_district values(seq_district_id.nextval, 'SETIA', 11, 1112);
 insert into tb_district values(seq_district_id.nextval, 'BLANG PIDIE', 11, 1112);
 insert into tb_district values(seq_district_id.nextval, 'JEUMPA', 11, 1112);
 insert into tb_district values(seq_district_id.nextval, 'SUSOH', 11, 1112);
 insert into tb_district values(seq_district_id.nextval, 'KUALA BATEE', 11, 1112);
 insert into tb_district values(seq_district_id.nextval, 'BABAH ROT', 11, 1112);

 insert into tb_district values(seq_district_id.nextval, 'KUTA PANJANG', 11, 1113);
 insert into tb_district values(seq_district_id.nextval, 'BLANG JERANGO', 11, 1113);
 insert into tb_district values(seq_district_id.nextval, 'BLANGKEJEREN', 11, 1113);
 insert into tb_district values(seq_district_id.nextval, 'PUTRI BETUNG', 11, 1113);
 insert into tb_district values(seq_district_id.nextval, 'DABUN GELANG', 11, 1113);
 insert into tb_district values(seq_district_id.nextval, 'BLANG PEGAYON', 11, 1113);
 insert into tb_district values(seq_district_id.nextval, 'PINING', 11, 1113);
 insert into tb_district values(seq_district_id.nextval, 'RIKIT GAIB', 11, 1113);
 insert into tb_district values(seq_district_id.nextval, 'PANTAN CUACA', 11, 1113);
 insert into tb_district values(seq_district_id.nextval, 'TERANGUN', 11, 1113);
 insert into tb_district values(seq_district_id.nextval, 'TRIPE JAYA', 11, 1113);
 insert into tb_district values(seq_district_id.nextval, 'TAMIANG HULU', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'BANDAR PUSAKA', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'KEJURUAN MUDA', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'TENGGULUN', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'RANTAU', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'KOTA KUALA SIMPANG', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'SERUWAY', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'BENDAHARA', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'BANDA MULIA', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'KARANG BARU', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'SEKERAK', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'MANYAK PAYED', 11, 1114);
 insert into tb_district values(seq_district_id.nextval, 'DARUL MAKMUR', 11, 1115);
 insert into tb_district values(seq_district_id.nextval, 'TRIPA MAKMUR', 11, 1115);
 insert into tb_district values(seq_district_id.nextval, 'KUALA', 11, 1115);
 insert into tb_district values(seq_district_id.nextval, 'KUALA PESISIR', 11, 1115);
 insert into tb_district values(seq_district_id.nextval, 'TADU RAYA', 11, 1115);
 insert into tb_district values(seq_district_id.nextval, 'BEUTONG', 11, 1115);
 insert into tb_district values(seq_district_id.nextval, 'BEUTONG ATEUH BANGGALANG', 11, 1115);
 insert into tb_district values(seq_district_id.nextval, 'SEUNAGAN', 11, 1115);
 insert into tb_district values(seq_district_id.nextval, 'SUKA MAKMUE', 11, 1115);
 insert into tb_district values(seq_district_id.nextval, 'SEUNAGAN TIMUR', 11, 1115);
 insert into tb_district values(seq_district_id.nextval, 'TEUNOM', 11, 1116);
 insert into tb_district values(seq_district_id.nextval, 'PASIE RAYA', 11, 1116);
 insert into tb_district values(seq_district_id.nextval, 'PANGA', 11, 1116);
 insert into tb_district values(seq_district_id.nextval, 'KRUENG SABEE', 11, 1116);
 insert into tb_district values(seq_district_id.nextval, 'SETIA BAKTI', 11, 1116);
 insert into tb_district values(seq_district_id.nextval, 'SAMPOINIET', 11, 1116);
 insert into tb_district values(seq_district_id.nextval, 'DARUL HIKMAH', 11, 1116);
 insert into tb_district values(seq_district_id.nextval, 'JAYA', 11, 1116);
 insert into tb_district values(seq_district_id.nextval, 'INDRA JAYA', 11, 1117);
 insert into tb_district values(seq_district_id.nextval, 'TIMANG GAJAH', 11, 1117);
 insert into tb_district values(seq_district_id.nextval, 'GAJAH PUTIH', 11, 1117);
 insert into tb_district values(seq_district_id.nextval, 'PINTU RIME GAYO', 11, 1117);
 insert into tb_district values(seq_district_id.nextval, 'BUKIT', 11, 1117);
 insert into tb_district values(seq_district_id.nextval, 'WIH PESAM', 11, 1117);
 insert into tb_district values(seq_district_id.nextval, 'BANDAR', 11, 1117);
 insert into tb_district values(seq_district_id.nextval, 'BENER KELIPAH', 11, 1117);
 insert into tb_district values(seq_district_id.nextval, 'SYIAH UTAMA', 11, 1117);
 insert into tb_district values(seq_district_id.nextval, 'MESIDAH', 11, 1117);
 insert into tb_district values(seq_district_id.nextval, 'PERMATA', 11, 1117);
 insert into tb_district values(seq_district_id.nextval, 'MEUREUDU', 11, 1118);
 insert into tb_district values(seq_district_id.nextval, 'MEURAH DUA', 11, 1118);
 insert into tb_district values(seq_district_id.nextval, 'BANDAR DUA', 11, 1118);
 insert into tb_district values(seq_district_id.nextval, 'JANGKA BUYA', 11, 1118);
 insert into tb_district values(seq_district_id.nextval, 'ULIM', 11, 1118);
 insert into tb_district values(seq_district_id.nextval, 'TRIENGGADENG', 11, 1118);
 insert into tb_district values(seq_district_id.nextval, 'PANTERAJA', 11, 1118);
 insert into tb_district values(seq_district_id.nextval, 'BANDAR BARU', 11, 1118);
 insert into tb_district values(seq_district_id.nextval, 'MEURAXA', 11, 1171);
 insert into tb_district values(seq_district_id.nextval, 'JAYA BARU', 11, 1171);
 insert into tb_district values(seq_district_id.nextval, 'BANDA RAYA', 11, 1171);
 insert into tb_district values(seq_district_id.nextval, 'BAITURRAHMAN', 11, 1171);
 insert into tb_district values(seq_district_id.nextval, 'LUENG BATA', 11, 1171);
 insert into tb_district values(seq_district_id.nextval, 'KUTA ALAM', 11, 1171);
 insert into tb_district values(seq_district_id.nextval, 'KUTA RAJA', 11, 1171);
 insert into tb_district values(seq_district_id.nextval, 'SYIAH KUALA', 11, 1171);
 insert into tb_district values(seq_district_id.nextval, 'ULEE KARENG', 11, 1171);
 insert into tb_district values(seq_district_id.nextval, 'SUKAJAYA', 11, 1172);
 insert into tb_district values(seq_district_id.nextval, 'SUKAKARYA', 11, 1172);
 insert into tb_district values(seq_district_id.nextval, 'LANGSA TIMUR', 11, 1173);
 insert into tb_district values(seq_district_id.nextval, 'LANGSA LAMA', 11, 1173);
 insert into tb_district values(seq_district_id.nextval, 'LANGSA BARAT', 11, 1173);
 insert into tb_district values(seq_district_id.nextval, 'LANGSA BARO', 11, 1173);
 insert into tb_district values(seq_district_id.nextval, 'LANGSA KOTA', 11, 1173);
 insert into tb_district values(seq_district_id.nextval, 'BLANG MANGAT', 11, 1174);
 insert into tb_district values(seq_district_id.nextval, 'MUARA DUA', 11, 1174);
 insert into tb_district values(seq_district_id.nextval, 'MUARA SATU', 11, 1174);
 insert into tb_district values(seq_district_id.nextval, 'BANDA SAKTI', 11, 1174);
 insert into tb_district values(seq_district_id.nextval, 'SIMPANG KIRI', 11, 1175);
 insert into tb_district values(seq_district_id.nextval, 'PENANGGALAN', 11, 1175);
 insert into tb_district values(seq_district_id.nextval, 'RUNDENG', 11, 1175);
 insert into tb_district values(seq_district_id.nextval, 'SULTAN DAULAT', 11, 1175);
 insert into tb_district values(seq_district_id.nextval, 'LONGKIB', 11, 1175);
 insert into tb_district values(seq_district_id.nextval, 'IDANO GAWO', 12, 1201);
 insert into tb_district values(seq_district_id.nextval, 'BAWOLATO', 12, 1201);
 insert into tb_district values(seq_district_id.nextval, 'ULUGAWO', 12, 1201);
 insert into tb_district values(seq_district_id.nextval, 'GIDO', 12, 1201);
 insert into tb_district values(seq_district_id.nextval, 'SOGAEADU', 12, 1201);
 insert into tb_district values(seq_district_id.nextval, 'MA U', 12, 1201);
 insert into tb_district values(seq_district_id.nextval, 'SOMOLO - MOLO', 12, 1201);
 insert into tb_district values(seq_district_id.nextval, 'HILIDUHO', 12, 1201);
 insert into tb_district values(seq_district_id.nextval, 'HILI SERANGKAI', 12, 1201);
 insert into tb_district values(seq_district_id.nextval, 'BOTOMUZOI', 12, 1201);
 insert into tb_district values(seq_district_id.nextval, 'BATAHAN', 12, 1202);
 insert insert tb_district values(seq_district_id.nextval, 'SINUNUKAN', 12, 1202);
 insert insert tb_district values(seq_district_id.nextval, 'BATANG NATAL', 12, 1202);
 insert insert tb_district values(seq_district_id.nextval, 'LINGGA BAYU', 12, 1202);
 insert insert tb_district values(seq_district_id.nextval, 'RANTO BAEK', 12, 1202);
 insert insert tb_district values(seq_district_id.nextval, 'KOTANOPAN', 12, 1202);
 insert insert tb_district values(seq_district_id.nextval, 'BATANG ANGKOLA', 12, 1203);
 insert insert tb_district values(seq_district_id.nextval, 'SAYUR MATINGGI', 12, 1203);
 insert insert tb_district values(seq_district_id.nextval, 'TANO TOMBANGAN ANGKOLA', 12, 1203);
 insert insert tb_district values(seq_district_id.nextval, 'ANGKOLA TIMUR', 12, 1203);
 insert insert tb_district values(seq_district_id.nextval, 'ANGKOLA SELATAN', 12, 1203);
 insert insert tb_district values(seq_district_id.nextval, 'ANGKOLA  BARAT', 12, 1203);
 insert insert tb_district values(seq_district_id.nextval, 'ANGKOLA SANGKUNUR', 12, 1203);
 insert insert tb_district values(seq_district_id.nextval, 'BATANG TORU', 12, 1203);
 insert insert tb_district values(seq_district_id.nextval, 'MARANCAR', 12, 1203);
 insert insert tb_district values(seq_district_id.nextval, 'MUARA BATANG TORU', 12, 1203);
 insert insert tb_district values(seq_district_id.nextval, 'PINANG SORI', 12, 1204);
 insert insert tb_district values(seq_district_id.nextval, 'BADIRI', 12, 1204);
 insert insert tb_district values(seq_district_id.nextval, 'SIBABANGUN', 12, 1204);
 insert insert tb_district values(seq_district_id.nextval, 'LUMUT', 12, 1204);
 insert insert tb_district values(seq_district_id.nextval, 'SUKABANGUN', 12, 1204);
 insert insert tb_district values(seq_district_id.nextval, 'PANDAN', 12, 1204);
 insert insert tb_district values(seq_district_id.nextval, 'TUKKA', 12, 1204);
 insert insert tb_district values(seq_district_id.nextval, 'SARUDIK', 12, 1204);
 insert insert tb_district values(seq_district_id.nextval, 'TAPIAN NAULI', 12, 1204);
insert insert tb_district values(seq_district_id.nextval , 'SITAHUIS', 12, 1204);
insert insert tb_district values(seq_district_id.nextval , 'PARMONANGAN', 12, 1205);
 insert insert tb_district values(seq_district_id.nextval, 'ADIANKOTING', 12, 1205);
 insert insert tb_district values(seq_district_id.nextval, 'SIPOHOLON', 12, 1205);
 insert insert tb_district values(seq_district_id.nextval, 'TARUTUNG', 12, 1205);
 insert insert tb_district values(seq_district_id.nextval, 'SIATAS BARITA', 12, 1205);
 insert insert tb_district values(seq_district_id.nextval, 'PAHAE JULU', 12, 1205);
insert insert tb_district values(seq_district_id.nextval , 'PAHAE JAE', 12, 1205);
 insert insert tb_district values(seq_district_id.nextval, 'PURBATUA', 12, 1205);
 insert insert tb_district values(seq_district_id.nextval, 'SIMANGUMBAN', 12, 1205);
 insert insert tb_district values(seq_district_id.nextval, 'PANGARIBUAN', 12, 1205);
 insert insert tb_district values(seq_district_id.nextval, 'BALIGE', 12, 1206);
 insert insert tb_district values(seq_district_id.nextval, 'TAMPAHAN', 12, 1206);
 insert insert tb_district values(seq_district_id.nextval, 'LAGUBOTI', 12, 1206);
 insert insert tb_district values(seq_district_id.nextval, 'HABINSARAN', 12, 1206);
 insert insert tb_district values(seq_district_id.nextval, 'BORBOR', 12, 1206);
 insert insert tb_district values(seq_district_id.nextval, 'BILAH HULU', 12, 1207);
 insert insert tb_district values(seq_district_id.nextval, 'PANGKATAN', 12, 1207);
 insert insert tb_district values(seq_district_id.nextval, 'BILAH BARAT', 12, 1207);
 insert insert tb_district values(seq_district_id.nextval, 'BILAH HILIR', 12, 1207);
 insert insert tb_district values(seq_district_id.nextval, 'PANAI HULU', 12, 1207);
 insert insert tb_district values(seq_district_id.nextval, 'BANDAR PASIR MANDOGE', 12, 1208);
 insert insert tb_district values(seq_district_id.nextval, 'BANDAR PULAU', 12, 1208);
 insert insert tb_district values(seq_district_id.nextval, 'AEK SONGSONGAN', 12, 1208);
 insert insert tb_district values(seq_district_id.nextval, 'RAHUNING', 12, 1208);
 insert insert tb_district values(seq_district_id.nextval, 'SILIMAKUTA', 12, 1209);
insert insert tb_district values(seq_district_id.nextval , 'PEMATANG SILIMAHUTA', 12, 1209);
insert insert tb_district values(seq_district_id.nextval , 'PURBA', 12, 1209);
 insert insert tb_district values(seq_district_id.nextval, 'HARANGGAOL HORISON', 12, 1209);
 insert insert tb_district values(seq_district_id.nextval, 'DOLOK PARDAMEAN', 12, 1209);
 insert insert tb_district values(seq_district_id.nextval, 'SIDIKALANG', 12, 1210);
 insert insert tb_district values(seq_district_id.nextval, 'BERAMPU', 12, 1210);
 insert insert tb_district values(seq_district_id.nextval, 'SITINJO', 12, 1210);
insert insert tb_district values(seq_district_id.nextval , 'PARBULUAN', 12, 1210);
 insert insert tb_district values(seq_district_id.nextval, 'SUMBUL', 12, 1210);
 insert insert tb_district values(seq_district_id.nextval, 'MARDINGDING', 12, 1211);
 insert insert tb_district values(seq_district_id.nextval, 'LAUBALENG', 12, 1211);
 insert insert tb_district values(seq_district_id.nextval, 'TIGA BINANGA', 12, 1211);
 insert insert tb_district values(seq_district_id.nextval, 'JUHAR', 12, 1211);
 insert insert tb_district values(seq_district_id.nextval, 'MUNTE', 12, 1211);
 insert insert tb_district values(seq_district_id.nextval, 'GUNUNG MERIAH', 12, 1212);
 insert insert tb_district values(seq_district_id.nextval, 'SINEMBAH TANJUNG MUDA HULU', 12, 1212);
 insert insert tb_district values(seq_district_id.nextval, 'SIBOLANGIT', 12, 1212);
 insert insert tb_district values(seq_district_id.nextval, 'KUTALIMBARU', 12, 1212);
 insert insert tb_district values(seq_district_id.nextval, 'PANCUR BATU', 12, 1212);
 insert insert tb_district values(seq_district_id.nextval, 'SIRAPIT', 12, 1213);
 insert insert tb_district values(seq_district_id.nextval, 'SALAPIAN', 12, 1213);
 insert insert tb_district values(seq_district_id.nextval, 'KUTAMBARU', 12, 1213);
 insert insert tb_district values(seq_district_id.nextval, 'SEI BINGAI', 12, 1213);
 insert insert tb_district values(seq_district_id.nextval, 'KUALA', 12, 1213);
 insert insert tb_district values(seq_district_id.nextval, 'TANAH MASA', 12, 1213);
 insert insert tb_district values(seq_district_id.nextval, 'PULAU-PULAU BATU', 12, 1214);
insert insert tb_district values(seq_district_id.nextval , 'PULAU-PULAU BATU TIMUR', 12, 1214);
insert insert tb_district values(seq_district_id.nextval , 'SIMUK', 12, 1214);
 insert insert tb_district values(seq_district_id.nextval, 'PULAU-PULAU BATU BARAT', 12, 1214);
 insert insert tb_district values(seq_district_id.nextval, 'PAKKAT', 12, 1215);
 insert insert tb_district values(seq_district_id.nextval, 'ONAN GANJANG', 12, 1215);
 insert insert tb_district values(seq_district_id.nextval, 'SIJAMA POLANG', 12, 1215);
 insert insert tb_district values(seq_district_id.nextval, 'DOLOK SANGGUL', 12, 1215);
 insert insert tb_district values(seq_district_id.nextval, 'LINTONG NIHUTA', 12, 1215);
 insert insert tb_district values(seq_district_id.nextval, 'SALAK', 12, 1216);
 insert insert tb_district values(seq_district_id.nextval, 'SITELLU TALI URANG JEHE', 12, 1216);
 insert insert tb_district values(seq_district_id.nextval, 'PAGINDAR', 12, 1216);
 insert insert tb_district values(seq_district_id.nextval, 'SITELLU TALI URANG JULU', 12, 1216);
 insert insert tb_district values(seq_district_id.nextval, 'PERGETTENG-GETTENG SENGKUT', 12, 1216);
 insert insert tb_district values(seq_district_id.nextval, 'SIANJUR MULA MULA', 12, 1217);
 insert insert tb_district values(seq_district_id.nextval, 'HARIAN', 12, 1217);
 insert insert tb_district values(seq_district_id.nextval, 'SITIO-TIO', 12, 1217);
 insert insert tb_district values(seq_district_id.nextval, 'ONAN RUNGGU', 12, 1217);
 insert insert tb_district values(seq_district_id.nextval, 'NAINGGOLAN', 12, 1217);
 insert insert tb_district values(seq_district_id.nextval, 'KOTARIH', 12, 1218);
 insert insert tb_district values(seq_district_id.nextval, 'SILINDA', 12, 1218);
 insert insert tb_district values(seq_district_id.nextval, 'BINTANG BAYU', 12, 1218);
 insert insert tb_district values(seq_district_id.nextval, 'DOLOK MASIHUL', 12, 1218);
 insert insert tb_district values(seq_district_id.nextval, 'SEI BALAI', 12, 1219);
 insert insert tb_district values(seq_district_id.nextval, 'TANJUNG TIRAM', 12, 1219);
 insert insert tb_district values(seq_district_id.nextval, 'TALAWI', 12, 1219);
 insert insert tb_district values(seq_district_id.nextval, 'LIMAPULUH', 12, 1219);
insert insert tb_district values(seq_district_id.nextval , 'AIR PUTIH', 12, 1219);
insert insert tb_district values(seq_district_id.nextval , 'BATANG ONANG', 12, 1220);
 insert insert tb_district values(seq_district_id.nextval, 'PADANG BOLAK JULU', 12, 1220);
 insert insert tb_district values(seq_district_id.nextval, 'PORTIBI', 12, 1220);
 insert insert tb_district values(seq_district_id.nextval, 'PADANG BOLAK', 12, 1220);
 insert insert tb_district values(seq_district_id.nextval, 'SIMANGAMBAT', 12, 1220);
 insert insert tb_district values(seq_district_id.nextval, 'SOSOPAN', 12, 1221);
 insert insert tb_district values(seq_district_id.nextval, 'ULU BARUMUN', 12, 1221);
 insert insert tb_district values(seq_district_id.nextval, 'BARUMUN', 12, 1221);
 insert insert tb_district values(seq_district_id.nextval, 'BARUMUN SELATAN', 12, 1221);
 insert insert tb_district values(seq_district_id.nextval, 'LUBUK BARUMUN', 12, 1221);
 insert insert tb_district values(seq_district_id.nextval, 'SUNGAI KANAN', 12, 1222);
 insert insert tb_district values(seq_district_id.nextval, 'TORGAMBA', 12, 1222);
 insert insert tb_district values(seq_district_id.nextval, 'KOTA PINANG', 12, 1222);
 insert insert tb_district values(seq_district_id.nextval, 'SILANGKITANG', 12, 1222);
 insert insert tb_district values(seq_district_id.nextval, 'KAMPUNG RAKYAT', 12, 1223); 
 insert insert tb_district values(seq_district_id.nextval, 'TUGALA OYO', 12, 1224);
 insert insert tb_district values(seq_district_id.nextval, 'ALASA', 12, 1224);
 insert insert tb_district values(seq_district_id.nextval, 'ALASA TALU MUZOI', 12, 1224);
 insert insert tb_district values(seq_district_id.nextval, 'NAMOHALU ESIWA', 12, 1224);
 insert insert tb_district values(seq_district_id.nextval, 'SIROMBU', 12, 1225);
 insert insert tb_district values(seq_district_id.nextval, 'LAHOMI', 12, 1225);
 insert insert tb_district values(seq_district_id.nextval, 'ULU MORO O', 12, 1225);
 insert insert tb_district values(seq_district_id.nextval, 'LOLOFITU MOI', 12, 1225);
 insert insert tb_district values(seq_district_id.nextval, 'MANDREHE UTARA', 12, 1225);
 insert insert tb_district values(seq_district_id.nextval, 'SIBOLGA UTARA', 12, 1271);
insert insert tb_district values(seq_district_id.nextval , 'SIBOLGA KOTA', 12, 1271);
insert insert tb_district values(seq_district_id.nextval , 'SIBOLGA SELATAN', 12, 1271);
 insert insert tb_district values(seq_district_id.nextval, 'SIBOLGA SAMBAS', 12, 1271);
 insert insert tb_district values(seq_district_id.nextval, 'DATUK BANDAR', 12, 1272);
 insert insert tb_district values(seq_district_id.nextval, 'DATUK BANDAR TIMUR', 12, 1272);
 insert insert tb_district values(seq_district_id.nextval, 'TANJUNG BALAI SELATAN', 12, 1272);
 insert insert tb_district values(seq_district_id.nextval, 'TANJUNG BALAI UTARA', 12, 1272);
 insert insert tb_district values(seq_district_id.nextval, 'SEI TUALANG RASO', 12, 1272);
 insert insert tb_district values(seq_district_id.nextval, 'SIANTAR MARIHAT', 12, 1273);
 insert insert tb_district values(seq_district_id.nextval, 'SIANTAR MARIMBUN', 12, 1273);
 insert insert tb_district values(seq_district_id.nextval, 'SIANTAR SELATAN', 12, 1273);
 insert insert tb_district values(seq_district_id.nextval, 'SIANTAR BARAT', 12, 1273);
 insert insert tb_district values(seq_district_id.nextval, 'SIANTAR UTARA', 12, 1273);
 insert insert tb_district values(seq_district_id.nextval, 'PADANG HULU', 12, 1274);
 insert insert tb_district values(seq_district_id.nextval, 'TEBING TINGGI KOTA', 12, 1274);
 insert insert tb_district values(seq_district_id.nextval, 'RAMBUTAN', 12, 1274);
 insert insert tb_district values(seq_district_id.nextval, 'BAJENIS', 12, 1274);
 insert insert tb_district values(seq_district_id.nextval, 'PADANG HILIR', 12, 1274);
 insert insert tb_district values(seq_district_id.nextval, 'MEDAN TUNTUNGAN', 12, 1275);
 insert insert tb_district values(seq_district_id.nextval, 'MEDAN JOHOR', 12, 1275);
 insert insert tb_district values(seq_district_id.nextval, 'MEDAN AMPLAS', 12, 1275);
 insert insert tb_district values(seq_district_id.nextval, 'MEDAN DENAI', 12, 1275);
 insert insert tb_district values(seq_district_id.nextval, 'MEDAN AREA', 12, 1275);
 insert insert tb_district values(seq_district_id.nextval, 'BINJAI SELATAN', 12, 1276);
 insert insert tb_district values(seq_district_id.nextval, 'BINJAI KOTA', 12, 1276);
 insert insert tb_district values(seq_district_id.nextval, 'BINJAI TIMUR', 12, 1276);
insert insert tb_district values(seq_district_id.nextval , 'BINJAI UTARA', 12, 1276);
insert insert tb_district values(seq_district_id.nextval , 'BINJAI BARAT', 12, 1276);
 insert insert tb_district values(seq_district_id.nextval, 'PADANGSIDIMPUAN TENGGARA', 12, 1277);
 insert insert tb_district values(seq_district_id.nextval, 'PADANGSIDIMPUAN SELATAN', 12, 1277);
 insert insert tb_district values(seq_district_id.nextval, 'PADANGSIDIMPUAN BATUNADUA', 12, 1277);
 insert insert tb_district values(seq_district_id.nextval, 'PADANGSIDIMPUAN UTARA', 12, 1277);
 insert insert tb_district values(seq_district_id.nextval, 'PADANGSIDIMPUAN HUTAIMBARU', 12, 1277);
 insert insert tb_district values(seq_district_id.nextval, 'GUNUNGSITOLI IDANOI', 12, 1278);
 insert insert tb_district values(seq_district_id.nextval, 'GUNUNGSITOLI SELATAN', 12, 1278);
 insert insert tb_district values(seq_district_id.nextval, 'GUNUNGSITOLI BARAT', 12, 1278);
 insert insert tb_district values(seq_district_id.nextval, 'GUNUNG SITOLI', 12, 1278);
 insert insert tb_district values(seq_district_id.nextval, 'GUNUNGSITOLI ALO OA', 12, 1278);
 insert insert tb_district values(seq_district_id.nextval, 'PAGAI SELATAN', 13, 1301);
 insert insert tb_district values(seq_district_id.nextval, 'SIKAKAP', 13, 1301);
 insert insert tb_district values(seq_district_id.nextval, 'PAGAI UTARA', 13, 1301);
 insert insert tb_district values(seq_district_id.nextval, 'SIPORA SELATAN', 13, 1301);
 insert insert tb_district values(seq_district_id.nextval, 'SIPORA UTARA', 13, 1301);
 insert insert tb_district values(seq_district_id.nextval, 'SILAUT', 13, 1302);
 insert insert tb_district values(seq_district_id.nextval, 'LUNANG', 13, 1302);
 insert insert tb_district values(seq_district_id.nextval, 'BASA AMPEK BALAI TAPAN', 13, 1302);
 insert insert tb_district values(seq_district_id.nextval, 'RANAH AMPEK HULU TAPAN', 13, 1302);
 insert insert tb_district values(seq_district_id.nextval, 'PANCUNG SOAL', 13, 1302);
 insert insert tb_district values(seq_district_id.nextval, 'PANTAI CERMIN', 13, 1303);
 insert insert tb_district values(seq_district_id.nextval, 'LEMBAH GUMANTI', 13, 1303);
 insert insert tb_district values(seq_district_id.nextval, 'HILIRAN GUMANTI', 13, 1303);
 insert insert tb_district values(seq_district_id.nextval, 'PAYUNG SEKAKI', 13, 1303);
 insert insert tb_district values(seq_district_id.nextval, 'TIGO LURAH', 13, 1303);
 insert insert tb_district values(seq_district_id.nextval, 'KAMANG BARU', 13, 1304);
 insert insert tb_district values(seq_district_id.nextval, 'TANJUNG GADANG', 13, 1304);
 insert insert tb_district values(seq_district_id.nextval, 'SIJUNJUNG', 13, 1304);
 insert insert tb_district values(seq_district_id.nextval, 'LUBUK TAROK', 13, 1304);
 insert insert tb_district values(seq_district_id.nextval, 'IV NAGARI', 13, 1304);
 insert insert tb_district values(seq_district_id.nextval, 'SEPULUH KOTO', 13, 1305);
 insert insert tb_district values(seq_district_id.nextval, 'BATIPUH', 13, 1305);
 insert insert tb_district values(seq_district_id.nextval, 'BATIPUH SELATAN', 13, 1305);
 insert insert tb_district values(seq_district_id.nextval, 'PARIANGAN', 13, 1305);
 insert insert tb_district values(seq_district_id.nextval, 'RAMBATAN', 13, 1305);
 insert insert tb_district values(seq_district_id.nextval, 'BATANG ANAI', 13, 1306);
 insert insert tb_district values(seq_district_id.nextval, 'LUBUK ALUNG', 13, 1306);
 insert insert tb_district values(seq_district_id.nextval, 'SINTUK TOBOH GADANG', 13, 1306);
 insert insert tb_district values(seq_district_id.nextval, 'ULAKAN TAPAKIS', 13, 1306);
 insert insert tb_district values(seq_district_id.nextval, 'NAN SABARIS', 13, 1306);
 insert insert tb_district values(seq_district_id.nextval, '2 X 11 ENAM LINGKUNG', 13, 1306);
 insert insert tb_district values(seq_district_id.nextval, 'TANJUNG MUTIARA', 13, 1307);
 insert insert tb_district values(seq_district_id.nextval, 'LUBUK BASUNG', 13, 1307);
 insert insert tb_district values(seq_district_id.nextval, 'AMPEK NAGARI', 13, 1307);
 insert insert tb_district values(seq_district_id.nextval, 'TANJUNG RAYA', 13, 1307);
 insert insert tb_district values(seq_district_id.nextval, 'MATUR', 13, 1307);
 insert insert tb_district values(seq_district_id.nextval, 'PAYAKUMBUH', 13, 1308);
 insert insert tb_district values(seq_district_id.nextval, 'AKABILURU', 13, 1308);
 insert insert tb_district values(seq_district_id.nextval, 'LUAK', 13, 1308);
 insert insert tb_district values(seq_district_id.nextval, 'LAREH SAGO HALABAN', 13, 1308);
 insert insert tb_district values(seq_district_id.nextval, 'SITUJUAH LIMO NAGARI', 13, 1308);
 insert insert tb_district values(seq_district_id.nextval, 'BONJOL', 13, 1309);
 insert insert tb_district values(seq_district_id.nextval, 'TIGO NAGARI', 13, 1309);
 insert insert tb_district values(seq_district_id.nextval, 'SIMPANG ALAHAN MATI', 13, 1309);
 insert insert tb_district values(seq_district_id.nextval, 'LUBUK SIKAPING', 13, 1309);
 insert insert tb_district values(seq_district_id.nextval, 'DUA KOTO', 13, 1309);
 insert insert tb_district values(seq_district_id.nextval, 'SANGIR', 13, 1310);
 insert insert tb_district values(seq_district_id.nextval, 'SANGIR JUJUAN', 13, 1310);
INSERT INTO `districts` VALUES
  ('1310021', '1310', 'SANGIR BALAI JANGGO'),
  ('1310030', '1310', 'SANGIR BATANG HARI'),
  ('1310040', '1310', 'SUNGAI PAGU'),
  ('1310041', '1310', 'PAUAH DUO'),
  ('1310050', '1310', 'KOTO PARIK GADANG DIATEH'),
  ('1311010', '1311', 'SUNGAI RUMBAI'),
  ('1311011', '1311', 'KOTO BESAR'),
  ('1311012', '1311', 'ASAM JUJUHAN'),
  ('1311020', '1311', 'KOTO BARU'),
  ('1311021', '1311', 'KOTO SALAK'),
  ('1311022', '1311', 'TIUMANG'),
  ('1311023', '1311', 'PADANG LAWEH'),
  ('1311030', '1311', 'SITIUNG'),
  ('1311031', '1311', 'TIMPEH'),
  ('1311040', '1311', 'PULAU PUNJUNG'),
  ('1311041', '1311', 'IX KOTO'),
  ('1312010', '1312', 'SUNGAI BEREMAS'),
  ('1312020', '1312', 'RANAH BATAHAN'),
  ('1312030', '1312', 'KOTO BALINGKA'),
  ('1312040', '1312', 'SUNGAI AUR'),
  ('1312050', '1312', 'LEMBAH MALINTANG'),
  ('1312060', '1312', 'GUNUNG TULEH'),
  ('1312070', '1312', 'TALAMAU'),
  ('1312080', '1312', 'PASAMAN'),
  ('1312090', '1312', 'LUHAK NAN DUO'),
  ('1312100', '1312', 'SASAK RANAH PASISIE'),
  ('1312110', '1312', 'KINALI'),
  ('1371010', '1371', 'BUNGUS TELUK KABUNG'),
  ('1371020', '1371', 'LUBUK KILANGAN'),
  ('1371030', '1371', 'LUBUK BEGALUNG'),
  ('1371040', '1371', 'PADANG SELATAN'),
  ('1371050', '1371', 'PADANG TIMUR'),
  ('1371060', '1371', 'PADANG BARAT'),
  ('1371070', '1371', 'PADANG UTARA'),
  ('1371080', '1371', 'NANGGALO'),
  ('1371090', '1371', 'KURANJI'),
  ('1371100', '1371', 'PAUH'),
  ('1371110', '1371', 'KOTO TANGAH'),
  ('1372010', '1372', 'LUBUK SIKARAH'),
  ('1372020', '1372', 'TANJUNG HARAPAN'),
  ('1373010', '1373', 'SILUNGKANG'),
  ('1373020', '1373', 'LEMBAH SEGAR'),
  ('1373030', '1373', 'BARANGIN'),
  ('1373040', '1373', 'TALAWI'),
  ('1374010', '1374', 'PADANG PANJANG BARAT'),
  ('1374020', '1374', 'PADANG PANJANG TIMUR'),
  ('1375010', '1375', 'GUGUK PANJANG'),
  ('1375020', '1375', 'MANDIANGIN KOTO SELAYAN'),
  ('1375030', '1375', 'AUR BIRUGO TIGO BALEH'),
  ('1376010', '1376', 'PAYAKUMBUH BARAT');
INSERT INTO `districts` VALUES
  ('1376011', '1376', 'PAYAKUMBUH SELATAN'),
  ('1376020', '1376', 'PAYAKUMBUH TIMUR'),
  ('1376030', '1376', 'PAYAKUMBUH UTARA'),
  ('1376031', '1376', 'LAMPOSI TIGO NAGORI'),
  ('1377010', '1377', 'PARIAMAN SELATAN'),
  ('1377020', '1377', 'PARIAMAN TENGAH'),
  ('1377021', '1377', 'PARIAMAN TIMUR'),
  ('1377030', '1377', 'PARIAMAN UTARA'),
  ('1401010', '1401', 'KUANTAN MUDIK'),
  ('1401011', '1401', 'HULU KUANTAN'),
  ('1401012', '1401', 'GUNUNG TOAR'),
  ('1401013', '1401', 'PUCUK RANTAU'),
  ('1401020', '1401', 'SINGINGI'),
  ('1401021', '1401', 'SINGINGI HILIR'),
  ('1401030', '1401', 'KUANTAN TENGAH'),
  ('1401031', '1401', 'SENTAJO RAYA'),
  ('1401040', '1401', 'BENAI'),
  ('1401050', '1401', 'KUANTAN HILIR'),
  ('1401051', '1401', 'PANGEAN'),
  ('1401052', '1401', 'LOGAS TANAH DARAT'),
  ('1401053', '1401', 'KUANTAN HILIR SEBERANG'),
  ('1401060', '1401', 'CERENTI'),
  ('1401061', '1401', 'INUMAN'),
  ('1402010', '1402', 'PERANAP'),
  ('1402011', '1402', 'BATANG PERANAP'),
  ('1402020', '1402', 'SEBERIDA'),
  ('1402021', '1402', 'BATANG CENAKU'),
  ('1402022', '1402', 'BATANG GANSAL'),
  ('1402030', '1402', 'KELAYANG'),
  ('1402031', '1402', 'RAKIT KULIM'),
  ('1402040', '1402', 'PASIR PENYU'),
  ('1402041', '1402', 'LIRIK'),
  ('1402042', '1402', 'SUNGAI LALA'),
  ('1402043', '1402', 'LUBUK BATU JAYA'),
  ('1402050', '1402', 'RENGAT BARAT'),
  ('1402060', '1402', 'RENGAT'),
  ('1402061', '1402', 'KUALA CENAKU'),
  ('1403010', '1403', 'KERITANG'),
  ('1403011', '1403', 'KEMUNING'),
  ('1403020', '1403', 'RETEH'),
  ('1403021', '1403', 'SUNGAI BATANG'),
  ('1403030', '1403', 'ENOK'),
  ('1403040', '1403', 'TANAH MERAH'),
  ('1403050', '1403', 'KUALA INDRAGIRI'),
  ('1403051', '1403', 'CONCONG'),
  ('1403060', '1403', 'TEMBILAHAN'),
  ('1403061', '1403', 'TEMBILAHAN HULU'),
  ('1403070', '1403', 'TEMPULING'),
  ('1403071', '1403', 'KEMPAS'),
  ('1403080', '1403', 'BATANG TUAKA');
INSERT INTO `districts` VALUES
  ('1403090', '1403', 'GAUNG ANAK SERKA'),
  ('1403100', '1403', 'GAUNG'),
  ('1403110', '1403', 'MANDAH'),
  ('1403120', '1403', 'KATEMAN'),
  ('1403121', '1403', 'PELANGIRAN'),
  ('1403122', '1403', 'TELUK BELENGKONG'),
  ('1403123', '1403', 'PULAU BURUNG'),
  ('1404010', '1404', 'LANGGAM'),
  ('1404011', '1404', 'PANGKALAN KERINCI'),
  ('1404012', '1404', 'BANDAR SEIKIJANG'),
  ('1404020', '1404', 'PANGKALAN KURAS'),
  ('1404021', '1404', 'UKUI'),
  ('1404022', '1404', 'PANGKALAN LESUNG'),
  ('1404030', '1404', 'BUNUT'),
  ('1404031', '1404', 'PELALAWAN'),
  ('1404032', '1404', 'BANDAR PETALANGAN'),
  ('1404040', '1404', 'KUALA KAMPAR'),
  ('1404041', '1404', 'KERUMUTAN'),
  ('1404042', '1404', 'TELUK MERANTI'),
  ('1405010', '1405', 'MINAS'),
  ('1405011', '1405', 'SUNGAI MANDAU'),
  ('1405012', '1405', 'KANDIS'),
  ('1405020', '1405', 'SIAK'),
  ('1405021', '1405', 'KERINCI KANAN'),
  ('1405022', '1405', 'TUALANG'),
  ('1405023', '1405', 'DAYUN'),
  ('1405024', '1405', 'LUBUK DALAM'),
  ('1405025', '1405', 'KOTO GASIB'),
  ('1405026', '1405', 'MEMPURA'),
  ('1405030', '1405', 'SUNGAI APIT'),
  ('1405031', '1405', 'BUNGA RAYA'),
  ('1405032', '1405', 'SABAK AUH'),
  ('1405033', '1405', 'PUSAKO'),
  ('1406010', '1406', 'KAMPAR KIRI'),
  ('1406011', '1406', 'KAMPAR KIRI HULU'),
  ('1406012', '1406', 'KAMPAR KIRI HILIR'),
  ('1406013', '1406', 'GUNUNG SAHILAN'),
  ('1406014', '1406', 'KAMPAR KIRI TENGAH'),
  ('1406020', '1406', 'XIII KOTO KAMPAR'),
  ('1406021', '1406', 'KOTO KAMPAR HULU'),
  ('1406030', '1406', 'KUOK'),
  ('1406031', '1406', 'SALO'),
  ('1406040', '1406', 'TAPUNG'),
  ('1406041', '1406', 'TAPUNG HULU'),
  ('1406042', '1406', 'TAPUNG HILIR'),
  ('1406050', '1406', 'BANGKINANG KOTA'),
  ('1406051', '1406', 'BANGKINANG'),
  ('1406060', '1406', 'KAMPAR'),
  ('1406061', '1406', 'KAMPAR TIMUR'),
  ('1406062', '1406', 'RUMBIO JAYA');
INSERT INTO `districts` VALUES
  ('1406063', '1406', 'KAMPAR UTARA'),
  ('1406070', '1406', 'TAMBANG'),
  ('1406080', '1406', 'SIAK HULU'),
  ('1406081', '1406', 'PERHENTIAN RAJA'),
  ('1407010', '1407', 'ROKAN IV KOTO'),
  ('1407011', '1407', 'PENDALIAN IV KOTO'),
  ('1407020', '1407', 'TANDUN'),
  ('1407021', '1407', 'KABUN'),
  ('1407022', '1407', 'UJUNG BATU'),
  ('1407030', '1407', 'RAMBAH SAMO'),
  ('1407040', '1407', 'RAMBAH'),
  ('1407041', '1407', 'RAMBAH HILIR'),
  ('1407042', '1407', 'BANGUN PURBA'),
  ('1407050', '1407', 'TAMBUSAI'),
  ('1407051', '1407', 'TAMBUSAI UTARA'),
  ('1407060', '1407', 'KEPENUHAN'),
  ('1407061', '1407', 'KEPENUHAN HULU'),
  ('1407070', '1407', 'KUNTO DARUSSALAM'),
  ('1407071', '1407', 'PAGARAN TAPAH DARUSSALAM'),
  ('1407072', '1407', 'BONAI DARUSSALAM'),
  ('1408010', '1408', 'MANDAU'),
  ('1408011', '1408', 'PINGGIR'),
  ('1408020', '1408', 'BUKIT BATU'),
  ('1408021', '1408', 'SIAK KECIL'),
  ('1408030', '1408', 'RUPAT'),
  ('1408031', '1408', 'RUPAT UTARA'),
  ('1408040', '1408', 'BENGKALIS'),
  ('1408050', '1408', 'BANTAN'),
  ('1409010', '1409', 'TANAH PUTIH'),
  ('1409011', '1409', 'PUJUD'),
  ('1409012', '1409', 'TANAH PUTIH TANJUNG MELAWAN'),
  ('1409013', '1409', 'RANTAU KOPAR'),
  ('1409014', '1409', 'TANJUNG MEDAN'),
  ('1409020', '1409', 'BAGAN SINEMBAH'),
  ('1409021', '1409', 'SIMPANG KANAN'),
  ('1409022', '1409', 'BAGAN SINEMBAH RAYA'),
  ('1409023', '1409', 'BALAI JAYA'),
  ('1409030', '1409', 'KUBU'),
  ('1409031', '1409', 'PASIR LIMAU KAPAS'),
  ('1409032', '1409', 'KUBU BABUSSALAM'),
  ('1409040', '1409', 'BANGKO'),
  ('1409041', '1409', 'SINABOI'),
  ('1409042', '1409', 'BATU HAMPAR'),
  ('1409043', '1409', 'PEKAITAN'),
  ('1409050', '1409', 'RIMBA MELINTANG'),
  ('1409051', '1409', 'BANGKO PUSAKO'),
  ('1410010', '1410', 'TEBING TINGGI BARAT'),
  ('1410020', '1410', 'TEBING TINGGI'),
  ('1410021', '1410', 'TEBING TINGGI TIMUR'),
  ('1410030', '1410', 'RANGSANG');
INSERT INTO `districts` VALUES
  ('1410031', '1410', 'RANGSANG PESISIR'),
  ('1410040', '1410', 'RANGSANG BARAT'),
  ('1410050', '1410', 'MERBAU'),
  ('1410051', '1410', 'PULAU MERBAU'),
  ('1410052', '1410', 'TASIK PUTRI PUYU'),
  ('1471010', '1471', 'TAMPAN'),
  ('1471011', '1471', 'PAYUNG SEKAKI'),
  ('1471020', '1471', 'BUKIT RAYA'),
  ('1471021', '1471', 'MARPOYAN DAMAI'),
  ('1471022', '1471', 'TENAYAN RAYA'),
  ('1471030', '1471', 'LIMAPULUH'),
  ('1471040', '1471', 'SAIL'),
  ('1471050', '1471', 'PEKANBARU KOTA'),
  ('1471060', '1471', 'SUKAJADI'),
  ('1471070', '1471', 'SENAPELAN'),
  ('1471080', '1471', 'RUMBAI'),
  ('1471081', '1471', 'RUMBAI PESISIR'),
  ('1473010', '1473', 'BUKIT KAPUR'),
  ('1473011', '1473', 'MEDANG KAMPAI'),
  ('1473012', '1473', 'SUNGAI SEMBILAN'),
  ('1473020', '1473', 'DUMAI BARAT'),
  ('1473021', '1473', 'DUMAI SELATAN'),
  ('1473030', '1473', 'DUMAI TIMUR'),
  ('1473031', '1473', 'DUMAI KOTA'),
  ('1501010', '1501', 'GUNUNG RAYA'),
  ('1501011', '1501', 'BUKIT KERMAN'),
  ('1501020', '1501', 'BATANG MERANGIN'),
  ('1501030', '1501', 'KELILING DANAU'),
  ('1501040', '1501', 'DANAU KERINCI'),
  ('1501050', '1501', 'SITINJAU LAUT'),
  ('1501070', '1501', 'AIR HANGAT'),
  ('1501071', '1501', 'AIR HANGAT TIMUR'),
  ('1501072', '1501', 'DEPATI VII'),
  ('1501073', '1501', 'AIR HANGAT BARAT'),
  ('1501080', '1501', 'GUNUNG KERINCI'),
  ('1501081', '1501', 'SIULAK'),
  ('1501082', '1501', 'SIULAK MUKAI'),
  ('1501090', '1501', 'KAYU ARO'),
  ('1501091', '1501', 'GUNUNG TUJUH'),
  ('1501092', '1501', 'KAYU ARO BARAT'),
  ('1502010', '1502', 'JANGKAT'),
  ('1502011', '1502', 'SUNGAI TENANG'),
  ('1502020', '1502', 'MUARA SIAU'),
  ('1502021', '1502', 'LEMBAH MASURAI'),
  ('1502022', '1502', 'TIANG PUMPUNG'),
  ('1502030', '1502', 'PAMENANG'),
  ('1502031', '1502', 'PAMENANG BARAT'),
  ('1502032', '1502', 'RENAH PAMENANG'),
  ('1502033', '1502', 'PAMENANG SELATAN'),
  ('1502040', '1502', 'BANGKO');
INSERT INTO `districts` VALUES
  ('1502041', '1502', 'BANGKO BARAT'),
  ('1502042', '1502', 'NALO TANTAN'),
  ('1502043', '1502', 'BATANG MASUMAI'),
  ('1502050', '1502', 'SUNGAI MANAU'),
  ('1502051', '1502', 'RENAH PEMBARAP'),
  ('1502052', '1502', 'PANGKALAN JAMBU'),
  ('1502060', '1502', 'TABIR'),
  ('1502061', '1502', 'TABIR ULU'),
  ('1502062', '1502', 'TABIR SELATAN'),
  ('1502063', '1502', 'TABIR ILIR'),
  ('1502064', '1502', 'TABIR TIMUR'),
  ('1502065', '1502', 'TABIR LINTAS'),
  ('1502066', '1502', 'MARGO TABIR'),
  ('1502067', '1502', 'TABIR BARAT'),
  ('1503010', '1503', 'BATANG ASAI'),
  ('1503020', '1503', 'LIMUN'),
  ('1503021', '1503', 'CERMIN NAN GEDANG'),
  ('1503030', '1503', 'PELAWAN'),
  ('1503031', '1503', 'SINGKUT'),
  ('1503040', '1503', 'SAROLANGUN'),
  ('1503041', '1503', 'BATHIN VIII'),
  ('1503050', '1503', 'PAUH'),
  ('1503051', '1503', 'AIR HITAM'),
  ('1503060', '1503', 'MANDIANGIN'),
  ('1504010', '1504', 'MERSAM'),
  ('1504011', '1504', 'MARO SEBO ULU'),
  ('1504020', '1504', 'BATIN XXIV'),
  ('1504030', '1504', 'MUARA TEMBESI'),
  ('1504040', '1504', 'MUARA BULIAN'),
  ('1504041', '1504', 'BAJUBANG'),
  ('1504042', '1504', 'MARO SEBO ILIR'),
  ('1504050', '1504', 'PEMAYUNG'),
  ('1505010', '1505', 'MESTONG'),
  ('1505011', '1505', 'SUNGAI BAHAR'),
  ('1505012', '1505', 'BAHAR SELATAN'),
  ('1505013', '1505', 'BAHAR UTARA'),
  ('1505020', '1505', 'KUMPEH ULU'),
  ('1505021', '1505', 'SUNGAI GELAM'),
  ('1505030', '1505', 'KUMPEH'),
  ('1505040', '1505', 'MARO SEBO'),
  ('1505041', '1505', 'TAMAN RAJO'),
  ('1505050', '1505', 'JAMBI LUAR KOTA'),
  ('1505060', '1505', 'SEKERNAN'),
  ('1506010', '1506', 'MENDAHARA'),
  ('1506011', '1506', 'MENDAHARA ULU'),
  ('1506012', '1506', 'GERAGAI'),
  ('1506020', '1506', 'DENDANG'),
  ('1506031', '1506', 'MUARA SABAK BARAT'),
  ('1506032', '1506', 'MUARA SABAK TIMUR'),
  ('1506033', '1506', 'KUALA JAMBI');
INSERT INTO `districts` VALUES
  ('1506040', '1506', 'RANTAU RASAU'),
  ('1506041', '1506', 'BERBAK'),
  ('1506050', '1506', 'NIPAH PANJANG'),
  ('1506060', '1506', 'SADU'),
  ('1507010', '1507', 'TUNGKAL ULU'),
  ('1507011', '1507', 'MERLUNG'),
  ('1507012', '1507', 'BATANG ASAM'),
  ('1507013', '1507', 'TEBING TINGGI'),
  ('1507014', '1507', 'RENAH MENDALUH'),
  ('1507015', '1507', 'MUARA PAPALIK'),
  ('1507020', '1507', 'PENGABUAN'),
  ('1507021', '1507', 'SENYERANG'),
  ('1507030', '1507', 'TUNGKAL ILIR'),
  ('1507031', '1507', 'BRAM ITAM'),
  ('1507032', '1507', 'SEBERANG KOTA'),
  ('1507040', '1507', 'BETARA'),
  ('1507041', '1507', 'KUALA BETARA'),
  ('1508010', '1508', 'TEBO ILIR'),
  ('1508011', '1508', 'MUARA TABIR'),
  ('1508020', '1508', 'TEBO TENGAH'),
  ('1508021', '1508', 'SUMAY'),
  ('1508022', '1508', 'TENGAH ILIR'),
  ('1508030', '1508', 'RIMBO BUJANG'),
  ('1508031', '1508', 'RIMBO ULU'),
  ('1508032', '1508', 'RIMBO ILIR'),
  ('1508040', '1508', 'TEBO ULU'),
  ('1508041', '1508', 'VII KOTO'),
  ('1508042', '1508', 'SERAI SERUMPUN'),
  ('1508043', '1508', 'VII KOTO ILIR'),
  ('1509010', '1509', 'PELEPAT'),
  ('1509011', '1509', 'PELEPAT ILIR'),
  ('1509021', '1509', 'BATHIN II BABEKO'),
  ('1509022', '1509', 'RIMBO TENGAH'),
  ('1509023', '1509', 'BUNGO DANI'),
  ('1509024', '1509', 'PASAR MUARA BUNGO'),
  ('1509025', '1509', 'BATHIN III'),
  ('1509030', '1509', 'RANTAU PANDAN'),
  ('1509031', '1509', 'MUKO-MUKO BATHIN VII'),
  ('1509032', '1509', 'BATHIN III ULU'),
  ('1509040', '1509', 'TANAH SEPENGGAL'),
  ('1509041', '1509', 'TANAH SEPENGGAL LINTAS'),
  ('1509050', '1509', 'TANAH TUMBUH'),
  ('1509051', '1509', 'LIMBUR LUBUK MENGKUANG'),
  ('1509052', '1509', 'BATHIN II PELAYANG'),
  ('1509060', '1509', 'JUJUHAN'),
  ('1509061', '1509', 'JUJUHAN ILIR'),
  ('1571010', '1571', 'KOTA BARU'),
  ('1571011', '1571', 'ALAM BARAJO'),
  ('1571020', '1571', 'JAMBI SELATAN'),
  ('1571021', '1571', 'PAAL MERAH');
INSERT INTO `districts` VALUES
  ('1571030', '1571', 'JELUTUNG'),
  ('1571040', '1571', 'PASAR JAMBI'),
  ('1571050', '1571', 'TELANAIPURA'),
  ('1571051', '1571', 'DANAU SIPIN'),
  ('1571060', '1571', 'DANAU TELUK'),
  ('1571070', '1571', 'PELAYANGAN'),
  ('1571080', '1571', 'JAMBI TIMUR'),
  ('1572010', '1572', 'TANAH KAMPUNG'),
  ('1572020', '1572', 'KUMUN DEBAI'),
  ('1572030', '1572', 'SUNGAI PENUH'),
  ('1572031', '1572', 'PONDOK TINGGGI'),
  ('1572032', '1572', 'SUNGAI BUNGKAL'),
  ('1572040', '1572', 'HAMPARAN RAWANG'),
  ('1572050', '1572', 'PESISIR BUKIT'),
  ('1572051', '1572', 'KOTO BARU'),
  ('1601052', '1601', 'LENGKITI'),
  ('1601070', '1601', 'SOSOH BUAY RAYAP'),
  ('1601080', '1601', 'PENGANDONAN'),
  ('1601081', '1601', 'SEMIDANG AJI'),
  ('1601082', '1601', 'ULU OGAN'),
  ('1601083', '1601', 'MUARA JAYA'),
  ('1601090', '1601', 'PENINJAUAN'),
  ('1601091', '1601', 'LUBUK BATANG'),
  ('1601092', '1601', 'SINAR PENINJAUAN'),
  ('1601093', '1601', 'KEDATON PENINJAUAN RAYA'),
  ('1601130', '1601', 'BATU RAJA TIMUR'),
  ('1601131', '1601', 'LUBUK RAJA'),
  ('1601140', '1601', 'BATU RAJA BARAT'),
  ('1602010', '1602', 'LEMPUING'),
  ('1602011', '1602', 'LEMPUING JAYA'),
  ('1602020', '1602', 'MESUJI'),
  ('1602021', '1602', 'SUNGAI MENANG'),
  ('1602022', '1602', 'MESUJI MAKMUR'),
  ('1602023', '1602', 'MESUJI RAYA'),
  ('1602030', '1602', 'TULUNG SELAPAN'),
  ('1602031', '1602', 'CENGAL'),
  ('1602040', '1602', 'PEDAMARAN'),
  ('1602041', '1602', 'PEDAMARAN TIMUR'),
  ('1602050', '1602', 'TANJUNG LUBUK'),
  ('1602051', '1602', 'TELUK GELAM'),
  ('1602060', '1602', 'KOTA KAYU AGUNG'),
  ('1602120', '1602', 'SIRAH PULAU PADANG'),
  ('1602121', '1602', 'JEJAWI'),
  ('1602130', '1602', 'PAMPANGAN'),
  ('1602131', '1602', 'PANGKALAN LAPAM'),
  ('1602140', '1602', 'AIR SUGIHAN'),
  ('1603010', '1603', 'SEMENDO DARAT LAUT'),
  ('1603011', '1603', 'SEMENDO DARAT ULU'),
  ('1603012', '1603', 'SEMENDO DARAT TENGAH'),
  ('1603020', '1603', 'TANJUNG AGUNG');
INSERT INTO `districts` VALUES
  ('1603031', '1603', 'RAMBANG'),
  ('1603032', '1603', 'LUBAI'),
  ('1603033', '1603', 'LUBAI ULU'),
  ('1603040', '1603', 'LAWANG KIDUL'),
  ('1603050', '1603', 'MUARA ENIM'),
  ('1603051', '1603', 'UJAN MAS'),
  ('1603060', '1603', 'GUNUNG MEGANG'),
  ('1603061', '1603', 'BENAKAT'),
  ('1603062', '1603', 'BELIMBING'),
  ('1603070', '1603', 'RAMBANG DANGKU'),
  ('1603090', '1603', 'GELUMBANG'),
  ('1603091', '1603', 'LEMBAK'),
  ('1603092', '1603', 'SUNGAI ROTAN'),
  ('1603093', '1603', 'MUARA BELIDA'),
  ('1603094', '1603', 'KELEKAR'),
  ('1603095', '1603', 'BELIDA DARAT'),
  ('1604011', '1604', 'TANJUNG SAKTI PUMI'),
  ('1604012', '1604', 'TANJUNG SAKTI PUMU'),
  ('1604040', '1604', 'KOTA AGUNG'),
  ('1604041', '1604', 'MULAK ULU'),
  ('1604042', '1604', 'TANJUNG TEBAT'),
  ('1604050', '1604', 'PULAU PINANG'),
  ('1604051', '1604', 'PAGAR GUNUNG'),
  ('1604052', '1604', 'GUMAY ULU'),
  ('1604060', '1604', 'JARAI'),
  ('1604061', '1604', 'PAJAR BULAN'),
  ('1604062', '1604', 'MUARA PAYANG'),
  ('1604063', '1604', 'SUKAMERINDU'),
  ('1604111', '1604', 'KIKIM BARAT'),
  ('1604112', '1604', 'KIKIM TIMUR'),
  ('1604113', '1604', 'KIKIM SELATAN'),
  ('1604114', '1604', 'KIKIM TENGAH'),
  ('1604120', '1604', 'LAHAT'),
  ('1604121', '1604', 'GUMAY TALANG'),
  ('1604122', '1604', 'PSEKSU'),
  ('1604131', '1604', 'MERAPI BARAT'),
  ('1604132', '1604', 'MERAPI TIMUR'),
  ('1604133', '1604', 'MERAPI SELATAN'),
  ('1605030', '1605', 'SUKU TENGAH LAKITAN ULU'),
  ('1605031', '1605', 'SELANGIT'),
  ('1605032', '1605', 'SUMBER HARTA'),
  ('1605040', '1605', 'TUGUMULYO'),
  ('1605041', '1605', 'PURWODADI'),
  ('1605050', '1605', 'MUARA BELITI'),
  ('1605051', '1605', 'TIANG PUMPUNG KEPUNGUT'),
  ('1605060', '1605', 'JAYALOKA'),
  ('1605061', '1605', 'SUKA KARYA'),
  ('1605070', '1605', 'MUARA KELINGI'),
  ('1605071', '1605', 'BULANG TENGAH SUKU ULU'),
  ('1605072', '1605', 'TUAH NEGERI');
INSERT INTO `districts` VALUES
  ('1605080', '1605', 'MUARA LAKITAN'),
  ('1605090', '1605', 'MEGANG SAKTI'),
  ('1606010', '1606', 'SANGA DESA'),
  ('1606020', '1606', 'BABAT TOMAN'),
  ('1606021', '1606', 'BATANGHARI LEKO'),
  ('1606022', '1606', 'PLAKAT TINGGI'),
  ('1606023', '1606', 'LAWANG WETAN'),
  ('1606030', '1606', 'SUNGAI KERUH'),
  ('1606040', '1606', 'SEKAYU'),
  ('1606041', '1606', 'LAIS'),
  ('1606090', '1606', 'SUNGAI LILIN'),
  ('1606091', '1606', 'KELUANG'),
  ('1606092', '1606', 'BABAT SUPAT'),
  ('1606100', '1606', 'BAYUNG LENCIR'),
  ('1606101', '1606', 'LALAN'),
  ('1606102', '1606', 'TUNGKAL JAYA'),
  ('1607010', '1607', 'RANTAU BAYUR'),
  ('1607020', '1607', 'BETUNG'),
  ('1607021', '1607', 'SUAK TAPEH'),
  ('1607030', '1607', 'PULAU RIMAU'),
  ('1607031', '1607', 'TUNGKAL ILIR'),
  ('1607040', '1607', 'BANYUASIN III'),
  ('1607041', '1607', 'SEMBAWA'),
  ('1607050', '1607', 'TALANG KELAPA'),
  ('1607051', '1607', 'TANJUNG LAGO'),
  ('1607060', '1607', 'BANYUASIN I'),
  ('1607061', '1607', 'AIR KUMBANG'),
  ('1607070', '1607', 'RAMBUTAN'),
  ('1607080', '1607', 'MUARA PADANG'),
  ('1607081', '1607', 'MUARA SUGIHAN'),
  ('1607090', '1607', 'MAKARTI JAYA'),
  ('1607091', '1607', 'AIR SALEH'),
  ('1607100', '1607', 'BANYUASIN II'),
  ('1607110', '1607', 'MUARA TELANG'),
  ('1607111', '1607', 'SUMBER MARGA TELANG'),
  ('1608010', '1608', 'MEKAKAU ILIR'),
  ('1608020', '1608', 'BANDING AGUNG'),
  ('1608021', '1608', 'WARKUK RANAU SELATAN'),
  ('1608022', '1608', 'BUAY PEMATANG RIBU RANAU TENGAH'),
  ('1608030', '1608', 'BUAY PEMACA'),
  ('1608040', '1608', 'SIMPANG'),
  ('1608041', '1608', 'BUANA PEMACA'),
  ('1608050', '1608', 'MUARADUA'),
  ('1608051', '1608', 'BUAY RAWAN'),
  ('1608060', '1608', 'BUAY SANDANG AJI'),
  ('1608061', '1608', 'TIGA DIHAJI'),
  ('1608070', '1608', 'BUAY RUNJUNG'),
  ('1608071', '1608', 'RUNJUNG AGUNG'),
  ('1608080', '1608', 'KISAM TINGGI'),
  ('1608090', '1608', 'MUARADUA KISAM');
INSERT INTO `districts` VALUES
  ('1608091', '1608', 'KISAM ILIR'),
  ('1608100', '1608', 'PULAU BERINGIN'),
  ('1608101', '1608', 'SINDANG DANAU'),
  ('1608102', '1608', 'SUNGAI ARE'),
  ('1609010', '1609', 'MARTAPURA'),
  ('1609011', '1609', 'BUNGA MAYANG'),
  ('1609012', '1609', 'JAYA PURA'),
  ('1609020', '1609', 'BUAY PEMUKA PELIUNG'),
  ('1609030', '1609', 'BUAY MADANG'),
  ('1609031', '1609', 'BUAY MADANG TIMUR'),
  ('1609032', '1609', 'BUAY PEMUKA BANGSA RAJA'),
  ('1609040', '1609', 'MADANG SUKU II'),
  ('1609041', '1609', 'MADANG SUKU III'),
  ('1609050', '1609', 'MADANG SUKU I'),
  ('1609051', '1609', 'BELITANG MADANG RAYA'),
  ('1609060', '1609', 'BELITANG'),
  ('1609061', '1609', 'BELITANG JAYA'),
  ('1609070', '1609', 'BELITANG III'),
  ('1609080', '1609', 'BELITANG II'),
  ('1609081', '1609', 'BELITANG MULYA'),
  ('1609090', '1609', 'SEMENDAWAI SUKU III'),
  ('1609091', '1609', 'SEMENDAWAI TIMUR'),
  ('1609100', '1609', 'CEMPAKA'),
  ('1609101', '1609', 'SEMENDAWAI BARAT'),
  ('1610010', '1610', 'MUARA KUANG'),
  ('1610011', '1610', 'RAMBANG KUANG'),
  ('1610012', '1610', 'LUBUK KELIAT'),
  ('1610020', '1610', 'TANJUNG BATU'),
  ('1610021', '1610', 'PAYARAMAN'),
  ('1610030', '1610', 'RANTAU ALAI'),
  ('1610031', '1610', 'KANDIS'),
  ('1610040', '1610', 'TANJUNG RAJA'),
  ('1610041', '1610', 'RANTAU PANJANG'),
  ('1610042', '1610', 'SUNGAI PINANG'),
  ('1610050', '1610', 'PEMULUTAN'),
  ('1610051', '1610', 'PEMULUTAN SELATAN'),
  ('1610052', '1610', 'PEMULUTAN BARAT'),
  ('1610060', '1610', 'INDRALAYA'),
  ('1610061', '1610', 'INDRALAYA UTARA'),
  ('1610062', '1610', 'INDRALAYA SELATAN'),
  ('1611010', '1611', 'MUARA PINANG'),
  ('1611020', '1611', 'LINTANG KANAN'),
  ('1611030', '1611', 'PENDOPO'),
  ('1611031', '1611', 'PENDOPO BARAT'),
  ('1611040', '1611', 'PASEMAH AIR KERUH'),
  ('1611050', '1611', 'ULU MUSI'),
  ('1611051', '1611', 'SIKAP DALAM'),
  ('1611060', '1611', 'TALANG PADANG'),
  ('1611070', '1611', 'TEBING TINGGI'),
  ('1611071', '1611', 'SALING');
INSERT INTO `districts` VALUES
  ('1612010', '1612', 'TALANG UBI'),
  ('1612020', '1612', 'TANAH ABANG'),
  ('1612030', '1612', 'ABAB'),
  ('1612040', '1612', 'PENUKAL'),
  ('1612050', '1612', 'PENUKAL UTARA'),
  ('1613010', '1613', 'ULU RAWAS'),
  ('1613020', '1613', 'KARANG JAYA'),
  ('1613030', '1613', 'RAWAS ULU'),
  ('1613040', '1613', 'RUPIT'),
  ('1613050', '1613', 'KARANG DAPO'),
  ('1613060', '1613', 'RAWAS ILIR'),
  ('1613070', '1613', 'NIBUNG'),
  ('1671010', '1671', 'ILIR BARAT II'),
  ('1671011', '1671', 'GANDUS'),
  ('1671020', '1671', 'SEBERANG ULU I'),
  ('1671021', '1671', 'KERTAPATI'),
  ('1671030', '1671', 'SEBERANG ULU II'),
  ('1671031', '1671', 'PLAJU'),
  ('1671040', '1671', 'ILIR BARAT I'),
  ('1671041', '1671', 'BUKIT KECIL'),
  ('1671050', '1671', 'ILIR TIMUR I'),
  ('1671051', '1671', 'KEMUNING'),
  ('1671060', '1671', 'ILIR TIMUR II'),
  ('1671061', '1671', 'KALIDONI'),
  ('1671070', '1671', 'SAKO'),
  ('1671071', '1671', 'SEMATANG BORANG'),
  ('1671080', '1671', 'SUKARAMI'),
  ('1671081', '1671', 'ALANG ALANG LEBAR'),
  ('1672010', '1672', 'RAMBANG KAPAK TENGAH'),
  ('1672020', '1672', 'PRABUMULIH TIMUR'),
  ('1672021', '1672', 'PRABUMULIH SELATAN'),
  ('1672030', '1672', 'PRABUMULIH BARAT'),
  ('1672031', '1672', 'PRABUMULIH UTARA'),
  ('1672040', '1672', 'CAMBAI'),
  ('1673010', '1673', 'DEMPO SELATAN'),
  ('1673011', '1673', 'DEMPO TENGAH'),
  ('1673020', '1673', 'DEMPO UTARA'),
  ('1673030', '1673', 'PAGAR ALAM SELATAN'),
  ('1673040', '1673', 'PAGAR ALAM UTARA'),
  ('1674011', '1674', 'LUBUK LINGGAU BARAT I'),
  ('1674012', '1674', 'LUBUK LINGGAU BARAT II'),
  ('1674021', '1674', 'LUBUK LINGGAU SELATAN I'),
  ('1674022', '1674', 'LUBUK LINGGAU SELATAN II'),
  ('1674031', '1674', 'LUBUK LINGGAU TIMUR I'),
  ('1674032', '1674', 'LUBUK LINGGAU TIMUR II'),
  ('1674041', '1674', 'LUBUK LINGGAU UTARA I'),
  ('1674042', '1674', 'LUBUK LINGGAU UTARA II'),
  ('1701040', '1701', 'MANNA'),
  ('1701041', '1701', 'KOTA MANNA'),
  ('1701042', '1701', 'KEDURANG');
INSERT INTO `districts` VALUES
  ('1701043', '1701', 'BUNGA MAS'),
  ('1701044', '1701', 'PASAR MANNA'),
  ('1701045', '1701', 'KEDURANG ILIR'),
  ('1701050', '1701', 'SEGINIM'),
  ('1701051', '1701', 'AIR NIPIS'),
  ('1701060', '1701', 'PINO'),
  ('1701061', '1701', 'PINORAYA'),
  ('1701062', '1701', 'ULU MANNA'),
  ('1702020', '1702', 'KOTA PADANG'),
  ('1702021', '1702', 'SINDANG BELITI ILIR'),
  ('1702030', '1702', 'PADANG ULAK TANDING'),
  ('1702031', '1702', 'SINDANG KELINGI'),
  ('1702032', '1702', 'BINDU RIANG'),
  ('1702033', '1702', 'SINDANG BELITI ULU'),
  ('1702034', '1702', 'SINDANG DATARAN'),
  ('1702040', '1702', 'CURUP'),
  ('1702041', '1702', 'BERMANI ULU'),
  ('1702042', '1702', 'SELUPU REJANG'),
  ('1702043', '1702', 'CURUP SELATAN'),
  ('1702044', '1702', 'CURUP TENGAH'),
  ('1702045', '1702', 'BERMANI ULU RAYA'),
  ('1702046', '1702', 'CURUP UTARA'),
  ('1702047', '1702', 'CURUP TIMUR'),
  ('1703010', '1703', 'ENGGANO'),
  ('1703050', '1703', 'KERKAP'),
  ('1703051', '1703', 'AIR NAPAL'),
  ('1703052', '1703', 'AIR BESI'),
  ('1703053', '1703', 'HULU PALIK'),
  ('1703054', '1703', 'TANJUNG AGUNG PALIK'),
  ('1703060', '1703', 'ARGA MAKMUR'),
  ('1703061', '1703', 'ARMA JAYA'),
  ('1703070', '1703', 'LAIS'),
  ('1703071', '1703', 'BATIK NAU'),
  ('1703072', '1703', 'GIRI MULYA'),
  ('1703073', '1703', 'AIR PADANG'),
  ('1703080', '1703', 'PADANG JAYA'),
  ('1703090', '1703', 'KETAHUN'),
  ('1703091', '1703', 'NAPAL PUTIH'),
  ('1703092', '1703', 'ULOK KUPAI'),
  ('1703093', '1703', 'PINANG RAYA'),
  ('1703100', '1703', 'PUTRI HIJAU'),
  ('1703101', '1703', 'MARGA SAKTI SEBELAT'),
  ('1704010', '1704', 'NASAL'),
  ('1704020', '1704', 'MAJE'),
  ('1704030', '1704', 'KAUR SELATAN'),
  ('1704031', '1704', 'TETAP'),
  ('1704040', '1704', 'KAUR TENGAH'),
  ('1704041', '1704', 'LUAS'),
  ('1704042', '1704', 'MUARA SAHUNG'),
  ('1704050', '1704', 'KINAL');
INSERT INTO `districts` VALUES
  ('1704051', '1704', 'SEMIDANG GUMAY'),
  ('1704060', '1704', 'TANJUNG KEMUNING'),
  ('1704061', '1704', 'KELAM TENGAH'),
  ('1704070', '1704', 'KAUR UTARA'),
  ('1704071', '1704', 'PADANG GUCI HILIR'),
  ('1704072', '1704', 'LUNGKANG KULE'),
  ('1704073', '1704', 'PADANG GUCI HULU'),
  ('1705010', '1705', 'SEMIDANG ALAS MARAS'),
  ('1705020', '1705', 'SEMIDANG ALAS'),
  ('1705030', '1705', 'TALO'),
  ('1705031', '1705', 'ILIR TALO'),
  ('1705032', '1705', 'TALO KECIL'),
  ('1705033', '1705', 'ULU TALO'),
  ('1705040', '1705', 'SELUMA'),
  ('1705041', '1705', 'SELUMA SELATAN'),
  ('1705042', '1705', 'SELUMA BARAT'),
  ('1705043', '1705', 'SELUMA TIMUR'),
  ('1705044', '1705', 'SELUMA UTARA'),
  ('1705050', '1705', 'SUKARAJA'),
  ('1705051', '1705', 'AIR PERIUKAN'),
  ('1705052', '1705', 'LUBUK SANDI'),
  ('1706010', '1706', 'IPUH'),
  ('1706011', '1706', 'AIR RAMI'),
  ('1706012', '1706', 'MALIN DEMAN'),
  ('1706020', '1706', 'PONDOK SUGUH'),
  ('1706021', '1706', 'SUNGAI RUMBAI'),
  ('1706022', '1706', 'TERAMANG JAYA'),
  ('1706030', '1706', 'TERAS TERUNJAM'),
  ('1706031', '1706', 'PENARIK'),
  ('1706032', '1706', 'SELAGAN RAYA'),
  ('1706040', '1706', 'KOTA MUKOMUKO'),
  ('1706041', '1706', 'AIR DIKIT'),
  ('1706042', '1706', 'XIV KOTO'),
  ('1706050', '1706', 'LUBUK PINANG'),
  ('1706051', '1706', 'AIR MANJUNTO'),
  ('1706052', '1706', 'V KOTO'),
  ('1707010', '1707', 'RIMBO PENGADANG'),
  ('1707011', '1707', 'TOPOS'),
  ('1707020', '1707', 'LEBONG SELATAN'),
  ('1707021', '1707', 'BINGIN KUNING'),
  ('1707030', '1707', 'LEBONG TENGAH'),
  ('1707031', '1707', 'LEBONG SAKTI'),
  ('1707040', '1707', 'LEBONG ATAS'),
  ('1707041', '1707', 'PADANG BANO'),
  ('1707042', '1707', 'PELABAI'),
  ('1707050', '1707', 'LEBONG UTARA'),
  ('1707051', '1707', 'AMEN'),
  ('1707052', '1707', 'URAM JAYA'),
  ('1707053', '1707', 'PINANG BELAPIS'),
  ('1708010', '1708', 'MUARA KEMUMU');
INSERT INTO `districts` VALUES
  ('1708020', '1708', 'BERMANI ILIR'),
  ('1708030', '1708', 'SEBERANG MUSI'),
  ('1708040', '1708', 'TEBAT KARAI'),
  ('1708050', '1708', 'KEPAHIANG'),
  ('1708060', '1708', 'KABA WETAN'),
  ('1708070', '1708', 'UJAN MAS'),
  ('1708080', '1708', 'MERIGI'),
  ('1709010', '1709', 'TALANG EMPAT'),
  ('1709020', '1709', 'KARANG TINGGI'),
  ('1709030', '1709', 'TABA PENANJUNG'),
  ('1709031', '1709', 'MERIGI KELINDANG'),
  ('1709040', '1709', 'PAGAR JATI'),
  ('1709041', '1709', 'MERIGI SAKTI'),
  ('1709050', '1709', 'PONDOK KELAPA'),
  ('1709051', '1709', 'PONDOK KUBANG'),
  ('1709060', '1709', 'PEMATANG TIGA'),
  ('1709061', '1709', 'BANG HAJI'),
  ('1771010', '1771', 'SELEBAR'),
  ('1771011', '1771', 'KAMPUNG MELAYU'),
  ('1771020', '1771', 'GADING CEMPAKA'),
  ('1771021', '1771', 'RATU AGUNG'),
  ('1771022', '1771', 'RATU SAMBAN'),
  ('1771023', '1771', 'SINGARAN PATI'),
  ('1771030', '1771', 'TELUK SEGARA'),
  ('1771031', '1771', 'SUNGAI SERUT'),
  ('1771040', '1771', 'MUARA BANGKA HULU'),
  ('1801040', '1801', 'BALIK BUKIT'),
  ('1801041', '1801', 'SUKAU'),
  ('1801042', '1801', 'LUMBOK SEMINUNG'),
  ('1801050', '1801', 'BELALAU'),
  ('1801051', '1801', 'SEKINCAU'),
  ('1801052', '1801', 'SUOH'),
  ('1801053', '1801', 'BATU BRAK'),
  ('1801054', '1801', 'PAGAR DEWA'),
  ('1801055', '1801', 'BATU KETULIS'),
  ('1801056', '1801', 'BANDAR NEGERI SUOH'),
  ('1801060', '1801', 'SUMBER JAYA'),
  ('1801061', '1801', 'WAY TENONG'),
  ('1801062', '1801', 'GEDUNG SURIAN'),
  ('1801063', '1801', 'KEBUN TEBU'),
  ('1801064', '1801', 'AIR HITAM'),
  ('1802010', '1802', 'WONOSOBO'),
  ('1802011', '1802', 'SEMAKA'),
  ('1802012', '1802', 'BANDAR NEGERI SEMUONG'),
  ('1802020', '1802', 'KOTA AGUNG'),
  ('1802021', '1802', 'PEMATANG SAWA'),
  ('1802022', '1802', 'KOTA AGUNG TIMUR'),
  ('1802023', '1802', 'KOTA AGUNG BARAT'),
  ('1802030', '1802', 'PULAU PANGGUNG'),
  ('1802031', '1802', 'ULUBELU');
INSERT INTO `districts` VALUES
  ('1802032', '1802', 'AIR NANINGAN'),
  ('1802040', '1802', 'TALANG PADANG'),
  ('1802041', '1802', 'SUMBEREJO'),
  ('1802042', '1802', 'GISTING'),
  ('1802043', '1802', 'GUNUNG ALIP'),
  ('1802050', '1802', 'PUGUNG'),
  ('1802101', '1802', 'BULOK'),
  ('1802110', '1802', 'CUKUH BALAK'),
  ('1802111', '1802', 'KELUMBAYAN'),
  ('1802112', '1802', 'LIMAU'),
  ('1802113', '1802', 'KELUMBAYAN BARAT'),
  ('1803060', '1803', 'NATAR'),
  ('1803070', '1803', 'JATI AGUNG'),
  ('1803080', '1803', 'TANJUNG BINTANG'),
  ('1803081', '1803', 'TANJUNG SARI'),
  ('1803090', '1803', 'KATIBUNG'),
  ('1803091', '1803', 'MERBAU MATARAM'),
  ('1803092', '1803', 'WAY SULAN'),
  ('1803100', '1803', 'SIDOMULYO'),
  ('1803101', '1803', 'CANDIPURO'),
  ('1803102', '1803', 'WAY PANJI'),
  ('1803110', '1803', 'KALIANDA'),
  ('1803111', '1803', 'RAJABASA'),
  ('1803120', '1803', 'PALAS'),
  ('1803121', '1803', 'SRAGI'),
  ('1803130', '1803', 'PENENGAHAN'),
  ('1803131', '1803', 'KETAPANG'),
  ('1803132', '1803', 'BAKAUHENI'),
  ('1804010', '1804', 'METRO KIBANG'),
  ('1804020', '1804', 'BATANGHARI'),
  ('1804030', '1804', 'SEKAMPUNG'),
  ('1804040', '1804', 'MARGATIGA'),
  ('1804050', '1804', 'SEKAMPUNG UDIK'),
  ('1804060', '1804', 'JABUNG'),
  ('1804061', '1804', 'PASIR SAKTI'),
  ('1804062', '1804', 'WAWAY KARYA'),
  ('1804063', '1804', 'MARGA SEKAMPUNG'),
  ('1804070', '1804', 'LABUHAN MARINGGAI'),
  ('1804071', '1804', 'MATARAM BARU'),
  ('1804072', '1804', 'BANDAR SRIBAWONO'),
  ('1804073', '1804', 'MELINTING'),
  ('1804074', '1804', 'GUNUNG PELINDUNG'),
  ('1804080', '1804', 'WAY JEPARA'),
  ('1804081', '1804', 'BRAJA SLEBAH'),
  ('1804082', '1804', 'LABUHAN RATU'),
  ('1804090', '1804', 'SUKADANA'),
  ('1804091', '1804', 'BUMI AGUNG'),
  ('1804092', '1804', 'BATANGHARI NUBAN'),
  ('1804100', '1804', 'PEKALONGAN'),
  ('1804110', '1804', 'RAMAN UTARA');
INSERT INTO `districts` VALUES
  ('1804120', '1804', 'PURBOLINGGO'),
  ('1804121', '1804', 'WAY BUNGUR'),
  ('1805010', '1805', 'PADANG RATU'),
  ('1805011', '1805', 'SELAGAI LINGGA'),
  ('1805012', '1805', 'PUBIAN'),
  ('1805013', '1805', 'ANAK TUHA'),
  ('1805014', '1805', 'ANAK RATU AJI'),
  ('1805020', '1805', 'KALIREJO'),
  ('1805021', '1805', 'SENDANG AGUNG'),
  ('1805030', '1805', 'BANGUNREJO'),
  ('1805040', '1805', 'GUNUNG SUGIH'),
  ('1805041', '1805', 'BEKRI'),
  ('1805042', '1805', 'BUMI RATU NUBAN'),
  ('1805050', '1805', 'TRIMURJO'),
  ('1805060', '1805', 'PUNGGUR'),
  ('1805061', '1805', 'KOTA GAJAH'),
  ('1805070', '1805', 'SEPUTIH RAMAN'),
  ('1805080', '1805', 'TERBANGGI BESAR'),
  ('1805081', '1805', 'SEPUTIH AGUNG'),
  ('1805082', '1805', 'WAY PENGUBUAN'),
  ('1805090', '1805', 'TERUSAN NUNYAI'),
  ('1805100', '1805', 'SEPUTIH MATARAM'),
  ('1805101', '1805', 'BANDAR MATARAM'),
  ('1805110', '1805', 'SEPUTIH BANYAK'),
  ('1805111', '1805', 'WAY SEPUTIH'),
  ('1805120', '1805', 'RUMBIA'),
  ('1805121', '1805', 'BUMI NABUNG'),
  ('1805122', '1805', 'PUTRA RUMBIA'),
  ('1805130', '1805', 'SEPUTIH SURABAYA'),
  ('1805131', '1805', 'BANDAR SURABAYA'),
  ('1806010', '1806', 'BUKIT KEMUNING'),
  ('1806011', '1806', 'ABUNG TINGGI'),
  ('1806020', '1806', 'TANJUNG RAJA'),
  ('1806030', '1806', 'ABUNG BARAT'),
  ('1806031', '1806', 'ABUNG TENGAH'),
  ('1806032', '1806', 'ABUNG  KUNANG'),
  ('1806033', '1806', 'ABUNG PEKURUN'),
  ('1806040', '1806', 'KOTABUMI'),
  ('1806041', '1806', 'KOTABUMI UTARA'),
  ('1806042', '1806', 'KOTABUMI SELATAN'),
  ('1806050', '1806', 'ABUNG SELATAN'),
  ('1806051', '1806', 'ABUNG SEMULI'),
  ('1806052', '1806', 'BLAMBANGAN PAGAR'),
  ('1806060', '1806', 'ABUNG TIMUR'),
  ('1806061', '1806', 'ABUNG SURAKARTA'),
  ('1806070', '1806', 'SUNGKAI SELATAN'),
  ('1806071', '1806', 'MUARA SUNGKAI'),
  ('1806072', '1806', 'BUNGA MAYANG'),
  ('1806073', '1806', 'SUNGKAI  BARAT'),
  ('1806074', '1806', 'SUNGKAI JAYA');
INSERT INTO `districts` VALUES
  ('1806080', '1806', 'SUNGKAI UTARA'),
  ('1806081', '1806', 'HULUSUNGKAI'),
  ('1806082', '1806', 'SUNGKAI TENGAH'),
  ('1807010', '1807', 'BANJIT'),
  ('1807020', '1807', 'BARADATU'),
  ('1807021', '1807', 'GUNUNG LABUHAN'),
  ('1807030', '1807', 'KASUI'),
  ('1807031', '1807', 'REBANG TANGKAS'),
  ('1807040', '1807', 'BLAMBANGAN UMPU'),
  ('1807041', '1807', 'WAY TUBA'),
  ('1807042', '1807', 'NEGERI AGUNG'),
  ('1807050', '1807', 'BAHUGA'),
  ('1807051', '1807', 'BUAY  BAHUGA'),
  ('1807052', '1807', 'BUMI AGUNG'),
  ('1807060', '1807', 'PAKUAN RATU'),
  ('1807061', '1807', 'NEGARA BATIN'),
  ('1807062', '1807', 'NEGERI BESAR'),
  ('1808030', '1808', 'BANJAR AGUNG'),
  ('1808031', '1808', 'BANJAR MARGO'),
  ('1808032', '1808', 'BANJAR BARU'),
  ('1808040', '1808', 'GEDUNG AJI'),
  ('1808041', '1808', 'PENAWAR AJI'),
  ('1808042', '1808', 'MERAKSA AJI'),
  ('1808050', '1808', 'MENGGALA'),
  ('1808051', '1808', 'PENAWAR TAMA'),
  ('1808052', '1808', 'RAWAJITU SELATAN'),
  ('1808053', '1808', 'GEDUNG MENENG'),
  ('1808054', '1808', 'RAWAJITU TIMUR'),
  ('1808055', '1808', 'RAWA PITU'),
  ('1808056', '1808', 'GEDUNG AJI BARU'),
  ('1808057', '1808', 'DENTE TELADAS'),
  ('1808058', '1808', 'MENGGALA TIMUR'),
  ('1809010', '1809', 'PUNDUH PIDADA'),
  ('1809011', '1809', 'MARGA PUNDUH'),
  ('1809020', '1809', 'PADANG CERMIN'),
  ('1809021', '1809', 'TELUK PANDAN'),
  ('1809022', '1809', 'WAY RATAI'),
  ('1809030', '1809', 'KEDONDONG'),
  ('1809031', '1809', 'WAY KHILAU'),
  ('1809040', '1809', 'WAY LIMA'),
  ('1809050', '1809', 'GEDUNG TATAAN'),
  ('1809060', '1809', 'NEGERI KATON'),
  ('1809070', '1809', 'TEGINENENG'),
  ('1810010', '1810', 'PARDASUKA'),
  ('1810020', '1810', 'AMBARAWA'),
  ('1810030', '1810', 'PAGELARAN'),
  ('1810031', '1810', 'PAGELARAN UTARA'),
  ('1810040', '1810', 'PRINGSEWU'),
  ('1810050', '1810', 'GADING REJO'),
  ('1810060', '1810', 'SUKOHARJO');
INSERT INTO `districts` VALUES
  ('1810070', '1810', 'BANYUMAS'),
  ('1810080', '1810', 'ADI LUWIH'),
  ('1811010', '1811', 'WAY SERDANG'),
  ('1811020', '1811', 'SIMPANG PEMATANG'),
  ('1811030', '1811', 'PANCA JAYA'),
  ('1811040', '1811', 'TANJUNG RAYA'),
  ('1811050', '1811', 'MESUJI'),
  ('1811060', '1811', 'MESUJI TIMUR'),
  ('1811070', '1811', 'RAWAJITU UTARA'),
  ('1812010', '1812', 'TULANG BAWANG UDIK'),
  ('1812020', '1812', 'TUMI JAJAR'),
  ('1812030', '1812', 'TULANG BAWANG TENGAH'),
  ('1812040', '1812', 'PAGAR DEWA'),
  ('1812050', '1812', 'LAMBU KIBANG'),
  ('1812060', '1812', 'GUNUNG TERANG'),
  ('1812070', '1812', 'GUNUNG AGUNG'),
  ('1812080', '1812', 'WAY KENANGA'),
  ('1813010', '1813', 'LEMONG'),
  ('1813020', '1813', 'PESISIR UTARA'),
  ('1813030', '1813', 'PULAU PISANG'),
  ('1813040', '1813', 'KARYA PENGGAWA'),
  ('1813050', '1813', 'WAY KRUI'),
  ('1813060', '1813', 'PESISIR TENGAH'),
  ('1813070', '1813', 'KRUI SELATAN'),
  ('1813080', '1813', 'PESISIR SELATAN'),
  ('1813090', '1813', 'NGAMBUR'),
  ('1813100', '1813', 'BENGKUNAT'),
  ('1813110', '1813', 'BENGKUNAT BELIMBING'),
  ('1871010', '1871', 'TELUK BETUNG BARAT'),
  ('1871011', '1871', 'TELUKBETUNG TIMUR'),
  ('1871020', '1871', 'TELUK BETUNG SELATAN'),
  ('1871021', '1871', 'BUMI WARAS'),
  ('1871030', '1871', 'PANJANG'),
  ('1871040', '1871', 'TANJUNG KARANG TIMUR'),
  ('1871041', '1871', 'KEDAMAIAN'),
  ('1871050', '1871', 'TELUK BETUNG UTARA'),
  ('1871060', '1871', 'TANJUNG KARANG PUSAT'),
  ('1871061', '1871', 'ENGGAL'),
  ('1871070', '1871', 'TANJUNG KARANG BARAT'),
  ('1871071', '1871', 'KEMILING'),
  ('1871072', '1871', 'LANGKAPURA'),
  ('1871080', '1871', 'KEDATON'),
  ('1871081', '1871', 'RAJABASA'),
  ('1871082', '1871', 'TANJUNG SENANG'),
  ('1871083', '1871', 'LABUHAN RATU'),
  ('1871090', '1871', 'SUKARAME'),
  ('1871091', '1871', 'SUKABUMI'),
  ('1871092', '1871', 'WAY HALIM'),
  ('1872011', '1872', 'METRO SELATAN'),
  ('1872012', '1872', 'METRO BARAT');
INSERT INTO `districts` VALUES
  ('1872021', '1872', 'METRO TIMUR'),
  ('1872022', '1872', 'METRO PUSAT'),
  ('1872023', '1872', 'METRO UTARA'),
  ('1901070', '1901', 'MENDO BARAT'),
  ('1901080', '1901', 'MERAWANG'),
  ('1901081', '1901', 'PUDING BESAR'),
  ('1901090', '1901', 'SUNGAI LIAT'),
  ('1901091', '1901', 'PEMALI'),
  ('1901092', '1901', 'BAKAM'),
  ('1901130', '1901', 'BELINYU'),
  ('1901131', '1901', 'RIAU SILIP'),
  ('1902010', '1902', 'MEMBALONG'),
  ('1902060', '1902', 'TANJUNG PANDAN'),
  ('1902061', '1902', 'BADAU'),
  ('1902062', '1902', 'SIJUK'),
  ('1902063', '1902', 'SELAT NASIK'),
  ('1903010', '1903', 'KELAPA'),
  ('1903020', '1903', 'TEMPILANG'),
  ('1903030', '1903', 'MENTOK'),
  ('1903040', '1903', 'SIMPANG TERITIP'),
  ('1903050', '1903', 'JEBUS'),
  ('1903051', '1903', 'PARITTIGA'),
  ('1904010', '1904', 'KOBA'),
  ('1904011', '1904', 'LUBUK BESAR'),
  ('1904020', '1904', 'PANGKALAN BARU'),
  ('1904021', '1904', 'NAMANG'),
  ('1904030', '1904', 'SUNGAI SELAN'),
  ('1904040', '1904', 'SIMPANG KATIS'),
  ('1905010', '1905', 'PAYUNG'),
  ('1905011', '1905', 'PULAU BESAR'),
  ('1905020', '1905', 'SIMPANG RIMBA'),
  ('1905030', '1905', 'TOBOALI'),
  ('1905031', '1905', 'TUKAK SADAI'),
  ('1905040', '1905', 'AIR GEGAS'),
  ('1905050', '1905', 'LEPAR PONGOK'),
  ('1905051', '1905', 'KEPULAUAN PONGOK'),
  ('1906010', '1906', 'DENDANG'),
  ('1906011', '1906', 'SIMPANG PESAK'),
  ('1906020', '1906', 'GANTUNG'),
  ('1906021', '1906', 'SIMPANG RENGGIANG'),
  ('1906030', '1906', 'MANGGAR'),
  ('1906031', '1906', 'DAMAR'),
  ('1906040', '1906', 'KELAPA KAMPIT'),
  ('1971010', '1971', 'RANGKUI'),
  ('1971020', '1971', 'BUKIT INTAN'),
  ('1971021', '1971', 'GIRIMAYA'),
  ('1971030', '1971', 'PANGKAL BALAM'),
  ('1971031', '1971', 'GABEK'),
  ('1971040', '1971', 'TAMAN SARI'),
  ('1971041', '1971', 'GERUNGGANG');
INSERT INTO `districts` VALUES
  ('2101010', '2101', 'MORO'),
  ('2101011', '2101', 'DURAI'),
  ('2101020', '2101', 'KUNDUR'),
  ('2101021', '2101', 'KUNDUR UTARA'),
  ('2101022', '2101', 'KUNDUR BARAT'),
  ('2101023', '2101', 'UNGAR'),
  ('2101024', '2101', 'BELAT'),
  ('2101030', '2101', 'KARIMUN'),
  ('2101031', '2101', 'BURU'),
  ('2101032', '2101', 'MERAL'),
  ('2101033', '2101', 'TEBING'),
  ('2101034', '2101', 'MERAL BARAT'),
  ('2102040', '2102', 'TELUK BINTAN'),
  ('2102050', '2102', 'BINTAN UTARA'),
  ('2102051', '2102', 'TELUK SEBONG'),
  ('2102052', '2102', 'SERI KUALA LOBAM'),
  ('2102060', '2102', 'BINTAN TIMUR'),
  ('2102061', '2102', 'GUNUNG KIJANG'),
  ('2102062', '2102', 'MANTANG'),
  ('2102063', '2102', 'BINTAN PESISIR'),
  ('2102064', '2102', 'TOAPAYA'),
  ('2102070', '2102', 'TAMBELAN'),
  ('2103030', '2103', 'MIDAI'),
  ('2103040', '2103', 'BUNGURAN BARAT'),
  ('2103041', '2103', 'BUNGURAN UTARA'),
  ('2103042', '2103', 'PULAU LAUT'),
  ('2103043', '2103', 'PULAU TIGA'),
  ('2103050', '2103', 'BUNGURAN TIMUR'),
  ('2103051', '2103', 'BUNGURAN TIMUR LAUT'),
  ('2103052', '2103', 'BUNGURAN TENGAH'),
  ('2103053', '2103', 'BUNGURAN SELATAN'),
  ('2103060', '2103', 'SERASAN'),
  ('2103061', '2103', 'SUBI'),
  ('2103062', '2103', 'SERASAN TIMUR'),
  ('2104010', '2104', 'SINGKEP BARAT'),
  ('2104011', '2104', 'KEPULAUAN POSEK'),
  ('2104020', '2104', 'SINGKEP'),
  ('2104021', '2104', 'SINGKEP SELATAN'),
  ('2104022', '2104', 'SINGKEP PESISIR'),
  ('2104030', '2104', 'LINGGA'),
  ('2104031', '2104', 'SELAYAR'),
  ('2104032', '2104', 'LINGGA TIMUR'),
  ('2104040', '2104', 'LINGGA UTARA'),
  ('2104050', '2104', 'SENAYANG'),
  ('2105010', '2105', 'JEMAJA'),
  ('2105020', '2105', 'JEMAJA TIMUR'),
  ('2105030', '2105', 'SIANTAN SELATAN'),
  ('2105040', '2105', 'SIANTAN'),
  ('2105050', '2105', 'SIANTAN TIMUR'),
  ('2105060', '2105', 'SIANTAN TENGAH');



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


