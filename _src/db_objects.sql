/*************************************************************
** Name   : db_objects.sql                                  **
** Author : M. van der Plas & M. van Zoest                  **
** Date   : 26 october 2013                                 **
**                                                          **
** This script creates the necessary tables for the         **
** recipes in the Oracle APEX Cookbook Second Edition       **
**                                                          **
** Modifications                                            **
**                                                          **
** Who              When       What                         **
** ---------------- ---------- ---------------------------- **
** MvdP/MvZ         26-10-2013 Creation                     **
**************************************************************/

set feedback off
set define off

prompt Dropping EMP_LANG...
drop table EMP_LANG cascade constraints;

prompt Dropping EMP_JOB_TITLES...
drop table EMP_JOB_TITLES cascade constraints;

prompt Dropping APP_ADDRESSES...
drop table APP_ADDRESSES cascade constraints;

prompt Dropping APP_CONTACTS...
drop table APP_CONTACTS cascade constraints;

prompt Dropping APP_ADS_CTT...
drop table APP_ADS_CTT cascade constraints;

prompt Dropping APP_COMMS...
drop table APP_COMMS cascade constraints;

prompt Dropping APP_COM_TYPES...
drop table APP_COM_TYPES cascade constraints;

prompt Dropping APP_CONTACTTYPES...
drop table APP_CONTACTTYPES cascade constraints;

prompt Dropping APP_CTT_CMM...
drop table APP_CTT_CMM cascade constraints;

prompt Dropping APP_DEPARTMENTS...
drop table APP_DEPARTMENTS cascade constraints;

prompt Dropping APP_EMPLOYEES...
drop table APP_EMPLOYEES cascade constraints;

prompt Dropping APP_JOBS...
drop table APP_JOBS cascade constraints;

prompt Dropping APP_REF_CODES...
drop table APP_REF_CODES cascade constraints;

prompt Dropping APP_USERS...
drop table APP_USERS cascade constraints;

prompt Dropping APP_CAROUSEL...
drop table APP_CAROUSEL cascade constraints;

prompt Dropping APP_CUSTOMERS...
drop table APP_CUSTOMERS cascade constraints;

prompt Dropping APP_EVENTS...
drop table APP_EVENTS cascade constraints;

prompt Dropping APP_NEWS...
drop table APP_NEWS cascade constraints;

prompt Dropping APP_TAGS...
drop table APP_TAGS cascade constraints;

prompt Dropping APP_TGS_NWS...
drop table APP_TGS_NWS cascade constraints;

prompt Dropping APP_VIDEO...
drop table APP_VIDEO cascade constraints;

prompt Dropping COUNTRIES...
drop table COUNTRIES cascade constraints;

prompt Dropping DEPARTMENTS...
drop table DEPARTMENTS cascade constraints;

prompt Dropping EMPLOYEES...
drop table EMPLOYEES cascade constraints;

prompt Dropping APP_USER_PROFILES...
drop table app_user_profiles cascade constraints;

prompt Dropping APP_DOCUMENTS...
drop table app_documents cascade constraints;

prompt Dropping APP_IMAGES...
drop table app_images;

prompt Dropping GM_COORDINATES...
drop table gm_coordinates;

prompt Dropping APP_DEALERS...
drop table app_dealers;'

prompt Dropping APP_ERROR_LOG...
drop table app_error_log;

prompt Dropping APP_COUNTRIES...
drop table app_countries;

DROP SEQUENCE APP_VID_SEQ;
DROP SEQUENCE DEPARTMENTS_SEQ;
DROP SEQUENCE EMPLOYEES_SEQ;
DROP SEQUENCE APP_UPS_SEQ;
DROP SEQUENCE DLR_SEQ;
DROP SEQUENCE CTR_SEQ;

----
prompt Creating EMP_LANG...
create table EMP_LANG
(
empno NUMBER(4) not null,
ename VARCHAR2(10),
job_no NUMBER,
mgr NUMBER(4),
hiredate DATE,
sal NUMBER(7,2),
comm NUMBER(7,2),
deptno NUMBER(2)
);

prompt Creating EMP_JOB_TITLES...
create table EMP_JOB_TITLES
(
job_no NUMBER,
job_title VARCHAR2(32),
language VARCHAR2(10)
);

prompt Creating APP_ADDRESSES...
create table APP_ADDRESSES
(
   ID            NUMBER(5) not null,
   ADDRESS_TYPE  VARCHAR2(10) not null,
   ADDRESS_LINE1 VARCHAR2(255) not null,
   ADDRESS_LINE2 VARCHAR2(255),
   POSTCODE      VARCHAR2(10) not null,
   CITY          VARCHAR2(255) not null,
   COUNTRY       VARCHAR2(255) not null,
   STATE         VARCHAR2(32) not null   --VISHAL sABHARWAL, 2/1/2011 CONSTRAINT not null BUT LEFT NULL IN INSERT STATEMENT
);

alter table APP_ADDRESSES
   add constraint ADS_PK primary key (ID)
   using index   ;

prompt Creating APP_CONTACTS...
create table APP_CONTACTS
(
   ID           NUMBER(5) not null,
   FIRSTNAME    VARCHAR2(255),
   LASTNAME     VARCHAR2(255),
   CONTACT_TYPE NUMBER(5)
);

alter table APP_CONTACTS
   add constraint CTT_PK primary key (ID)
   using index;

