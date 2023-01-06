#!/bin/sh

docker run --name srv1c01 \
  --hostname srv1c01 \
  -p 1540-1541:1540-1541 \
  -p 1560-1591:1560-1591 \
  --detach \
  --volume /srv/srv1c/home/usr1cv8:/home/usr1cv8 \
  --volume /srv/srv1c/var/log/1C:/var/log/1C \
  --volume /etc/localtime:/etc/localtime:ro \
  srv1c
