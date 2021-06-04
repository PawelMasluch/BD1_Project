ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";


/* Dodanie rekordu do tabeli Historyczny_zakup_kwatery, o ile zmienia siê wlasciciel kwatery */
CREATE OR REPLACE PROCEDURE zmien_wlasciciela_kwatery(p_id_zakupu NUMBER, p_id_kwatery NUMBER, p_id_wlasciciela NUMBER, p_data_zakupu DATE, p_data_zakonczenia DATE := NULL) 
AS
v_id NUMBER;
BEGIN
    INSERT INTO historyczny_zakup_kwatery(id_zakupu, data_zakupu, data_zakonczenia, id_kwatery, id_wlasciciela)
    VALUES (p_id_zakupu, p_data_zakupu, p_data_zakonczenia, p_id_kwatery, p_id_wlasciciela);
    
    UPDATE kwatera SET id_wlasciciela = p_id_wlasciciela, data_zakupu = p_data_zakupu, liczba_lat_waznosci = p_data_zakonczenia - p_data_zakupu
    WHERE id_kwatery = p_id_kwatery;
END;
/



begin
    zmien_wlasciciela_kwatery( 140, 109, 101, '15/12/2004', '06/12/2007' );
    rollback;
end;


/






/* Funkcja zwracajaca liczba roznych wlascicieli kwater w ramach cmentarzy z danego kraju  */
CREATE OR REPLACE FUNCTION liczba_wlascicieli_w_kraju(p_id NUMBER) 
RETURN NUMBER 
AS 
  v_liczba_wlascicieli NUMBER := 0;
BEGIN 
    SELECT COUNT(DISTINCT id_wlasciciela) INTO v_liczba_wlascicieli
    FROM kraj LEFT JOIN cmentarz USING (id_kraju) LEFT JOIN kwatera USING (id_cmentarza)
    WHERE id_kraju = p_id;
    
    RETURN v_liczba_wlascicieli; 
END;
/

select liczba_wlascicieli_w_kraju(101)
from dual;
/


