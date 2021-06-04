/* Testy operacji INSERT, UPDATE oraz DELETE */



ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";




/* Firma - kolejnoœæ: ID_firmy, Nazwa, NIP */
INSERT INTO Firma VALUES (1, 'WiœniewskiRemonty','kkk');
INSERT INTO Firma VALUES (1234, null, 1324690382);
INSERT INTO Firma VALUES (12345, 'ppp', 13246903899992);
ROLLBACK;

/* Typ_cmentarza - kolejnoœæ: ID_typu_cmentarza, Nazwa */
INSERT INTO Typ_Cmentarza VALUES (101, 'Komunalny');
INSERT INTO Typ_Cmentarza VALUES (102, null);
ROLLBACK;

/* Kierownik - kolejnoœæ: ID_kierownika, Imiê, Nazwisko, Numer_telefonu, E-mail (Opcja) */
INSERT INTO Kierownik VALUES (101, 'Bartosz', 'Pawlak', '743009214' , 'bartoszpawlak@gmail.com');
INSERT INTO Kierownik VALUES (null, 'Randall', 'Rogers', '358870767' , 'randalrogers@gmail.com');
INSERT INTO Kierownik VALUES (103, null, 'Himuro', '7804557458' , 'guyhimuro@gmail.com');
INSERT INTO Kierownik VALUES (104, 'Steven', null, '2315125087' , 'steven.murgos@gmail.com');
INSERT INTO Kierownik VALUES (105, 'Ki', 'Bissot', null, 'kibissot12@gmail.com');
ROLLBACK;

/* Typ_kwatery - kolejnoœæ: Id_typu_kwatery, Nazwa, Stawka_roczna, Iloœæ_miejsc */
INSERT INTO typ_kwatery VALUES (101, 'Pojedyncza' , 16, 1);
INSERT INTO typ_kwatery VALUES (null, 'Podwójna' , 30, 2);
INSERT INTO typ_kwatery VALUES (103, null , 50, 4);
INSERT INTO typ_kwatery VALUES (101, 'Pojedyncza' , null, 1);
INSERT INTO typ_kwatery VALUES (101, 'Pojedyncza' , 16, null);
ROLLBACK;

/* Region - kolejnoœæ: ID_regionu, Nazwa */
INSERT INTO region VALUES (101, 'EUROPA');
INSERT INTO region VALUES (120, 'AFRYKA');
INSERT INTO region VALUES (null, 'AMERYKA PN');
INSERT INTO region VALUES (104, null);
ROLLBACK;

/* Kraj - kolejnoœæ: ID_kraju, Nazwa, ID_regionu */
INSERT INTO kraj VALUES (101, 'WIELKA BRYTANIA', 101);
INSERT INTO kraj VALUES (140, 'NIEMCY', 101);
INSERT INTO kraj VALUES (150, 'ANDORA', 400);
INSERT INTO kraj VALUES (null, 'POLSKA', 101);
INSERT INTO kraj VALUES (105, null, 101);
INSERT INTO kraj VALUES (106, 'LITWA', null);
ROLLBACK;

/* Adres - kolejnoœæ: ID_adresu, Ulica (Opcja), Numer, Kod_pocztowy, Miejscowoœæ, ID_kraju */
INSERT INTO adres VALUES (1001, 'Miodowa', 4, '00-123', 'WARSZAWA', 104);
INSERT INTO adres VALUES (1047, 'Koszykowa', 1,  '12-234', 'KRAKOW', 104);
INSERT INTO adres VALUES (null, 'Oxford Street', 1,  '23AB1', 'LONDYN', 101);
INSERT INTO adres VALUES (1004, 'Spadina Ave', null,  'm5V 2L7', null, 116);
INSERT INTO adres VALUES (1055, null, 78, '23A123',  null , 117);
INSERT INTO adres VALUES (1001, 'Miodowa', 4, null, 'WARSZAWA', 104);
INSERT INTO adres VALUES (1066, '2017 Shinjuku-ku', 32, '1689', 'Tokyo', 987);
ROLLBACK;

/* Cmentarz - kolejnoœæ: ID_cmentarza, Nazwa (Opcja), Godzina_otwarcia, Godzina_zamkniecia, ID_typu_cmentarza, ID, adresu, ID_kraju, ID_kierownika */
INSERT INTO cmentarz VALUES (101, 'Nowy' , 8, 20 , 101, 1001, 104, 101);
INSERT INTO cmentarz VALUES (122, null , 19, 12 , 103, 1002, 104, 101);
INSERT INTO cmentarz VALUES (133, null , 7, 21, 101, 1003, 101, 122);
INSERT INTO cmentarz VALUES (144, null , 6, 21, 142, 1004, 116, 103);
INSERT INTO cmentarz VALUES (155, 'Stary' , 10, 23 , 101, 1065, 117, 104);
INSERT INTO cmentarz VALUES (166, 'Nowy' , 6, 20 , 101, 1006, 149, 105);
ROLLBACK;

/*Inwestycja - kolejnoœæ: ID_inwestycji, Data_rozpczecia, Data_zakonczenia (Opcja), Kwota (Opcja), Opis (Opcja), ID_cmentarza, ID_firmy */
INSERT INTO Inwestycja VALUES (100001, '01/02/2004', '01/08/2004', 1300000, ' Remont generalny', 101, 1); 
INSERT INTO Inwestycja VALUES (100042, null, '25/06/2018', 120000, ' Wymiana ogrodzenia',102, 2);
INSERT INTO Inwestycja VALUES (100082, '01/06/2016', null, null, null, 122, 2);
INSERT INTO Inwestycja VALUES (100072, '01/06/2016', null, null, null, 122, 100);
ROLLBACK;

