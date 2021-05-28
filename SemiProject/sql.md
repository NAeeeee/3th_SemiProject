
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


#qna_board 테이블 생성 , sequence 생성
create table qna_board(
qna_board_no number(19) primary key,
qna_board_header varchar2(15) check(qna_board_header in('주문/결제','배송','환불/교환','기타')) not null,
qna_board_title varchar2(300) not null,
qna_board_content varchar2(4000) not null,
qna_board_writer references member(member_no) on delete cascade,
qna_board_time date default sysdate not null,
qna_board_reply number default 0 not null
);

create sequence qna_board_seq nocache;

#qna_reply 테이블, 시퀀스 생성
DROP TABLE qna_reply;
CREATE TABLE qna_reply(
qna_reply_no NUMBER(19) PRIMARY KEY,
qna_reply_content varchar2(4000),
qna_reply_time DATE DEFAULT sysdate NOT NULL,
qna_reply_writer REFERENCES member(member_no) ON DELETE SET NULL,
qna_reply_origin REFERENCES qna_board(qna_board_no) ON DELETE CASCADE
);

CREATE SEQUENCE qna_reply_seq nocache;

#(qna_reply , member) join view 생성
DROP VIEW qna_reply_member;
CREATE VIEW qna_reply_member AS
SELECT 
	R.qna_reply_no, R.qna_reply_content, R.qna_reply_time, R.qna_reply_writer, R.qna_reply_origin,
	M.member_no, M.member_id, M.member_admin
FROM qna_reply R
	LEFT OUTER JOIN MEMBER M ON R.qna_reply_writer = M.member_no;


#notice 테이블 , 시퀀스 생성
create table notice_board(
notice_board_no number(19) primary key,
notice_board_header varchar2(15) check(notice_board_header in('공지','이벤트')) not null,
notice_board_title varchar2(300) not null,
notice_board_content varchar2(4000) not null,
notice_board_writer references member(member_no) on delete cascade,
notice_board_time date default sysdate not null,
notice_board_read number default 0 not null
);

CREATE SEQUENCE notice_seq nocache;	

#book 테이블 생성, sequence 생성
create table book(
book_no number(10) primary key,
book_name varchar2(150) not null,
book_writer varchar2(50) not null,
book_publisher varchar2(50) not null,
book_genre varchar2(30) not null,
book_nation varchar2(30) not null,
book_price number(10) not null,
book_info varchar(4000) ,
book_img varchar2(100),
book_table varchar2(4000),
book_start date  default sysdate not null
);
create sequence book_seq;




