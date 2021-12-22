-- cargar el respaldo de la base 

postgres=# CREATE DATABASE productos;
CREATE DATABASE
postgres=# \c productos
Ahora está conectado a la base de datos «productos» con el usuario «administrador».
productos=# \i C:/unidad2.sql
SET
SET
SET
SET
SET
 set_config
------------

(1 fila)


SET
SET
SET
SET
CREATE EXTENSION
COMMENT
SET
SET
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
COPY 10
COPY 32
COPY 42
COPY 20
 setval
--------
     12
(1 fila)


 setval
--------
     38
(1 fila)


 setval
--------
     60
(1 fila)


 setval
--------
     20
(1 fila)


ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE

-- compra usuario 1 

productos=# BEGIN; UPDATE producto SET stock = stock - 5 WHERE descripcion = 'producto9'; UPDATE compra SET fecha = current_date WHERE cliente_id = 1 AND ID = 31; SELECT descripcion, stock FROM producto WHERE descripcion = 'producto9'; SELECT * FROM detalle_compra; COMMIT;
BEGIN
UPDATE 1
UPDATE 1
 descripcion | stock
-------------+-------
 producto9   |     3
(1 fila)


 id | producto_id | compra_id | cantidad
----+-------------+-----------+----------
  1 |           2 |         2 |        9
  2 |           7 |         6 |        5
  3 |          16 |        23 |        1
  4 |          10 |        13 |        4
  5 |           7 |         8 |        2
  6 |           2 |        14 |        6
  7 |          19 |         8 |        7
  8 |           7 |        19 |        5
  9 |          17 |         3 |        5
 10 |           2 |         3 |        5
 11 |          16 |        27 |        8
 12 |          16 |        10 |        8
 13 |          13 |        14 |        8
 14 |           3 |        30 |        4
 15 |          13 |        15 |        2
 16 |          20 |        21 |        5
 17 |          15 |        21 |        2
 18 |          15 |        16 |        3
 19 |          16 |        19 |        9
 20 |           1 |         6 |       10
 21 |          17 |         1 |        7
 22 |          18 |         1 |        9
 23 |          20 |         4 |        8
 24 |          16 |         4 |        9
 25 |          14 |         5 |        6
 26 |          17 |         7 |        2
 27 |          17 |         9 |        6
 28 |          18 |        11 |        4
 29 |          20 |        12 |        7
 30 |           3 |        17 |        5
 31 |           2 |        18 |       10
 32 |          20 |        20 |        1
 33 |          10 |        22 |       10
 34 |          18 |        24 |        2
 35 |           3 |        25 |       10
 36 |           3 |        26 |        4
 37 |           3 |        28 |        2
 38 |          11 |        29 |        7
 39 |           9 |        31 |        5
 40 |           1 |        32 |        3
 41 |           2 |        32 |        3
 42 |           8 |        32 |        3
(42 filas)


COMMIT

-- compra cliente 2

productos=# BEGIN; UPDATE producto SET stock = stock - 3 WHERE descripcion = 'producto1'; UPDATE producto SET stock = stock - 3 WHERE descripcion = 'producto2'; UPDATE producto SET stock = stock - 3 WHERE descripcion = 'producto8'; UPDATE compra SET fecha = current_date WHERE cliente_id = 2; SELECT descripcion, stock FROM producto WHERE descripcion IN ( 'producto1', 'producto2', 'producto8' ); SELECT * FROM detalle_compra; COMMIT;
BEGIN
UPDATE 1
UPDATE 1
UPDATE 1
UPDATE 3
 descripcion | stock
-------------+-------
 producto1   |     3
 producto2   |     2
 producto8   |     3
(3 filas)


 id | producto_id | compra_id | cantidad
----+-------------+-----------+----------
  1 |           2 |         2 |        9
  2 |           7 |         6 |        5
  3 |          16 |        23 |        1
  4 |          10 |        13 |        4
  5 |           7 |         8 |        2
  6 |           2 |        14 |        6
  7 |          19 |         8 |        7
  8 |           7 |        19 |        5
  9 |          17 |         3 |        5
 10 |           2 |         3 |        5
 11 |          16 |        27 |        8
 12 |          16 |        10 |        8
 13 |          13 |        14 |        8
 14 |           3 |        30 |        4
 15 |          13 |        15 |        2
 16 |          20 |        21 |        5
 17 |          15 |        21 |        2
 18 |          15 |        16 |        3
 19 |          16 |        19 |        9
 20 |           1 |         6 |       10
 21 |          17 |         1 |        7
 22 |          18 |         1 |        9
 23 |          20 |         4 |        8
 24 |          16 |         4 |        9
 25 |          14 |         5 |        6
 26 |          17 |         7 |        2
 27 |          17 |         9 |        6
 28 |          18 |        11 |        4
 29 |          20 |        12 |        7
 30 |           3 |        17 |        5
 31 |           2 |        18 |       10
 32 |          20 |        20 |        1
 33 |          10 |        22 |       10
 34 |          18 |        24 |        2
 35 |           3 |        25 |       10
 36 |           3 |        26 |        4
 37 |           3 |        28 |        2
 38 |          11 |        29 |        7
 39 |           9 |        31 |        5
 40 |           1 |        32 |        3
 41 |           2 |        32 |        3
 42 |           8 |        32 |        3
(42 filas)


COMMIT



-- desactivar autocommit, agreagar usuario, rollback, testear

productos=# \set AUTOCOMMIT off
productos-# \echo :AUTOCOMMIT
off

productos=# BEGIN; INSERT INTO cliente(id, nombre, email) VALUES (11, 'usuario011', 'usuario011@yahoo.com'); SELECT * FROM cliente WHERE nombre= 'usuario011';
BEGIN
INSERT 0 1
 id |   nombre   |        email
----+------------+----------------------
 11 | usuario011 | usuario011@yahoo.com
(1 fila)

productos=!# ROLLBACK;
ROLLBACK

productos=# SELECT * FROM cliente WHERE nombre= 'usuario011';
 id | nombre | email
----+--------+-------
(0 filas)

productos=*# \set AUTOCOMMIT on
productos=*# \echo :AUTOCOMMIT
on