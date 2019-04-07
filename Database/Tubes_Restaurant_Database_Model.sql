create table customer(
    id_customer varchar2(15) not null enable,
    nama_customer varchar2(255) not null,
    gender varchar2(25),
    alamat varchar2(255),
    no_hp varchar2(255),
    constraint pk_customer primary key(id_customer)enable
);

create table item(
    no_item varchar2(15) not null enable, 
    nama_item varchar2(255) not null,
    jenis varchar2(255),
    deskripsi varchar2(255),
    total_bahan varchar2(255),
    harga number,
    constraint pk_item primary key(no_item)enable
);

create table chef(
    id_chef varchar2(15) not null enable, 
    nama_chef varchar2(255) not null,
    gaji_chef number,
    no_hp varchar2(255),
    mulai_bekerja date,
    constraint pk_chef primary key(id_chef)enable
);

create table pelayan(
    id_pelayan varchar2(15) not null enable,
    nama_pelayan varchar2(255) not null,
    gaji_pelayan number,
    no_hp varchar2(255),
    mulai_bekerja date,
    constraint pk_pelayan primary key(id_pelayan)enable
);

create table komentar(
    id_komentar varchar2(15) not null enable, 
    id_customer varchar2(15) not null,
    tanggal date,
    judul varchar2(255),
    deskripsi_komentar varchar2(255),
    rate float,
    constraint pk_komentar primary key(id_komentar) enable,
    constraint fk_komentar foreign key(id_customer) references customer (id_customer) on delete cascade
);

create table orderan(
    id_orderan varchar2(15) not null enable, 
    no_item varchar2(15),
    id_customer varchar2(15),
    tanggal date,
    catatan varchar2(255),
    total_item number,
    total_harga number,
    constraint pk_orderan primary key(id_orderan)enable,
    constraint fk_orderan1 foreign key(no_item) references item(no_item) on delete cascade,
    constraint fk_orderan2 foreign key(id_customer) references customer(id_customer) on delete cascade
);

create table mengambil(
    id_mengambil varchar2(15) not null enable, 
    id_orderan varchar2(15),
    id_pelayan varchar2(15),
    constraint pk_mengambil primary key(id_mengambil)enable,
    constraint fk_mengambil1 foreign key(id_pelayan) references pelayan(id_pelayan) on delete cascade,
    constraint fk_mengambil2 foreign key(id_orderan) references orderan(id_orderan) on delete cascade
);

create table mendapat(
    id_mendapat varchar2(15) not null enable, 
    no_item varchar2(15),
    id_chef varchar2(15),
    constraint pk_mendapat primary key(id_mendapat)enable,
    constraint fk_mendapat1 foreign key(id_chef) references chef(id_chef) on delete cascade,
    constraint fk_mendapat2 foreign key(no_item) references item(no_item) on delete cascade
);

alter session set nls_date_format= 'dd-month-yyyy';

--INSERT TABLE CUSTOMER
insert into customer values ('CUST001','Adri','Laki-laki','Perumahan Citra','087877768909');
insert into customer values ('CUST002','Dwi','Laki-laki','Jl.Radio','021356765413');
insert into customer values ('CUST003','Rendra','Laki-laki','Jl.Soekarno','087767653124');
insert into customer values ('CUST004','Eko','Laki-laki','Perumahan Diponorogo','089097651211');
insert into customer values ('CUST005','Nana','Perempuan','Jl.Soekarno','088912435546');
insert into customer values ('CUST006','Lala','Perempuan','Perumahan Aksara','081212336517');
insert into customer values ('CUST007','Asri','Perempuan','Ciputra Residence','081290998765');
insert into customer values ('CUST008','Bagus','Laki-laki','Java Residence','089900122615');
insert into customer values ('CUST009','Dian','Perempuan','Perumahan Citra','087876766565');
insert into customer values ('CUST010','Tya','Perempuan','Jl.Juanda','087123615432');
insert into customer values ('CUST011','Joko','Laki-laki','Bintaro Residence','089877651234');
insert into customer values ('CUST012','Bambang','Laki-laki','Indah Permata Residence','083224566154');
insert into customer values ('CUST013','Nanang','Laki-laki','Jl.Telkom Utama','086654567890');
insert into customer values ('CUST014','Nia','Perempuan','Perumahan Permata Sari','021343557765');
insert into customer values ('CUST015','Agus','Laki-laki','Perumahan Diponorogo','081211326537');
insert into customer values ('CUST016','Gita','Perempuan','Jl.Radio','021176755436');
insert into customer values ('CUST017','Farhan','Laki-laki','Perumahan Aksara','021767874123');
insert into customer values ('CUST018','Fitri','Perempuan','Jl.Juanda','083421766514');
insert into customer values ('CUST019','Nur','Perempuan','Java Residence','089976775123');
insert into customer values ('CUST020','Satria','Laki-laki','Bintaro Residence','089012213412');

