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

CREATE TABLE jugador -- Jugador
(
  CodJug INT NOT NULL, -- PK del jugador
  NomJug VARCHAR(40) NOT NULL, -- Nombre del jugador
  ApeJug VARCHAR(40) NOT NULL, -- Apellidos del jugador
  DNIJug CHAR(9) NOT NULL, -- DNI del jugador
  PosJug VARCHAR(50) NOT NULL, -- Posición del jugador
  PRIMARY KEY (CodJug)
);

COMMENT ON TABLE jugador IS 'Tabla de jugadores';
COMMENT ON COLUMN jugador.CodJug IS 'Primary key del jugador';
COMMENT ON COLUMN jugador.NomJug IS 'Nombre del jugador';
COMMENT ON COLUMN jugador.ApeJug IS 'Apellidos del jugador';
COMMENT ON COLUMN jugador.DNIJug IS 'DNI del jugador';
COMMENT ON COLUMN jugador.PosJug IS 'Posición del jugador';

CREATE TABLE entrenador -- Entrenador
(
  CodEnt INT NOT NULL, -- PK del entrenador
  NomEnt VARCHAR(40) NOT NULL, -- Nombre del entrenador
  ApeEnt VARCHAR(40) NOT NULL, -- Apellidos del entrenador
  DNIEnt CHAR(9) NOT NULL, -- DNI del entrenador
  PRIMARY KEY (CodEnt)
);

COMMENT ON TABLE entrenador IS 'Tabla de entrenadores';
COMMENT ON COLUMN entrenador.CodEnt IS 'Primary key del entrenador';
COMMENT ON COLUMN entrenador.NomEnt IS 'Nombre del entrenador';
COMMENT ON COLUMN entrenador.ApeEnt IS 'Apellidos del entrenador';
COMMENT ON COLUMN entrenador.DNIEnt IS 'DNI del entrenador';

CREATE TABLE ojeador -- Ojeador
(
  CodOje INT NOT NULL, -- PK del ojeador
  NomOje VARCHAR(40) NOT NULL, -- Nombre del ojeador
  ApeOje VARCHAR(40) NOT NULL, -- Apellidos del ojeador
  DNIOje CHAR(9) NOT NULL, -- DNI del ojeador
  PRIMARY KEY (CodOje)
);

COMMENT ON TABLE ojeador IS 'Tabla de ojeadores';
COMMENT ON COLUMN ojeador.CodOje IS 'Primary key del ojeador';
COMMENT ON COLUMN ojeador.NomOje IS 'Nombre del ojeador';
COMMENT ON COLUMN ojeador.ApeOje IS 'Apellidos del ojeador';
COMMENT ON COLUMN ojeador.DNIOje IS 'DNI del ojeador';

CREATE TABLE estadio -- Estadio
(
  CodEst INT NOT NULL, -- PK del estadio
  NomEst VARCHAR(40) NOT NULL, -- Nombre del estadio
  PaisEst VARCHAR(40) NOT NULL, -- País en el que se encuentra el estadio
  CiuEst VARCHAR(40) NOT NULL, -- Ciudad en la que se encuentra el estadio
  CapacEst INT NOT NULL, -- Capacidad del estadio
  PRIMARY KEY (CodEst)
);

COMMENT ON TABLE estadio IS 'Tabla de estadios';
COMMENT ON COLUMN estadio.CodEst IS 'Primary key del estadio';
COMMENT ON COLUMN estadio.NomEst IS 'Nombre del estadio';
COMMENT ON COLUMN estadio.PaisEst IS 'País en el que se encuentra el estadio';
COMMENT ON COLUMN estadio.CiuEst IS 'Ciudad en la que se encuentra el estadio';
COMMENT ON COLUMN estadio.CapacEst IS 'Capacidad del estadio';

CREATE TABLE equipo -- Equipo
(
  CodEqui INT NOT NULL, -- PK del equipo
  CodEst INT NOT NULL, -- FK del estadio
  NomEqui VARCHAR(40) NOT NULL, -- Nombre del equipo
  LigGan INT NOT NULL, -- Campeonatos de Liga ganados por el equipo
  PRIMARY KEY (CodEqui),
  FOREIGN KEY (CodEst) REFERENCES estadio(CodEst)
);

