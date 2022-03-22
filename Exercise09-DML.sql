select * from MEMBER;
-- 01.請新建 會員資料表 MEMBER ，欄位描述如下
CREATE TABLE `EXAMPLE`.`MEMBER` (
  `ID` INT NOT NULL AUTO_INCREMENT COMMENT '編號',
  `USERNAME` VARCHAR(50) NOT NULL COMMENT '帳號',
  `PASSWORD` VARCHAR(50) NOT NULL COMMENT '密碼',
  `PASS` BIT(1) NOT NULL DEFAULT 0 COMMENT '帳號開通日期',
  `CREATE_DATE` DATETIME NOT NULL COMMENT '建立日期',
  `LAST_UPDATE_DATE`MEMBER DATETIME NOT NULL,
  PRIMARY KEY (`ID`));

-- 02.請對資料表 MEMBER 的欄位 PASSWORD 之後加入一欄位
alter table MEMBER
add column `NICKNAME` varchar(50) NOT NULL comment '暱稱' after PASSWORD;

-- 03.請修改資料表 MEMBER 的欄位
-- USERNAME、 PASSWORD: not null 、長度 100
-- LAST_UPDATE_DATE:預設值 NOW() 、註解"最後修改日期"
alter table MEMBER
	modify column USERNAME varchar (100) not null,
    modify column PASSWORD varchar (100) not null,
    modify column LAST_UPDATE_DATE DATETIME DEFAULT (NOW()) not null COMMENT '最後修改日期';
    
-- 04.請將資料表 MEMBER 的欄位 USERNAME 設為唯一鍵
alter table MEMBER
add constraint UK_MEMBER_USERNAME unique key (USERNAME);

-- 05.請將資料表 MEMBER 的欄位 USERNAME 的唯一鍵約束移除
alter table MEMBER
drop constraint UK_MEMBER_USERNAME;

-- 06.請將資料表 MEMBER 的欄位 CREATE_DATE 移除
alter table MEMBER
drop column CREATE_DATE;

-- 07.請新建資料表 MEMBER2 、 MEMBER3 2 個資料表的結構跟資料須與資料表 MEMBER 一樣
create table MEMBER2 like EMP;
create table MEMBER3 like EMP;

-- 08.請將資料表 MEMBER2 改名為 MEMBER_HIS
alter table MEMBER2 rename to MEMBER_HIS;

-- 09.請將資料表 MEMBER3 截斷 (truncate)
truncate table MEMBER3;

-- 10.請將資料表 MEMBER3 的儲存引擎改為 MyISAM
alter table MEMBER3 engine MyISAM;

-- 11.請將資料表 MEMBER3 移除
drop table MEMBER3;