prompt Creating APP_ADS_CTT...
create table APP_ADS_CTT
(
   CTT_ID     NUMBER not null,
   ADS_ID     NUMBER not null,
   DEFAULT_YN VARCHAR2(1) default 'N' not null
);

alter table APP_ADS_CTT
add constraint ADS_FK foreign key (ADS_ID)
references APP_ADDRESSES (ID);

alter table APP_ADS_CTT
add constraint CTT_FK1 foreign key (CTT_ID)
references APP_CONTACTS (ID);

prompt Creating APP_COMMS...
create table APP_COMMS
(
   ID        NUMBER not null,
   COM_VALUE VARCHAR2(255) not null,
   CTP_ID    NUMBER not null
);

alter table APP_COMMS
   add constraint CMM_PK primary key (ID)
   using index;

prompt Creating APP_COM_TYPES...
create table APP_COM_TYPES
(
   ID       NUMBER(5),
   COM_TYPE VARCHAR2(255)
);

prompt Creating APP_CONTACTTYPES...
create table APP_CONTACTTYPES
(
   ID           NUMBER(5) not null,
   CONTACT_TYPE VARCHAR2(255)
);

alter table APP_CONTACTTYPES
   add constraint CTE_FK primary key (ID)
   using index   ;

prompt Creating APP_CTT_CMM...
create table APP_CTT_CMM
(
   CTT_ID NUMBER not null,
   CMM_ID NUMBER not null
);

alter table APP_CTT_CMM
   add constraint CMM_FK foreign key (CMM_ID)
   references APP_COMMS (ID);
alter table APP_CTT_CMM
   add constraint CTT_FK foreign key (CTT_ID)
   references APP_CONTACTS (ID);

prompt Creating APP_DEPARTMENTS...
create table APP_DEPARTMENTS
(
   ID   NUMBER(5),
   NAME VARCHAR2(30)
);

prompt Creating APP_EMPLOYEES...
create table APP_EMPLOYEES
(
   ID        NUMBER(5),
   FIRSTNAME VARCHAR2(100),
   LASTNAME  VARCHAR2(100),
   USERNAME  VARCHAR2(20),
   DEPT_ID   NUMBER(5),
   SALARY    NUMBER(6),
   JOB_ID    NUMBER(5),
   MANAGER   NUMBER(5)
);

prompt Creating APP_JOBS...
create table APP_JOBS
(
   ID           NUMBER(5),
   ABBREVIATION VARCHAR2(10),
   DESCRIPTION  VARCHAR2(100)
);

prompt Creating APP_REF_CODES...
create table APP_REF_CODES
(
   RV_LOW_VALUE   VARCHAR2(240),
   RV_HIGH_VALUE  VARCHAR2(240),
   RV_ABBREVIATON VARCHAR2(240),
   RV_DOMAIN      VARCHAR2(100),
   RV_MEANING     VARCHAR2(240),
   RV_TYPE        VARCHAR2(10)
);

prompt Creating APP_USERS...
create table APP_USERS
(
   ID       NUMBER(5),
   USERNAME VARCHAR2(20),
   PASSWORD VARCHAR2(20),
   ROLE     VARCHAR2(10)
);


prompt Creating APP_CAROUSEL...
CREATE TABLE APP_CAROUSEL
(
   ID NUMBER(5,0),
   PANEL_TITLE     VARCHAR2(50),
   PANEL_TEXT      VARCHAR2(100),
   PANEL_TEXT_DATE DATE
);

prompt Creating APP_CUSTOMERS...
CREATE TABLE APP_CUSTOMERS
(
   CUSTOMER_ID NUMBER,
   CUST_FIRST_NAME      VARCHAR2(20),
   CUST_LAST_NAME       VARCHAR2(20),
   CUST_STREET_ADDRESS1 VARCHAR2(60),
   CUST_STREET_ADDRESS2 VARCHAR2(60),
   CUST_CITY            VARCHAR2(30),
   CUST_STATE           VARCHAR2(2),
   CUST_POSTAL_CODE     VARCHAR2(10),
   PHONE_NUMBER1        VARCHAR2(25),
   PHONE_NUMBER2        VARCHAR2(25),
   CREDIT_LIMIT         NUMBER(9,2),
   CUST_EMAIL           VARCHAR2(30)
);

prompt Creating APP_EVENTS...
CREATE TABLE APP_EVENTS
(
   ID           NUMBER(5,0),
   EVENT        VARCHAR2(100),
   EVENT_TYPE   VARCHAR2(50),
   LOCATION     VARCHAR2(50),
   EVENT_DATE   DATE,
   ORACLE_EVENT VARCHAR2(5)
);

prompt Creating APP_NEWS...
CREATE TABLE APP_NEWS
(
   ID             NUMBER(5,0),
   TITLE          VARCHAR2(20),
   DATE_PUBLISHED DATE,
   TEXT           VARCHAR2(4000)
);

prompt Creating APP_TAGS...
CREATE TABLE APP_TAGS
(
   ID NUMBER(5,0),
   TAG VARCHAR2(50)
);

prompt Creating APP_TGS_NWS...
CREATE TABLE APP_TGS_NWS
(
   TGS_ID NUMBER(5,0),
   NWS_ID NUMBER(5,0)
);

prompt Creating APP_VIDEO...
CREATE TABLE APP_VIDEO
(
   ID   NUMBER(5,0),
   NAME VARCHAR2(50),
   URL  VARCHAR2(255)
);

