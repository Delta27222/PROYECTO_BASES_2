-- PROFILE SQL
CREATE PROFILE app_user LIMIT 
  SESSIONS_PER_USER                 2   --
  CPU_PER_SESSION               10000   -- decimas de segundo
  CONNECT_TIME              UNLIMITED   -- minutos
  -- COMPOSITE_LIMIT          DEFAULT   --
  PRIVATE_SGA                     20M   --
  FAILED_LOGIN_ATTEMPTS     UNLIMITED   --
  PASSWORD_LIFE_TIME        UNLIMITED   -- dias

--COMPROBAR LOS PERMISOS (EN EL USER USER_PROYECTO)
select * FROM USER_SYS_PRIVS;
SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'DUENO'; --PUEDO COMPROBAR LOS PRIVILEGIOS QUE SE LE ASIGNAN A TABLAS EN CONCRETO
SELECT * FROM USER_ROLE_PRIVS;

CREATE  USER Eduardo IDENTIFIED BY "1234"
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON SYSTEM
PROFILE app_user

------------------- ROLES   select role from dba_roles where role = 'DUENO'
Create Role Administrador;

------------------- SYSTEM PRIVILEGES       select * from dba_sys_privs where grantee = 'DUENO' -O- SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'DUENO'
--GENERALES
GRANT CREATE ROLE TO Administrador;
GRANT CREATE TRIGGER  TO Administrador;
GRANT CREATE VIEW TO Administrador;
GRANT CREATE TABLE TO Administrador;
GRANT CREATE SEQUENCE TO Administrador;
GRANT CREATE USER TO Administrador;
GRANT CREATE PROCEDURE TO Administrador;
GRANT DROP USER TO Administrador;

--POR TABLAS
--Selects
GRANT select on compra to Administrador;
GRANT select on consumo to Administrador;
GRANT select on contabilidad to Administrador;
GRANT select on empleado to Administrador;
GRANT select on encuesta to Administrador;
GRANT select on evento to Administrador;
GRANT select on grupo to Administrador;
GRANT select on inventario to Administrador;
GRANT select on mesa to Administrador;
GRANT select on mesa_reservada to Administrador;
GRANT select on pago to Administrador;
GRANT select on persona to Administrador;
GRANT select on plato to Administrador;
GRANT select on plato_consumido to Administrador;
GRANT select on plato_dia to Administrador;
GRANT select on producto to Administrador;
GRANT select on promocion to Administrador;
GRANT select on puesto to Administrador;
GRANT select on receta to Administrador;
GRANT select on reserva to Administrador;
GRANT select on restaurante to Administrador;
GRANT select on rol to Administrador;
GRANT select on sucursal to Administrador;

--Inserts
GRANT insert on compra to Administrador;
GRANT insert on consumo to Administrador;
GRANT insert on contabilidad to Administrador;
GRANT insert on empleado to Administrador;
GRANT insert on encuesta to Administrador;
GRANT insert on evento to Administrador;
GRANT insert on grupo to Administrador;
GRANT insert on inventario to Administrador;
GRANT insert on mesa to Administrador;
GRANT insert on mesa_reservada to Administrador;
GRANT insert on pago to Administrador;
GRANT insert on persona to Administrador;
GRANT insert on plato to Administrador;
GRANT insert on plato_consumido to Administrador;
GRANT insert on plato_dia to Administrador;
GRANT insert on producto to Administrador;
GRANT insert on promocion to Administrador;
GRANT insert on puesto to Administrador;
GRANT insert on receta to Administrador;
GRANT insert on reserva to Administrador;
GRANT insert on restaurante to Administrador;
GRANT insert on rol to Administrador;
GRANT insert on sucursal to Administrador;

--Updates
GRANT update on compra to Administrador;
GRANT update on consumo to Administrador;
GRANT update on contabilidad to Administrador;
GRANT update on empleado to Administrador;
GRANT update on encuesta to Administrador;
GRANT update on evento to Administrador;
GRANT update on grupo to Administrador;
GRANT update on inventario to Administrador;
GRANT update on mesa to Administrador;
GRANT update on mesa_reservada to Administrador;
GRANT update on pago to Administrador;
GRANT update on persona to Administrador;
GRANT update on plato to Administrador;
GRANT update on plato_consumido to Administrador;
GRANT update on plato_dia to Administrador;
GRANT update on producto to Administrador;
GRANT update on promocion to Administrador;
GRANT update on puesto to Administrador;
GRANT update on receta to Administrador;
GRANT update on reserva to Administrador;
GRANT update on restaurante to Administrador;
GRANT update on rol to Administrador;
GRANT update on sucursal to Administrador;

