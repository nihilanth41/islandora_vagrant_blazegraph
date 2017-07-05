# docker-blazegraph

## Build a new image
Last argument is directory of Dockerfile
```
docker build -t <image_name> <dockerfile_directory>
docker build -t blazecat .
```
## Run newly created image
--name is optional, else get container id using `docker ps`
```
docker run -p $HOSTPORT:$CONTAINERPORT --name <container_name> -i -t <image_name>
docker run -p 8081:8081 --name blaze1 -i -t blazecat
```
Detach using <C-P> <C-Q>  
Attach with shell using:  
```
docker exec -it <container_name> bash
```