--INSERT TABLE ITEM
insert into item values('ITM001','Nasi Goreng','Makanan','Nasi yang digoreng','10',15000 );
insert into item values('ITM002','Ayam Bakar','Makanan','Ayam yang dibakar','7', 17000);
insert into item values('ITM003','Ayam Goreng','Makanan','Ayam yang digoreng','7', 17000);
insert into item values('ITM004','Pecel','Makanan','Sayur dan nasi dengan saus kacang','15', 13000);
insert into item values('ITM005','Steak','Makanan','Daging yang dibakar','15', 45000);
insert into item values('ITM006','Fish and Chips','Makanan','Ikan tepung dan chips','20', 42500);
insert into item values('ITM007','Ikan Bakar','Makanan','Ikan yang dibakar','7', 16000);
insert into item values('ITM008','Ikan Goreng','Makanan','Ikan yang digoreng','7', 16000);
insert into item values('ITM009','Nasi Bakar','Makanan','Nasi yang dibakar dengan isi suir ayam','15', 12000);
insert into item values('ITM010','Nasi Bogana','Makanan','Nasi dan lauk yang dibungkus dengan daun pisang','15', 12000);
insert into item values('ITM011','Nasi Liwet','Makanan','Nasi khas solo','16', 12000);
insert into item values('ITM012','Makaroni','Makanan','Makaroni yang dipanggang','10', 13500);
insert into item values('ITM013','Spageti','Makanan','Spageti yang dipadu dengan saus bolognes','10', 25000);
insert into item values('ITM014','Pizza','Makanan','Isi berbagai macam jenis sayuran dan daging','17', 52500);
insert into item values('ITM015','Roti Bakar','Makanan','Roti yang dibakar','5', 7000);
insert into item values('ITM016','Jus','Minuman','Buah buahan yang diblender','5', 8000);
insert into item values('ITM017','Teh Manis','Minuman','Teh seduh yang diberi gula','4', 3500);
insert into item values('ITM018','Susu','Minuman','Susu coklat, stroberi, vanilla','4', 5000);
insert into item values('ITM019','Kopi','Minuman','Kopi seduh','3', 5000);
insert into item values('ITM020','Teh Tawar','Minuman','Teh tanpa gula','3', 2000);

--INSERT TABLE CHEF
insert into chef values('CHF001','Lucas', 1000000,'088987877655','01-Jan-2000');
insert into chef values('CHF002','Nara', 1200000,'087122133242','02-Feb-2001');
insert into chef values('CHF003','Kia', 950000,'021322116521','05-Nov-2000');
insert into chef values('CHF004','Steve', 900000,'081221311567','01-Jan-2000');
insert into chef values('CHF005','Jhon', 1050000,'087665122712','05-Jan-2000');
insert into chef values('CHF006','Niel', 1000000,'080911223171','08-Feb-2000');
insert into chef values('CHF007','Cikha', 890000,'087678988098','21-May-2003');
insert into chef values('CHF008','Lisa', 920000,'081223312151','22-Jun-2001');
insert into chef values('CHF009','Jack', 1250000,'081221314567','18-Mar-2011');
insert into chef values('CHF010','Wira', 1100000,'081277689876','30-Jul-2002');
insert into chef values('CHF011','Kiki', 935000,'021099881627','15-Oct-2004');
insert into chef values('CHF012','Shindy', 1200000,'080127716323','12-Apr-2000');
insert into chef values('CHF013','Azka', 1000000,'089077123123','11-Jun-2001');
insert into chef values('CHF014','Feby', 1150000,'0812991732351','13-Mar-2009');
insert into chef values('CHF015','Adnan', 1000000,'081676541231','19-May-2011');
insert into chef values('CHF016','Jean', 900000,'089077668190','20-Dec-2003');
insert into chef values('CHF017','Sasa', 920000,'021223125437','19-Mar-2000');
insert into chef values('CHF018','Dika', 1050000,'071265651234','23-Oct-2003');
insert into chef values('CHF019','Danu', 980000,'087712153643','11-May-2007');
insert into chef values('CHF020','Yasmin', 1000000,'089001283700','13-Jun-2009');