prompt Creating COUNTRIES...
CREATE TABLE COUNTRIES
(
   COUNTRY_ID   CHAR(2),
   COUNTRY_NAME VARCHAR2(40),
   REGION_ID    NUMBER,
   CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ENABLE
) ORGANIZATION INDEX NOCOMPRESS ;

prompt Creating DEPARTMENTS...
CREATE TABLE DEPARTMENTS
(
   DEPARTMENT_ID   NUMBER(4,0),
   DEPARTMENT_NAME VARCHAR2(30),
   MANAGER_ID      NUMBER(6,0),
   LOCATION_ID     NUMBER(4,0)
);

prompt Creating EMPLOYEES...
CREATE TABLE EMPLOYEES
(
   EMPLOYEE_ID    NUMBER(6,0),
   FIRST_NAME     VARCHAR2(20),
   LAST_NAME      VARCHAR2(25),
   EMAIL          VARCHAR2(25),
   PHONE_NUMBER   VARCHAR2(20),
   HIRE_DATE      DATE,
   JOB_ID         VARCHAR2(10),
   SALARY         NUMBER(8,2),
   COMMISSION_PCT NUMBER(2,2),
   MANAGER_ID     NUMBER(6,0),
   DEPARTMENT_ID  NUMBER(4,0)
);

prompt Creating table APP_DOCUMENTS...
create table app_documents
(id          number(9) not null
,description varchar2(100)
,filename    varchar2(256)
,doc_content blob
,primary key (id));

prompt Creating table APP_IMAGES...
CREATE TABLE APP_IMAGES
(
"ID" number,
"PICTURE" BLOB,
"MIMETYPE" VARCHAR2(255),
"FILENAME" VARCHAR2(255),
"IMAGE_LAST_UPDATE" DATE
) ;

prompt Creating table GM_COORDINATES...
create table gm_coordinates
(date_time  datetime
,ip_address varchar2(15)
,latitude   varchar2(20)
,longitude  varchar2(20));

prompt Creating table APP_USER_PROFILES...
create table app_user_profiles
(ID               NUMBER(6)
,GENDER           VARCHAR2(1)
,CONSTRAINT "UPS_CHK1" CHECK (GENDER in ('M','F')) ENABLE
,BIRTHDAY         DATE
,REL_STATUS       VARCHAR2(20)
,EMAIL            VARCHAR2(256)
,HOME_PHONE       VARCHAR2(50)
,MOBILE_PHONE     VARCHAR2(50)
,WORK_PHONE       VARCHAR2(50)
,SKYPE_NAME       VARCHAR2(100)
,MSN              VARCHAR2(50)
,TWITTER          VARCHAR2(50)
,NICKNAME         VARCHAR2(50)
,INTERESTS        VARCHAR2(100)
,FAVOURITE_MUSIC  VARCHAR2(100)
,FAVOURITE_MOVIES VARCHAR2(100)
,FAVOURITE_BOOKS  VARCHAR2(100)
,CONSTRAINT "UPS_PK" PRIMARY KEY ("ID") ENABLE );

prompt Creating table APP_DEALERS...
create table app_dealers
(dlr_id         number(3)
,dlr_name       varchar2(100)
,dlr_address1   varchar2(100)
,dlr_city       varchar2(100)
,dlr_state      varchar2(100)
,dlr_country_cd varchar2(100));

prompt Creating table APP_ERROR_LOG...
create table app_error_log
(message          varchar2(4000)
,display_location varchar2(40)
,association_type varchar2(40)
,page_item_name   varchar2(255)
,region_id        number
,row_num          integer
,apex_error_code  varchar2(255)
,ora_sqlcode      number
,ora_sqlerrm      varchar2(4000)
,error_date       date);

prompt Creating table APP_COUNTRIES...
create table app_countries
(id       number(4)
,ctr_code varchar2(100)
,ctr_name varchar2(100));

create sequence app_vid_seq start with 1 increment by 1;
create sequence departments_seq start with 1 increment by 1;
create sequence employees_seq start with 1 increment by 1;
create sequence app_ups_seq start with 1 increment by 1;
create sequence dlr_seq start with 1 increment by 1;
create sequence ctr_seq start with 1 increment by 1;

create or replace view app_vw_contacts as
select ctt.firstname
,      ctt.lastname
,      ctt.contact_type
,      ads.address_type
,      ads.address_line1
,      ads.address_line2
,      ads.postcode
,      ads.city
,      ads.state
,      ads.country
,      aac.default_yn
,      ctt.id contact_id
,      ads.id address_id
from   app_contacts ctt
,      app_addresses ads
,      app_ads_ctt aac
where  aac.ctt_id = ctt.id
and    aac.ads_id = ads.id;

prompt Disabling triggers for APP_ADDRESSES...
alter table APP_ADDRESSES disable all triggers;

prompt Disabling triggers for APP_CONTACTS...
alter table APP_CONTACTS disable all triggers;

prompt Disabling triggers for APP_ADS_CTT...
alter table APP_ADS_CTT disable all triggers;

prompt Disabling triggers for APP_COMMS...
alter table APP_COMMS disable all triggers;

prompt Disabling triggers for APP_COM_TYPES...
alter table APP_COM_TYPES disable all triggers;

