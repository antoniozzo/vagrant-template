# -*- mode: ruby -*-
# vi: set ft=ruby :

name = "[name]"
boxName = "[boxName]"
boxUrl = "[boxUrl]"
syncDir = "[syncDir]"
memory = "[memory]"
ip = "[ip]"
vhost = "[vhost]"
git = "[git]"
node = "[node]"
php = "[php]"
pubDir = "[pubDir]"
composer = "[composer]"
mysql = "[mysql]"
dbName = "[dbName]"
dbPass = "[dbPass]"
apachePort = "[apachePort]"
mysqlPort = "[mysqlPort]"
sshPort = "[sshPort]"
app = "[app]"

Vagrant.configure("2") do |config|
	config.vm.define :"#{name}" do |config|
		config.vm.box      = boxName
		config.vm.box_url  = boxUrl
		config.vm.hostname = name
		config.vm.synced_folder "./", "#{syncDir}", :mount_options => ["dmode=777", "fmode=666"]

		config.vm.provider :virtualbox do |v|
			v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
			v.customize ["modifyvm", :id, "--memory", memory]
		end

		if ip
			config.vm.network :private_network, ip: "#{ip}"
		end

		if apachePort
			config.vm.network :forwarded_port, guest: 80, host: apachePort, auto_correct: true
		end

		if mysqlPort
			config.vm.network :forwarded_port, guest: 3306, host: mysqlPort, auto_correct: true
		end

		if sshPort
			config.vm.network :forwarded_port, guest: 22, host: sshPort, auto_correct: true
		end

		config.vm.provision :shell, path: "provision/server.sh"

		if git == "1"
			config.vm.provision :shell, path: "provision/git.sh"
		end

		if node == "1"
			config.vm.provision :shell, path: "provision/node.sh"
		end

		if php == "1"
			config.vm.provision :shell do |s|
				s.path = "provision/php.sh"
				s.args = "#{pubDir}"
			end
		end

		if composer == "1"
			config.vm.provision :shell, path: "provision/composer.sh"
		end

		if mysql == "1"
			config.vm.provision :shell do |s|
				s.path = "provision/mysql.sh"
				s.args = "#{dbName} #{dbPass} #{php}"
			end
		end	

		if app == "1"
			config.vm.provision :shell do |s|
				s.path = "provision/app.sh"
				s.args = "#{name} #{pubDir} gulp wordpress"
			end
		end
	end
end
