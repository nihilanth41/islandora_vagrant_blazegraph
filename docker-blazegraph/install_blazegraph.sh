#!/bin/bash

function main { 
	set -euf -o pipefail

	ln -sfv /usr/local/tomcat /usr/share/tomcat-blzg

	mkdir -p /var/bigdata/logs
	mkdir -p /etc/bigdata/
	cd ~
	git clone https://github.com/discoverygarden/blazegraph_conf
	cp blazegraph_conf/RWStore.properties /etc/bigdata
	#note log4j.properties could be tweaked to log INFO/DEBUG could impact throughput however.`
	cp blazegraph_conf/log4j.properties /etc/bigdata
	cp blazegraph_conf/blazegraph_init /etc/init.d/blazegraph
	cd /usr/share/tomcat-blzg/webapps
	wget -q https://sourceforge.net/projects/bigdata/files/bigdata/2.1.0/blazegraph.war/download -O blazegraph.war
	chmod +x /etc/init.d/blazegraph
	#note this will vary just make sure it starts before fedora
	#/etc/init.d/blazegraph start -r

	# Change listening port to 8081
	sed -i 's/8080/8081/g' /usr/share/tomcat-blzg/conf/server.xml
	
	. /var/bigdata/.bash_profile
	/usr/share/tomcat-blzg/bin/catalina.sh start 

	return 0
}

main
