#!/usr/bin/env bash

read -p "Enter public dir for vhost: [Default: /var/www/public]" PUBLIC_DIR
PUBLIC_DIR=${PUBLIC_DIR:-/var/www/public}

echo "Adding repositories.."
sudo add-apt-repository -y ppa:ondrej/php5-5.6
sudo apt-get update && sudo apt-get -y upgrade

echo "Installing apache + php.."
sudo apt-get install -y apache2
sudo apt-get install -y php5
sudo apt-get install -y php5-gd
sudo apt-get install -y php5-cli
sudo apt-get install -y php5-curl
sudo apt-get install -y php5-mcrypt

# setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:80>
	DocumentRoot "${PUBLIC_DIR}"
	<Directory "${PUBLIC_DIR}">
		AllowOverride All
		Require all granted
	</Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

echo "Enabling mod rewrite.."
sudo a2enmod rewrite

echo "Restarting apache.."
service apache2 restart
