#!/bin/bash

function main {
set -euf -o pipefail

cd
git clone https://github.com/discoverygarden/trippi-sail.git
cd trippi-sail

# Must pass -DremoteBlazegraph or -DskipTests for tests to function properly
mvn package -Dfedora.version=3.8.1 -DremoteBlazegraph=http://localhost:8081/blazegraph
cd trippi-sail-blazegraph-remote/target
tar xvf trippi-sail-blazegraph-remote-0.0.1-SNAPSHOT-bin.tar.gz
sudo mv trippi-sail-blazegraph-remote-0.0.1-SNAPSHOT /opt/trippi-sail
sudo chown -R tomcat7:tomcat7 /opt/trippi-sail

sudo service tomcat7 stop

sudo -u tomcat7 cat << EOF > "/var/lib/tomcat7/conf/Catalina/localhost/fedora.xml"
<?xml version="1.0" encoding="UTF-8"?>
<Context>
 <Loader
       className="org.apache.catalina.loader.VirtualWebappLoader"
       virtualClasspath="/opt/trippi-sail/*.jar"
       searchVirtualFirst="true"/>
 <Parameter name="fedora.home" value="/usr/local/fedora" />
</Context>
EOF

cd /home/vagrant/islandora_vagrant_blazegraph/islandora-blazegraph
sudo -u tomcat7 cp -v -- remote-blazegraph.xml /usr/local/fedora/server/config/spring/
sudo chown -R tomcat7:tomcat7 /usr/local/fedora

sudo -u tomcat7 cp -v -- fedora.fcfg /usr/local/fedora/server/config/.
sudo -u tomcat7 cp -v -- env-server.sh /usr/local/fedora/server/bin/env-server.sh

sudo apt-get -y install expect 
cd /vagrant/islandora_vagrant_blazegraph/islandora-blazegraph/ 
sudo bash -c "FEDORA_HOME=/usr/local/fedora CATALINA_HOME=/var/lib/tomcat7 ./rebuild_expect.sh"

sleep 1 
sudo service tomcat7 start

exit 0
}

main
