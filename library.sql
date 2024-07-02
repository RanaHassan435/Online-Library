/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     5/9/2024 12:34:48 AM                         */
/*==============================================================*/

create database Project;

use Project
go


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"ADD"') and o.name = 'FK_ADD_ADD_ADMIN')
alter table "ADD"
   drop constraint FK_ADD_ADD_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"ADD"') and o.name = 'FK_ADD_ADD2_BOOK')
alter table "ADD"
   drop constraint FK_ADD_ADD2_BOOK
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ADMIN') and o.name = 'FK_ADMIN_ADMININHE_USER')
alter table ADMIN
   drop constraint FK_ADMIN_ADMININHE_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BOOK') and o.name = 'FK_BOOK_WRITTENBY_AUTHOR')
alter table BOOK
   drop constraint FK_BOOK_WRITTENBY_AUTHOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BOOKCOPY') and o.name = 'FK_BOOKCOPY_HAS_BOOK')
alter table BOOKCOPY
   drop constraint FK_BOOKCOPY_HAS_BOOK
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BORROW') and o.name = 'FK_BORROW_BOOROW_ST_STUDENT')
alter table BORROW
   drop constraint FK_BORROW_BOOROW_ST_STUDENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BORROW') and o.name = 'FK_BORROW_BORROW_BO_BOOKCOPY')
alter table BORROW
   drop constraint FK_BORROW_BORROW_BO_BOOKCOPY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STUDENT') and o.name = 'FK_STUDENT_STUDENTIN_USER')
alter table STUDENT
   drop constraint FK_STUDENT_STUDENTIN_USER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"ADD"')
            and   name  = 'ADD2_FK'
            and   indid > 0
            and   indid < 255)
   drop index "ADD".ADD2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"ADD"')
            and   name  = 'ADD_FK'
            and   indid > 0
            and   indid < 255)
   drop index "ADD".ADD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"ADD"')
            and   type = 'U')
   drop table "ADD"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ADMIN')
            and   type = 'U')
   drop table ADMIN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AUTHOR')
            and   type = 'U')
   drop table AUTHOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BOOK')
            and   name  = 'WRITTENBY_FK'
            and   indid > 0
            and   indid < 255)
   drop index BOOK.WRITTENBY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BOOK')
            and   type = 'U')
   drop table BOOK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BOOKCOPY')
            and   name  = 'HAS_FK'
            and   indid > 0
            and   indid < 255)
   drop index BOOKCOPY.HAS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BOOKCOPY')
            and   type = 'U')
   drop table BOOKCOPY
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BORROW')
            and   name  = 'BORROW_BOOKCOPY_FK'
            and   indid > 0
            and   indid < 255)
   drop index BORROW.BORROW_BOOKCOPY_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BORROW')
            and   name  = 'BOOROW_STUDENT_FK'
            and   indid > 0
            and   indid < 255)
   drop index BORROW.BOOROW_STUDENT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BORROW')
            and   type = 'U')
   drop table BORROW
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STUDENT')
            and   type = 'U')
   drop table STUDENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"USER"')
            and   type = 'U')
   drop table "USER"
go

/*==============================================================*/
/* Table: "ADD"                                                 */
/*==============================================================*/
create table "ADD" (
   ID                   int                  not null,
   BOOKID               int                  not null,
   constraint PK_ADD primary key (ID, BOOKID)
)
go

/*==============================================================*/
/* Index: ADD_FK                                                */
/*==============================================================*/




create nonclustered index ADD_FK on "ADD" (ID ASC)
go

/*==============================================================*/
/* Index: ADD2_FK                                               */
/*==============================================================*/




create nonclustered index ADD2_FK on "ADD" (BOOKID ASC)
go

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN (
   ID                   int                  not null,
   PASSWORD             varchar(25)          null,
   FIRSTNAME            varchar(25)          null,
   LASTNAME             varchar(25)          null,
   EMAIL                varchar(50)          null,
   USERNAME             varchar(25)          null,
   constraint PK_ADMIN primary key (ID)
)
go

/*==============================================================*/
/* Table: AUTHOR                                                */
/*==============================================================*/
create table AUTHOR (
   FIRSTNAME            varchar(25)          null,
   LASTNAME             varchar(25)          null,
   BIBLIOGRAPHY         text                 null,
   WRITINGSTYLE         text                 null,
   AWARDS               text                 null,
   AUTHORID             int                  not null,
   constraint PK_AUTHOR primary key (AUTHORID)
)
go