--Drops
GRANT delete on compra to Administrador;
GRANT delete on consumo to Administrador;
GRANT delete on contabilidad to Administrador;
GRANT delete on empleado to Administrador;
GRANT delete on encuesta to Administrador;
GRANT delete on evento to Administrador;
GRANT delete on grupo to Administrador;
GRANT delete on inventario to Administrador;
GRANT delete on mesa to Administrador;
GRANT delete on mesa_reservada to Administrador;
GRANT delete on pago to Administrador;
GRANT delete on persona to Administrador;
GRANT delete on plato to Administrador;
GRANT delete on plato_consumido to Administrador;
GRANT delete on plato_dia to Administrador;
GRANT delete on producto to Administrador;
GRANT delete on promocion to Administrador;
GRANT delete on puesto to Administrador;
GRANT delete on receta to Administrador;
GRANT delete on reserva to Administrador;
GRANT delete on restaurante to Administrador;
GRANT delete on rol to Administrador;
GRANT delete on sucursal to Administrador;

--Alters
GRANT alter on compra to Administrador;
GRANT alter on consumo to Administrador;
GRANT alter on contabilidad to Administrador;
GRANT alter on empleado to Administrador;
GRANT alter on encuesta to Administrador;
GRANT alter on evento to Administrador;
GRANT alter on grupo to Administrador;
GRANT alter on inventario to Administrador;
GRANT alter on mesa to Administrador;
GRANT alter on mesa_reservada to Administrador;
GRANT alter on pago to Administrador;
GRANT alter on persona to Administrador;
GRANT alter on plato to Administrador;
GRANT alter on plato_consumido to Administrador;
GRANT alter on plato_dia to Administrador;
GRANT alter on producto to Administrador;
GRANT alter on promocion to Administrador;
GRANT alter on puesto to Administrador;
GRANT alter on receta to Administrador;
GRANT alter on reserva to Administrador;
GRANT alter on restaurante to Administrador;
GRANT alter on rol to Administrador;
GRANT alter on sucursal to Administrador;

------------------- GRANT ROLE TO USER
GRANT Administrador to Eduardo;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

------------------- USER SQL  select username, default_tablespace from dba_users where default_tablespace = 'USERS'

CREATE USER Angel IDENTIFIED BY "1234"
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON SYSTEM
PROFILE app_user

Create Role Dueno;

------------------- SYSTEM PRIVILEGES       select * from dba_sys_privs where grantee = 'DUENO' -O- SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'DUENO'

--GENERALES
GRANT CREATE ROLE TO Dueno;
GRANT CREATE USER TO Dueno;
GRANT DROP USER TO dueno;

--POR TABLAS

--Selects
GRANT select on compra to Dueno;
GRANT select on consumo to Dueno;
GRANT select on contabilidad to Dueno;
GRANT select on empleado to Dueno;
GRANT select on encuesta to Dueno;
GRANT select on evento to Dueno;
GRANT select on grupo to Dueno;
GRANT select on inventario to Dueno;
GRANT select on mesa to Dueno;
GRANT select on mesa_reservada to Dueno;
GRANT select on pago to Dueno;
GRANT select on persona to Dueno;
GRANT select on plato to Dueno;
GRANT select on plato_consumido to Dueno;
GRANT select on plato_dia to Dueno;
GRANT select on producto to Dueno;
GRANT select on promocion to Dueno;
GRANT select on puesto to Dueno;
GRANT select on receta to Dueno;
GRANT select on reserva to Dueno;
GRANT select on restaurante to Dueno;
GRANT select on rol to Dueno;
GRANT select on sucursal to Dueno;

