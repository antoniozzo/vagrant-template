#!/usr/bin/env bash
 
# vars
read -p "Enter root password: [Default: root]" DB_PASS
DB_PASS=${DB_PASS:-root}

read -p "Enter database name: [Default: db]" DB_NAME
DB_NAME=${DB_NAME:-db}

echo "Installing mysql.."
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_PASS"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_PASS"
sudo apt-get -y install mysql-server

if [[ $i_php =~ ^[Yy]$ ]]; then
	echo "Installing php5-mysql.."
	sudo apt-get install php5-mysql
fi

echo "Creating database.."
sudo mysql -uroot -p$DB_PASS -e "create database $DB_NAME;"
