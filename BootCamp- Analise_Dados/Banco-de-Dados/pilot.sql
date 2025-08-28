Microsoft Windows [versão 10.0.26100.4946]
(c) Microsoft Corporation. Todos os direitos reservados.

C:\Users\deivi>mysql deivid
'mysql' não é reconhecido como um comando interno
ou externo, um programa operável ou um arquivo em lotes.

C:\Users\deivi>mysql deivi
'mysql' não é reconhecido como um comando interno
ou externo, um programa operável ou um arquivo em lotes.

C:\Users\deivi>mysql
'mysql' não é reconhecido como um comando interno
ou externo, um programa operável ou um arquivo em lotes.

C:\Users\deivi>cd C:\Program Files\MySQL\

C:\Program Files\MySQL>cd
C:\Program Files\MySQL

C:\Program Files\MySQL>"MySQL Server 9.4"
'"MySQL Server 9.4"' não é reconhecido como um comando interno
ou externo, um programa operável ou um arquivo em lotes.

C:\Program Files\MySQL>cd "MySQL Server 9.4"

C:\Program Files\MySQL\MySQL Server 9.4>cd bin

C:\Program Files\MySQL\MySQL Server 9.4\bin>mysql -u root -p
Enter password: ****
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)

C:\Program Files\MySQL\MySQL Server 9.4\bin>mysql -u root -p
Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 9.4.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.033 sec)

mysql> CREATE DATABASE FACULDADE
    ->
    ->
    -> ^C
mysql> CREATE DATABASE FACULDADE
    -> CREATE DATABASE FACULDADE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CREATE DATABASE FACULDADE' at line 2
mysql> CREATE DATABASE FACULDADE;
Query OK, 1 row affected (0.050 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| faculdade          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.007 sec)

mysql> USE faculdade
Database changed
mysql> CREATE TABLE alunos(
    -> ra INT AUTO_INCREMENT PRIMARY KEY,
    -> nome VARCHAR(20),
    -> idade INT,
    -> ra_sistema INT
    -> );
Query OK, 0 rows affected (0.156 sec)

mysql> CREATE TABLE sistema(
    -> ra INTEGER AUTO_INCREMENT,
    -> nome_universidade VARCHAR(120) UNIQUE,
    -> campus VARCHAR(5),
    -> PRIMARY KEY(id)
    -> );
ERROR 1072 (42000): Key column 'id' doesn't exist in table
mysql> CREATE TABLE sistema(
    -> ra INT AUTO_INCREMENT PRIMARY KEY,
    -> nome VARCHAR(20),
    -> PRIMARY KEY(ra)
    -> );
ERROR 1068 (42000): Multiple primary key defined
mysql> CREATE TABLE sistema(
    -> ra INTEGER AUTO_INCREMENT,
    -> nome_universidade VARCHAR(120) UNIQUE,
    -> campus VARCHAR(5),
    -> PRIMARY KEY(ra)
    -> );
Query OK, 0 rows affected (0.722 sec)

mysql> ALTER TABLE alunos ADD CONSTRAINT fk_ra_sistema FOREING KEY (ra_sistema) REFERENCES sistema);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FOREING KEY (ra_sistema) REFERENCES sistema)' at line 1
mysql> ALTER TABLE alunos ADD CONSTRAINT fk_ra_sistema FOREING KEY (ra_sistema) REFERENCES sistema(ra);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FOREING KEY (ra_sistema) REFERENCES sistema(ra)' at line 1
mysql> ALTER TABLE alunos ADD CONSTRAINT fk_ra_sistema FOREIGn KEY (ra_sistema) REFERENCES sistema(ra);
Query OK, 0 rows affected (0.497 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO editora (nome_aluno, idade) VALUES ('JAMES', '22'), ('DAVID' , '21');
ERROR 1146 (42S02): Table 'faculdade.editora' doesn't exist
mysql> INSERT INTO sistema (nome_universidade, campus) VALUES ('UTFPR', 'AP'), ('UNESP' , 'RP');
Query OK, 2 rows affected (0.052 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM sistema
    ->
    -> ^C
mysql> SELECT * FROM sistema;
+----+-------------------+--------+
| ra | nome_universidade | campus |
+----+-------------------+--------+
|  1 | UTFPR             | AP     |
|  2 | UNESP             | RP     |
+----+-------------------+--------+
2 rows in set (0.004 sec)

mysql> INSERT INTO alunos(nome, idade, ra_sistema) VALUES ('James', '22', '1');
Query OK, 1 row affected (0.043 sec)

mysql> SELECT * FROM alunos
    -> ^C
mysql> SELECT * FROM alunos;
+----+-------+-------+------------+
| ra | nome  | idade | ra_sistema |
+----+-------+-------+------------+
|  1 | James |    22 |          1 |
+----+-------+-------+------------+
1 row in set (0.004 sec)