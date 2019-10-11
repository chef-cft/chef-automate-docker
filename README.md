# chef-automate-docker

Built to allow A2 to run in a container for test purposes.
Note: This is not a supported Chef configuration.

Usage:

Create a volume to persist the /hab directory in:

docker volume create habvol

Build the Docker image:

docker build . -t \<your tag\> 

Run the container withg the volume:

docker run -itd  --privileged -p443:443 --name ChefAutomate --mount source=habvol,target=/hab \<your tag\>

Drop into the running container:

docker exec -it \<your container id\>  bin/bash

Inside the container check to see the status of Chef Automate:

./chef-automate status

Should show something like:

Status from deployment with channel [current] and type [local]

Service Name            Process State  Health Check  Uptime (s) PID</br>
deployment-service      running        ok            829        195</br>
backup-gateway          running        ok            715        931</br>
automate-postgresql     running        ok            712        1092</br>
automate-pg-gateway     running        ok            715        980</br>
automate-elasticsearch  running        ok            715        995</br>
automate-es-gateway     running        ok            709        1297</br>
automate-ui             running        ok            709        1307</br>
pg-sidecar-service      running        ok            710        1240</br>
cereal-service          running        ok            710        1258</br>
event-service           running        ok            709        1359</br>
es-sidecar-service      running        ok            700        1643</br>
event-feed-service      running        ok            700        1652</br>
authz-service           running        ok            705        1542</br>
automate-dex            running        ok            705        3447</br>
teams-service           running        ok            697        1716</br>
authn-service           running        ok            697        3552</br>
secrets-service         running        ok            697        1771</br>
applications-service    running        ok            697        1733</br>
notifications-service   running        ok            691        3690</br>
nodemanager-service     running        ok            692        2016</br>
compliance-service      running        ok            692        3504</br>
license-control-service running        ok            691        2034</br>
local-user-service      running        ok            686        2467</br>
session-service         running        ok            685        3473</br>
ingest-service          running        ok            686        2431</br>
config-mgmt-service     running        ok            686        2422</br>
data-feed-service       running        ok            685        2543</br>
event-gateway           running        ok            683        3573</br>
automate-gateway        running        ok            683        3615</br>
automate-load-balancer  running        ok            682        2827</br>
