ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";



/* Wyzwalacz sprawdzaj¹cy, czy próbujemy dodaæ zmar³¹ osobê do aktualnie pe³nej kwatery */

DROP TRIGGER trig_pelna_kwatera;

CREATE OR REPLACE TRIGGER trig_pelna_kwatera
BEFORE INSERT or UPDATE OF id_kwatery ON zmarly FOR EACH ROW
DECLARE 
    liczba_dostepnych_miejsc /*typ_kwatery.ilosc_miejsc%TYPE*/ NUMBER;
    liczba_zajetych_miejsc NUMBER;
BEGIN

    -- liczba_dostepnych_miejsc
    SELECT distinct typ_kw.ilosc_miejsc into liczba_dostepnych_miejsc
    FROM zmarly zm left join kwatera kw on (:new.id_kwatery=kw.id_kwatery) left join typ_kwatery typ_kw on (kw.id_typu_kwatery=typ_kw.id_typu_kwatery);
    dbms_output.put_line( 'Liczba dostêpnych miejsc w kwaterze' || ' ' || :new.id_kwatery || ' ' || 'wynosi' || ' ' || liczba_dostepnych_miejsc || '.' );
    
    -- liczba_zajetych_miejsc
    SELECT count(*) into liczba_zajetych_miejsc
    FROM zmarly zm
    WHERE id_kwatery = :new.id_kwatery;
    dbms_output.put_line( 'Liczba aktualnie zajêtych miejsc w kwaterze ' || :new.id_kwatery || ' wynosi ' || liczba_zajetych_miejsc || '.' );
    
    IF liczba_zajetych_miejsc = liczba_dostepnych_miejsc THEN 
        dbms_output.put_line('Kwatera o identyfikatorze równym ' || :new.id_kwatery || ' ' || 'jest zajêta!');
        raise_application_error(-20001, 'Aktualnie pelna kwatera');
    
    END IF;
    
END;

/

/* Pojawi siê blad */
INSERT INTO zmarly VALUES (121, 'Adam', 'Nowak', '31/12/1929', '19/09/2018', '24/09/2018', 104);
rollback;
/

/* Poprawne wykonanie */
INSERT INTO zmarly VALUES (121, 'Adam', 'Nowak', '31/12/1929', '19/09/2018', '24/09/2018', 109);
rollback;

/

UPDATE zmarly SET id_kwatery=105 where id_zmarlego=114;



/



/* Prodedura próbujaca dodac rekord do tabeli Historyczny_zakup_kwatery, o ile nie "nachodzi siê" z innym rekordem w czasie. Uzycie kursora. */

CREATE OR REPLACE PROCEDURE coherent_history (start_buy DATE, end_buy DATE, owner_id NUMBER, kwatera_id NUMBER)
AS 
    v_id_zakupu NUMBER;
    v_czy_dobre_dane NUMBER := 1;
    v_zly_rekord NUMBER := -1;
    v_min_date DATE;
    v_max_date DATE;
BEGIN
    
    -- v_id_zakupu
    select max(id_zakupu) into v_id_zakupu 
    from historyczny_zakup_kwatery;
    
    v_id_zakupu := v_id_zakupu + 1;
    
    
    FOR r_hist IN (select id_zakupu, data_zakupu, data_zakonczenia
                    from historyczny_zakup_kwatery
                    where id_kwatery = kwatera_id)
    LOOP
        
        IF r_hist.data_zakupu > start_buy THEN
            v_max_date := r_hist.data_zakupu;
        ELSE v_max_date := start_buy;
        END IF;
        
        
        
        IF r_hist.data_zakonczenia < end_buy THEN
            v_min_date := r_hist.data_zakonczenia;
        ELSE v_min_date := end_buy;
        END IF;
    
    
        IF v_max_date < v_min_date then
            v_czy_dobre_dane := 0;
            v_zly_rekord := r_hist.id_zakupu;
        end if;
    END LOOP;
    
    if v_czy_dobre_dane = 1 then
        INSERT into historyczny_zakup_kwatery values(v_id_zakupu, start_buy, end_buy, owner_id, kwatera_id);
        commit;
    else
        dbms_output.put_line ('Dane nie sa poprawne - daty nachodza sie z datami z rekordu o id_zakupu = ' || v_zly_rekord);
    end if;
END;


/

begin
    coherent_history ('01/01/2015', '01/01/2050', 101, 109);
    rollback;
end;







