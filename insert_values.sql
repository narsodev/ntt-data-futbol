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
    (1, "Alejandro", "Aguilera", "24353512Z", "Delantero"),
    (2, "Ernesto", "Hernandez", "12342512F", "Portero"),
    (3, "Narciso", "Gonzalez", "24321412T", "Medio-Centro"),
    (4, "Alfonso", "Urbano", "24423412B", "Defensa"),
    (5, "Juan", "Cruz", "12432245A", "Delantero");

-- Insertamos los entrenadores
INSERT INTO entrenador VALUES
    (1, "Pepe", "Ruiz", "24353512Z"),
    (2, "Jose", "Garcia", "12342512F"),
    (3, "Fernando", "Perez", "24321412T");

-- Insertamos los ojeadores
INSERT INTO ojeador VALUES
    (1, "Luis", "Tellez", "24353512Z"),
    (2, "Alejandro", "Montes", "12342512F"),
    (3, "Juan", "Calderon", "24321412T");

-- Insertamos los estadios
INSERT INTO estadio VALUES
    (1, "La rosaleda", "España", "Malaga", 30044),
    (2, "Benito Villamarin", "España", "Sevilla", 60721);

-- Insertamos los equipos
INSERT INTO equipo VALUES
    (1, 1, "Malaga", 0),
    (2, 2, "Betis", 0);

-- Insertamos los contratos de los jugadores