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
SELECT FROM bbbfutbol.estadio WHERE CiuEst LIKE 'Málaga';

-- Consultar estadios de la ciudad 'Málaga' o 'Sevilla'
SELECT FROM bbbfutbol.estadio WHERE CiuEst LIKE 'Málaga' OR CiuEst LIKE 'Sevilla';

-- Obtener numero de jugadores que juego de porteros
 SELECT COUNT(CodJug) FROM bbddfutbol.jugador WHERE PosJug LIKE 'Portero';

 -- Obtener el máximo numero de ligas ganadas por un equipo y el equipo que las ha ganado
 SELECT NomEqui, MAX(LigGan) FROM bbddfutbol.equipo;

 --Obtener el codigo de los partidos que han tenido ganador (no empate)
 SELECT CodPar FROM bbddfutbol.partido WHERE ResPar NOT LIKE 'X';

----------------------------------
-- Consultas Medias / Complejas --
----------------------------------

-- Cantidad de estadios por ciudad (Mas de un estadio)
SELECT CiuEst AS Ciudad, COUNT(CodEst) AS CantidadEstadios
FROM bbddfutbol.estadio
GROUP BY CiuEst
HAVING CantidadEstadios > 1;

-- Cantidad de goles por jugador (jugadores sin gol también aparecen)
SELECT jugador.NomJug AS Jugador, COUNT(gol.CodGol) AS Goles
FROM jugador LEFT JOIN gol ON jugador.CodJug = gol.CodJug
GROUP BY gol.CodJug;

-- Cantidad de jugadores por equipo (todos los equipos)
SELECT equipo.NomEqui AS NombreEquipo, COUNT(contrato_jugador.CodJug) AS Jugadores
FROM contrato_jugador RIGHT JOIN equipo ON equipo.CodEqui = contrato_jugador.CodEqui
GROUP BY contrato_jugador.CodEqui;

-- Obtener al ojeador Luis Tellez y su sueldo
SELECT ojeador.NomOje, contrato_ojeador.SalOje
FROM ojeador INNER JOIN contrato_ojeador ON ojeador.CodOje = contrato_ojeador.CodOje
