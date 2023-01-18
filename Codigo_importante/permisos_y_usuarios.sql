--COMPROBAR LOS PERMISOS (EN EL USER USER_PROYECTO)
select * FROM USER_SYS_PRIVS;
SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'DUENO'; --PUEDO COMPROBAR LOS PRIVILEGIOS QUE SE LE ASIGNAN A TABLAS EN CONCRETO
SELECT * FROM USER_ROLE_PRIVS;


-- PROFILE SQL
CREATE PROFILE app_user LIMIT 
  SESSIONS_PER_USER                 2   --
  CPU_PER_SESSION               10000   -- decimas de segundo
  CONNECT_TIME              UNLIMITED   -- minutos
  -- COMPOSITE_LIMIT          DEFAULT   --
  PRIVATE_SGA                     20M   --
  FAILED_LOGIN_ATTEMPTS     UNLIMITED   --
  PASSWORD_LIFE_TIME        UNLIMITED   -- dias

------------------- USER SQL  select username, default_tablespace from dba_users where default_tablespace = 'USERS'

CREATE or replace USER Miguel IDENTIFIED BY "1234"
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON SYSTEM
PROFILE app_user

------------------- ROLES   select role from dba_roles where role = 'DUENO'
Create Role dueno;

------------------- SYSTEM PRIVILEGES       select * from dba_sys_privs where grantee = 'DUENO' -O- SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'DUENO'
GRANT create session, create table, alter any table, drop any table,
        insert any table, update any table, delete any table, select any table to Dueno;

------------------- GRANT ROLE TO USER
GRANT dueno to Miguel;



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

--Updates
GRANT update on plato to Chef_Ejecutivo;
GRANT update on plato_dia to Chef_Ejecutivo;
GRANT update on inventario to Chef_Ejecutivo;
GRANT update on receta to Chef_Ejecutivo;

--Selects       
GRANT select on plato to Chef_Ejecutivo;
GRANT select on plato_dia to Chef_Ejecutivo;
GRANT select on inventario to Chef_Ejecutivo;
GRANT select on receta to Chef_Ejecutivo;
GRANT select on promocion to Chef_Ejecutivo;


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
    
        --DUENO (MIGUEL)
            --PRIVILEGIOS A EL PROPIO ROL
                select * FROM USER_SYS_PRIVS;   --(DESDE CONEXION Z_DUENO_MIGUEL)
                
            --VERIFICANDO QUE ROL DE MIGUEL
                SELECT * FROM USER_ROLE_PRIVS;   --(DESDE CONEXION Z_DUENO_MIGUEL)
                
            --PRIVILEGIOS A OBJETOS EN ESPECIFICOS
                SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'DUENO'; --(DESDE CONEXION PROYECTO)
                
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





--Alters
GRANT alter on compra to Gerente_General;
GRANT alter on empleado to Gerente_General;
GRANT alter on evento to Gerente_General;
GRANT alter on grupo to Gerente_General;
GRANT alter on persona to Gerente_General;
GRANT alter on reserva to Gerente_General;
GRANT alter on mesa to Gerente_General;
GRANT alter on mesa_reservada to Gerente_General;
GRANT alter on rol to Gerente_General;