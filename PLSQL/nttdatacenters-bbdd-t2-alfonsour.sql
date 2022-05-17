-- Pl/SQL
--Mostrar Los estadios de los equipos con mas de 4 ligas y si tiene 5, 
--aumentar la capacidad el doble.

-- Declaracion de variables
DECLARE
 
-- Cursor

    CURSOR estadios_equipos is 
    SELECT NomEst, CapacEst, LigGan FROM estadio Es, equipo E
    WHERE ES.CodEst = E.CodEst
    AND E.LigGan > 2;


BEGIN
    for registro in estadios_equipos loop

        dbms_output.put_line(registro.NomEst);
        updateCapacidad(registro.CapacEst, registro.LigGan, registro.NomEst);

    end loop;
end;

-- Procedimiento
CREATE OR REPLACE
PROCEDURE UpdateCapacidad (v_capacidad INT, v_LigGan INT, v_NomEst VARCHAR)
IS
BEGIN
    IF  v_LigGan = 5 THEN
        UPDATE estadio 
            SET CapacEst *= 2
            WHERE;
    END IF;
END;