prompt Disabling triggers for APP_CONTACTTYPES...
alter table APP_CONTACTTYPES disable all triggers;

prompt Disabling triggers for APP_CTT_CMM...
alter table APP_CTT_CMM disable all triggers;

prompt Disabling triggers for APP_DEPARTMENTS...
alter table APP_DEPARTMENTS disable all triggers;

prompt Disabling triggers for APP_EMPLOYEES...
alter table APP_EMPLOYEES disable all triggers;

prompt Disabling triggers for APP_JOBS...
alter table APP_JOBS disable all triggers;

prompt Disabling triggers for APP_REF_CODES...
alter table APP_REF_CODES disable all triggers;

prompt Disabling triggers for APP_USERS...
alter table APP_USERS disable all triggers;

prompt Disabling foreign key constraints for APP_ADS_CTT...
alter table APP_ADS_CTT disable constraint ADS_FK;
alter table APP_ADS_CTT disable constraint CTT_FK1;

prompt Disabling foreign key constraints for APP_CTT_CMM...
alter table APP_CTT_CMM disable constraint CMM_FK;
alter table APP_CTT_CMM disable constraint CTT_FK;

prompt Loading APP_ADDRESSES...
insert into APP_ADDRESSES (ID, ADDRESS_TYPE, ADDRESS_LINE1, ADDRESS_LINE2, POSTCODE, CITY, COUNTRY, STATE)
values (1, 'HO', '15 Rudyard Lane', null, '5629', 'Eindhoven', 'Netherlands','Noord-Brabant');

insert into APP_ADDRESSES (ID, ADDRESS_TYPE, ADDRESS_LINE1, ADDRESS_LINE2, POSTCODE, CITY, COUNTRY, STATE)
values (2, 'HO', '28 Eastfarm', null, '2861', 'Gouda', 'Netherlands','Zuid-Holland');

insert into APP_ADDRESSES (ID, ADDRESS_TYPE, ADDRESS_LINE1, ADDRESS_LINE2, POSTCODE, CITY, COUNTRY, STATE)
values (3, 'SH', '6363 S Fiddlers Green Circle', null, '80111', 'Greenwood Village', 'United States', 'Colorado');

insert into APP_ADDRESSES (ID, ADDRESS_TYPE, ADDRESS_LINE1, ADDRESS_LINE2, POSTCODE, CITY, COUNTRY, STATE)
values (4, 'HO', '5750 Hannum Avenue', null, '90230', 'Culver City', 'United States', 'California');

insert into APP_ADDRESSES (ID, ADDRESS_TYPE, ADDRESS_LINE1, ADDRESS_LINE2, POSTCODE, CITY, COUNTRY, STATE)
values (5, 'HO', '5805 Owens Drive', null, '94588', 'Pleasanton', 'United States', 'California');

insert into APP_ADDRESSES (ID, ADDRESS_TYPE, ADDRESS_LINE1, ADDRESS_LINE2, POSTCODE, CITY, COUNTRY, STATE)
values (6, 'HO', '1001 Sunset Boulevard', null, '95765', 'Rocklin', 'United States', 'California');


commit;

prompt Loading APP_CONTACTS...
insert into APP_CONTACTS (ID, FIRSTNAME, LASTNAME, CONTACT_TYPE)
values (4, 'Michel', 'van Zoest', 1);

insert into APP_CONTACTS (ID, FIRSTNAME, LASTNAME, CONTACT_TYPE)
values (5, 'Marcel', 'van der Plas', 1);

insert into APP_CONTACTS (ID, FIRSTNAME, LASTNAME, CONTACT_TYPE)
values (6, 'John', 'Johnson', 1);

insert into APP_CONTACTS (ID, FIRSTNAME, LASTNAME, CONTACT_TYPE)
values (7, 'Keith', 'Parker', 1);

insert into APP_CONTACTS (ID, FIRSTNAME, LASTNAME, CONTACT_TYPE)
values (8, 'Peter', 'Wellington', 1);



commit;

prompt Loading APP_ADS_CTT...
insert into APP_ADS_CTT (CTT_ID, ADS_ID, DEFAULT_YN) values (4, 2, 'Y');

insert into APP_ADS_CTT (CTT_ID, ADS_ID, DEFAULT_YN) values (5, 1, 'Y');

insert into APP_ADS_CTT (CTT_ID, ADS_ID, DEFAULT_YN) values (6, 1, 'Y');

insert into APP_ADS_CTT (CTT_ID, ADS_ID, DEFAULT_YN) values (7, 1, 'Y');

insert into APP_ADS_CTT (CTT_ID, ADS_ID, DEFAULT_YN) values (8, 1, 'Y');


commit;

prompt Loading APP_COMMS...
insert into APP_COMMS (ID, COM_VALUE, CTP_ID)
values (1, 'michel.van.zoest@whitehorses.nl', 5);

insert into APP_COMMS (ID, COM_VALUE, CTP_ID)
values (2, 'michel@oosterhoef.nl', 4);

insert into APP_COMMS (ID, COM_VALUE, CTP_ID)
values (3, '0652413706', 2);

commit;

prompt Loading APP_COM_TYPES...
insert into APP_COM_TYPES (ID, COM_TYPE)
values (1, 'Home phone');

insert into APP_COM_TYPES (ID, COM_TYPE)
values (2, 'Business phone');

insert into APP_COM_TYPES (ID, COM_TYPE)
values (3, 'Mobile phone');

