create database lzy_blog;

drop table User;
drop table MyQuestion;
drop table MyResponse;
drop table MyCollection;

create table User(
	uid int primary key auto_increment,
	username varchar(20),
	password varchar(20),
	secondname varchar(20),
	age int,
	sex varchar(5),
	email varchar(50),
	tximg varchar(20),
	motto varchar(20),
	hobby varchar(20),
	utime timestamp
)default charset=utf8;

create table MyQuestion(
	qid int primary key auto_increment,
	uid int,
	qtitle varchar(50),
	qco varchar(1000),
	qtime timestamp
)default charset=utf8;

create table MyResponse(
	rid int primary key auto_increment,
	qid int,
	uid int,
	rco varchar(1000),
	rtime timestamp
)default charset=utf8;

create table MyCollection(
	cid int primary key auto_increment,
	qid int,
	uid int,
	rid int,
	ctime timestamp
)default charset=utf8;

create table Messages(
	mid int primary key auto_increment,
	uid int,
	mco varchar(1000),
	mtime timestamp
)default charset=utf8;

truncate table User;
truncate table MyQuestion;
truncate table MyResponse;
truncate table MyCollection;
truncate table Messages;

select * from User;
select * from MyQuestion;
select * from MyResponse;
select * from MyCollection;
select * from Messages;

update User set secondname='����Ա' where uid=1;

insert into User(username,secondname,password,tximg) value ('admin','����Ա','admin','tx0.png');
insert into User(username,password,secondname,age,sex,email,hobby,motto,tximg) value ('syy','syy','syy','18','Ů','1084@qq.com','game','i love game','tx2.png');
insert into User(username,password,secondname,age,sex,email,hobby,motto,tximg) value ('zxy','zxy666','Xing��','30','��','6965@qq.com','game','No game No gain!','tx5.png');
insert into User(username,password,secondname,age,sex,email,hobby,motto,tximg) value ('wsk','19970126wsk','Shao��','25','��','2916@qq.com','study','study is my life','tx4.png');
insert into User(username,password,secondname,age,sex,email,hobby,motto,tximg) value ('wyp','wyp2333','WangYP','38','Ů','1178@qq.com','study','i love study','tx1.png');
insert into User(username,password,secondname,age,sex,email,hobby,motto,tximg) value ('lzy','wiselzy','�ɰ���������','19','Ů','1084@qq.com','study','day day up','tx3.png');

insert into MyQuestion(uid,qtitle,qco) value('1','Ӣ�����������Ϸ���׻��ܻ��ã�','��Щʱ���������š��Լ��������ʺ����š�����Ϸ�ĳ��֣����Ƕ�Ӣ�����˵���Ȥ���������ͣ����������ĵ��������Ϸ���ܻ��ã�');
insert into MyQuestion(uid,qtitle,qco) value('1','��Ϸ�������������ʲôӰ���أ�','�ִ��Ƽ����ٷ�չ����Ϸ������ҲԽ��Խ�߶ˣ������ҲԽ��Խ������ٶ�������ǵ�������Ӱ�죬��������ϷӰ�����');
insert into MyQuestion(uid,qtitle,qco) value('2','��ĩ��θ�Ч��ϰ��','��:-(����ĩҪ���ˣ�ǰ��һֱû�кú�ѧϰ���Ҹ���ô���Ч�ʸ�ϰ�أ���������');
insert into MyQuestion(uid,qtitle,qco) value('2','��ĩ������������','��ĩ�����븴ϰ��û�и�ϰ���ϣ�������ѧ��ѧ���������ҪC������ϰ����');
insert into MyQuestion(uid,qtitle,qco) value('3','���ѧϰ�ø���','��˵��ѧ�������ѣ�������ѧ��ѧ���ǵ�����Ҫ��ô������ѧ�ø�����');
insert into MyQuestion(uid,qtitle,qco) value('3','���ѧϰӢ�����','����������ѧ������Ӣ�����ܸ���Ȥ��Ҳ����ѧ�ã����ʴ�������ʲô�����������Ӣ������');
insert into MyQuestion(uid,qtitle,qco) value('4','�ö���Ϸ�������ˣ���û�к������Ϸ�Ƽ�','��Ӣ�����ˡ������Լ����������ˣ���û�к��������Ϸ�Ƽ�ѽ��');
insert into MyQuestion(uid,qtitle,qco) value('4','��ο͹�����������Ϸ��˾','�Լ��Ƴ���ӿ���˴�����������ң�����Ϸ���鼰�Ż���Ϸ��˾����һֱ�������⣬��ο͹�����������˾');
insert into MyQuestion(uid,qtitle,qco) value('5','��ĩ������ʦ�࿼�ϸ��𣿿�������С�����','������������������ֻ�����ʣ���Ҫ����');
insert into MyQuestion(uid,qtitle,qco) value('5','��ĩ���Դ�С��','��ĩ�о�Ҫ���¶�����־ͬ���ϵĲ���');