COMMENT ON TABLE equipo IS 'Tabla de equipos';
COMMENT ON COLUMN equipo.CodEqui IS 'Primary key del equipo';
COMMENT ON COLUMN equipo.CodEst IS 'Foreign Key del estadio asociado';
COMMENT ON COLUMN equipo.NomEqui IS 'Nombre del equipo';
COMMENT ON COLUMN equipo.LigGan IS 'Campeonatos de Liga ganados por el equipo';

CREATE TABLE partido -- Partido
(
  CodPar INT NOT NULL, -- PK del partido
  CodEquiLoc INT NOT NULL,  -- FK del equipo local
  CodEquiVis INT NOT NULL, -- FK del equipo visitante
  CodJugMVP INT NOT NULL, -- FK del jugador MVP
  CodEst INT NOT NULL, -- FK del estadio en el que se jugó el partido
  FecPar TIMESTAMP NOT NULL, -- Fecha en la que se disputó el partido
  ResPar CHAR(1) NOT NULL, -- Resultado del partido (Quiniela: 1 - x - 2)
  PRIMARY KEY (CodPar),
  CONSTRAINT FK_CodEquiLoc FOREIGN KEY (CodEquiLoc)
    REFERENCES equipo(CodEqui)
    ON DELETE CASCADE,
  CONSTRAINT FK_CodEquiVis FOREIGN KEY (CodEquiVis)
    REFERENCES equipo(CodEqui)
    ON DELETE CASCADE,
  CONSTRAINT FK_CodJugMVP FOREIGN KEY (CodJugMVP)
    REFERENCES jugador(CodJug)
    ON DELETE CASCADE,
  CONSTRAINT FK_CodEst FOREIGN KEY (CodEst)
    REFERENCES estadio(CodEst)
    ON DELETE CASCADE
);

COMMENT ON TABLE partido IS 'Tabla de partidos';
COMMENT ON COLUMN partido.CodPar IS 'Primary key del partido';
COMMENT ON COLUMN partido.CodEquiLoc IS 'Foreign Key del equipo local';
COMMENT ON COLUMN partido.CodEquiVis IS 'Foreign Key del equipo visitante';
COMMENT ON COLUMN partido.CodJugMVP IS 'Foreign Key del jugador MVP';
COMMENT ON COLUMN partido.CodEst IS 'Foreign Key del estadio en el que se jugó el partido';
COMMENT ON COLUMN partido.FecPar IS 'Fecha en la que se disputó el partido';
COMMENT ON COLUMN partido.ResPar IS 'Resultado del partido (Quiniela: 1 - x - 2)';

CREATE TABLE gol -- Gol
(
  CodGol INT NOT NULL, -- PK del gol
  CodEquiGoleador INT NOT NULL, -- FK del equipo que marcó el gol
  CodEquiGoleado INT NOT NULL, -- FK del equipo que recibió el gol
  CodJug INT NOT NULL, -- FK del jugador que marcó el gol
  CodJugAsis INT, -- FK del jugador que asistió el gol
  CodPar INT NOT NULL, -- FK del partido en el que se marcó el gol
  MinGol INT NOT NULL, -- Minuto en el que se marcó el gol
  PuntGol INT NOT NULL, -- Puntuación del gol
  PRIMARY KEY (CodGol),
  CONSTRAINT FK_CodEquiGoleador FOREIGN KEY (CodEquiGoleador)
    REFERENCES equipo(CodEqui)
    ON DELETE CASCADE,
  CONSTRAINT FK_CodEquiGoleado FOREIGN KEY (CodEquiGoleado)
    REFERENCES equipo(CodEqui)
    ON DELETE CASCADE,
  CONSTRAINT FK_CodJug FOREIGN KEY (CodJug)
    REFERENCES jugador(CodJug)
    ON DELETE CASCADE,
  CONSTRAINT FK_CodJugAsis FOREIGN KEY (CodJugAsis)
    REFERENCES jugador(CodJug)
    ON DELETE SET NULL,
  CONSTRAINT FK_CodPar FOREIGN KEY (CodPar)
    REFERENCES partido(CodPar)
    ON DELETE CASCADE
);