insert into APP_COM_TYPES (ID, COM_TYPE)
values (4, 'Personal email address');

insert into APP_COM_TYPES (ID, COM_TYPE)
values (5, 'Business email address');

insert into APP_COM_TYPES (ID, COM_TYPE)
values (6, 'fax');

commit;

prompt Loading APP_CONTACTTYPES...
insert into APP_CONTACTTYPES (ID, CONTACT_TYPE)
values (1, 'customer');

insert into APP_CONTACTTYPES (ID, CONTACT_TYPE)
values (2, 'supplier');

commit;

prompt Loading APP_CTT_CMM...
insert into APP_CTT_CMM (CTT_ID, CMM_ID)
values (4, 1);

insert into APP_CTT_CMM (CTT_ID, CMM_ID)
values (4, 2);

insert into APP_CTT_CMM (CTT_ID, CMM_ID)
values (4, 3);

commit;

prompt Loading APP_DEPARTMENTS...
insert into APP_DEPARTMENTS (ID, NAME)
values (1, 'Sales');

insert into APP_DEPARTMENTS (ID, NAME)
values (2, 'Human Resource');

insert into APP_DEPARTMENTS (ID, NAME)
values (3, 'IT');

insert into APP_DEPARTMENTS (ID, NAME)
values (4, 'Accounting');

insert into APP_DEPARTMENTS (ID, NAME)
values (5, 'Office');

insert into APP_DEPARTMENTS (ID, NAME)
values (6, 'Research and development');

commit;

prompt Loading APP_EMPLOYEES...
insert into APP_EMPLOYEES (ID, FIRSTNAME, LASTNAME, USERNAME, DEPT_ID, SALARY, JOB_ID, MANAGER)
values (1, 'Marcel', 'van der Plas', 'mvdplas', 3, 5000, 4, 1);

insert into APP_EMPLOYEES (ID, FIRSTNAME, LASTNAME, USERNAME, DEPT_ID, SALARY, JOB_ID, MANAGER)
values (2, 'Michel', 'van Zoest', 'mvzoest', 3, 5000, 4, 2);

insert into APP_EMPLOYEES (ID, FIRSTNAME, LASTNAME, USERNAME, DEPT_ID, SALARY, JOB_ID, MANAGER)
values (3, 'Mark', 'Jones', 'mjones', 3, 5000, 4, 2);

insert into APP_EMPLOYEES (ID, FIRSTNAME, LASTNAME, USERNAME, DEPT_ID, SALARY, JOB_ID, MANAGER)
values (4, 'Kees', 'Sanders', 'ksanders', 1, 7000, 10, 2);

insert into APP_EMPLOYEES (ID, FIRSTNAME, LASTNAME, USERNAME, DEPT_ID, SALARY, JOB_ID, MANAGER)
values (5, 'Marco', 'Stradijk', 'mstradijk', 2, 6000, 7, 2);


commit;

prompt Loading APP_JOBS...
insert into APP_JOBS (ID, ABBREVIATION, DESCRIPTION)
values (1, 'CEO', 'Chief Executive Officer');

insert into APP_JOBS (ID, ABBREVIATION, DESCRIPTION)
values (2, 'MGR', 'Manager');

insert into APP_JOBS (ID, ABBREVIATION, DESCRIPTION)
values (3, 'CLERK', 'Clerk');

insert into APP_JOBS (ID, ABBREVIATION, DESCRIPTION)
values (4, 'CONS', 'Consultant');

insert into APP_JOBS (ID, ABBREVIATION, DESCRIPTION)
values (5, 'ARCH', 'Architect');

insert into APP_JOBS (ID, ABBREVIATION, DESCRIPTION)
values (6, 'DBA', 'Database administrator');

insert into APP_JOBS (ID, ABBREVIATION, DESCRIPTION)
values (7, 'HRM', 'Human Resource Manager');

insert into APP_JOBS (ID, ABBREVIATION, DESCRIPTION)
values (8, 'CIO', 'Chief Information Officer');

insert into APP_JOBS (ID, ABBREVIATION, DESCRIPTION)
values (9, 'CFO', 'Chief Financial Officer');

insert into APP_JOBS (ID, ABBREVIATION, DESCRIPTION)
values (10, 'CMO', 'Chief Marketing Officer');

commit;

prompt Loading APP_REF_CODES...
insert into APP_REF_CODES (RV_LOW_VALUE, RV_HIGH_VALUE, RV_ABBREVIATON, RV_DOMAIN, RV_MEANING, RV_TYPE)
values ('SH', null, null, 'ADDRESSES', 'Shipping address', null);

insert into APP_REF_CODES (RV_LOW_VALUE, RV_HIGH_VALUE, RV_ABBREVIATON, RV_DOMAIN, RV_MEANING, RV_TYPE)
values ('IV', null, null, 'ADDRESSES', 'Invoice address', null);

insert into APP_REF_CODES (RV_LOW_VALUE, RV_HIGH_VALUE, RV_ABBREVIATON, RV_DOMAIN, RV_MEANING, RV_TYPE)
values ('VA', null, null, 'ADDRESSES', 'visitor address', null);

insert into APP_REF_CODES (RV_LOW_VALUE, RV_HIGH_VALUE, RV_ABBREVIATON, RV_DOMAIN, RV_MEANING, RV_TYPE)
values ('HO', null, null, 'ADDRESSES', 'Home address', null);

