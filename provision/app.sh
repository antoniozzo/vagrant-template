#!/usr/bin/env bash

sudo chown -R $USER:$USER $2 

cd $2


if [[ $1 == "gulp" ]]; then
	mkdir -p assets/src/less assets/src/js assets/src/css assets/dist; touch assets/src/less/main.less; touch assets/src/js/main.js; cd assets
	git clone https://github.com/antoniozzo/coding-with-love.git tmp; rm -rf tmp/gulp/README.md ;mv tmp/gulp/* .; rm -rf tmp
	npm install -g gulp
	npm install
fi

sed -i "s|[name]|pName|g" package.json