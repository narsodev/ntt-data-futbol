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

-- Insertamos los jugadores
INSERT ALL
  INTO jugador VALUES(1, 'Alejandro', 'Aguilera', '24353512Z', 'Delantero')
  INTO jugador VALUES(2, 'Ernesto', 'Hernández', '12342512F', 'Portero')
  INTO jugador VALUES(3, 'Narciso', 'González', '24321412T', 'Medio-Centro')
  INTO jugador VALUES(4, 'Alfonso', 'Urbano', '24423412B', 'Defensa')
  INTO jugador VALUES(5, 'Juan', 'Cruz', '12432245A', 'Delantero')
SELECT 1 FROM DUAL;

-- Insertamos los entrenadores
INSERT ALL
  INTO entrenador VALUES(1, 'Pepe', 'Ruiz', '24353512Z')
  INTO entrenador VALUES(2, 'José', 'García', '12342512F')
  INTO entrenador VALUES(3, 'Fernando', 'Pérez', '24321412T')
SELECT 1 FROM DUAL;

-- Insertamos los ojeadores
INSERT ALL
  INTO ojeador VALUES(1, 'Alejandro', 'Tellez', '24353512Z')
  INTO ojeador VALUES(2, 'Alejandro', 'Montes', '12342512F')
  INTO ojeador VALUES(3, 'Juan', 'Calderón', '24321412T')
SELECT 1 FROM DUAL;

-- Insertamos los estadios
INSERT ALL
  INTO estadio VALUES(1, 'Ramón Sánchez-Pizjuán', 'España', 'Sevilla', 30044)
  INTO estadio VALUES(2, 'Benito Villamarín', 'España', 'Sevilla', 60721)
SELECT 1 FROM DUAL;

-- Insertamos los equipos
INSERT ALL
  INTO equipo VALUES(1, 1, 'Sevilla FC', 3)
  INTO equipo VALUES(2, 2, 'Real Betis Balompié', 1)
SELECT 1 FROM DUAL;

-- Insertamos los contratos de los jugadores
INSERT ALL
  INTO contrato_jugador VALUES(1, 1, 1, 10000, TO_TIMESTAMP('2022-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2024-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), 100)
  INTO contrato_jugador VALUES(2, 2, 2, 10000, TO_TIMESTAMP('2022-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2024-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), 100)
  INTO contrato_jugador VALUES(3, 1, 3, 10000, TO_TIMESTAMP('2022-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2024-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), 100)
  INTO contrato_jugador VALUES(4, 2, 4, 10000, TO_TIMESTAMP('2022-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2024-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), 100)
  INTO contrato_jugador VALUES(5, 1, 5, 10000, TO_TIMESTAMP('2022-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2024-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), 100)
SELECT 1 FROM DUAL;

-- Insertamos los contratos de los entrenadores
INSERT ALL
  INTO contrato_entrenador VALUES(1, 1, 1, 1000, TO_TIMESTAMP('2022-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2024-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), 10)
  INTO contrato_entrenador VALUES(2, 2, 2, 1000, TO_TIMESTAMP('2022-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2024-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), 10)
  INTO contrato_entrenador VALUES(3, 1, 3, 1000, TO_TIMESTAMP('2022-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2024-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), 10)
SELECT 1 FROM DUAL;

-- Insertamos los contratos de los ojeadores
INSERT ALL
  INTO contrato_ojeador VALUES(1, 1, 1, 150, TO_TIMESTAMP('2022-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2024-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'))
  INTO contrato_ojeador VALUES(2, 2, 2, 100, TO_TIMESTAMP('2022-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2024-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'))
  INTO contrato_ojeador VALUES(3, 1, 3, 100, TO_TIMESTAMP('2022-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2024-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF'))
SELECT 1 FROM DUAL;

-- Insertamos los partidos
INSERT ALL
  INTO partido VALUES(1, 1, 2, 1, 1, TO_TIMESTAMP('2023-01-07 20:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'X')
  INTO partido VALUES(2, 2, 1, 2, 2, TO_TIMESTAMP('2023-01-13 20:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), '2')
SELECT 1 FROM DUAL;

-- Insertamos jugador_partido
INSERT ALL
  INTO jugador_partido VALUES(4, 2, 0, 90)
  INTO jugador_partido VALUES(2, 2, 0, 90)
SELECT 1 FROM DUAL;

-- Insertamos los goles
INSERT ALL
  INTO gol VALUES(1, 2, 1, 2, 4, 2, 40, 1)
  INTO gol VALUES(2, 2, 1, 4, 2, 2, 42, 1)
SELECT 1 FROM DUAL;

-- Insertamos ojeador_partido
INSERT ALL
  INTO ojeador_partido VALUES(1, 2)
  INTO ojeador_partido VALUES(2, 1)
SELECT 1 FROM DUAL;
