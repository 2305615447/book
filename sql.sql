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

--创建公告(bbs)表
create sequence seq_bbs start with 1;
create table bbs(
  bbsid Integer primary key,  --自增主键
  title varchar2(50) not null,    --公告标题
  bbscontext varchar2(4000),      --公告内容
  showtime date     --公告发布时间
) ;


insert into bbs values(seq_bbs.nextval,'暑假购书月活动开始啦','炎炎夏日已到，美好的暑假就要来了，
在这个漫长的假期中，你在家里吹着空调开着电脑，会不会生出空虚之感？为了让大家能享受到充实而有趣的假期，本站举办了暑假购书月活动，
凡凭学生证在本站购书，均享受8折优惠，时间为7月1日至8月31日！',to_date('2017-01-03','yyyy-mm-dd'));



--创建用户(users)表
create sequence seq_bookuser start with 1;
create table bookuser
(
  userid integer primary key,  --自增主键
  userName varchar2(20) not null,    --用户登录名
  trueName varchar2(20),      --用户真实姓名
  userpwd varchar2(20) not null,    --登录密码
  city varchar2(20),      --用户所在城市
  address varchar2(100),      --用户详细地址
  postcode varchar2(6),      --邮政编码
  cardNo varchar2(24),      --证件号码
  grade integer,        --等级编号，折扣表外键
  amount float,        --累计消费金额
  phone varchar2(20),      --联系电话
  email varchar2(200),      --电子邮件地址
  freeze integer,        --该帐户是否被冻结(1可用，0被冻结)
  status integer        --用户身份(1普通用户，2网站管理员)
);

insert into bookuser values(seq_bookuser.nextval,'mike','马志国','888888','徐州市','江苏省徐州市解放南路181号','221000','320726186702030011',1,5000.0,'13814423344','mikegood@163.com',1,2);
insert into bookuser values(seq_bookuser.nextval,'badboy','捣蛋鬼','444444','未知','未知','未知','未知',1,0.0,'未知','未知',0,1);
insert into bookuser values(seq_bookuser.nextval,'accp','小小鸟','222222','徐州市','江苏省徐州市解放南路181号','221000','320726186702030011',1,5000.0,'13814423344','mikegood@163.com',1,1);

--select * from bookuser;


--创建图书种类(bookType)表
create sequence seq_bookType start with 1;
create table bookType
(
  bTypeid integer primary key,  --自增主键
  bTypeName varchar2(50) not null    --种类名称
);

insert into bookType values(seq_bookType.Nextval,'计算机');
insert into bookType values(seq_bookType.Nextval,'小说');
insert into bookType values(seq_bookType.Nextval,'人物传记');
insert into bookType values(seq_bookType.Nextval,'经济类');
--select * from bookType;

--创建图书信息(books)表
create sequence seq_book start with 1;
create table book
(
  bookid Integer primary key,    --自增主键
  isbn varchar2(20) not null,--ISBN号码
  bookName varchar2(200) not null,    --书名
  booktype integer references bookType(bTypeid),                  --图书类型编号，图书种类表外键
  publisher varchar2(100),   --出版社
  author varchar2(100),      --图书作者
  introduce varchar2(1000),  --图书信息介绍
  price float not null,      --图书价格
  pdate date,            --出版时间
  conver varchar2(100),      --存储图书封皮图片，此处存储的是图片路径
  intime date,               --入库时间
  newBook integer,           --是否为新书(1为真 0为假)
  commend integer,           --是否为推荐图书(1为真 0为假)
  quantity integer not null,     --库存数量
  selled integer                 --销售数量
);

insert into book values(seq_book.nextval,'9787505418868',
'哪一年让一生改变',1,'朝华出版社','姬流觞',
'一份契',25.00,to_date('2015-01-03','yyyy-mm-dd'),'00',to_date('2017-01-03','yyyy-mm-dd'),1,1,500,120);
--select * from book;


--创建图书评论(remark)表
create sequence seq_remark start with 1;
create table remark(
  remarkid integer primary key,  --自增主键
  bookid integer references book(bookid),        --图书表外键
  userid integer references bookuser(userid),        --用户表外键
  rmcontent varchar2(1000)      --评论内容
)

insert into remark values(seq_remark.nextval,1,1,'55555');
--select * from remark;

--创建定单(orders)表
create sequence seq_orders start with 1;
create table orders
(
  orderid integer primary key,  --自增主键
  userid integer references bookuser(userid),        --用户表外键
  pay varchar2(50),      --记录用户的付款方式
  carry varchar2(50),      --邮寄方式
  address varchar2(100),      --邮寄地址
  orderDate date,      --定单生成日期
  bz varchar2(1000),      --定单备注信息
  enforces integer        --该定单是否已执行完毕(1执行 0未执行)
);
insert into orders values(seq_orders.nextval,1,'未知','未知','衡阳',to_date('2017-01-03','yyyy-mm-dd'),'000',0);
--select * from orders;

--创建定单明细(orderDetail)表
create sequence seq_orderDetail start with 1;
create table orderDetail
(
  odid integer primary key,  --自增主键
  orderId integer references orders(orderid),        --定单表外键
  bookId integer references book(bookid),        --图书表外键
  quantity integer        --该类商品的购买数量
);
insert into orderDetail values(seq_orderDetail.Nextval,1,1,1);
--select * from orderDetail