--Inserts
GRANT insert on compra to Dueno;
GRANT insert on consumo to Dueno;
GRANT insert on contabilidad to Dueno;
GRANT insert on empleado to Dueno;
GRANT insert on encuesta to Dueno;
GRANT insert on evento to Dueno;
GRANT insert on grupo to Dueno;
GRANT insert on inventario to Dueno;
GRANT insert on mesa to Dueno;
GRANT insert on mesa_reservada to Dueno;
GRANT insert on pago to Dueno;
GRANT insert on persona to Dueno;
GRANT insert on plato to Dueno;
GRANT insert on plato_consumido to Dueno;
GRANT insert on plato_dia to Dueno;
GRANT insert on producto to Dueno;
GRANT insert on promocion to Dueno;
GRANT insert on puesto to Dueno;
GRANT insert on receta to Dueno;
GRANT insert on reserva to Dueno;
GRANT insert on restaurante to Dueno;
GRANT insert on rol to Dueno;
GRANT insert on sucursal to Dueno;

--Updates
GRANT update on compra to Dueno;
GRANT update on consumo to Dueno;
GRANT update on contabilidad to Dueno;
GRANT update on empleado to Dueno;
GRANT update on encuesta to Dueno;
GRANT update on evento to Dueno;
GRANT update on grupo to Dueno;
GRANT update on inventario to Dueno;
GRANT update on mesa to Dueno;
GRANT update on mesa_reservada to Dueno;
GRANT update on pago to Dueno;
GRANT update on persona to Dueno;
GRANT update on plato to Dueno;
GRANT update on plato_consumido to Dueno;
GRANT update on plato_dia to Dueno;
GRANT update on producto to Dueno;
GRANT update on promocion to Dueno;
GRANT update on puesto to Dueno;
GRANT update on receta to Dueno;
GRANT update on reserva to Dueno;
GRANT update on restaurante to Dueno;
GRANT update on rol to Dueno;
GRANT update on sucursal to Dueno;

------------------- GRANT ROLE TO USER
GRANT Dueno to Angel;

select * from dba_users order by username; --Asi consultamos

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

------------------- USER SQL  select username, default_tablespace from dba_users where default_tablespace = 'USERS'
CREATE USER Antonio IDENTIFIED BY "1234"
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON SYSTEM
PROFILE app_user

------------------- ROLES   select role from dba_roles where role = 'GERENTE_GENERAL';
Create Role Gerente_General;

------------------- SYSTEM PRIVILEGES      select * from dba_sys_privs where grantee = 'GERENTE_GENERAL' O SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'GERENTE_GENERAL'

--Inserts
GRANT insert on empleado to Gerente_General;
GRANT insert on evento to Gerente_General;
GRANT insert on grupo to Gerente_General;
GRANT insert on persona to Gerente_General;
GRANT insert on reserva to Gerente_General;
GRANT insert on mesa to Gerente_General;
GRANT insert on mesa_reservada to Gerente_General;
GRANT insert on rol to Gerente_General;
--Updates
GRANT update on empleado to Gerente_General;
GRANT update on evento to Gerente_General;
GRANT update on grupo to Gerente_General;
GRANT update on reserva to Gerente_General;
GRANT update on mesa to Gerente_General;
GRANT update on mesa_reservada to Gerente_General;
--Selects       GRANT select any table to Gerente_General;
GRANT select on compra to Gerente_General;
GRANT select on consumo to Gerente_General;
GRANT select on contabilidad to Gerente_General;
GRANT select on empleado to Gerente_General;
GRANT select on encuesta to Gerente_General;
GRANT select on evento to Gerente_General;
GRANT select on grupo to Gerente_General;
GRANT select on inventario to Gerente_General;
GRANT select on mesa to Gerente_General;
GRANT select on mesa_reservada to Gerente_General;
GRANT select on pago to Gerente_General;
GRANT select on persona to Gerente_General;
GRANT select on plato to Gerente_General;
GRANT select on plato_consumido to Gerente_General;
GRANT select on plato_dia to Gerente_General;
GRANT select on producto to Gerente_General;
GRANT select on promocion to Gerente_General;
GRANT select on puesto to Gerente_General;
GRANT select on receta to Gerente_General;
GRANT select on reserva to Gerente_General;
GRANT select on restaurante to Gerente_General;
GRANT select on rol to Gerente_General;
GRANT select on sucursal to Gerente_General;

