#!/usr/bin/env bash

sudo chown -R $USER:$USER $2 

cd $2


if [[ $3 == "gulp" ]]; then
	mkdir -p assets/src/less assets/src/js assets/src/css assets/dist; touch assets/src/less/main.less; touch assets/src/js/main.js; cd assets
	git clone https://github.com/antoniozzo/coding-with-love.git tmp; rm -rf tmp/gulp/README.md ;mv tmp/gulp/* .; rm -rf tmp
	sudo npm install -g gulp
	npm install
fi

sed -i "s|$1|pName|g" package.json

if [[ $4 == "wordpress" ]]; then
	cd ..; wget http://wordpress.org/latest.tar.gz; tar -zxvf latest.tar.gz; rm latest.tar.gz
fi