--INSERT TABLE PELAYAN
insert into pelayan values('PYN001','Azalia', 850000,'081299001271','02-Jan-2000');
insert into pelayan values('PYN002','Yuni', 900000,'088121336789','03-Feb-2000');
insert into pelayan values('PYN003','Joshua',740000,'089102735345','01-Jan-2000');
insert into pelayan values('PYN004','Dean', 800000,'081231314242','13-Mar-2001');
insert into pelayan values('PYN005','Nanda', 820000,'089071625348','18-May-2007');
insert into pelayan values('PYN006','Tika', 785000,'081900991277','12-Dec-2000');
insert into pelayan values('PYN007','Teresia', 790000,'08812632466','10-Apr-2007');
insert into pelayan values('PYN008','Gea', 700000,'0810763554612','09-Jun-2005');
insert into pelayan values('PYN009','Kirana', 670000,'081254746321','20-Oct-2000');
insert into pelayan values('PYN010','Firzha', 750000,'081990082345','13-Sep-2001');
insert into pelayan values('PYN011','Wawan', 900000,'081232125514','12-Nov-2000');
insert into pelayan values('PYN012','Ana', 875000,'089123453321','16-Sep-2001');
insert into pelayan values('PYN013','Leo', 735000,'021163744837','20-Oct-2011');
insert into pelayan values('PYN014','Hera', 765000,'081298766120','13-Jul-2006');
insert into pelayan values('PYN015','Novita', 825000,'021787876543','12-Nov-2011');
insert into pelayan values('PYN016','Zahra', 800000,'089076512213','11-Apr-2000');
insert into pelayan values('PYN017','Lia', 810000,'021736455321','18-Feb-2000');
insert into pelayan values('PYN018','Rian', 900000,'087890966543','18-May-2001');
insert into pelayan values('PYN019','Raihan', 810000,'089011211345','14-Mar-2009');
insert into pelayan values('PYN020','Tio', 815000,'087126355432','03-Jun-2000');

--INSERT TABLE KOMENTAR
insert into komentar values('KMN001','CUST001','21-Oct-2018','none','Pelayanan nya baik', 8.5);
insert into komentar values('KMN002','CUST002','01-Jun-2018','-','Masih ada kesalahan dalam pemesanan', 6.0);
insert into komentar values('KMN003','CUST004','22-Feb-2018','none','Harga sesuai dengan kualitas makanan', 8.8);
insert into komentar values('KMN004','CUST020','19-May-2018','none','Makanannya enak', 9.0);
insert into komentar values('KMN005','CUST018','30-Nov-2018','-','Minumannya sedikit', 7.5);
insert into komentar values('KMN006','CUST011','02-Oct-2018','-','Harganya masih terlampau mahal', 7.0);
insert into komentar values('KMN007','CUST009','03-Jun-2018','-','Bahan makanannya cukup baik', 7.8);
insert into komentar values('KMN008','CUST001','27-Oct-2018','-','Tempatnya asik', 8.1);
insert into komentar values('KMN009','CUST010','11-Oct-2018','none','Stopkontaknya sedikit', 7.7);
insert into komentar values('KMN010','CUST011','17-May-2018','-','Wifi nya kenceng, jadi betah', 8.6);
insert into komentar values('KMN011','CUST018','05-Apr-2018','none','Masih suka telat dalam pelayanannya', 5.0);
insert into komentar values('KMN012','CUST002','22-Jun-2018','none','Ada sedikit keselahan dalam orderan', 6.1);
insert into komentar values('KMN013','CUST002','09-Sep-2018','none','Pelyannya ramah', 7.2);
insert into komentar values('KMN014','CUST011','10-Apr-2018','-','Masih dalam batas wajar', 6.9);
insert into komentar values('KMN015','CUST004','10-May-2018','-','Bisa ditingkatkan menjadi lebih baik', 7.0);
insert into komentar values('KMN016','CUST018','21-May-2018','-','Menunya ditambah lagi', 7.4);
insert into komentar values('KMN017','CUST009','23-Feb-2018','-','Mejanya ada yang rusak', 6.0);
insert into komentar values('KMN018','CUST001','13-Nov-2018','none','Minum dan Makanan dibuat cepat', 7.9);
insert into komentar values('KMN019','CUST002','29-Oct-2018','-','Ada atap yang bocor', 5.5);
insert into komentar values('KMN020','CUST009','06-Sep-2018','none','Pelayanannya lebih baik dari sebelumnya', 7.3);

