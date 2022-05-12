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

-- Consultas Simples

-- Consultar estadios de la ciudad 'Málaga'
SELECT FROM bbbfutbol.estadio WHERE CiuEst LIKE 'Málaga';

-- Consultar estadios de la ciudad 'Málaga' o 'Sevilla'
SELECT FROM bbbfutbol.estadio WHERE CiuEst LIKE 'Málaga' OR CiuEst LIKE 'Sevilla';

-- Obtener numero de jugadores que juego de porteros
 SELECT COUNT(CodJug) FROM jugador WHERE PosJug LIKE 'Portero';

 -- Obtener el máximo numero de ligas ganadas por un equipo y el equipo que las ha ganado
 SELECT NomEqui, MAX(LigGan) FROM equipo;

 --Obtener el codigo de los partidos que han tenido ganador (no empate)
 SELECT CodPar FROM partido WHERE ResPar NOT LIKE 'X';