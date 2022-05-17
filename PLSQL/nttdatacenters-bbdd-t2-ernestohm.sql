/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\
*                                                                     *
*                           IES CAMPANILLAS                           *
*                                                                     *
*   - Ernesto Hernández Mangas                                        *
*                                                                     *
\* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- Pl/SQL

DECLARE

-- Cursor
CURSOR ligasequipo IS SELECT LigGan, NomEqui FROM equipo;

-- Bucle
BEGIN
    FOR liga IN ligasequipo
    LOOP
        updateLigas(liga.LigGan, liga.NomEqui);
    END LOOP;
END;

-- Procedimiento
CREATE OR REPLACE
PROCEDURE updateLigas(liga INT, v_equipo VARCHAR)
IS
-- Declaracion de variables locales
ligas INT := 0;
BEGIN
    IF liga < 0 THEN
        UPDATE equipo
            SET liga = ligas
            WHERE NomEqui LIKE v_equipo;
    END IF;
END updateLiga;