COMMENT ON TABLE gol IS 'Tabla de goles';
COMMENT ON COLUMN gol.CodGol IS 'Primary key del gol';
COMMENT ON COLUMN gol.CodEquiGoleador IS 'Foreign Key del equipo que marcó el gol';
COMMENT ON COLUMN gol.CodEquiGoleado IS 'Foreign Key del equipo que recibió el gol';
COMMENT ON COLUMN gol.CodJug IS 'Foreign Key del jugador que marcó el gol';
COMMENT ON COLUMN gol.CodJugAsis IS 'Foreign Key del jugador que asistió el gol';
COMMENT ON COLUMN gol.CodPar IS 'Foreign Key del partido en el que se marcó el gol';
COMMENT ON COLUMN gol.MinGol IS 'Minuto en el que se marcó el gol';
COMMENT ON COLUMN gol.PuntGol IS 'Puntuación del gol';

CREATE TABLE contrato_jugador -- Contrato entre un equipo y un jugador
(
  CodContJug INT NOT NULL, -- PK del contrato
  CodEqui INT NOT NULL, -- FK del equipo que contrata
  CodJug INT NOT NULL, -- FK del jugador
  SalConJug INT NOT NULL, -- Salario del jugador
  FecIniConJug TIMESTAMP NOT NULL, -- Fecha de inicio del contrato
  FecFinConJug TIMESTAMP NOT NULL, -- Fecha de fin del contrato
  ClausConJug INT NOT NULL, -- Cláusula del contrato
  PRIMARY KEY (CodContJug),
  CONSTRAINT C_J_FK_CodEqui FOREIGN KEY (CodEqui)
    REFERENCES equipo(CodEqui)
    ON DELETE CASCADE,
  CONSTRAINT C_J_FK_CodJug FOREIGN KEY (CodJug)
    REFERENCES jugador(CodJug)
    ON DELETE CASCADE
);

COMMENT ON TABLE contrato_jugador IS 'Tabla de contratos entre un equipo y un jugador';
COMMENT ON COLUMN contrato_jugador.CodContJug IS 'Primary key del contrato';
COMMENT ON COLUMN contrato_jugador.CodEqui IS 'Foreign Key del equipo que contrata';
COMMENT ON COLUMN contrato_jugador.CodJug IS 'Foreign Key del jugador';
COMMENT ON COLUMN contrato_jugador.SalConJug IS 'Salario del jugador';
COMMENT ON COLUMN contrato_jugador.FecIniConJug IS 'Fecha de inicio del contrato';
COMMENT ON COLUMN contrato_jugador.FecFinConJug IS 'Fecha de fin del contrato';
COMMENT ON COLUMN contrato_jugador.ClausConJug IS 'Cláusula del contrato';

CREATE TABLE contrato_entrenador -- Contrato entre un equipo y un entrenador
(
  CodContEnt INT NOT NULL, -- PK del contrato
  CodEqui INT NOT NULL, -- FK del equipo que contrata
  CodEnt INT NOT NULL, -- FK del entrenador
  SalConEnt INT NOT NULL, -- Salario del entrenador
  FecIniConEnt TIMESTAMP NOT NULL, -- Fecha de inicio del contrato
  FecFinConEnt TIMESTAMP NOT NULL, -- Fecha de fin del contrato
  ClausConEnt INT NOT NULL, -- Cláusula del contrato
  PRIMARY KEY (CodContEnt),
  CONSTRAINT C_E_FK_CodEqui FOREIGN KEY (CodEqui)
    REFERENCES equipo(CodEqui)
    ON DELETE CASCADE,
  CONSTRAINT C_E_FK_CodEnt FOREIGN KEY (CodEnt)
    REFERENCES entrenador(CodEnt)
    ON DELETE CASCADE
);

COMMENT ON TABLE contrato_entrenador IS 'Tabla de contratos entre un equipo y un entrenador';
COMMENT ON COLUMN contrato_entrenador.CodContEnt IS 'Primary key del contrato';
COMMENT ON COLUMN contrato_entrenador.CodEqui IS 'Foreign Key del equipo que contrata';
COMMENT ON COLUMN contrato_entrenador.CodEnt IS 'Foreign Key del entrenador';
COMMENT ON COLUMN contrato_entrenador.SalConEnt IS 'Salario del entrenador';
COMMENT ON COLUMN contrato_entrenador.FecIniConEnt IS 'Fecha de inicio del contrato';
COMMENT ON COLUMN contrato_entrenador.FecFinConEnt IS 'Fecha de fin del contrato';
COMMENT ON COLUMN contrato_entrenador.ClausConEnt IS 'Cláusula del contrato';

