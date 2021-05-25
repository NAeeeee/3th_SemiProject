
#sql 계정 생성 , 권한 부여
create user semiadmin identified by semiadmin;

grant resource, connect to semiadmin;



#member 테이블 생성,sequence 생성
create table member(
member_no number primary key,
member_id varchar2(20) not null,
member_pw varchar2(20) not null,
member_name varchar(21) not null,
member_birth date not null,
member_gender char(1) check(member_gender in ('M', 'F')),
member_email varchar2(50) not null,
member_address varchar2(300) not null,
member_point number default 0 not null check(member_point >= 0),
member_phone varchar2(11) not null,
member_admin char(1) default 'N' not null check(member_admin in ('Y', 'N')),
member_join date default sysdate not null
);

create sequence member_seq nocache;



