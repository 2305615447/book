drop table orderDetail;
drop sequence seq_orderDetail;
drop table orders;
drop sequence seq_orders;
drop table remark;
drop sequence seq_remark;
drop table book;
drop sequence seq_bookType;
drop sequence seq_book;
drop table bookType;
drop sequence seq_bookuser;
drop table bookuser;
drop table bbs;
drop sequence seq_bbs;

--��������(bbs)��
create sequence seq_bbs start with 1;
create table bbs(
  bbsid Integer primary key,  --��������
  title varchar2(50) not null,    --�������
  bbscontext varchar2(4000),      --��������
  showtime date     --���淢��ʱ��
) ;


insert into bbs values(seq_bbs.nextval,'��ٹ����»��ʼ��','���������ѵ������õ���پ�Ҫ���ˣ�
����������ļ����У����ڼ��ﴵ�ſյ����ŵ��ԣ��᲻����������֮�У�Ϊ���ô�������ܵ���ʵ����Ȥ�ļ��ڣ���վ�ٰ�����ٹ����»��
��ƾѧ��֤�ڱ�վ���飬������8���Żݣ�ʱ��Ϊ7��1����8��31�գ�',to_date('2017-01-03','yyyy-mm-dd'));



--�����û�(users)��
create sequence seq_bookuser start with 1;
create table bookuser
(
  userid integer primary key,  --��������
  userName varchar2(20) not null,    --�û���¼��
  trueName varchar2(20),      --�û���ʵ����
  userpwd varchar2(20) not null,    --��¼����
  city varchar2(20),      --�û����ڳ���
  address varchar2(100),      --�û���ϸ��ַ
  postcode varchar2(6),      --��������
  cardNo varchar2(24),      --֤������
  grade integer,        --�ȼ���ţ��ۿ۱����
  amount float,        --�ۼ����ѽ��
  phone varchar2(20),      --��ϵ�绰
  email varchar2(200),      --�����ʼ���ַ
  freeze integer,        --���ʻ��Ƿ񱻶���(1���ã�0������)
  status integer        --�û����(1��ͨ�û���2��վ����Ա)
);

insert into bookuser values(seq_bookuser.nextval,'mike','��־��','888888','������','����ʡ�����н����·181��','221000','320726186702030011',1,5000.0,'13814423344','mikegood@163.com',1,2);
insert into bookuser values(seq_bookuser.nextval,'badboy','������','444444','δ֪','δ֪','δ֪','δ֪',1,0.0,'δ֪','δ֪',0,1);
insert into bookuser values(seq_bookuser.nextval,'accp','СС��','222222','������','����ʡ�����н����·181��','221000','320726186702030011',1,5000.0,'13814423344','mikegood@163.com',1,1);

--select * from bookuser;


--����ͼ������(bookType)��
create sequence seq_bookType start with 1;
create table bookType
(
  bTypeid integer primary key,  --��������
  bTypeName varchar2(50) not null    --��������
);

insert into bookType values(seq_bookType.Nextval,'�����');
insert into bookType values(seq_bookType.Nextval,'С˵');
insert into bookType values(seq_bookType.Nextval,'���ﴫ��');
insert into bookType values(seq_bookType.Nextval,'������');
--select * from bookType;

--����ͼ����Ϣ(books)��
create sequence seq_book start with 1;
create table book
(
  bookid Integer primary key,    --��������
  isbn varchar2(20) not null,--ISBN����
  bookName varchar2(200) not null,    --����
  booktype integer references bookType(bTypeid),                  --ͼ�����ͱ�ţ�ͼ����������
  publisher varchar2(100),   --������
  author varchar2(100),      --ͼ������
  introduce varchar2(1000),  --ͼ����Ϣ����
  price float not null,      --ͼ��۸�
  pdate date,            --����ʱ��
  conver varchar2(100),      --�洢ͼ���ƤͼƬ���˴��洢����ͼƬ·��
  intime date,               --���ʱ��
  newBook integer,           --�Ƿ�Ϊ����(1Ϊ�� 0Ϊ��)
  commend integer,           --�Ƿ�Ϊ�Ƽ�ͼ��(1Ϊ�� 0Ϊ��)
  quantity integer not null,     --�������
  selled integer                 --��������
);

insert into book values(seq_book.nextval,'9787505418868',
'��һ����һ���ı�',1,'����������','������',
'һ����',25.00,to_date('2015-01-03','yyyy-mm-dd'),'00',to_date('2017-01-03','yyyy-mm-dd'),1,1,500,120);
--select * from book;


--����ͼ������(remark)��
create sequence seq_remark start with 1;
create table remark(
  remarkid integer primary key,  --��������
  bookid integer references book(bookid),        --ͼ������
  userid integer references bookuser(userid),        --�û������
  rmcontent varchar2(1000)      --��������
)

insert into remark values(seq_remark.nextval,1,1,'55555');
--select * from remark;

--��������(orders)��
create sequence seq_orders start with 1;
create table orders
(
  orderid integer primary key,  --��������
  userid integer references bookuser(userid),        --�û������
  pay varchar2(50),      --��¼�û��ĸ��ʽ
  carry varchar2(50),      --�ʼķ�ʽ
  address varchar2(100),      --�ʼĵ�ַ
  orderDate date,      --������������
  bz varchar2(1000),      --������ע��Ϣ
  enforces integer        --�ö����Ƿ���ִ�����(1ִ�� 0δִ��)
);
insert into orders values(seq_orders.nextval,1,'δ֪','δ֪','����',to_date('2017-01-03','yyyy-mm-dd'),'000',0);
--select * from orders;

--����������ϸ(orderDetail)��
create sequence seq_orderDetail start with 1;
create table orderDetail
(
  odid integer primary key,  --��������
  orderId integer references orders(orderid),        --���������
  bookId integer references book(bookid),        --ͼ������
  quantity integer        --������Ʒ�Ĺ�������
);
insert into orderDetail values(seq_orderDetail.Nextval,1,1,1);
--select * from orderDetail
