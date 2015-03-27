# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.define :pNAME do |config|
		config.vm.box = "pBOXNAME"
		config.vm.box_url = "pBOXURL"

		#pIP config.vm.network :private_network, ip: "pIP"
        #pAPACHEPORT config.vm.network :forwarded_port, guest: 80, host: pAPACHEPORT, auto_correct: true
        #pMYSQLPORT config.vm.network :forwarded_port, guest: 3306, host: pMYSQLPORT, auto_correct: true
        #pSSHPORT config.vm.network :forwarded_port, guest: 22, host: pSSHPORT, auto_correct: true

		config.vm.hostname = "pNAME"
		config.vm.synced_folder "./", "pTDIR", :mount_options => ["dmode=777", "fmode=666"]

		config.vm.provider :virtualbox do |v|
			v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
			v.customize ["modifyvm", :id, "--memory", pMEM]
		end

		config.vm.provision :shell, path: "provision/server.sh"
		#pGIT config.vm.provision :shell, path: "provision/git.sh"
		#pNODE config.vm.provision :shell, path: "provision/node.sh"
		#pPHP config.vm.provision :shell, path: "provision/php.sh"
		#pCOMPOSER config.vm.provision :shell, path: "provision/composer.sh"
		#pMYSQL config.vm.provision :shell, path: "provision/mysql.sh"
	end
end
