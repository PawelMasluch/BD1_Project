ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";

truncate table adres;
truncate table cmentarz;
truncate table firma;
truncate table historyczny_zakup_kwatery;
truncate table inwestycja ;
truncate table kierownik;
truncate table kraj;
truncate table kwatera;
truncate table region;
truncate table typ_cmentarza;
truncate table typ_kwatery;
truncate table wlasciciel_kwatery;
truncate table zmarly;

/* Firma - kolejnoœæ: ID_firmy, Nazwa, NIP */
INSERT INTO Firma VALUES (1, 'WiœniewskiRemonty',5632900458);
INSERT INTO Firma VALUES (2, 'F.R.G.',1324690382);
commit;

/* Typ_cmentarza - kolejnoœæ: ID_typu_cmentarza, Nazwa */
INSERT INTO Typ_Cmentarza VALUES (101, 'Komunalny');
INSERT INTO Typ_Cmentarza VALUES (102, 'Wojskowy');
INSERT INTO Typ_Cmentarza VALUES (103, 'Wyznaniowy');
commit;

/* Kierownik - kolejnoœæ: ID_kierownika, Imiê, Nazwisko, Numer_telefonu, E-mail */
INSERT INTO Kierownik VALUES (101, 'Bartosz', 'Pawlak', '743009214' , 'bartoszpawlak@gmail.com');
INSERT INTO Kierownik VALUES (102, 'Randall', 'Rogers', '358870767' , 'randalrogers@gmail.com');
INSERT INTO Kierownik VALUES (103, 'Guy', 'Himuro', '7804557458' , 'guyhimuro@gmail.com');
INSERT INTO Kierownik VALUES (104, 'Steven', 'Murgos', '2315125087' , 'steven.murgos@gmail.com');
INSERT INTO Kierownik VALUES (105, 'Ki', 'Bissot', '6790935647' , 'kibissot12@gmail.com');
commit;

/* Typ_kwatery - kolejnoœæ: Id_typu_kwatery, Nazwa, Stawka_roczna, Iloœæ_miejsc */
INSERT INTO typ_kwatery VALUES (101, 'Pojedyncza' , 16, 1);
INSERT INTO typ_kwatery VALUES (102, 'Podwójna' , 30, 2);
INSERT INTO typ_kwatery VALUES (103, 'Poczwórna' , 50, 4);
commit;

/* Region - kolejnoœæ: ID_regionu, Nazwa */
INSERT INTO region VALUES (101, 'EUROPA');
INSERT INTO region VALUES (102, 'AFRYKA');
INSERT INTO region VALUES (103, 'AMERYKA PN');
INSERT INTO region VALUES (104, 'AZJA');
INSERT INTO region VALUES (105, 'AMERYKA PD');
INSERT INTO region VALUES (106, 'AUSTRALIA');
commit;

/* Kraj - kolejnoœæ: ID_kraju, Nazwa, ID_regionu */
INSERT INTO kraj VALUES (101, 'WIELKA BRYTANIA', 101);
INSERT INTO kraj VALUES (102, 'NIEMCY', 101);
INSERT INTO kraj VALUES (103, 'FRANCJA', 101);
INSERT INTO kraj VALUES (104, 'POLSKA', 101);
INSERT INTO kraj VALUES (105, 'CZECHY', 101);
INSERT INTO kraj VALUES (106, 'LITWA', 101);
INSERT INTO kraj VALUES (107, 'UKRAINA', 101);
INSERT INTO kraj VALUES (108, 'SLOWACJA', 101);
INSERT INTO kraj VALUES (109, 'NORWEGIA', 101);
INSERT INTO kraj VALUES (110, 'SZWECJA', 101);
INSERT INTO kraj VALUES (111, 'FINLANDIA', 101);
INSERT INTO kraj VALUES (112, 'RPA', 102);
INSERT INTO kraj VALUES (113, 'EGIPT', 102);
INSERT INTO kraj VALUES (114, 'IRAK', 104);
INSERT INTO kraj VALUES (115, 'USA', 103);
INSERT INTO kraj VALUES (116, 'KANADA', 103);
INSERT INTO kraj VALUES (117, 'BRAZYLIA', 105);
INSERT INTO kraj VALUES (118, 'CHINY', 104);
INSERT INTO kraj VALUES (119, 'JAPONIA', 104);
INSERT INTO kraj VALUES (120, 'KOREA PD', 104);
commit;