--INSERT TABLE ORDERAN
insert into orderan values('000','ITM001','CUST001','21-Oct-2018','-', 2, 30000);
insert into orderan values('001','ITM020','CUST001','21-Oct-2018','-', 2, 4000);
insert into orderan values('002','ITM005','CUST002','01-Jun-2018','-', 1, 45000);
insert into orderan values('003','ITM014','CUST004','22-Feb-2018','-', 1, 52500);
insert into orderan values('004','ITM013','CUST020','19-May-2018','-', 2, 50000);
insert into orderan values('005','ITM011','CUST018','21-Mar-2018','-', 3, 36000);
insert into orderan values('006','ITM001','CUST011','13-Jun-2018','-', 1, 15000);
insert into orderan values('007','ITM008','CUST009','21-Apr-2018','-', 3, 48000);
insert into orderan values('008','ITM010','CUST010','22-Jun-2018','-', 2, 24000);
insert into orderan values('009','ITM016','CUST005','23-Oct-2018','-', 2, 16000);
insert into orderan values('010','ITM011','CUST007','17-Jan-2018','-', 2, 24000);
insert into orderan values('011','ITM005','CUST017','11-Feb-2018','-', 1, 45000);
insert into orderan values('012','ITM006','CUST003','19-Jul-2018','-', 2, 85000);
insert into orderan values('013','ITM009','CUST008','10-May-2018','-', 2, 24000);
insert into orderan values('014','ITM009','CUST016','02-Nov-2018','-', 4, 48000);
insert into orderan values('015','ITM002','CUST012','12-Dec-2018','-', 2, 34000);
insert into orderan values('016','ITM001','CUST014','29-Sep-2018','-', 1, 15000);
insert into orderan values('017','ITM002','CUST019','09-Nov-2018','-', 5, 85000);
insert into orderan values('018','ITM004','CUST020','11-May-2018','-', 3, 39000);
insert into orderan values('019','ITM018','CUST011','10-Oct-2018','-', 1, 5000);

--INSERT TABLE MENGAMBIL
insert into mengambil values('1','001','PYN001');
insert into mengambil values('2','002','PYN002');
insert into mengambil values('3','003','PYN003');
insert into mengambil values('4','004','PYN004');
insert into mengambil values('5','005','PYN005');
insert into mengambil values('6','006','PYN006');
insert into mengambil values('7','007','PYN007');
insert into mengambil values('8','008','PYN008');
insert into mengambil values('9','009','PYN009');
insert into mengambil values('10','010','PYN010');
insert into mengambil values('11','011','PYN011');
insert into mengambil values('12','012','PYN012');
insert into mengambil values('13','013','PYN013');
insert into mengambil values('14','014','PYN014');
insert into mengambil values('15','015','PYN015');
insert into mengambil values('16','016','PYN016');
insert into mengambil values('17','017','PYN017');
insert into mengambil values('18','018','PYN018');
insert into mengambil values('19','019','PYN019');
insert into mengambil values('20','000','PYN020');

--INSERT TABLE MENDAPAT
insert into mendapat values('1','ITM001','CHF001');
insert into mendapat values('2','ITM002','CHF002');
insert into mendapat values('3','ITM003','CHF003');
insert into mendapat values('4','ITM004','CHF004');
insert into mendapat values('5','ITM005','CHF005');
insert into mendapat values('6','ITM006','CHF006');
insert into mendapat values('7','ITM007','CHF007');
insert into mendapat values('8','ITM008','CHF008');
insert into mendapat values('9','ITM009','CHF009');
insert into mendapat values('10','ITM010','CHF010');
insert into mendapat values('11','ITM011','CHF011');
insert into mendapat values('12','ITM012','CHF012');
insert into mendapat values('13','ITM013','CHF013');
insert into mendapat values('14','ITM014','CHF014');
insert into mendapat values('15','ITM015','CHF015');
insert into mendapat values('16','ITM016','CHF016');
insert into mendapat values('17','ITM017','CHF017');
insert into mendapat values('18','ITM018','CHF018');
insert into mendapat values('19','ITM019','CHF019');
insert into mendapat values('20','ITM020','CHF020');

commit;