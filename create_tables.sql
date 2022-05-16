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
  CodJug INT NOT NULL, -- PK del jugador
  NomJug VARCHAR(40) NOT NULL, -- Nombre del jugador
  ApeJug VARCHAR(40) NOT NULL, -- Apellidos del jugador
  DNIJug CHAR(9) NOT NULL, -- DNI del jugador
  PosJug VARCHAR(50) NOT NULL, -- Posición del jugador
  PRIMARY KEY (CodJug)
);

CREATE TABLE entrenador -- Entrenador
(
  CodEnt INT NOT NULL, -- PK del entrenador
  NomEnt VARCHAR(40) NOT NULL, -- Nombre del entrenador
  ApeEnt VARCHAR(40) NOT NULL, -- Apellidos del entrenador
  DNIEnt CHAR(9) NOT NULL, -- DNI del entrenador
  PRIMARY KEY (CodEnt)
);

CREATE TABLE ojeador -- Ojeador
(
  CodOje INT NOT NULL, -- PK del ojeador
  NomOje VARCHAR(40) NOT NULL, -- Nombre del ojeador
  ApeOje VARCHAR(40) NOT NULL, -- Apellidos del ojeador
  DNIOje CHAR(9) NOT NULL, -- DNI del ojeador
  PRIMARY KEY (CodOje)
);

CREATE TABLE estadio -- Estadio
(
  CodEst INT NOT NULL, -- PK del estadio
  NomEst VARCHAR(40) NOT NULL, -- Nombre del estadio
  PaisEst VARCHAR(40) NOT NULL, -- País en el que se encuentra el estadio
  CiuEst VARCHAR(40) NOT NULL, -- Ciudad en la que se encuentra el estadio
  CapacEst INT NOT NULL, -- Capacidad del estadio
  PRIMARY KEY (CodEst)
);

CREATE TABLE equipo -- Equipo
(
  CodEqui INT NOT NULL, -- PK del equipo
  CodEst INT NOT NULL, -- FK del estadio
  NomEqui VARCHAR(40) NOT NULL, -- Nombre del equipo
  LigGan INT NOT NULL, -- Campeonatos de Liga ganados por el equipo
  PRIMARY KEY (CodEqui),
  FOREIGN KEY (CodEst) REFERENCES estadio(CodEst)
);

CREATE TABLE partido -- Partido
(
  CodPar INT NOT NULL, -- PK del partido
  CodEquiLoc INT NOT NULL,  -- FK del equipo local
  CodEquiVis INT NOT NULL, -- FK del equipo visitante
  CodJugMVP INT NOT NULL, -- FK del jugador MVP
  CodEst INT NOT NULL, -- FK del estadio en el que se jugó el partido
  FecPar TIMESTAMP NOT NULL, -- Fecha en la que se disputó el partido
  ResPar CHAR(1) NOT NULL, -- Resultado del partido (Quiniela: 1 - x - 2)
  /* PS/SQL */
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

CREATE TABLE jugador_partido -- Relación entre un partido y un jugador
(
  CodJug INT NOT NULL, -- FK del jugador (PK)
  CodPar INT NOT NULL, -- FK del partido (PK)
  MinEnt INT NOT NULL, -- Minuto de entrada al partido
  MinSal INT NOT NULL, -- Minuto de salida del partido
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