insert into APP_REF_CODES (RV_LOW_VALUE, RV_HIGH_VALUE, RV_ABBREVIATON, RV_DOMAIN, RV_MEANING, RV_TYPE)
values ('ADMIN', null, null, 'ROLES', 'Administrator', null);

insert into APP_REF_CODES (RV_LOW_VALUE, RV_HIGH_VALUE, RV_ABBREVIATON, RV_DOMAIN, RV_MEANING, RV_TYPE)
values ('HR', null, null, 'ROLES', 'Human Resource', null);

insert into APP_REF_CODES (RV_LOW_VALUE, RV_HIGH_VALUE, RV_ABBREVIATON, RV_DOMAIN, RV_MEANING, RV_TYPE)
values ('SALES', null, null, 'ROLES', 'Sales', null);

insert into APP_REF_CODES (RV_LOW_VALUE, RV_HIGH_VALUE, RV_ABBREVIATON, RV_DOMAIN, RV_MEANING, RV_TYPE)
values ('DEFAULT', null, null, 'ROLES', 'Sales', null);

commit;

prompt Loading APP_USERS...
insert into APP_USERS (ID, USERNAME, PASSWORD, ROLE)
values (1, 'mvdplas', 'mvdplas', 'DEFAULT');

insert into APP_USERS (ID, USERNAME, PASSWORD, ROLE)
values (2, 'mvzoest', 'mvzoest', 'DEFAULT');

insert into APP_USERS (ID, USERNAME, PASSWORD, ROLE)
values (3, 'dvdbos', 'dvdbos', 'DEFAULT');

insert into APP_USERS (ID, USERNAME, PASSWORD, ROLE)
values (4, 'ksanders', 'ksanders', 'ADMIN');

insert into APP_USERS (ID, USERNAME, PASSWORD, ROLE)
values (5, 'mstradijk', 'mstradijk', 'HR');

insert into APP_USERS (ID, USERNAME, PASSWORD, ROLE)
values (6, 'mjones', 'mjones', 'SALES');

commit;


prompt INSERTING into APP_CAROUSEL
Insert into APP_CAROUSEL (ID,PANEL_TITLE,PANEL_TEXT,PANEL_TEXT_DATE) values  
(1,'News','New terms on maximum call tariffs',to_timestamp('09-06-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'));
Insert into APP_CAROUSEL (ID,PANEL_TITLE,PANEL_TEXT,PANEL_TEXT_DATE) values  
(2,'Weather','Tomorrow sunshine, 20 degrees Celcius',to_timestamp('10-06-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'));
Insert into APP_CAROUSEL (ID,PANEL_TITLE,PANEL_TEXT,PANEL_TEXT_DATE) values  
(3,'Stock Exchange','AEX +1.1%, NYSE +0,9%, FTSE +1,0%',to_timestamp('10-06-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'));
Insert into APP_CAROUSEL (ID,PANEL_TITLE,PANEL_TEXT,PANEL_TEXT_DATE) values  
(4,'Lunch','Today: ham and egg sandwich',to_timestamp('11-06-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'));
Insert into APP_CAROUSEL (ID,PANEL_TITLE,PANEL_TEXT,PANEL_TEXT_DATE) values  
(5,'Lunch','Today: Bufkes sandwich with meatballs and cheese',to_timestamp('22-10-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'));

prompt INSERTING into APP_CUSTOMERS
Insert into APP_CUSTOMERS  
(CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_STREET_ADDRESS1,CUST_STREET_ADDRESS2,CUST_CITY,CUST_STATE,CUST_POSTAL_CODE,PHONE_NUMBER1,PHONE_NUMBER2,CREDIT_LIMIT,CUST_EMAIL)
values (1,'John','Dulles','45020 Aviation Drive',null,'Sterling','VA','20166','703-555-2143',null,1000,null);
Insert into APP_CUSTOMERS  
(CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_STREET_ADDRESS1,CUST_STREET_ADDRESS2,CUST_CITY,CUST_STATE,CUST_POSTAL_CODE,PHONE_NUMBER1,PHONE_NUMBER2,CREDIT_LIMIT,CUST_EMAIL)
values (2,'William','Hartsfield','6000 North Terminal Parkway',null,'Atlanta','GA','30320','404-555-3285',null,1000,null);
Insert into APP_CUSTOMERS  
(CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_STREET_ADDRESS1,CUST_STREET_ADDRESS2,CUST_CITY,CUST_STATE,CUST_POSTAL_CODE,PHONE_NUMBER1,PHONE_NUMBER2,CREDIT_LIMIT,CUST_EMAIL)
values (3,'Edward','Logan','1 Harborside Drive',null,'East Boston','MA','02128','617-555-3295',null,1000,null);
Insert into APP_CUSTOMERS  
(CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_STREET_ADDRESS1,CUST_STREET_ADDRESS2,CUST_CITY,CUST_STATE,CUST_POSTAL_CODE,PHONE_NUMBER1,PHONE_NUMBER2,CREDIT_LIMIT,CUST_EMAIL) 
values (4,'Edward "Butch"','OHare','10000 West OHare',null,'Chicago','IL','60666','773-555-7693',null,1000,null);
Insert into APP_CUSTOMERS  
(CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_STREET_ADDRESS1,CUST_STREET_ADDRESS2,CUST_CITY,CUST_STATE,CUST_POSTAL_CODE,PHONE_NUMBER1,PHONE_NUMBER2,CREDIT_LIMIT,CUST_EMAIL)
values (5,'Fiorello','LaGuardia','Hangar Center','Third Floor','Flushing','NY','11371','212-555-3923',null,1000,null);
Insert into APP_CUSTOMERS  
(CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_STREET_ADDRESS1,CUST_STREET_ADDRESS2,CUST_CITY,CUST_STATE,CUST_POSTAL_CODE,PHONE_NUMBER1,PHONE_NUMBER2,CREDIT_LIMIT,CUST_EMAIL)
values (6,'Albert','Lambert','10701 Lambert International Blvd,',null,'St, Louis','MO','63145','314-555-4022',null,1000,null);
Insert into APP_CUSTOMERS  
(CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_STREET_ADDRESS1,CUST_STREET_ADDRESS2,CUST_CITY,CUST_STATE,CUST_POSTAL_CODE,PHONE_NUMBER1,PHONE_NUMBER2,CREDIT_LIMIT,CUST_EMAIL) 
values (7,'Eugene','Bradley','Schoephoester Road',null,'Windsor Locks','CT','06096','(860) 555-1835','(860) 555-1836',1000,null);