/*==============================================================*/
/* Table: BOOK                                                  */
/*==============================================================*/
create table BOOK (
   TITLE                varchar(50)          null,
   CATEGORY             varchar(50)          null,
   AUTHOR               varchar(50)          null,
   DESCRIPTION          text                 null,
   RATE                 decimal(2,2)         null,
   ISBN                 bigint               null,
   PUBLISHEDYEAR        datetime             null,
   NUMBEROFCOPIES       bigint               null,
   BOOKID               int                  not null,
   AUTHORID             int                  null,
   constraint PK_BOOK primary key (BOOKID)
)
go

/*==============================================================*/
/* Index: WRITTENBY_FK                                          */
/*==============================================================*/




create nonclustered index WRITTENBY_FK on BOOK (AUTHORID ASC)
go

/*==============================================================*/
/* Table: BOOKCOPY                                              */
/*==============================================================*/
create table BOOKCOPY (
   BOOKID               int                  not null,
   COPYBOOKID           int                  not null,
   ACQUISITION_SOURCE   varchar(50)          null,
   STATUS               bit                  null,
   constraint PK_BOOKCOPY primary key (BOOKID, COPYBOOKID)
)
go

/*==============================================================*/
/* Index: HAS_FK                                                */
/*==============================================================*/




create nonclustered index HAS_FK on BOOKCOPY (BOOKID ASC)
go

/*==============================================================*/
/* Table: BORROW                                                */
/*==============================================================*/
create table BORROW (
   ID                   int                  not null,
   BOOKID               int                  not null,
   COPYBOOKID           int                  not null,
   RETURNDATE           datetime             null,
   BORROWDATE           datetime             null,
   constraint PK_BORROW primary key (BOOKID, ID, COPYBOOKID)
)
go

/*==============================================================*/
/* Index: BOOROW_STUDENT_FK                                     */
/*==============================================================*/




create nonclustered index BOOROW_STUDENT_FK on BORROW (ID ASC)
go

/*==============================================================*/
/* Index: BORROW_BOOKCOPY_FK                                    */
/*==============================================================*/




create nonclustered index BORROW_BOOKCOPY_FK on BORROW (BOOKID ASC,
  COPYBOOKID ASC)
go

/*==============================================================*/
/* Table: STUDENT                                               */
/*==============================================================*/
create table STUDENT (
   ID                   int                  not null,
   PASSWORD             varchar(25)          null,
   FIRSTNAME            varchar(25)          null,
   LASTNAME             varchar(25)          null,
   EMAIL                varchar(50)          null,
   USERNAME             varchar(25)          null,
   NUMBER_OF_BORROWED_BOOKS int                  null,
   constraint PK_STUDENT primary key (ID)
)
go

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" (
   PASSWORD             varchar(25)          null,
   FIRSTNAME            varchar(25)          null,
   LASTNAME             varchar(25)          null,
   EMAIL                varchar(50)          null,
   USERNAME             varchar(25)          null,
   ID                   int                  not null,
   constraint PK_USER primary key (ID)
)
go

alter table "ADD"
   add constraint FK_ADD_ADD_ADMIN foreign key (ID)
      references ADMIN (ID)
go

alter table "ADD"
   add constraint FK_ADD_ADD2_BOOK foreign key (BOOKID)
      references BOOK (BOOKID)
go

alter table ADMIN
   add constraint FK_ADMIN_ADMININHE_USER foreign key (ID)
      references "USER" (ID)
go

alter table BOOK
   add constraint FK_BOOK_WRITTENBY_AUTHOR foreign key (AUTHORID)
      references AUTHOR (AUTHORID)
go

alter table BOOKCOPY
   add constraint FK_BOOKCOPY_HAS_BOOK foreign key (BOOKID)
      references BOOK (BOOKID)
go

alter table BORROW
   add constraint FK_BORROW_BOOROW_ST_STUDENT foreign key (ID)
      references STUDENT (ID)
go

alter table BORROW
   add constraint FK_BORROW_BORROW_BO_BOOKCOPY foreign key (BOOKID, COPYBOOKID)
      references BOOKCOPY (BOOKID, COPYBOOKID)
go

alter table STUDENT
   add constraint FK_STUDENT_STUDENTIN_USER foreign key (ID)
      references "USER" (ID)
go


ALTER TABLE BOOK
ALTER COLUMN RATE float;


Alter table [user]
add [type] int not null;

Alter table [user]
add isLogin Bit;




ALTER TABLE Borrow
DROP CONSTRAINT PK_BORROW

