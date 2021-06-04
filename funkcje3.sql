ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";


/* Funkcja zliczajaca liczbe historycznych zakupow kwater w ramach danego cmentarza */
CREATE OR REPLACE FUNCTION ile_zakupow_kwater(p_id NUMBER)
RETURN NUMBER
AS
ile_zakupow_kwater NUMBER := 0;
BEGIN
SELECT COUNT(DISTINCT id_zakupu ) INTO ile_zakupow_kwater
FROM historyczny_zakup_kwatery INNER JOIN kwatera USING (id_kwatery) INNER JOIN cmentarz USING (id_cmentarza)
WHERE id_cmentarza = p_id;

RETURN ile_zakupow_kwater;
END;

/

SELECT ile_zakupow_kwater(105)
FROM DUAL;

/




/* WYZWALACZ SPRAWDZA CZY DATA ZAKONCZENIA INWESTYCJI JEST WIEKSZA BADZ ROWNA DACIE ROZPOCZECIA INWESTYCJI */

CREATE OR REPLACE TRIGGER poprawnosc_daty_inwestycji
BEFORE INSERT or update of data_zakonczenia ON inwestycja FOR EACH ROW
DECLARE
v_data_rozpoczecia DATE;
v_data_zakonczenia DATE;
BEGIN
SELECT data_rozpoczecia, data_zakonczenia INTO v_data_rozpoczecia, v_data_zakonczenia
FROM inwestycja WHERE id_inwestycji = :new.id_inwestycji ;

IF v_data_zakonczenia < v_data_rozpoczecia THEN 
        dbms_output.put_line('Data zakonczenia inwestycji wypada wczesniej niz data rozpoczecia inwestycji');
        raise_application_error(-20001, 'Wprowadzoono bledna date');
    END IF;
END;

/

INSERT INTO inwestycja VALUES ( 100003, '01/01/2003' , '01/01/2004' , 10, 'XYZ', 103, 1);
ROLLBACK;

/


/* Funkcja obliczajaca dlugosc zycia zmarlego (w latach) */
CREATE OR REPLACE FUNCTION ile_kto_pozyl(p_id NUMBER)
RETURN NUMBER
AS
v_ile_kto_pozyl NUMBER := 0;
v_data_urodzenia date;
v_data_smierci date ;
BEGIN
select data_urodzenia, data_smierci into v_data_urodzenia, v_data_smierci
from zmarly
where id_zmarlego = p_id;

v_ile_kto_pozyl := round( (v_data_smierci - v_data_urodzenia)/365 ) ;
return  v_ile_kto_pozyl;

END;

/

select ile_kto_pozyl(112)
from dual;