------------------- GRANT ROLE TO USER
GRANT Gerente_General to Antonio;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

------------------- USER SQL  select username, default_tablespace from dba_users where default_tablespace = 'USERS'
CREATE USER Juan IDENTIFIED BY "1234"
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON SYSTEM
PROFILE app_user

------------------- ROLES   select role from dba_roles where role = 'SUB_GERENTE';
Create Role Sub_Gerente;

------------------- SYSTEM PRIVILEGES      select * from dba_sys_privs where grantee = 'SUB_GERENTE' O SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'SUB_GERENTE'
--Inserts
GRANT insert on pago to Sub_Gerente;
GRANT insert on promocion to Sub_Gerente;
GRANT insert on inventario to Sub_Gerente;
GRANT insert on producto to Sub_Gerente;

--Updates
GRANT update on pago to Sub_Gerente;
GRANT update on promocion to Sub_Gerente;
GRANT update on inventario to Sub_Gerente;
GRANT update on producto to Sub_Gerente;

--Selects       
GRANT select on plato to Sub_Gerente;
GRANT select on sucursal to Sub_Gerente;
GRANT select on consumo to Sub_Gerente;
GRANT select on pago to Sub_Gerente;
GRANT select on promocion to Sub_Gerente;
GRANT select on inventario to Sub_Gerente;
GRANT select on producto to Sub_Gerente;

------------------- GRANT ROLE TO USER
GRANT SUB_GERENTE to Juan;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

------------------- USER SQL  select username, default_tablespace from dba_users where default_tablespace = 'USERS'
CREATE USER Maria IDENTIFIED BY "1234"
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON SYSTEM
PROFILE app_user;

------------------- ROLES   select role from dba_roles where role = 'CHEF_EJECUTIVO';
Create Role Chef_Ejecutivo;


------------------- SYSTEM PRIVILEGES      select * from dba_sys_privs where grantee = 'CHEF_EJECUTIVO' O SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'CHEF_EJECUTIVO'
--Inserts
GRANT insert on plato to Chef_Ejecutivo;
GRANT insert on plato_dia to Chef_Ejecutivo;
GRANT insert on inventario to Chef_Ejecutivo;
GRANT insert on receta to Chef_Ejecutivo;
GRANT insert on producto to Chef_Ejecutivo;

--Updates
GRANT update on plato to Chef_Ejecutivo;
GRANT update on plato_dia to Chef_Ejecutivo;
GRANT update on inventario to Chef_Ejecutivo;
GRANT update on receta to Chef_Ejecutivo;
GRANT update on producto to Chef_Ejecutivo;

--Selects       
GRANT select on plato to Chef_Ejecutivo;
GRANT select on plato_dia to Chef_Ejecutivo;
GRANT select on inventario to Chef_Ejecutivo;
GRANT select on receta to Chef_Ejecutivo;
GRANT select on promocion to Chef_Ejecutivo;
GRANT select on producto to Chef_Ejecutivo;


------------------- GRANT ROLE TO USER
GRANT Chef_Ejecutivo to Maria;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

------------------- USER SQL  select username, default_tablespace from dba_users where default_tablespace = 'USERS'
CREATE USER Milena IDENTIFIED BY "1234"
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON SYSTEM
PROFILE app_user;

------------------- ROLES   select role from dba_roles where role = 'MESERO';
Create Role Mesero;
select * from consumo

------------------- SYSTEM PRIVILEGES      select * from dba_sys_privs where grantee = 'MESERO' O SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'MESERO'
--Inserts
GRANT insert on mesa to Mesero;
GRANT insert on mesa_reservada to Mesero;
GRANT insert on encuesta to Mesero;
GRANT insert on consumo to Mesero;
GRANT insert on plato_consumido to Mesero;

--Updates
GRANT update on mesa to Mesero;
GRANT update on mesa_reservada to Mesero;
GRANT update on encuesta to Mesero;
GRANT update on consumo to Mesero;
GRANT update on plato_consumido to Mesero;

--Selects       
GRANT select on plato to Mesero;
GRANT select on consumo to Mesero;
GRANT select on sucursal to Mesero;
GRANT select on compra to Mesero;
GRANT select on persona to Mesero;
GRANT select on mesa to Mesero;
GRANT select on mesa_reservada to Mesero;
GRANT select on encuesta to Mesero;
GRANT select on plato_consumido to Mesero;