/* Adres - kolejnoœæ: ID_adresu, Ulica, Numer, Kod_pocztowy, Miejscowoœæ, ID_kraju */
INSERT INTO adres VALUES (1001, 'Miodowa', 4, '00-123', 'WARSZAWA', 104);
INSERT INTO adres VALUES (1002, 'Koszykowa', 1,  '12-234', 'KRAKOW', 104);
INSERT INTO adres VALUES (1003, 'Oxford Street', 1,  '23AB1', 'LONDYN', 101);
INSERT INTO adres VALUES (1004, 'Spadina Ave', 15,  'm5V 2L7', 'TORONTO', 116);
INSERT INTO adres VALUES (1005, 'Back ST',12, '23A123',  'Sao Paulo' , 117);
INSERT INTO adres VALUES (1006, '2017 Shinjuku-ku', 32, '1689', 'Tokyo', 119);
commit;

/* Cmentarz - kolejnoœæ: ID_cmentarza, Nazwa, Godzina_otwarcia, Godzina_zamkniecia, ID_typu_cmentarza, ID, adresu, ID_kraju, ID_kierownika */
INSERT INTO cmentarz VALUES (101, 'Nowy' , 8, 20 , 101, 1001, 104, 101);
INSERT INTO cmentarz VALUES (102, 'Stary' , 6, 22 , 103, 1002, 104, 101);
INSERT INTO cmentarz VALUES (103, null , 7, 21, 101, 1003, 101, 102);
INSERT INTO cmentarz VALUES (104, null , 6, 21, 102, 1004, 116, 103);
INSERT INTO cmentarz VALUES (105, 'Stary' , 10, 23 , 101, 1005, 117, 104);
INSERT INTO cmentarz VALUES (106, 'Nowy' , 6, 20 , 101, 1006, 119, 105);
commit;

/*Inwestycja - kolejnoœæ: ID_inwestycji, Data_rozpczecia, Data_zakonczenia, Kwota, Opis, ID_cmentarza, ID_firmy */
INSERT INTO Inwestycja VALUES (100001, '01/02/2004', '01/08/2004', 1300000, ' Remont generalny', 101, 1); 
INSERT INTO Inwestycja VALUES (100002, '01/06/2016', '25/06/2016', 120000, ' Wymiana ogrodzenia',102, 2);
commit;

/* Wlasciciel_kwatery - kolejnoœæ: ID_wlasciciela, Imie, Nazwisko, PESEL */
INSERT INTO wlasciciel_kwatery VALUES (101, 'Piotr', 'Maciejewski', 92091398077 );
INSERT INTO wlasciciel_kwatery VALUES (102, 'Piotr', 'Janowski', 50013067812);
INSERT INTO wlasciciel_kwatery VALUES (103, 'Andrzej', 'King', 66121256738 );
INSERT INTO wlasciciel_kwatery VALUES (104, 'Lex', 'Kochhar', 68060894032 );
INSERT INTO wlasciciel_kwatery VALUES (105, 'Alexander', 'Hunold', 4610190925 );
INSERT INTO wlasciciel_kwatery VALUES (106, 'Tracy', 'Hunold', 49110239062);
INSERT INTO wlasciciel_kwatery VALUES (107, 'David', 'Ernst', 73040978991);
INSERT INTO wlasciciel_kwatery VALUES (108, 'Diana', 'Pataballa', 82031597841);
commit;

