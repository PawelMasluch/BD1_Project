/* Zapytania SELECT */

select imie, nazwisko
from cmentarz join kwatera using(id_cmentarza) join zmarly using (id_kwatery)
where id_cmentarza = 101;
/
select miejscowosc
from adres join cmentarz using(id_adresu) join kwatera using (id_cmentarza) join zmarly using(id_kwatery)
where id_zmarlego = 115;
/
SELECT imie,  nazwisko 
FROM kierownik  join cmentarz  using(id_kierownika) join typ_cmentarza  using(id_typu_cmentarza)
WHERE id_typu_cmentarza = 101 ;
/
SELECT *
FROM cmentarz
where godzina_zamkniecia-godzina_otwarcia > 12;
/
SELECT w.imie, w.nazwisko , pesel
FROM wlasciciel_kwatery w join kwatera using(id_wlasciciela) join zmarly  using(id_kwatery)
where id_zmarlego = 120 ;
/
select f.nazwa
from firma f join inwestycja using(id_firmy) join cmentarz using(id_cmentarza)
where id_cmentarza= 101;
/
SELECT DISTINCT(id_typu_kwatery), count(id_kwatery) 
from typ_kwatery join kwatera using(id_typu_kwatery) join cmentarz  using(id_cmentarza)
where id_cmentarza = 103
group by id_typu_kwatery;
/