------------------- GRANT ROLE TO USER
GRANT Mesero to Milena;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

--COMPROBAR LOS PERMISOS (EN EL USER USER_PROYECTO)
select * FROM USER_SYS_PRIVS;
SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'MESERO'; --PUEDO COMPROBAR LOS PRIVILEGIOS QUE SE LE ASIGNAN A TABLAS EN CONCRETO



SELECT * FROM USER_ROLE_PRIVS;  --MOSTRAR LOS USUARIOS DENTRO DE LA BASE DE DATOS

select * FROM USER_SYS_PRIVS;   --MOSTRAR LOS PERMISOS QUE TIENE EL USAURIO USER_PROYECTO (TIENE TODOS LOS PERMISOS SUPONGAMOS QUE ES EL ADMINISTRADOR DE LA BASE DE DATOS)

    --MOSTRAMOS CADA USAURIO
    
        --ADMINISTRADOR (EDUARDO)
            --PRIVILEGIOS A EL PROPIO ROL
                select * FROM USER_SYS_PRIVS;   --(DESDE CONEXION Y_ADMINISTRAOR_EDUARDO)
                
            --VERIFICANDO QUE ROL DE EDUARDO
                SELECT * FROM USER_ROLE_PRIVS;   --(DESDE CONEXION Z_ADMINISTRAOR_EDUARDO)
                
            --PRIVILEGIOS A OBJETOS EN ESPECIFICOS
                SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'ADMINISTRADOR'; --(DESDE CONEXION PROYECTO)

            --PRIVILEGIOS DEL ROL
            select privilege from dba_sys_privs where grantee = 'ADMINISTRADOR'
                
     -----------------------------------------------------------------------------------------------           
     
     --DUENO (ANGEL)
            --PRIVILEGIOS A EL PROPIO ROL
                select * FROM USER_SYS_PRIVS;   --(DESDE CONEXION Z_DUENO_ANGEL)
                
            --VERIFICANDO QUE ROL DE ANGEL
                SELECT * FROM USER_ROLE_PRIVS;   --(DESDE CONEXION Z_DUENO_ANGEL)
                
            --PRIVILEGIOS A OBJETOS EN ESPECIFICOS
                SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'DUENO'; --(DESDE CONEXION PROYECTO)

            --PRIVILEGIOS DEL ROL
            select privilege from dba_sys_privs where grantee = 'DUENO'
                
     -----------------------------------------------------------------------------------------------   
     
        --GERENTE_GENERAL (ANTONIO)
            --PRIVILEGIOS A EL PROPIO ROL
                select * FROM USER_SYS_PRIVS;   --(DESDE CONEXION ZZ_GERENTE_GENERAL_ANTONIO)
            --VERIFICANDO QUE ROL DE MIGUEL
                SELECT * FROM USER_ROLE_PRIVS;   --(DESDE CONEXION ZZ_GERENTE_GENERAL_ANTONIO)
            --PRIVILEGIOS A OBJETOS EN ESPECIFICOS
                SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'GERENTE_GENERAL'; --(DESDE CONEXION PROYECTO)
                
     -----------------------------------------------------------------------------------------------   
     
        --SUB_GERENTE (JUAN)
            --PRIVILEGIOS A EL PROPIO ROL
                select * FROM USER_SYS_PRIVS;   --(DESDE CONEXION ZZZ_SUB_GERENTE_JUAN)
            --VERIFICANDO QUE ROL DE MIGUEL
                SELECT * FROM USER_ROLE_PRIVS;   --(DESDE CONEXION ZZZ_SUB_GERENTE_JUAN)
            --PRIVILEGIOS A OBJETOS EN ESPECIFICOS
                SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'SUB_GERENTE'; --(DESDE CONEXION PROYECTO)
                
     -----------------------------------------------------------------------------------------------   
     
        --CHEF_EJECUTIVO (MARIA)
            --PRIVILEGIOS A EL PROPIO ROL
                select * FROM USER_SYS_PRIVS;   --(DESDE CONEXION ZZZZ_CHEF_EJECUTIVO_MARIA)
            --VERIFICANDO QUE ROL DE MIGUEL
                SELECT * FROM USER_ROLE_PRIVS;   --(DESDE CONEXION ZZZZ_CHEF_EJECUTIVO_MARIA)
            --PRIVILEGIOS A OBJETOS EN ESPECIFICOS
                SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'CHEF_EJECUTIVO'; --(DESDE CONEXION PROYECTO)
                
     -----------------------------------------------------------------------------------------------   
     
        --MESERO (MILENA)
            --PRIVILEGIOS A EL PROPIO ROL
                select * FROM USER_SYS_PRIVS;   --(DESDE CONEXION ZZZZZ_MESERO_MILENA)
            --VERIFICANDO QUE ROL DE MIGUEL
                SELECT * FROM USER_ROLE_PRIVS;   --(DESDE CONEXION ZZZZZ_MESERO_MILENA)
            --PRIVILEGIOS A OBJETOS EN ESPECIFICOS
                SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'MESERO'; --(DESDE CONEXION PROYECTO)
                
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==










