CREATE TABLE contrato_ojeador -- Contrato entre un equipo y un ojeador
(
  CodContOje INT NOT NULL, -- PK del contrato
  CodEqui INT NOT NULL, -- FK del equipo
  CodOje INT NOT NULL, -- FK del ojeador
  SalOje INT NOT NULL, -- Salario del contrato
  FecIniConOje TIMESTAMP NOT NULL, -- Fecha de inicio del contrato
  FecFinConOje TIMESTAMP NOT NULL, -- Fecha de fin del contrato
  PRIMARY KEY (CodOje, CodEqui),
  CONSTRAINT C_O_FK_CodEqui FOREIGN KEY (CodEqui)
    REFERENCES equipo(CodEqui)
    ON DELETE CASCADE,
  CONSTRAINT C_O_FK_CodOje FOREIGN KEY (CodOje)
    REFERENCES ojeador(CodOje)
    ON DELETE CASCADE
);

COMMENT ON TABLE contrato_ojeador IS 'Tabla de contratos entre un equipo y un ojeador';
COMMENT ON COLUMN contrato_ojeador.CodContOje IS 'Primary key del contrato';
COMMENT ON COLUMN contrato_ojeador.CodEqui IS 'Foreign Key del equipo';
COMMENT ON COLUMN contrato_ojeador.CodOje IS 'Foreign Key del ojeador';
COMMENT ON COLUMN contrato_ojeador.SalOje IS 'Salario del contrato';
COMMENT ON COLUMN contrato_ojeador.FecIniConOje IS 'Fecha de inicio del contrato';
COMMENT ON COLUMN contrato_ojeador.FecFinConOje IS 'Fecha de fin del contrato';

CREATE TABLE jugador_partido -- Relación entre un partido y un jugador
(
  CodJug INT NOT NULL, -- FK del jugador (PK)
  CodPar INT NOT NULL, -- FK del partido (PK)
  MinEnt INT NOT NULL, -- Minuto de entrada al campo
  MinSal INT NOT NULL, -- Minuto de salida del campo
  PRIMARY KEY (CodJug, CodPar),
  CONSTRAINT J_P_FK_CodJug FOREIGN KEY (CodJug)
    REFERENCES jugador(CodJug)
    ON DELETE CASCADE,
  CONSTRAINT J_P_FK_CodPar FOREIGN KEY (CodPar)
    REFERENCES partido(CodPar)
    ON DELETE CASCADE
);

COMMENT ON TABLE jugador_partido IS 'Tabla de jugadores que participan en un partido';
COMMENT ON COLUMN jugador_partido.CodJug IS 'Foreign Key del jugador';
COMMENT ON COLUMN jugador_partido.CodPar IS 'Foreign Key del partido';
COMMENT ON COLUMN jugador_partido.MinEnt IS 'Minuto de entrada al campo';
COMMENT ON COLUMN jugador_partido.MinSal IS 'Minuto de salida del campo';

CREATE TABLE ojeador_partido -- Relación entre un partido y un ojeador
(
  CodOje INT NOT NULL, -- FK del ojeador (PK)
  CodPar INT NOT NULL, -- FK del partido (PK)
  PRIMARY KEY (CodOje, CodPar),
  CONSTRAINT O_P_FK_CodOje FOREIGN KEY (CodOje)
    REFERENCES ojeador(CodOje)
    ON DELETE CASCADE,
  CONSTRAINT O_P_FK_CodPar FOREIGN KEY (CodPar)
    REFERENCES partido(CodPar)
    ON DELETE CASCADE
);

COMMENT ON TABLE ojeador_partido IS 'Tabla de ojeadores que participan en un partido';
COMMENT ON COLUMN ojeador_partido.CodOje IS 'Foreign Key del ojeador';
COMMENT ON COLUMN ojeador_partido.CodPar IS 'Foreign Key del partido';
