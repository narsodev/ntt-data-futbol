/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\
*                                                                     *
*                           IES CAMPANILLAS                           *
*                                                                     *
*   - Alejandro Aguilera García                                       *
*   - Narciso Gonzalez Calderón                                       *
*   - Ernesto Hernandez Mangas                                        *
*   - Alfonso Urbano Ruz                                              *
*                                                                     *
\* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-----------------------
-- Consultas Simples --
-----------------------

-- Consultar estadios de la ciudad 'Málaga'
SELECT *
FROM estadio
WHERE CiuEst LIKE 'Málaga';

-- Consultar estadios de la ciudad 'Málaga' o 'Sevilla'
SELECT *
FROM estadio
WHERE
  CiuEst LIKE 'Málaga' OR
  CiuEst LIKE 'Sevilla';

-- Obtener numero de jugadores que juegan de porteros
SELECT COUNT(CodJug) AS "Número de porteros"
FROM jugador
WHERE PosJug LIKE 'Portero';

 -- Obtener el máximo numero de ligas ganadas por un equipo y el equipo que las ha ganado
SELECT NomEqui, LigGan
FROM equipo
ORDER BY 2 DESC
FETCH FIRST 1 ROWS ONLY;

 --Obtener el codigo de los partidos que han tenido ganador (no empate)
SELECT CodPar
FROM partido
WHERE ResPar NOT LIKE 'X';

----------------------------------
-- Consultas Medias / Complejas --
----------------------------------

-- Cantidad de estadios por ciudad (Mas de un estadio)
SELECT CiuEst AS "Ciudad", COUNT(CodEst) AS "Número de estadios"
FROM estadio
GROUP BY CiuEst
HAVING COUNT(CodEst) > 1;

-- Cantidad de goles por jugador (jugadores sin gol también aparecen)
SELECT jugador.NomJug AS "Jugador", COUNT(gol.CodGol) AS "Goles"
FROM jugador LEFT JOIN gol
  ON jugador.CodJug = gol.CodJug
GROUP BY jugador.NomJug;

-- Cantidad de jugadores por equipo (todos los equipos)
SELECT equipo.NomEqui AS "Equipo", COUNT(contrato_jugador.CodJug) AS "Jugadores"
FROM contrato_jugador RIGHT JOIN equipo
  ON equipo.CodEqui = contrato_jugador.CodEqui
GROUP BY equipo.NomEqui;

-- Obtener al ojeador Luis Tellez y su sueldo
SELECT ojeador.NomOje AS "Nombre", ojeador.ApeOje AS "Apellidos", contrato_ojeador.SalOje AS "Sueldo"
FROM ojeador INNER JOIN contrato_ojeador
  ON ojeador.NomOje LIKE 'Luis' AND
  ojeador.ApeOje LIKE 'Tellez' AND
  ojeador.CodOje = contrato_ojeador.CodOje;