--Consultas varias
SELECT
  *
FROM
  DBA_SYS_PRIVS where grantee = 'MIGUEL'

SELECT table_name, privilege FROM sys.dba_tab_privs WHERE grantor='SYS';

alter session set "_ORACLE_SCRIPT"=true; --Cuando de un error al crear el usuario por el nombre

drop user user1 cascade;




select tablespace_name,contents from dba_Tablespaces;

select privilege from dba_sys_privs where grantee = 'Dueno'

alter session set "_ORACLE_SCRIPT"=true;  




--Link de info
--https://ittutorial.org/how-to-grant-and-revoke-privileges-create-and-drop-any-user-in-oracle-database/

--No se muestran las tablas que le doy al usaurio
--https://www.lawebdelprogramador.com/foros/SQL/1604457-SQL-DEVELOPER-NO-APARECE-LAS-TABLAS.html

--Info Importante 
--https://jorgesanchez.net/manuales/abd/control-usuarios-oracle.html

--Selects
GRANT select on compra to Administrador;
GRANT select on consumo to Administrador;
GRANT select on contabilidad to Administrador;
GRANT select on empleado to Administrador;
GRANT select on encuesta to Administrador;
GRANT select on evento to Administrador;
GRANT select on grupo to Administrador;
GRANT select on inventario to Administrador;
GRANT select on mesa to Administrador;
GRANT select on mesa_reservada to Administrador;
GRANT select on pago to Administrador;
GRANT select on persona to Administrador;
GRANT select on plato to Administrador;
GRANT select on plato_consumido to Administrador;
GRANT select on plato_dia to Administrador;
GRANT select on producto to Administrador;
GRANT select on promocion to Administrador;
GRANT select on puesto to Administrador;
GRANT select on receta to Administrador;
GRANT select on reserva to Administrador;
GRANT select on restaurante to Administrador;
GRANT select on rol to Administrador;
GRANT select on sucursal to Administrador;

--Inserts
GRANT insert on compra to Administrador;
GRANT insert on consumo to Administrador;
GRANT insert on contabilidad to Administrador;
GRANT insert on empleado to Administrador;
GRANT insert on encuesta to Administrador;
GRANT insert on evento to Administrador;
GRANT insert on grupo to Administrador;
GRANT insert on inventario to Administrador;
GRANT insert on mesa to Administrador;
GRANT insert on mesa_reservada to Administrador;
GRANT insert on pago to Administrador;
GRANT insert on persona to Administrador;
GRANT insert on plato to Administrador;
GRANT insert on plato_consumido to Administrador;
GRANT insert on plato_dia to Administrador;
GRANT insert on producto to Administrador;
GRANT insert on promocion to Administrador;
GRANT insert on puesto to Administrador;
GRANT insert on receta to Administrador;
GRANT insert on reserva to Administrador;
GRANT insert on restaurante to Administrador;
GRANT insert on rol to Administrador;
GRANT insert on sucursal to Administrador;

