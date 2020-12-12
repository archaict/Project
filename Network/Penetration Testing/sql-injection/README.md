<h1 align="center"> SQL Injection </h1>
<h4 align = "center"> <b> Hi, foundation sixty four here. </b><br>
<i><sup> Agents, anomalies has been detected in your repo's. </sup></i></h4>

# SQL Injection

[WARNING: WRITER ARE NOT RESPONSIBLE FOR ANY MISUSE OR DAMAGE CAUSED BY USING TOOLS MENTIONED IN THIS REPO. IT IS ILLEGAL TO USE THIS TOOLS WITHOUT MUTUAL CONSENT, YOU'VE BEEN WARNED!]

Sql injection is a type of attack that we use for injecting code into a database, the code can be malicious based on the intended action and results wanted. This type of attack can delete your entire database, let's say you have a database and you didn't use safety regulation that has been provided in the internet (you might have to search for latest security approach that you can implement in your databases code).

To do sql injection, you can use your browser to blind sql injecting or you can use tools like sqlmap to automate injecting the code.

## SQL Syntax

All the syntax that you have to use can be anything from, `SELECT`, `FROM`, `OR`, `AND`, or any other syntax that usually found inside sql databases.

# Setup Lab

## Create Project Database

In here, I use MariaDB to create databases, you can use mysql instead, it'll be the same process.

This script will autogenerate database from your cli using the sql script that have been provided here, you can download `project_schema.sql` from this repo.

If you want a simple database, you can use this command to generate a lab database, you might want to use `root` as `yourusername`.

```
$ mysql --user="yourusername" -p < /path/to/project_schema.sql
```

This database then will be created by using command above:

```
+----------+------------------+------+-----+---------+----------------+
| Field    | Type             | Null | Key | Default | Extra          |
+----------+------------------+------+-----+---------+----------------+
| id       | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| username | varchar(30)      | NO   |     | NULL    |                |
| passwd   | varchar(30)      | NO   |     | NULL    |                |
| email    | varchar(40)      | NO   |     | NULL    |                |
+----------+------------------+------+-----+---------+----------------+
```

If you prefer doing it manually, you can go into your database with `sudo mysql` command, you'll prompted with password as `sudo` user.
You can use commands below to create your database.

```
$ sudo mysql


MariaDB [(none)]> show databases;

+--------------------+
| Database           |
+--------------------+
| 1st_database       |
| 2nd_database       |
| 3rd_database       |
+--------------------+
3 rows in set (0.001 sec)

MariaDB [(none)]> create database project;

MariaDB [(none)]> show databases;

+--------------------+
| Database           |
+--------------------+
| 1st_database       |
| 2nd_database       |
| 3rd_database       |
| project            |
+--------------------+
4 rows in set (0.001 sec)

MariaDB [(none)]> create table user(id int(11) unsigned auto_increment primary key not null, username varchar (30) not null, passwd varchar(30) not null, email varchar(40) not null); 

MariaDB [project]> show tables;
+---------------------------+
| Tables_in_project         |
+---------------------------+
| user                      |
+---------------------------+
1 row in set (0.001 sec)

MariaDB [project]> describe user;
+----------+------------------+------+-----+---------+----------------+
| Field    | Type             | Null | Key | Default | Extra          |
+----------+------------------+------+-----+---------+----------------+
| id       | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| username | varchar(30)      | NO   |     | NULL    |                |
| passwd   | varchar(30)      | NO   |     | NULL    |                |
| email    | varchar(40)      | NO   |     | NULL    |                |
+----------+------------------+------+-----+---------+----------------+
4 rows in set (0.002 sec)

```

<!-- # Sqlmap Sqlmap is a tool that you can use for automating sql injection, yo-->

