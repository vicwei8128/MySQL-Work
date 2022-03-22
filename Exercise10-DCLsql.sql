-- 01.請利用 Workbench 建立一使用者帳號 Username: william Host: % Password:P@ssw0rd

-- 02.請授予使用者 william 對資料庫 EXAMPLE 底下所有資料表的所有權限
grant all
on EXAMPLE.*
to 'william'@'%'
with grant option;

-- 03.請撤銷 william 對資料庫 EXAMPLE 底下所有資料表的所有權限
revoke all
on EXAMPLE.*
from 'william'@'%';