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

-- Obtener los estadios y su capacidad de la ciudad 'Sevilla'
SELECT NomEst AS "Estadio", CapacEst AS "Capacidad"
FROM estadio
WHERE CiuEst LIKE 'Sevilla';

-- Obtener nombre, apellidos y DNI de los entrenadores
SELECT NomEnt AS "Nombre", ApeEnt "Apellidos", DNIEnt AS "DNI"
FROM entrenador;

-- Obtener número de jugadores que juegan de porteros
SELECT COUNT(CodJug) AS "Número de porteros"
FROM jugador
WHERE PosJug LIKE 'Portero';

-- Obtener el equipo con más ligas y el número de ligas que ganó
SELECT NomEqui AS "Equipo", LigGan "Ligas ganadas"
FROM equipo
ORDER BY 2 DESC
FETCH FIRST 1 ROWS ONLY;

-- Obtener el código de los partidos en los que no hubo empate
SELECT CodPar
FROM partido
WHERE ResPar NOT LIKE 'X';

----------------------------------
-- Consultas Medias / Complejas --
----------------------------------

-- Obtener número de estadios por ciudad (mínimo 1)
SELECT CiuEst AS "Ciudad", COUNT(CodEst) AS "Número de estadios"
FROM estadio
GROUP BY CiuEst
HAVING COUNT(CodEst) > 1;

-- Obtener número de goles por jugador (jugadores sin goles también aparecen)
SELECT NomJug AS "Jugador", ApeJug AS "Apellidos", COUNT(CodGol) AS "Goles"
FROM jugador LEFT JOIN gol
  ON jugador.CodJug = gol.CodJug
GROUP BY NomJug, ApeJug;

-- Obtener número de jugadores por equipo
SELECT NomEqui AS "Equipo", COUNT(CodJug) AS "Número de jugadores"
FROM contrato_jugador RIGHT JOIN equipo
  ON equipo.CodEqui = contrato_jugador.CodEqui
GROUP BY NomEqui;

-- Obtener al ojeador Alejandro Tellez y su salario
SELECT NomOje AS "Nombre", ApeOje AS "Apellidos", SalOje AS "Salario"
FROM ojeador INNER JOIN contrato_ojeador
  ON ojeador.NomOje LIKE 'Alejandro' AND
  ojeador.ApeOje LIKE 'Tellez' AND
  ojeador.CodOje = contrato_ojeador.CodOje;
