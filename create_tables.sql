CREATE TABLE jugador
(
  CodJug INT NOT NULL, -- PK
  NomJug VARCHAR(40) NOT NULL,
  ApeJug VARCHAR(40) NOT NULL,
  DNIJug CHAR(9) NOT NULL,
  PosJug VARCHAR(50) NOT NULL,
  PRIMARY KEY (CodJug)
);

CREATE TABLE entrenador
(
  CodEnt INT NOT NULL, -- PK
  NomEnt VARCHAR(40) NOT NULL,
  ApeEnt VARCHAR(40) NOT NULL,
  DNIEnt CHAR(9) NOT NULL,
  PRIMARY KEY (CodEnt)
);

CREATE TABLE ojeador
(
  CodOje INT NOT NULL, -- PK
  NomOje VARCHAR(40) NOT NULL,
  ApeOje VARCHAR(40) NOT NULL,
  DNIOje CHAR(9) NOT NULL,
  PRIMARY KEY (CodOje)
);

CREATE TABLE estadio
(
  CodEst INT NOT NULL, -- PK
  NomEst VARCHAR(40) NOT NULL,
  PaisEst INT NOT NULL,
  CiuEst INT NOT NULL,
  CapacEst INT NOT NULL,
  PRIMARY KEY (CodEst)
);

CREATE TABLE equipo
(
  CodEqui INT NOT NULL, -- PK
  CodEst INT NOT NULL,
  NomEqui VARCHAR(40) NOT NULL,
  LigGan INT NOT NULL,
  PRIMARY KEY (CodEqui),
  FOREIGN KEY (CodEst) REFERENCES estadio(CodEst)
);

CREATE TABLE partido
(
  CodPar INT NOT NULL, -- PK
  CodEquiLoc INT NOT NULL,
  CodEquiVis INT NOT NULL,
  CodJugMVP INT NOT NULL,
  CodEst INT NOT NULL,
  FecPar INT NOT NULL,
  ResPar INT NOT NULL,
  /* PS/SQL */
  PRIMARY KEY (CodPar),
  FOREIGN KEY (CodEquiLoc) REFERENCES equipo(CodEqui),
  FOREIGN KEY (CodEquiVis) REFERENCES equipo(CodEqui),
  FOREIGN KEY (CodJugMVP) REFERENCES jugador(CodJug),
  FOREIGN KEY (CodEst) REFERENCES estadio(CodEst)
);

CREATE TABLE gol
(
  CodGol INT NOT NULL, -- PK
  CodEquiGoleador INT NOT NULL,
  CodEquiGoleado INT NOT NULL,
  CodJug INT NOT NULL,
  CodJugAsis INT,
  CodPar INT NOT NULL,
  MinGol INT NOT NULL,
  PuntGol INT NOT NULL,
  PRIMARY KEY (CodGol),
  FOREIGN KEY (CodPar) REFERENCES partido(CodPar),
  FOREIGN KEY (CodJug) REFERENCES jugador(CodJug),
  FOREIGN KEY (CodJugAsis) REFERENCES jugador(CodJug),
  FOREIGN KEY (CodEquiGoleador) REFERENCES equipo(CodEqui),
  FOREIGN KEY (CodEquiGoleado) REFERENCES equipo(CodEqui)
);

CREATE TABLE contrato_jugador
(
  CodContJug INT NOT NULL, -- PK
  CodEqui INT NOT NULL,
  CodJug INT NOT NULL,
  SalConJug INT NOT NULL,
  FecIniConJug INT NOT NULL,
  FecFinConJug INT NOT NULL,
  ClausConJug INT NOT NULL,
  PRIMARY KEY (CodContJug),
  FOREIGN KEY (CodJug) REFERENCES jugador(CodJug),
  FOREIGN KEY (CodEqui) REFERENCES equipo(CodEqui),
  UNIQUE (CodJug, CodEqui)
);

CREATE TABLE contrato_entrenador
(
  CodContEnt INT NOT NULL, -- PK
  CodEqui INT NOT NULL,
  CodEnt INT NOT NULL,
  SalConEnt INT NOT NULL,
  FecIniConJug INT NOT NULL,
  FecFinConJug INT NOT NULL,
  ClausConJug INT NOT NULL,
  PRIMARY KEY (CodContEnt),
  FOREIGN KEY (CodEqui) REFERENCES equipo(CodEqui),
  FOREIGN KEY (CodEnt) REFERENCES entrenador(CodEnt),
  UNIQUE (CodEqui, CodEnt)
);

CREATE TABLE contrato_ojeador
(
  CodContOje INT NOT NULL, -- PK
  SalOje INT NOT NULL,
  CodEqui INT NOT NULL,
  CodOje INT NOT NULL,
  PRIMARY KEY (CodOje, CodEqui),
  FOREIGN KEY (CodEqui) REFERENCES equipo(CodEqui),
  FOREIGN KEY (CodOje) REFERENCES ojeador(CodOje)
);

CREATE TABLE jugador_partido
(
  CodJug INT NOT NULL, -- PK, FK
  CodPar INT NOT NULL, -- PK, FK
  MinEnt INT NOT NULL,
  MinSal INT NOT NULL,
  PRIMARY KEY (CodJug, CodPar),
  FOREIGN KEY (CodJug) REFERENCES jugador(CodJug),
  FOREIGN KEY (CodPar) REFERENCES partido(CodPar)
);

CREATE TABLE ojeador_partido
(
  CodOje INT NOT NULL, -- PK, FK
  CodPar INT NOT NULL, -- PK, FK
  PRIMARY KEY (CodOje, CodPar),
  FOREIGN KEY (CodOje) REFERENCES ojeador(CodOje),
  FOREIGN KEY (CodPar) REFERENCES partido(CodPar)
);
