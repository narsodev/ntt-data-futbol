/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\
*                                                                     *
*                           IES CAMPANILLAS                           *
*                                                                     *
*   - Narciso González Calderón                                       *
*                                                                     *
\* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/*
 * PL/SQL que modifica el valor del resultado de los partidos;
 *   Modifica el valor 'x' a 'X'
 *   Modifica los valores sin sentido a '?'
*/
-- Variables
DECLARE
-- Variable para almacenar el resultado de la función
correctValue CHAR;
-- Cursor para recorrer la tabla resultados
CURSOR resultados IS SELECT CodPar, ResPar FROM partido;

BEGIN
  -- Recorremos la tabla resultados
  FOR resultado IN resultados
  LOOP
    -- Comprobamos si el resultado es correcto
    correctValue := getCorrectValue(resultado.ResPar);
    IF resultado.ResPar != correctValue THEN
      -- Si no es correcto, actualizamos el resultado
      UPDATE partido
      SET ResPar = correctValue
      WHERE partido.CodPar = resultado.CodPar;
      -- Commit para guardar el cambio
      COMMIT;
    END IF;
  END LOOP;
END;

/

-- Función que devuelve el resultado correcto
CREATE OR REPLACE
FUNCTION getCorrectValue(resultado CHAR) RETURN CHAR
IS
  -- Variable para almacenar el valor correcto
  correctValue CHAR;
BEGIN
  -- Comprobamos el resultado y asignamos su valor correcto
  IF resultado = 'x' THEN
    correctValue := 'X';
  ELSIF resultado NOT IN ('1', 'X', '2') THEN
    correctValue := '?';
  ELSE
    correctValue := resultado;
  END IF;

  -- Devolvemos el valor correcto
  RETURN correctValue;
END getCorrectValue;

