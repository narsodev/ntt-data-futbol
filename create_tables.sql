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

CREATE TABLE jugador
(
  CodJug INT NOT NULL COMMENT 'PK del jugador',
  NomJug VARCHAR(40) NOT NULL COMMENT 'Nombre del jugador',
  ApeJug VARCHAR(40) NOT NULL COMMENT 'Apellidos del jugador',
  DNIJug CHAR(9) NOT NULL COMMENT 'DNI del jugador',
  PosJug VARCHAR(50) NOT NULL COMMENT 'Posición del jugador',
  PRIMARY KEY (CodJug)
);

CREATE TABLE entrenador -- Entrenador
(
  CodEnt INT NOT NULL COMMENT 'PK del entrenador',
  NomEnt VARCHAR(40) NOT NULL COMMENT 'Nombre del entrenador',
  ApeEnt VARCHAR(40) NOT NULL COMMENT 'Apellidos del entrenador',
  DNIEnt CHAR(9) NOT NULL COMMENT 'DNI del entrenador',
  PRIMARY KEY (CodEnt)
);

CREATE TABLE ojeador -- Ojeador
(
  CodOje INT NOT NULL COMMENT 'PK del ojeador',
  NomOje VARCHAR(40) NOT NULL COMMENT 'Nombre del ojeador',
  ApeOje VARCHAR(40) NOT NULL COMMENT 'Apellidos del ojeador',
  DNIOje CHAR(9) NOT NULL COMMENT 'DNI del ojeador',
  PRIMARY KEY (CodOje)
);

CREATE TABLE estadio -- Estadio
(
  CodEst INT NOT NULL COMMENT 'PK del estadio',
  NomEst VARCHAR(40) NOT NULL COMMENT 'Nombre del estadio',
  PaisEst VARCHAR(40) NOT NULL COMMENT 'País en el que se encuentra el estadio',
  CiuEst VARCHAR(40) NOT NULL COMMENT 'Ciudad en la que se encuentra el estadio',
  CapacEst INT NOT NULL COMMENT 'Capacidad del estadio',
  PRIMARY KEY (CodEst)
);

CREATE TABLE equipo -- Equipo
(
  CodEqui INT NOT NULL COMMENT 'PK del equipo',
  CodEst INT NOT NULL COMMENT 'FK del estadio',
  NomEqui VARCHAR(40) NOT NULL COMMENT 'Nombre del equipo',
  LigGan INT NOT NULL COMMENT 'Campeonatos de Liga ganados por el equipo',
  PRIMARY KEY (CodEqui),
  FOREIGN KEY (CodEst) REFERENCES estadio(CodEst)
);