--Updates
GRANT update on compra to Administrador;
GRANT update on consumo to Administrador;
GRANT update on contabilidad to Administrador;
GRANT update on empleado to Administrador;
GRANT update on encuesta to Administrador;
GRANT update on evento to Administrador;
GRANT update on grupo to Administrador;
GRANT update on inventario to Administrador;
GRANT update on mesa to Administrador;
GRANT update on mesa_reservada to Administrador;
GRANT update on pago to Administrador;
GRANT update on persona to Administrador;
GRANT update on plato to Administrador;
GRANT update on plato_consumido to Administrador;
GRANT update on plato_dia to Administrador;
GRANT update on producto to Administrador;
GRANT update on promocion to Administrador;
GRANT update on puesto to Administrador;
GRANT update on receta to Administrador;
GRANT update on reserva to Administrador;
GRANT update on restaurante to Administrador;
GRANT update on rol to Administrador;
GRANT update on sucursal to Administrador;

--Drops
GRANT delete on compra to Administrador;
GRANT delete on consumo to Administrador;
GRANT delete on contabilidad to Administrador;
GRANT delete on empleado to Administrador;
GRANT delete on encuesta to Administrador;
GRANT delete on evento to Administrador;
GRANT delete on grupo to Administrador;
GRANT delete on inventario to Administrador;
GRANT delete on mesa to Administrador;
GRANT delete on mesa_reservada to Administrador;
GRANT delete on pago to Administrador;
GRANT delete on persona to Administrador;
GRANT delete on plato to Administrador;
GRANT delete on plato_consumido to Administrador;
GRANT delete on plato_dia to Administrador;
GRANT delete on producto to Administrador;
GRANT delete on promocion to Administrador;
GRANT delete on puesto to Administrador;
GRANT delete on receta to Administrador;
GRANT delete on reserva to Administrador;
GRANT delete on restaurante to Administrador;
GRANT delete on rol to Administrador;
GRANT delete on sucursal to Administrador;

--Alters
GRANT alter on compra to Administrador;
GRANT alter on consumo to Administrador;
GRANT alter on contabilidad to Administrador;
GRANT alter on empleado to Administrador;
GRANT alter on encuesta to Administrador;
GRANT alter on evento to Administrador;
GRANT alter on grupo to Administrador;
GRANT alter on inventario to Administrador;
GRANT alter on mesa to Administrador;
GRANT alter on mesa_reservada to Administrador;
GRANT alter on pago to Administrador;
GRANT alter on persona to Administrador;
GRANT alter on plato to Administrador;
GRANT alter on plato_consumido to Administrador;
GRANT alter on plato_dia to Administrador;
GRANT alter on producto to Administrador;
GRANT alter on promocion to Administrador;
GRANT alter on puesto to Administrador;
GRANT alter on receta to Administrador;
GRANT alter on reserva to Administrador;
GRANT alter on restaurante to Administrador;
GRANT alter on rol to Administrador;
GRANT alter on sucursal to Administrador;





--AOSDJKFASDKFALSJDFLKASJDFLJASDLFJLASJDFKLJASLDKFJLKASJFAJSDFLKASJLFKDJALSKFJAS

Select * FROM  USER_PROYECTO.compra;
Select * FROM  USER_PROYECTO.consumo;
Select * FROM  USER_PROYECTO.contabilidad;
Select * FROM  USER_PROYECTO.empleado;
Select * FROM  USER_PROYECTO.encuesta;
Select * FROM  USER_PROYECTO.evento;
Select * FROM  USER_PROYECTO.grupo;
Select * FROM  USER_PROYECTO.inventario;
Select * FROM  USER_PROYECTO.mesa;
Select * FROM  USER_PROYECTO.mesa_reservada;
Select * FROM  USER_PROYECTO.pago;
Select * FROM  USER_PROYECTO.persona;
Select * FROM  USER_PROYECTO.plato;
Select * FROM  USER_PROYECTO.plato_consumido;
Select * FROM  USER_PROYECTO.plato_dia;
Select * FROM  USER_PROYECTO.producto;
Select * FROM  USER_PROYECTO.promocion;
Select * FROM  USER_PROYECTO.puesto;
Select * FROM  USER_PROYECTO.receta;
Select * FROM  USER_PROYECTO.reserva;
Select * FROM  USER_PROYECTO.restaurante;
Select * FROM  USER_PROYECTO.rol;
Select * FROM  USER_PROYECTO.sucursal;