prompt INSERTING into APP_EVENTS
Insert into APP_EVENTS (ID,EVENT,EVENT_TYPE,LOCATION,EVENT_DATE,ORACLE_EVENT)  
values (2,'ODTUG Kaleidoscope 2010','Seminar','Washington, D,C,, United States',to_timestamp('27-06-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'),'Y');
Insert into APP_EVENTS (ID,EVENT,EVENT_TYPE,LOCATION,EVENT_DATE,ORACLE_EVENT)  
values (3,'OBUG APEX 4,0 day','Seminar','Genk, Belgium',to_timestamp('17-06-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'),null);
Insert into APP_EVENTS (ID,EVENT,EVENT_TYPE,LOCATION,EVENT_DATE,ORACLE_EVENT)  
values (4,'Oracle Open World 2010','Seminar','San Francisco, United States',to_timestamp('19-09-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'),'Y');
Insert into APP_EVENTS (ID,EVENT,EVENT_TYPE,LOCATION,EVENT_DATE,ORACLE_EVENT)  
values (5,'Dinner with colleagues','Dinner','Den Bosch, Netherlands',to_timestamp('30-09-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'),'Y');
Insert into APP_EVENTS (ID,EVENT,EVENT_TYPE,LOCATION,EVENT_DATE,ORACLE_EVENT)  
values (6,'Knowledge session','Meeting','Nieuwegein, Netherlands',to_timestamp('15-11-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'),null);
Insert into APP_EVENTS (ID,EVENT,EVENT_TYPE,LOCATION,EVENT_DATE,ORACLE_EVENT)  
values (7,'APEX workshop','Workshop','Eindhoven, Netherlands',to_timestamp('01-12-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'),'Y');

prompt INSERTING into APP_NEWS
Insert into APP_NEWS (ID,TITLE,DATE_PUBLISHED,TEXT) values (3,'New APEX 4,0 book',to_timestamp('01-11-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'),'At the end of this year, a new book about APEX 4,0 will be in the bookstores, Michel van Zoest and Marcel van der Plas are the writers of the book,');
Insert into APP_NEWS (ID,TITLE,DATE_PUBLISHED,TEXT) values (4,'Rumours',to_timestamp('01-11-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'),'During the OOW there were some rumours that Oracle is about to release a 12C database, C stands for Coud, In 10g and 11g, the g stands for grid control, ');
Insert into APP_NEWS (ID,TITLE,DATE_PUBLISHED,TEXT) values (5,'Sun takeover',to_timestamp('01-11-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'),'With the Sun-takeover, Oracle is now owner of OpenOffice and Java, This is very important because with OpenOffice, Oracle now can compete with Microsoft. However, some people are affraid that in the end, Oracle will ask money to download OpenOffice, That''s just a matter of time, they say,');
Insert into APP_NEWS (ID,TITLE,DATE_PUBLISHED,TEXT) values (6,'Developer Suite',to_timestamp('01-11-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'),'In the last few years, the Oracle Forms and Designer projects have been decreased, This is a result of a shift of the focus to Oracle JHeadstart/ADF and APEX.');
Insert into APP_NEWS (ID,TITLE,DATE_PUBLISHED,TEXT) values (7,'What is APEX?',to_timestamp('10-11-10 00:00:00,000000000','DD-MM-RR HH24:MI:SS,FF'),'APEX is an abbreviation of Application Express. It is a schema on the Oracle database, either 10g or 11g. ');
Insert into APP_NEWS (ID,TITLE,DATE_PUBLISHED,TEXT) values (1,'APEX 4.0 released',to_timestamp('31-10-10 20:59:25,000000000','DD-MM-RR HH24:MI:SS,FF'),'In the summer of this year, a new version of APEX was released: APEX 4.0');
Insert into APP_NEWS (ID,TITLE,DATE_PUBLISHED,TEXT) values (2,'OOW highlights',to_timestamp('31-10-10 21:01:03,000000000','DD-MM-RR HH24:MI:SS,FF'),'Last september the Oracle Open World was again held in San Fransisco. Larry Ellison told something about the new Oracle RDBMS.');

