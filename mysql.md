# MySql数据库简单操作

### mysql 数据库导入导出

```
- 导出
mysqldump -h IP -u 用户名 -p -d 数据库名 > 导出的文件名
参数解析：
-h:表示host地址
-u:表示user用户
-p:表示password密码
-d:表示不导出数据


- 导入
首先创建对应的数据库名，然后执行下面代码
source+文件路径
```



### 简单操作

```
mysql -h localhost -u root -p（进入mysql下面）

create database dbtest; (创建数据库)

show databases;(查看数据库列表)

use dbtest;(进入dbtest数据库下面)

show tables;(刚创建的数据库dbtest下面空没有表)

source C:\Users\Administrator\Desktop\users2.sql（导入数据库表）

show tables;(查看dbtest数据库下面的所有表,就可以看到表了)

desc users;(查看表结构设计)

select * from users;(查询所有的数据)

exit;(或者ctrl + c)退出mysql
————————————————
原文链接：https://blog.csdn.net/u013626215/java/article/details/88548342
```

