export BLZG_CONF="/etc/bigdata"
export CATALINA_HOME="/usr/share/tomcat-blzg"
export CATALINA_PID="/usr/share/tomcat-blzg/catalina.pid"
export JAVA_HOME="/docker-java-home/jre"
export BLZG_USER=root
export PATH="/docker-java-home/jre/bin:/usr/share/tomcat-blzg/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin"
export JAVA_OPTS="-server -Xmx2000m -Dcom.bigdata.rdf.sail.webapp.ConfigParams.propertyFile=/etc/bigdata/RWStore.properties -Dlog4j.configuration=/etc/bigdata/log4j.properties -Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8 -XX:+UseParallelOldGC"