/* Kwatera - kolejnoœæ: ID_kwatery, Kod_kwatery, Data_zakupu, Liczba_lat_waznosci, ID_typu_kwatery, ID_cmentarza, ID_wlasciciela */
INSERT INTO kwatera VALUES (101, 'ADG4690421', '01/01/2009', 20, 101, 101, 108);
INSERT INTO kwatera VALUES (102, 'YUIO326789', '01/01/2009', 20, 101, 102, 108);
INSERT INTO kwatera VALUES (103, 'CVY7804322', '15/04/2009', 30, 101, 103, 107 );
INSERT INTO kwatera VALUES (104, 'WQP4089785', '20/11/2011', 30, 102, 103, 106);
INSERT INTO kwatera VALUES (105, 'AAS2968409', '14/03/2012', 40, 102, 104, 105);
INSERT INTO kwatera VALUES (106, 'LJP6859032', '14/06/2012', 20, 102, 104, 104);
INSERT INTO kwatera VALUES (107, 'HJJG950493', '01/10/2012', 20, 102, 105, 103);
INSERT INTO kwatera VALUES (108, 'LKY59667-2', '01/01/2013', 50, 102, 105, 102);
INSERT INTO kwatera VALUES (109, 'FGT5670990', '01/01/2013', 50, 103, 106, 101);
commit;

/* Zmarly - kolejnoœæ: ID_zmarlego, Imie, Nazwisko, Data_urodzenia, Data_smierci, Data_pochowku, ID_kwatery */
INSERT INTO zmarly VALUES (111, 'Daniel', 'Greenberg', '11/11/1936', '11/05/2015', '16/05/2015', 101);
INSERT INTO zmarly VALUES (112, 'John', 'Faviet', '09/06/1937',  '09/11/2015', '11/11/2015', 102);
INSERT INTO zmarly VALUES (113, 'Ismael', 'Chen', '06/11/1948',  '08/11/2014', '11/11/2014', 103);
INSERT INTO zmarly VALUES (114, 'Jose Manuel', 'Sciarra', '02/01/1951', '11/06/2016', '11/06/2016', 104);
INSERT INTO zmarly VALUES (115, 'Luis', 'Urman', '31/12/1959', '10/05/2017', '14/05/2017', 104);
INSERT INTO zmarly VALUES (116, 'Luis', 'Popp', '04/10/1948','12/12/2017', '18/12/2017', 105);
INSERT INTO zmarly VALUES (117, 'Den', 'Raphaely', '07/05/1927', '20/01/2015', '22/01/2015', 106);
INSERT INTO zmarly VALUES (118, 'Alex', 'Khoo', '10/10/1930', '20/02/2018', '25/02/2018', 107);
INSERT INTO zmarly VALUES (119, 'Shelli', 'Baida', '12/08/1931', '15/09/2019', '20/09/2019', 108);
INSERT INTO zmarly VALUES (120, 'Sigal', 'Tobias', '01/03/1930', '21/07/2019', '22/07/2019', 109);
commit;

/* HISTORYCZNY_ZAKUP_KWATERY - kolejnoœæ: ID_zakupu, Data_zakupu, Data_Zakonczenia, ID_wlasciciela, ID_kwatery */
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (101, '01/01/2013', '01/01/2063', 101, 109);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (102, '01/01/2013', '01/01/2063', 102 ,108);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (103, '01/10/2012', '01/10/2032', 103, 107);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (104, '01/01/1991', '01/01/2011', 103,  107);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (105, '14/06/2012', '14/06/2032', 104, 106);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (106, '14/03/2012', '14/03/2052', 105, 105);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (107, '20/11/2011', '20/11/2041' , 106, 104);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (108, '15/04/2009', '15/04/2039', 107, 103);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (109, '01/01/2009', '01/01/2029', 108, 102);
INSERT INTO HISTORYCZNY_ZAKUP_KWATERY VALUES (110, '01/01/2009', '01/01/2029', 108, 101);
commit;