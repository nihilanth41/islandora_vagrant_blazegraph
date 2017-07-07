FROM tomcat:7.0.79-jre8

RUN \
	mkdir -p /var/bigdata
	mkdir -p /var/bigdata/logs
	mkdir -p /etc/bigdata
	ln -sfv /usr/local/tomcat /usr/share/tomcat-blzg

COPY .bash_profile /var/bigdata
COPY blazegraph_conf/RWStore.properties /etc/bigdata/
COPY blazegraph_conf/log4j.properties	/etc/bigdata/

RUN \
	curl -SL https://sourceforge.net/projects/bigdata/files/bigdata/2.1.0/blazegraph.war/download \
	-O /usr/share/tomcat-blzg/webapps/blazegraph.war

ENTRYPOINT ["/bin/bash", "-c", ". /var/bigdata/.bash_profile; /usr/share/tomcat-blzg/bin/catalina.sh start"]





