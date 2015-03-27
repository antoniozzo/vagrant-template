#!/usr/bin/env bash
 
echo "Updating server.."
sudo apt-get update
sudo apt-get install python-software-properties

read -p "Do you wish to install git?" i_git
if [[ $i_git =~ ^[Yy]$ ]]; then
	echo "Installing git.."
	sudo apt-get -y install git
fi

read -p "Do you wish to install php 5.6?" i_php
if [[ $i_php =~ ^[Yy]$ ]]; then
	. php.sh

	read -p "Do you wish to install composer?" i_composer
	if [[ $i_composer =~ ^[Yy]$ ]]; then
		echo "Installing composer.."
		curl -s https://getcomposer.org/installer | php
		mv composer.phar /usr/local/bin/composer
	fi
fi

read -p "Do you wish to install node?" i_node
if [[ $i_node =~ ^[Yy]$ ]]; then
	. node.sh
fi

read -p "Do you wish to install mysql?" i_mysql
if [[ $i_mysql =~ ^[Yy]$ ]]; then
	. mysql.sh
fi

read -p "Do you wish to setup a basic app structure with gulp?" i_app
if [[ $i_app =~ ^[Yy]$ ]]; then
	. app.sh
fi
