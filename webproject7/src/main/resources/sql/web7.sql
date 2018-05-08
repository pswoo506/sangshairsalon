-- Project 

-- 고객 정보 테이블
create table customer (
	id			varchar2(20) primary key,	
	password	varchar2(20) not null,		
	name		varchar2(30) not null,		
	email		varchar2(30),				
	phonenum	varchar2(30) not null,		
	address		varchar2(100)				
);

--예약 테이블
create table reservation (
	reservenum number primary key,
	id varchar2(20) not null, 
	reservedate date default sysdate,
	hairstyle varchar2(40) not null,
	designer varchar2(40) not null,
	reservetime varchar2(30) not null,
	requesttext varchar2(100),	
	constraint reservation_fk foreign key(id) references customer(id)
);

--예약 시퀀스
create sequence reservation_seq;


-- 게시판 본문 글
create table board (
	boardnum		number	primary key,		
	id				varchar2(20) not null,		
	title			varchar2(100) not null,		
	content			varchar2(2000) not null,	
	inputdate		date	default sysdate,	
	hits			number 	default 0,			
	originalfile	varchar2(200),				
	savedfile		varchar2(100)				
);

-- 게시판 일련번호에 사용할 시퀀스 
create sequence board_seq start with 1 increment by 1;

-- 리플 내용
create table reply (
	replynum		number	primary key,		
	boardnum		number not null,			
	id				varchar2(20) not null,		
	text			varchar2(200) not null,		
	inputdate		date 	default sysdate,	
	constraint reply_fk foreign key(boardnum) 
		references board(boardnum) on delete cascade
);

-- 리플에 사용할 시퀀스
create sequence reply_seq start with 1 increment by 1;

