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
INSERT INTO jugador VALUES
    (1, 'Alejandro', 'Aguilera', '24353512Z', 'Delantero'),
    (2, 'Ernesto', 'Hernandez', '12342512F', 'Portero'),
    (3, 'Narciso', 'Gonzalez', '24321412T', 'Medio-Centro'),
    (4, 'Alfonso', 'Urbano', '24423412B', 'Defensa'),
    (5, 'Juan', 'Cruz', '12432245A', 'Delantero');

-- Insertamos los entrenadores
INSERT INTO entrenador VALUES
    (1, 'Pepe', 'Ruiz', '24353512Z'),
    (2, 'Jose', 'Garcia', '12342512F'),
    (3, 'Fernando', 'Perez', '24321412T');

-- Insertamos los ojeadores
INSERT INTO ojeador VALUES
    (1, 'Luis', 'Tellez', '24353512Z'),
    (2, 'Alejandro', 'Montes', '12342512F'),
    (3, 'Juan', 'Calderon', '24321412T');

-- Insertamos los estadios
INSERT INTO estadio VALUES
    (1, 'La rosaleda', 'España', 'Malaga', 30044),
    (2, 'Benito Villamarin', 'España', 'Sevilla', 60721);

-- Insertamos los equipos
INSERT INTO equipo VALUES
    (1, 1, 'Malaga', 0),
    (2, 2, 'Betis', 0);

-- Insertamos los contratos de los jugadores
INSERT INTO contrato_jugador VALUES
    (1, 1, 1, 10000, 2022-12-31 23:59:59.10, 2024-12-31 23:59:59.10, 100),
    (2, 2, 2, 10000, 2022-12-31 23:59:59.10, 2024-12-31 23:59:59.10, 100),
    (3, 1, 3, 10000, 2022-12-31 23:59:59.10, 2024-12-31 23:59:59.10, 100),
    (4, 2, 4, 10000, 2022-12-31 23:59:59.10, 2024-12-31 23:59:59.10, 100),
    (5, 1, 5, 10000, 2022-12-31 23:59:59.10, 2024-12-31 23:59:59.10, 100);

-- Insertamos los contratos de los entrenadores
INSERT INTO contrato_entrenador VALUES
    (1, 1, 1, 1000, 2022-12-31 23:59:59.10, 2024-12-31 23:59:59.10, 10),
    (2, 2, 2, 1000, 2022-12-31 23:59:59.10, 2024-12-31 23:59:59.10, 10),
    (3, 1, 3, 1000, 2022-12-31 23:59:59.10, 2024-12-31 23:59:59.10, 10);

-- Insertamos los contratos de los ojeadores
INSERT INTO contrato_ojeador VALUES
    (1, 1, 1, 100, 2022-12-31 23:59:59.10, 2024-12-31 23:59:59.10,),
    (2, 2, 2, 100, 2022-12-31 23:59:59.10, 2024-12-31 23:59:59.10,),
    (3, 1, 3, 100, 2022-12-31 23:59:59.10, 2024-12-31 23:59:59.10,);

-- Insertamos los partidos
INSERT INTO partido VALUES
    (1, 1, 2, 1, 1, 2023-01-07 20:00:00.00, 'X'),
    (2, 2, 1, 2, 2, 2023-01-13 20:00:00.00, '2');

-- Insertamos jugador_partido
INSERT INTO jugador_partido VALUES
    (4, 2, 0, 90),
    (2, 2, 0, 90);

-- Insertamos los goles
INSERT INTO gol VALUES
    (1, 2, 1, 2, 4, 2, 40, 1),
    (2, 2, 1, 4, 2, 2, 42, 1);

-- Insertamos ojeador_partido
INSERT INTO ojeador_partido VALUES
    (1, 2),
    (2, 1);
