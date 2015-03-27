#!/usr/bin/env bash
 
# vars
DBPASS='pDBPASS'
DBNAME='pDBNAME'

echo "Installing mysql.."
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASS"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASS"
sudo apt-get -y install mysql-server

#pPHPMYSQL echo "Installing php5-mysql.."
#pPHPMYSQL sudo apt-get install php5-mysql

echo "Creating database.."
sudo mysql -uroot -p$DBPASS -e "create database $DBNAME;"
