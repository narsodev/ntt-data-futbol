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

ALTER TABLE jugador
ADD CONSTRAINT dni_format_jugador CHECK DNIJug LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]';

ALTER TABLE entrenador
ADD CONSTRAINT dni_unico_entrenador UNIQUE (DNIEnt);

ALTER TABLE entrenador
ADD CONSTRAINT dni_format_entrenador CHECK DNIEnt LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]';

ALTER TABLE ojeador
ADD CONSTRAINT dni_unico_ojeador UNIQUE (DNIOje);

ALTER TABLE ojeador
ADD CONSTRAINT dni_format_ojeador CHECK DNIOje LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]';