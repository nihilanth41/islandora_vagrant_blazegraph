# islandora_vagrant_blazegraph
## Install

```
cd
git clone https://vcs.missouri.edu/zrrm74/islandora_vagrant_blazegraph.git
cd islandora_vagrant_blazegraph/docker-blazegraph
docker build -t blazecat . 
docker run -d -p 8081:8080 --name blaze1 -i -t blazecat
cd ../islandora-blazegraph
./install.sh
```



