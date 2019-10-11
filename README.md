# chef-automate-docker

Built to allow A2 to run in a container for test purposes.
Note: This is not a supported Chef configuration.

Usage:

docker volume create habvol

docker build . -t \<your tag\> 

docker run -itd  --privileged -p443:443 --name ChefAutomate --mount source=habvol,target=/hab \<your tag\>
  
docker exec -it \<your container id\>  bin/bash