ALTER TABLE Borrow
add constraint PK_BORROW primary key (COPYBOOKID)

ALTER TABLE [user]
ADD CONSTRAINT DF_isLogin DEFAULT 0 FOR isLogin;/*False=0*/

ALTER TABLE student
ADD CONSTRAINT DF_number DEFAULT 0 FOR NUMBER_OF_BORROWED_BOOKS;/*False=0*/


ALTER TABLE Borrow
DROP CONSTRAINT PK_BORROW

ALTER TABLE Borrow
add constraint PK_BORROW primary key (COPYBOOKID,BOOkId,ID)

TRUNCATE TABLE [ADMIN];/*done*/

TRUNCATE TABLE [Student];/*done*/


TRUNCATE TABLE [USER];/*done*/

TRUNCATE TABLE borrow;/*done*/

TRUNCATE TABLE book;/*done*/

TRUNCATE TABLE bookcopy;/*done*/

TRUNCATE TABLE author;/*done*/

TRUNCATE TABLE [add];/*done*/


INSERT INTO [USER] (ID, FIRSTNAME, LASTNAME, EMAIL, USERNAME, PASSWORD, type) VALUES
(1, 'Alice', 'Johnson', 'alice@example.com', 'alicej', 'Password123', 0), -- Student
(2, 'Bob', 'Smith', 'bob@example.com', 'bobs', 'Password123', 1), -- Admin
(3, 'Carol', 'Williams', 'carol@example.com', 'carolw', 'Password123', 1), -- Admin
(4, 'David', 'Brown', 'david@example.com', 'davidb', 'Password123', 0); -- Student



INSERT INTO STUDENT (ID, FIRSTNAME, LASTNAME, EMAIL, USERNAME, PASSWORD , NUMBER_OF_BORROWED_BOOKS) VALUES
(1, 'Alice', 'Johnson', 'alice@example.com', 'alicej', 'Password123', 0),
(4, 'David', 'Brown', 'david@example.com', 'davidb', 'Password123' , 0);

INSERT INTO ADMIN (ID, FIRSTNAME, LASTNAME, EMAIL, USERNAME, PASSWORD) VALUES
(2, 'Bob', 'Smith', 'bob@example.com', 'bobs', 'Password123'),
(3, 'Carol', 'Williams', 'carol@example.com', 'carolw', 'Password123');


INSERT INTO AUTHOR (AUTHORID, FIRSTNAME, LASTNAME, BIBLIOGRAPHY, WRITINGSTYLE, AWARDS) VALUES
(1, 'Thomas', 'Cormen', 'Author of Introduction to Algorithms', 'Technical', 'Turing Award'),
(2, 'Robert', 'Martin', 'Author of Clean Code', 'Technical', 'Jolt Award'),
(3, 'Erich', 'Gamma', 'Author of Design Patterns', 'Technical', 'IBM Fellow');


INSERT INTO BOOK (BOOKID, TITLE, CATEGORY, AUTHOR, DESCRIPTION, RATE, ISBN, PUBLISHEDYEAR, NUMBEROFCOPIES, AUTHORID) VALUES
(1, 'Introduction to Algorithms', 'Computer Science', 'Thomas H. Cormen', 'A comprehensive textbook on algorithms.', 4.5, 9780262033848, '2009-07-31', 5, 1),
(2, 'Clean Code', 'Software Engineering', 'Robert C. Martin', 'A handbook of agile software craftsmanship.', 4.7, 9780132350884, '2008-08-01', 3, 2),
(3, 'Design Patterns', 'Software Engineering', 'Erich Gamma', 'Elements of reusable object-oriented software.', 4.6, 9780201633610, '1994-10-21', 4, 3);


INSERT INTO BOOKCOPY (BOOKID, COPYBOOKID, ACQUISITION_SOURCE, STATUS) VALUES
(1, 1, 'Library Purchase', 1),
(1, 2, 'Library Purchase', 1),
(2, 3, 'Library Purchase', 1),
(2, 4, 'Library Purchase', 1),
(3, 5, 'Library Purchase', 1),
(3, 6, 'Library Purchase', 1);


INSERT INTO BORROW (ID, BOOKID, COPYBOOKID, BORROWDATE, RETURNDATE) VALUES
(1, 1, 1, '2024-05-01', '2024-05-15'),
(4, 2, 3, '2024-05-03', '2024-05-17'),
(1, 3, 5, '2024-05-10', '2024-05-24');





TRUNCATE TABLE [add];/*done*/
