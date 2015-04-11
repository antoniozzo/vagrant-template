#!/usr/bin/env bash

echo "Installing mysql.."
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $2"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $2"
sudo apt-get -y install mysql-server

if [ $3 == "1" ]; then 
	echo "Installing php5-mysql.."
	sudo apt-get install php5-mysql
fi

echo "Creating database.."
sudo mysql -uroot -p$2 -e "create database $1;"
