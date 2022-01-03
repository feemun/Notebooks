-----------------------------------------------------------------------------------------------
------------------------------   1 创建临时表空间   ----------------------------------------------
-----------------------------------------------------------------------------------------------
-- 1.1 查询临时表空间文件的绝对路径
select name
from v$tempfile;

-- 1.2 创建表空间
create temporary tablespace catfish_temp
    tempfile '/u01/app/oracle/oradata/HWBASE/datafile/catfish_temp.tmp'
    size 100 m reuse
    autoextend on
    next 20 m
    maxsize unlimited;


-------------------------------------------------------------------------------------------------
------------------------------- 2 创建用户表空间 ---------------------------------------------------
-------------------------------------------------------------------------------------------------
-- 2.1 查询用户表空间文件的绝对路径
select name
from v$datafile;

-- 2.2 创建用户表空间
create tablespace 表空间名
    datafile '/u01/app/oracle/oradata/HWBASE/datafile/catfish.dbf' --（指定用户表空间存储的位置和存储在那个文件中）
    size 100 m reuse
    autoextend on
    next 40 m
    maxsize unlimited
    default storage (initial 128 k next 128 k minextents 2 maxextents unlimited);



--------------------------------------------------------------------------------------------------
-------------------------------- 3 指定用户表空间 ---------------------------------------------------
--------------------------------------------------------------------------------------------------
-- 3.1 指定用户的默认表空间
alter USER 用户名
    DEFAULT TABLESPACE 表空间名;

-- 3.2 指定用户的临时表空间
alter USER 用户名
    temporary tablespace 表空间名;

-- 3.2 创建用户和密码，指定上边创建的临时表空间和表空间
create user 用户名 identified by 密码
    default tablespace 用户表空间名
    temporary tablespace 临时表空间名;



-------------------------------------------------------------------------------------------------------
------------------------------------- 删除表空间 --------------------------------------------------------
-------------------------------------------------------------------------------------------------------
--删除表空间NOTIFYDB_TEMP及其包含数据对象以及数据文件
drop tablespace NOTIFYDB_TEMP including contents and datafiles;


-- 给创建的用户授予权限
grant dba to catfish;
grant connect, resource to catfish;
grant select any table to catfish;
grant delete any table to catfish;
grant update any table to catfish;
grant insert any table to catfish;


--用户和表空间对应关系
select username, DEFAULT_TABLESPACE
from dba_users;
select username, TEMPORARY_TABLESPACE
from dba_users;