CREATE TABLE partido -- Partido
(
  CodPar INT NOT NULL COMMENT 'PK del partido',
  CodEquiLoc INT NOT NULL COMMENT 'FK del equipo local',
  CodEquiVis INT NOT NULL COMMENT 'FK del equipo visitante',
  CodJugMVP INT NOT NULL COMMENT 'FK del jugador MVP',
  CodEst INT NOT NULL COMMENT 'FK del estadio en el que se jugó el partido',
  FecPar TIMESTAMP NOT NULL COMMENT 'Fecha en la que se disputó el partido',
  ResPar CHAR(1) NOT NULL COMMENT 'Resultado del partido (Quiniela: 1 - x - 2)',
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

CREATE TABLE gol -- Gol
(
  CodGol INT NOT NULL COMMENT 'PK del gol',
  CodEquiGoleador INT NOT NULL COMMENT 'FK del equipo que marcó el gol',
  CodEquiGoleado INT NOT NULL COMMENT 'FK del equipo que recibió el gol',
  CodJug INT NOT NULL COMMENT 'FK del jugador que marcó el gol',
  CodJugAsis INT COMMENT 'FK del jugador que asistió el gol',
  CodPar INT NOT NULL COMMENT 'FK del partido en el que se marcó el gol',
  MinGol INT NOT NULL COMMENT 'Minuto en el que se marcó el gol',
  PuntGol INT NOT NULL COMMENT 'Puntuación del gol',
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

CREATE TABLE contrato_jugador -- Contrato entre un equipo y un jugador
(
  CodContJug INT NOT NULL COMMENT 'PK del contrato',
  CodEqui INT NOT NULL COMMENT 'FK del equipo que contrata',
  CodJug INT NOT NULL COMMENT 'FK del jugador',
  SalConJug INT NOT NULL COMMENT 'Salario del jugador',
  FecIniConJug TIMESTAMP NOT NULL COMMENT 'Fecha de inicio del contrato',
  FecFinConJug TIMESTAMP NOT NULL COMMENT 'Fecha de fin del contrato',
  ClausConJug INT NOT NULL COMMENT 'Cláusula del contrato',
  PRIMARY KEY (CodContJug),
  CONSTRAINT C_J_FK_CodEqui FOREIGN KEY (CodEqui)
    REFERENCES equipo(CodEqui)
    ON DELETE CASCADE,
  CONSTRAINT C_J_FK_CodJug FOREIGN KEY (CodJug)
    REFERENCES jugador(CodJug)
    ON DELETE CASCADE
);

CREATE TABLE contrato_entrenador -- Contrato entre un equipo y un entrenador
(
  CodContEnt INT NOT NULL COMMENT 'PK del contrato',
  CodEqui INT NOT NULL COMMENT 'FK del equipo que contrata',
  CodEnt INT NOT NULL COMMENT 'FK del entrenador',
  SalConEnt INT NOT NULL COMMENT 'Salario del entrenador',
  FecIniConEnt TIMESTAMP NOT NULL COMMENT 'Fecha de inicio del contrato',
  FecFinConEnt TIMESTAMP NOT NULL COMMENT 'Fecha de fin del contrato',
  ClausConEnt INT NOT NULL COMMENT 'Cláusula del contrato',
  PRIMARY KEY (CodContEnt),
  CONSTRAINT C_E_FK_CodEqui FOREIGN KEY (CodEqui)
    REFERENCES equipo(CodEqui)
    ON DELETE CASCADE,
  CONSTRAINT C_E_FK_CodEnt FOREIGN KEY (CodEnt)
    REFERENCES entrenador(CodEnt)
    ON DELETE CASCADE
);

CREATE TABLE contrato_ojeador -- Contrato entre un equipo y un ojeador
(
  CodContOje INT NOT NULL COMMENT 'PK del contrato',
  CodEqui INT NOT NULL COMMENT 'FK del equipo',
  CodOje INT NOT NULL COMMENT 'FK del ojeador',
  SalOje INT NOT NULL COMMENT 'Salario del contrato',
  FecIniConOje TIMESTAMP NOT NULL COMMENT 'Fecha de inicio del contrato',
  FecFinConOje TIMESTAMP NOT NULL COMMENT 'Fecha de fin del contrato',
  PRIMARY KEY (CodOje, CodEqui),
  CONSTRAINT C_O_FK_CodEqui FOREIGN KEY (CodEqui)
    REFERENCES equipo(CodEqui)
    ON DELETE CASCADE,
  CONSTRAINT C_O_FK_CodOje FOREIGN KEY (CodOje)
    REFERENCES ojeador(CodOje)
    ON DELETE CASCADE
);

CREATE TABLE jugador_partido -- Relación entre un partido y un jugador
(
  CodJug INT NOT NULL COMMENT 'FK del jugador (PK)',
  CodPar INT NOT NULL COMMENT 'FK del partido (PK)',
  MinEnt INT NOT NULL COMMENT 'Minuto de entrada al partido',
  MinSal INT NOT NULL COMMENT 'Minuto de salida del partido',
  PRIMARY KEY (CodJug, CodPar),
  CONSTRAINT J_P_FK_CodJug FOREIGN KEY (CodJug)
    REFERENCES jugador(CodJug)
    ON DELETE CASCADE,
  CONSTRAINT J_P_FK_CodPar FOREIGN KEY (CodPar)
    REFERENCES partido(CodPar)
    ON DELETE CASCADE
);

CREATE TABLE ojeador_partido -- Relación entre un partido y un ojeador
(
  CodOje INT NOT NULL COMMENT 'FK del ojeador (PK)',
  CodPar INT NOT NULL COMMENT 'FK del partido (PK)',
  PRIMARY KEY (CodOje, CodPar),
  CONSTRAINT O_P_FK_CodOje FOREIGN KEY (CodOje)
    REFERENCES ojeador(CodOje)
    ON DELETE CASCADE,
  CONSTRAINT O_P_FK_CodPar FOREIGN KEY (CodPar)
    REFERENCES partido(CodPar)
    ON DELETE CASCADE
);
