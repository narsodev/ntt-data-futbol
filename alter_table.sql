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

ALTER TABLE jugador
ADD CONSTRAINT dni_unico_jugador UNIQUE (DNIJug);

ALTER TABLE entrenador
ADD CONSTRAINT dni_unico_entrenador UNIQUE (DNIEnt);

ALTER TABLE ojeador
ADD CONSTRAINT dni_unico_ojeador UNIQUE (DNIOje);
