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

update User set secondname='管理员' where uid=1;

insert into User(username,secondname,password,tximg) value ('admin','管理员','admin','tx0.png');
insert into User(username,password,secondname,age,sex,email,hobby,motto,tximg) value ('syy','syy','syy','18','女','1084@qq.com','game','i love game','tx2.png');
insert into User(username,password,secondname,age,sex,email,hobby,motto,tximg) value ('zxy','zxy666','Xing阳','30','男','6965@qq.com','game','No game No gain!','tx5.png');
insert into User(username,password,secondname,age,sex,email,hobby,motto,tximg) value ('wsk','19970126wsk','Shao昆','25','男','2916@qq.com','study','study is my life','tx4.png');
insert into User(username,password,secondname,age,sex,email,hobby,motto,tximg) value ('wyp','wyp2333','WangYP','38','女','1178@qq.com','study','i love study','tx1.png');
insert into User(username,password,secondname,age,sex,email,hobby,motto,tximg) value ('lzy','wiselzy','可爱的梁紫怡','19','女','1084@qq.com','study','day day up','tx3.png');

insert into MyQuestion(uid,qtitle,qco) value('1','英雄联盟这款游戏到底还能火多久？','近些时间来，随着“吃鸡”、“彩虹六号”等游戏的出现，人们对英雄联盟的兴趣度有所降低，试问在座的到底这款游戏还能火多久？');
insert into MyQuestion(uid,qtitle,qco) value('1','游戏对你生活产生了什么影响呢？','现代科技飞速发展，游戏的制作也越来越高端，玩的人也越来越多或多或少都会对我们的生活有影响，你的生活被游戏影响了嘛？');
insert into MyQuestion(uid,qtitle,qco) value('2','期末如何高效复习？','唉:-(，期末要来了，前面一直没有好好学习，我该怎么提高效率复习呢？求大神帮助');
insert into MyQuestion(uid,qtitle,qco) value('2','期末资料有人有吗？','期末考试想复习，没有复习资料，请问有学长学姐有嘛？我需要C语音复习资料');
insert into MyQuestion(uid,qtitle,qco) value('3','如何学习好高数','都说大学高数很难，想问问学姐学长们到底我要怎么样才能学好高数？');
insert into MyQuestion(uid,qtitle,qco) value('3','如何学习英语口语','我是外国语的学生，对英语口语很感兴趣，也很想学好，请问大神们有什么方法可以提高英语口语嘛？');
insert into MyQuestion(uid,qtitle,qco) value('4','好多游戏都玩腻了，有没有好玩的游戏推荐','“英雄联盟”、“吃鸡”都玩腻了，有没有好玩的新游戏推荐呀？');
insert into MyQuestion(uid,qtitle,qco) value('4','如何客观评价蓝洞游戏公司','吃鸡推出后，涌入了大量国内外玩家，可游戏体验及优化游戏公司做的一直不如人意，如何客观评价蓝洞公司');
insert into MyQuestion(uid,qtitle,qco) value('5','期末考试老师监考严格吗？可以做点小动作嘛？','哈哈哈哈哈哈哈，我只是问问，不要介意');
insert into MyQuestion(uid,qtitle,qco) value('5','期末考试打小抄','期末感觉要出事儿！有志同道合的不？');

insert into MyResponse(qid,uid,rco) value('1','1','不出意外肯定5年以上');
insert into MyResponse(qid,uid,rco) value('1','2','moba游戏目前没有推陈出新，游戏仍有大基数玩家，在没有更有挑战性游戏出台前，依旧会火下去的');
insert into MyResponse(qid,uid,rco) value('1','3','RNG夺冠了，游戏不会倒！！！');

insert into MyResponse(qid,uid,rco) value('2','1','男朋友就知道打游戏，不太关心我，让他和游戏过日子好了');
insert into MyResponse(qid,uid,rco) value('2','2','游戏有利有弊，可以说合理的游戏给我带来了很多乐趣，尤其是在无聊的时候');
insert into MyResponse(qid,uid,rco) value('2','3','我有个同学就因为打游戏差点被退学，大学里还是要以学院为重，不要因为打游戏荒废了啊！');
insert into MyResponse(qid,uid,rco) value('2','4','很多人因为游戏赚钱了，说实话我也想尝试一下做一个游戏主播赚钱');

insert into MyResponse(qid,uid,rco) value('3','1','手机关机！手机关机！手机关机！');
insert into MyResponse(qid,uid,rco) value('3','2','自己找个安静的地方，一定要安静！');
insert into MyResponse(qid,uid,rco) value('3','3','复习有条理有层次，先重后轻！先主后次');
insert into MyResponse(qid,uid,rco) value('3','4','能要到学长学姐复习资料的尽量要一下');
insert into MyResponse(qid,uid,rco) value('3','5','我们组团去图书馆去不去呀？？');

insert into MyResponse(qid,uid,rco) value('4','5','我有，私信联系我，我发你');

insert into MyResponse(qid,uid,rco) value('5','1','其实没别人说的那么恐怖，你只要上课认真听，好好复习，绝对能学好的');
insert into MyResponse(qid,uid,rco) value('5','2','挂科了路过，很难受！');
insert into MyResponse(qid,uid,rco) value('5','3','课后习题了解一下，学霸答疑了解一下');
insert into MyResponse(qid,uid,rco) value('5','5','期末会有学长学姐补习班，去听听很有用！');

insert into MyResponse(qid,uid,rco) value('6','2','多听多讲！');
insert into MyResponse(qid,uid,rco) value('6','3','多听听英语歌曲，多唱唱效果不错哦');
insert into MyResponse(qid,uid,rco) value('6','4','多看看美剧，平时和同学对话可以用英语');

insert into MyResponse(qid,uid,rco) value('7','4','来DNF吧，和我一起搬砖');

insert into MyResponse(qid,uid,rco) value('8','1','游戏公司想法是好的，但是对于游戏的优化和反外挂系统过于垃圾');
insert into MyResponse(qid,uid,rco) value('8','2','蓝洞公司垃圾公司，有种族歧视的嫌疑');
insert into MyResponse(qid,uid,rco) value('8','3','小公司造不出太完美的游戏！');

insert into MyResponse(qid,uid,rco) value('9','1','遵守考场纪律，认真答题');
insert into MyResponse(qid,uid,rco) value('9','3','别动歪脑筋了，你可能会死很惨');
insert into MyResponse(qid,uid,rco) value('9','4','做不出来也别作弊，千万别作弊');
insert into MyResponse(qid,uid,rco) value('9','5','老师不是很严格，但是作弊就算了吧');