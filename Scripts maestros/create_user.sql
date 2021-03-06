-- Creación de tablespace.
CREATE TABLESPACE futbol_manager_tablespace DATAFILE '(Route to Oracle SQL Install)\Oracle\oradata\XE\futbol_manager_tablespace.dbf' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED;

-- Generación de usuario, asignación de permisos sobre tablespace.
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER futbol_manager IDENTIFIED BY rootroot DEFAULT TABLESPACE futbol_manager_tablespace;
GRANT ALL PRIVILEGES TO futbol_manager;