insert into MyResponse(qid,uid,rco) value('1','1','��������϶�5������');
insert into MyResponse(qid,uid,rco) value('1','2','moba��ϷĿǰû���Ƴ³��£���Ϸ���д������ң���û�и�����ս����Ϸ��̨ǰ�����ɻ����ȥ��');
insert into MyResponse(qid,uid,rco) value('1','3','RNG����ˣ���Ϸ���ᵹ������');

insert into MyResponse(qid,uid,rco) value('2','1','�����Ѿ�֪������Ϸ����̫�����ң���������Ϸ�����Ӻ���');
insert into MyResponse(qid,uid,rco) value('2','2','��Ϸ�����бף�����˵�������Ϸ���Ҵ����˺ܶ���Ȥ�������������ĵ�ʱ��');
insert into MyResponse(qid,uid,rco) value('2','3','���и�ͬѧ����Ϊ����Ϸ��㱻��ѧ����ѧ�ﻹ��Ҫ��ѧԺΪ�أ���Ҫ��Ϊ����Ϸ�ķ��˰���');
insert into MyResponse(qid,uid,rco) value('2','4','�ܶ�����Ϊ��Ϸ׬Ǯ�ˣ�˵ʵ����Ҳ�볢��һ����һ����Ϸ����׬Ǯ');

insert into MyResponse(qid,uid,rco) value('3','1','�ֻ��ػ����ֻ��ػ����ֻ��ػ���');
insert into MyResponse(qid,uid,rco) value('3','2','�Լ��Ҹ������ĵط���һ��Ҫ������');
insert into MyResponse(qid,uid,rco) value('3','3','��ϰ�������в�Σ����غ��ᣡ�������');
insert into MyResponse(qid,uid,rco) value('3','4','��Ҫ��ѧ��ѧ�㸴ϰ���ϵľ���Ҫһ��');
insert into MyResponse(qid,uid,rco) value('3','5','��������ȥͼ���ȥ��ȥѽ����');

insert into MyResponse(qid,uid,rco) value('4','5','���У�˽����ϵ�ң��ҷ���');

insert into MyResponse(qid,uid,rco) value('5','1','��ʵû����˵����ô�ֲ�����ֻҪ�Ͽ����������úø�ϰ��������ѧ�õ�');
insert into MyResponse(qid,uid,rco) value('5','2','�ҿ���·���������ܣ�');
insert into MyResponse(qid,uid,rco) value('5','3','�κ�ϰ���˽�һ�£�ѧ�Դ����˽�һ��');
insert into MyResponse(qid,uid,rco) value('5','5','��ĩ����ѧ��ѧ�㲹ϰ�࣬ȥ���������ã�');

insert into MyResponse(qid,uid,rco) value('6','2','�����ི��');
insert into MyResponse(qid,uid,rco) value('6','3','������Ӣ��������೪��Ч������Ŷ');
insert into MyResponse(qid,uid,rco) value('6','4','�࿴�����磬ƽʱ��ͬѧ�Ի�������Ӣ��');

insert into MyResponse(qid,uid,rco) value('7','4','��DNF�ɣ�����һ���ש');

insert into MyResponse(qid,uid,rco) value('8','1','��Ϸ��˾�뷨�Ǻõģ����Ƕ�����Ϸ���Ż��ͷ����ϵͳ��������');
insert into MyResponse(qid,uid,rco) value('8','2','������˾������˾�����������ӵ�����');
insert into MyResponse(qid,uid,rco) value('8','3','С��˾�첻��̫��������Ϸ��');

insert into MyResponse(qid,uid,rco) value('9','1','���ؿ������ɣ��������');
insert into MyResponse(qid,uid,rco) value('9','3','�����Խ��ˣ�����ܻ����ܲ�');
insert into MyResponse(qid,uid,rco) value('9','4','��������Ҳ�����ף�ǧ�������');
insert into MyResponse(qid,uid,rco) value('9','5','��ʦ���Ǻ��ϸ񣬵������׾����˰�');