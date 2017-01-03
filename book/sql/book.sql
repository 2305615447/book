--创建公告(bbs)表
create table bbs
(
	id int identity(1,1) primary key,	--自增主键
	title varchar(50) not null,		--公告标题
	content varchar(4000),			--公告内容
	showtime datetime			--公告发布时间
)

--创建用户(users)表
create table users
(
	id int identity(1,1) primary key,	--自增主键
	loginName varchar(20) not null,		--用户登录名
	trueName varchar(20),			--用户真实姓名
	password varchar(20) not null,		--登录密码
	city varchar(20),			--用户所在城市
	address varchar(100),			--用户详细地址
	postcode varchar(6),			--邮政编码
	cardNo varchar(24),			--证件号码
	
	grade int,				--等级编号，折扣表外键
	amount float,				--累计消费金额
	phone varchar(20),			--联系电话
	email varchar(200),			--电子邮件地址
	freeze bit,				--该帐户是否被冻结(1可用，0被冻结)
	status int				--用户身份(1普通用户，2网站管理员)
)

--创建图书信息(books)表
create table books
(
	id int identity(1,1) primary key,	--自增主键
	isbn varchar(20) not null,		--ISBN号码
	bookName varchar(200) not null,		--书名
	type int,				--图书类型编号，图书种类表外键
	publisher varchar(100),			--出版社
	author varchar(100),			--图书作者
	introduce varchar(5000),		--图书信息介绍
	price float not null,			--图书价格
	pdate datetime,				--出版时间
	conver varchar(100),			--存储图书封皮图片，此处存储的是图片路径
	intime datetime,			--入库时间
	newBook bit,				--是否为新书(1为真 0为假)
	commend bit,				--是否为推荐图书(1为真 0为假)
	quantity int not null,			--库存数量
	selled int				--销售数量
)


--创建图书种类(bookType)表
create table bookType
(
	id int identity(1,1) primary key,	--自增主键
	typeName varchar(50) not null		--种类名称
)


--创建图书评论(remark)表
create table remark
(
	id int identity(1,1) primary key,	--自增主键
	bookId int,				--图书表外键
	uid int,				--用户表外键
	content varchar(1000)			--评论内容
)

--创建定单(orders)表
create table orders
(
	id int identity(1,1) primary key,	--自增主键
	uid int,				--用户表外键
	pay varchar(50),			--记录用户的付款方式
	carry varchar(50),			--邮寄方式
	address varchar(100),			--邮寄地址
	orderDate datetime,			--定单生成日期
	bz varchar(1000),			--定单备注信息
	enforce bit				--该定单是否已执行完毕(1执行 0未执行)
)

--创建定单明细(orderDetail)表
create table orderDetail
(
	id int identity(1,1) primary key,	--自增主键
	orderId int,				--定单表外键
	bookId int,				--图书表外键
	quantity int,				--该类商品的购买数量
)


--创建投票信息(poll)表
create table poll
(
	id int identity(1,1) primary key,	--自增主键
	optionName varchar(50) not null,	--投票选项
	poll int				--得票数
)

--创建折扣(rebate)表
create table rebate
(
	id int identity(1,1) primary key,	--自增主键
	amount float,				--每个折扣等级对应的金额
	rebate float				--每个等级对应的折扣
)