prompt INSERTING into APP_TAGS
Insert into APP_TAGS (ID,TAG) values (1,'oracle');
Insert into APP_TAGS (ID,TAG) values (2,'apex');
Insert into APP_TAGS (ID,TAG) values (3,'11g');
Insert into APP_TAGS (ID,TAG) values (4,'10g');
Insert into APP_TAGS (ID,TAG) values (5,'designer');
Insert into APP_TAGS (ID,TAG) values (6,'forms');
Insert into APP_TAGS (ID,TAG) values (7,'reports');
Insert into APP_TAGS (ID,TAG) values (8,'rdbms');
Insert into APP_TAGS (ID,TAG) values (9,'repository');
Insert into APP_TAGS (ID,TAG) values (10,'xe');
Insert into APP_TAGS (ID,TAG) values (11,'sql');
Insert into APP_TAGS (ID,TAG) values (12,'pl/sql');
Insert into APP_TAGS (ID,TAG) values (13,'xml');
Insert into APP_TAGS (ID,TAG) values (14,'xsl');
Insert into APP_TAGS (ID,TAG) values (15,'xsd');
Insert into APP_TAGS (ID,TAG) values (16,'sql developer');
Insert into APP_TAGS (ID,TAG) values (17,'jdeveloper');
Insert into APP_TAGS (ID,TAG) values (18,'9i');
Insert into APP_TAGS (ID,TAG) values (19,'toad');
Insert into APP_TAGS (ID,TAG) values (20,'declare');
Insert into APP_TAGS (ID,TAG) values (21,'exception');
Insert into APP_TAGS (ID,TAG) values (22,'date');
Insert into APP_TAGS (ID,TAG) values (23,'pragma');
Insert into APP_TAGS (ID,TAG) values (24,'sequence');
Insert into APP_TAGS (ID,TAG) values (25,'procedure');
Insert into APP_TAGS (ID,TAG) values (26,'function');
Insert into APP_TAGS (ID,TAG) values (27,'table');
Insert into APP_TAGS (ID,TAG) values (28,'package');
Insert into APP_TAGS (ID,TAG) values (29,'twitter');
Insert into APP_TAGS (ID,TAG) values (30,'hyves');
Insert into APP_TAGS (ID,TAG) values (31,'facebook');
Insert into APP_TAGS (ID,TAG) values (32,'msn');

prompt INSERTING into APP_TGS_NWS
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,4);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,5);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,6);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,7);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,2);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,4);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,5);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,6);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,7);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,2);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,4);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,5);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,6);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,7);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (1,2);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,3);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,6);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,7);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,1);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,3);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,6);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,7);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,1);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,3);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,6);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,7);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (2,1);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (3,4);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (3,7);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (3,5);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (3,4);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (3,7);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (4,4);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (4,7);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (4,4);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (4,7);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (4,5);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (5,6);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (5,4);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (5,7);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (5,6);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (6,5);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (6,6);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (6,6);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (7,4);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (8,2);
Insert into APP_TGS_NWS (TGS_ID,NWS_ID) values (8,2);

prompt INSERTING into APP_VIDEO
Insert into APP_VIDEO (ID,NAME,URL) values (1,'BMW','http://www.youtube.com/v/dySXmkAEy1A');
Insert into APP_VIDEO (ID,NAME,URL) values (2,'Caro Emerald - Bad romance','http://www.youtube.com/v/vw3zpXrXvf8');
Insert into APP_VIDEO (ID,NAME,URL) values (3,'Oracle Open World 2010','http://www.youtube.com/v/gDCO8xJ_VeE');
Insert into APP_VIDEO (ID,NAME,URL) values (4,'Jamie Oliver','http://www.youtube.com/v/AgHgbn_sVUw');

commit;

prompt Enabling foreign key constraints for APP_ADS_CTT...
alter table APP_ADS_CTT enable constraint ADS_FK;
alter table APP_ADS_CTT enable constraint CTT_FK1;

prompt Enabling foreign key constraints for APP_CTT_CMM...
alter table APP_CTT_CMM enable constraint CMM_FK;
alter table APP_CTT_CMM enable constraint CTT_FK;

prompt Enabling triggers for APP_ADDRESSES...
alter table APP_ADDRESSES enable all triggers;

prompt Enabling triggers for APP_CONTACTS...
alter table APP_CONTACTS enable all triggers;

prompt Enabling triggers for APP_ADS_CTT...
alter table APP_ADS_CTT enable all triggers;

prompt Enabling triggers for APP_COMMS...
alter table APP_COMMS enable all triggers;

prompt Enabling triggers for APP_COM_TYPES...
alter table APP_COM_TYPES enable all triggers;

prompt Enabling triggers for APP_CONTACTTYPES...
alter table APP_CONTACTTYPES enable all triggers;

prompt Enabling triggers for APP_CTT_CMM...
alter table APP_CTT_CMM enable all triggers;

prompt Enabling triggers for APP_DEPARTMENTS...
alter table APP_DEPARTMENTS enable all triggers;

prompt Enabling triggers for APP_EMPLOYEES...
alter table APP_EMPLOYEES enable all triggers;

prompt Enabling triggers for APP_JOBS...
alter table APP_JOBS enable all triggers;

prompt Enabling triggers for APP_REF_CODES...
alter table APP_REF_CODES enable all triggers;

prompt Enabling triggers for APP_USERS...
alter table APP_USERS enable all triggers;

set feedback on
set define on