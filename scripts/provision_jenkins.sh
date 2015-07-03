#! /bin/bash
# Provisioning script for Jenkins
# Maintainer Eric Irwin <eric.irwin1124@gmail.com>

if [ ! -f /etc/init.d/jenkins ]; 
then
	echo "-------- PROVISIONING JENKINS ------------"
	echo "------------------------------------------"
 
 
	## Install Jenkins
	#
	# URL: http://localhost:6060
	# Home: /var/lib/jenkins
	# Start/Stop: /etc/init.d/jenkins
	# Config: /etc/default/jenkins
	# Jenkins log: /var/log/jenkins/jenkins.log
	wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
	sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
	apt-get update
	apt-get -y install jenkins
	
	/etc/init.d/jenkins restart

		#Install Plugins
	wget http://localhost:8080/jnlpJars/jenkins-cli.jar
	mv jenkins-cli.jar /usr/bin/jenkins-cli.jar
	alias jenkins-cli="java -jar /usr/bin/jenkins-cli.jar -s http://localhost:8080/"

	/etc/init.d/jenkins restart
else
	echo "CHECK - Jenkins already installed"
fi