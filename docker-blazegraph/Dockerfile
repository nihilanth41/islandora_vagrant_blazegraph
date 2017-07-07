FROM tomcat:7.0.79-jre8

RUN \
	mkdir -p /var/bigdata && \
	mkdir -p /var/bigdata/logs && \
	mkdir -p /etc/bigdata && \
	ln -sfv /usr/local/tomcat /usr/share/tomcat-blzg

COPY blazegraph_conf/RWStore.properties /etc/bigdata/
COPY blazegraph_conf/log4j.properties	/etc/bigdata/

ENV \
	BLZG_CONF="/etc/bigdata" \
	CATALINA_HOME="/usr/share/tomcat-blzg" \
	CATALINA_PID="/usr/share/tomcat-blzg/catalina.pid" \
	JAVA_HOME="/docker-java-home/jre" \
	BLZG_USER="root" \
	JAVA_OPTS="-server -Xmx2000m -Dcom.bigdata.rdf.sail.webapp.ConfigParams.propertyFile=/etc/bigdata/RWStore.properties -Dlog4j.configuration=/etc/bigdata/log4j.properties -Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8 -XX:+UseParallelOldGC"

RUN \
	curl -SL https://sourceforge.net/projects/bigdata/files/bigdata/2.1.0/blazegraph.war/download \
	-o /usr/share/tomcat-blzg/webapps/blazegraph.war






