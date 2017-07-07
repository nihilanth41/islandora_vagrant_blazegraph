# islandora_vagrant_blazegraph

## Installation

### Clone repository
```
cd
git clone https://vcs.missouri.edu/zrrm74/islandora_vagrant_blazegraph.git
```

### Install Blazegraph (via Docker)
```
cd islandora_vagrant_blazegraph/docker-blazegraph
sudo docker build -t blazecat . 
sudo docker run -d -p 8081:8080 --name blaze1 -i -t blazecat
```
Confirm blazegraph is installed and running by visiting http://localhost:8081/blazegraph   

### Configure Fedora
```
cd ../islandora-blazegraph
./install.sh
```

### Rebuild Fedora 

#### (Optional) Check pidGen table prior to rebuild
```
mysql -u fedoraAdmin -p 
(default password is fedoraAdmin)
use fedora3;
select * from pidGen;
exit
```

#### Rebuild
```
sudo -u tomcat7 -E -H bash -c "/usr/local/fedora/server/bin/fedora-rebuild.sh"
```
1. Rebuild the Resource Index 
 - Had to ^C (SIGINT) after it reports Finished.
2. Run again and select "Rebuild SQL database"
 - Had to ^C (SIGINT) after it reports Finished.
3. (Optionally) Check pidGen table again and make sure it matches the count prior to rebuild.
4. Start fedora `sudo service tomcat7 start`
5. Visit http://localhost:8080/admin/islandora/configure
 - Uncheck 'Use iTQL for particular queries'

## References
https://github.com/discoverygarden/trippi-sail/wiki/Replacing-Mulgara-with-Blazegraph
