/*******************************************************/
/*업로드 마지막 : 김준영 */
/******************************************************/

show databases;
use jspmodel2;
show tables;


-------------------------------------------------------------
/*일반 회원 테이블 구조, (아이디 -> 이메일 대체)  */
-- 회원가입 페이지 2개 (사업자 전용, 손님 전용)  만들기


create table member ( /*회원전용 테이블*/
id_number int(10) primary key  auto_increment, 
email_id varchar(20) unique not null,
nickname varchar(20) not null unique,
password varchar(20) not null,
phone varchar(20) not null unique,
grade varchar(20), -- 기본1부여
agree varchar(2)  /*수신 동의 여부*/
/*이거 아마 체크박스로 해서 동의 값 넘어온다고 했던거 같네요*/
); 
----------------------------------------------------------------

create table business_member ( /*사업자 전용*/
bs_idnumber int (10) primary key auto_increment,  /*사업자의 아이디 번호*/
bs_email_id varchar(20) unique not null,
bs_nickname varchar(20) not null unique,
bs_password varchar(20) not null,
bs_phone varchar(20) not null unique,
bs_number int(20) not null  unique /*사업자등록번호*/

); 

/* order가 예약어라서 food 썼습니당*/
create table order_food ( /*주문 테이블*/
order_number int primary key auto_increment,
id_number int(10) unique, /*고객 번호*/
bs_idnumber int(10) unique, /*업체 번호*/
FOREIGN KEY(id_number) REFERENCES member(id_number), /*고객번호*/
FOREIGN KEY(bs_idnumber) REFERENCES business_member(bs_number), /*그냥 번호 */
menu varchar(10) not null,
price int (20) not null,
address varchar(20) not null,
/***********************************************/
/*일단 잠시만 한글 해놓을게요*/
결제방식 varchar(2) not null,
사장님요청 varchar(200) not null,
고객연락처  varchar(20) not null,
주문확인  varchar(5) not null,
소유시간 varchar(5) not null,
-- 주문시간 varchar(5) not null, /* 이거 잠시 보류*/
수락 varchar(5) not null
/***********************************************/
);

create table coupon( /*쿠폰 테이블*/
c_no int(10) primary key  auto_increment unique,
coupon int(10) not null unique
);

create table review (/*후기 페이지*/
review_number int (10) primary key auto_increment,
bs_idnumber int(10) not null, /*업체 번호*/
id_number int (10) not null, /*회원 번호*/
FOREIGN KEY(bs_idnumber) REFERENCES business_member(bs_number), /*업체번호*/
FOREIGN KEY(id_number) REFERENCES member(id_number), /*그냥회원 번호 */
user_picture varchar(30) not null, /*썸네일할 경로 */
star varchar(5) not null /*별점, 점 개수로 Ranking */
);