/* Wlasciciel_kwatery - kolejnoœæ: ID_wlasciciela, Imie, Nazwisko, PESEL (Opcja) */
INSERT INTO wlasciciel_kwatery VALUES (101, 'Piotr', 'Maciejewski', 92091398077 );
INSERT INTO wlasciciel_kwatery VALUES (122, null, 'Janowski', 50013067812);
INSERT INTO wlasciciel_kwatery VALUES (null, 'Andrzej', 'King', 66121256738 );
INSERT INTO wlasciciel_kwatery VALUES (104, 'Lex', null, 68060894032 );
INSERT INTO wlasciciel_kwatery VALUES (105, 'Alexander', 'Hunold', 4610199990925 );
ROLLBACK;

/* Kwatera - kolejnoœæ: ID_kwatery, Kod_kwatery, Data_zakupu (Opcja), Liczba_lat_waznosci (Opcja), ID_typu_kwatery, ID_cmentarza, ID_wlasciciela (Opcja) */
INSERT INTO kwatera VALUES (101, 'ADG4690421', '01/01/2009', 20, 101, 101, 108);
INSERT INTO kwatera VALUES (122, 'YUIO326789', '01/01/2009', 20, 101, 102, 108);
INSERT INTO kwatera VALUES (133, null, '15/04/2009', 30, 101, 103, 107 );
INSERT INTO kwatera VALUES (144, 'WQP4089795', null, null, 192, 103, 106);
INSERT INTO kwatera VALUES (185, 'AAS2968409', '14/03/2012', 40, 102, 184, 105);
INSERT INTO kwatera VALUES (176, 'LJP68566032', '14/06/2012', 20, 102, 104, 404);
ROLLBACK;

/* Zmarly - kolejnoœæ: ID_zmarlego, Imie, Nazwisko, Data_urodzenia, Data_smierci, Data_pochowku, ID_kwatery */
INSERT INTO zmarly VALUES (111, 'Daniel', 'Greenberg', '11/11/1936', '11/05/2015', '16/05/2015', 101);
INSERT INTO zmarly VALUES (122, null, 'Faviet', '09/06/1937',  '09/11/2015', '11/11/2015', 102);
INSERT INTO zmarly VALUES (133, 'Ismael', null, '06/11/1948',  '08/11/2014', '11/11/2014', 103);
INSERT INTO zmarly VALUES (144, 'Jose Manuel', 'Sciarra', null, '11/06/2016', '11/06/2016', 104);
INSERT INTO zmarly VALUES (155, 'Luis', 'Urman', '31/12/1959', null, '14/05/2017', 104);
INSERT INTO zmarly VALUES (166, 'Luis', 'Popp', '04/10/1948','12/12/2017', null, 105);
INSERT INTO zmarly VALUES (177, 'Den', 'Raphaely', '07/05/1927', '20/01/2015', '22/01/2015', 166);
INSERT INTO zmarly VALUES (188, 'Alex', 'Khoo', '10/10/1930', '20/02/2018', '25/02/2018', null);
INSERT INTO zmarly VALUES (199, 'Shelli', 'Baida', '12/08/1931', '15/09/1930', '20/09/2019', 108);
INSERT INTO zmarly VALUES (209, 'Sigal', 'Tobias', '01/03/1930', '21/07/2019', '22/07/2016', 109);
ROLLBACK;

/* HISTORYCZNY_ZAKUP_KWATERY - kolejnoœæ: ID_zakupu, Data_zakupu, Data_Zakonczenia, ID_wlasciciela, ID_kwatery */
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (101, '01/01/2013', '01/01/2063', 101, 109);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (122, '01/01/2013', '01/01/2003', 102 ,108);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (null, '01/10/2012', '01/10/2032', 103, 107);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (144, null, '01/01/2011', 103,  107);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (155, '14/06/2012', null, 104, 106);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (166, '14/03/2012', '14/03/2052', 175, 105);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (177, '20/11/2011', '20/11/2041' , 106, 404);
ROLLBACK;

/

Update historyczny_zakup_kwatery
set data_zakonczenia = '01/01/2074'
where id_wlasciciela = 101;
rollback;
/

Update typ_kwatery
set stawka_roczna = 25
where ilosc_miejsc < 3;
rollback;
/

Update zmarly
set data_pochowku = '26/02/2018'
where id_zmarlego = 118;
rollback;
/

Update zmarly
set data_pochowku = '27/02/2018', id_kwatery= 109
where id_zmarlego = 118;
rollback;
/

Update adres
set kod_pocztowy = '00-124'
where id_adresu= 1001;
rollback;

/


delete from  region;
delete from  wlasciciel_kwatery;
delete from historyczny_zakup_kwatery;
delete from firma;
delete from  inwestycja;
delete from adres;
delete from cmentarz;
delete from  kierownik;
delete from  kraj;
delete from  kwatera;
delete from  typ_cmentarza;
delete from  typ_kwatery;
delete from  zmarly;

ROLLBACK;
