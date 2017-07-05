# 
FROM tomcat:7.0.79-jre8

# Install bash_profile for blazegraph user (currently root)
RUN mkdir -p /var/bigdata

ADD .bash_profile /var/bigdata
ADD install_blazegraph.sh /root

RUN \
	apt-get update && apt-get install -y \
	git \
	vim

RUN \
	chmod +x /root/install_blazegraph.sh && /root/install_blazegraph.sh




