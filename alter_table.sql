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

-- Hacer que el dni del jugador sea único
ALTER TABLE jugador
ADD CONSTRAINT dni_unico_jugador UNIQUE (DNIJug);

-- Hacer que el dni del entrenador sea único
ALTER TABLE entrenador
ADD CONSTRAINT dni_unico_entrenador UNIQUE (DNIEnt);

-- Hacer que el dni del ojeador sea único
ALTER TABLE ojeador
ADD CONSTRAINT dni_unico_ojeador UNIQUE (DNIOje);
