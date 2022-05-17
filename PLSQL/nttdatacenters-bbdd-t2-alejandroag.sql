/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\
*                                                                     *
*                           IES CAMPANILLAS                           *
*                                                                     *
*   - Alejandro Aguilera García                                       *
*                                                                     *
\* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- Inicio PL/SQL
DECLARE
-- Cursor
CURSOR paises IS SELECT CodEst, PaisEst FROM estadio;

BEGIN

  -- Bucle
  FOR pais IN paises
  LOOP 

    updatePais(pais.CodEst, pais.PaisEst);

  END LOOP;

END;
/
-- Procedimiento
CREATE OR REPLACE   
PROCEDURE updatePais(cod INT, pais VARCHAR)
IS
  -- Declaracion de variables locales
  paiserroneo VARCHAR (40) := 'Espana';
  paisBueno VARCHAR (40) := 'España';
BEGIN

  IF pais LIKE paiserroneo THEN

    UPDATE estadio
      SET estadio.PaisEst = paisBueno
      WHERE estadio.CodEst = cod;

  END IF;

END updatePais;
