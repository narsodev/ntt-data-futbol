-- Eliminación de tablespace y usuario.
alter session set "_ORACLE_SCRIPT"=true;
DROP USER futbol_manager CASCADE;
DROP TABLESPACE futbol_manager_tablespace INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;
