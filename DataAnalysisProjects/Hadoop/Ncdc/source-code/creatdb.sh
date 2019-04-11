#!/bin/bash

# SQL Login
mysql -uroot -pready2go <<MYSQL
# db create

create database psr_ncdc;
GRANT ALL PRIVILEGES ON ncdc_psr.* TO root@localhost IDENTIFIED BY ready2go;
#Exit Connection
exit
