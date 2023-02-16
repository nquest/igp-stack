#!/bin/sh

docker run  -d \
  --restart always \
  -h srv1c \
  -p 1540-1545:1540-1545 \
  -p 1560-1591:1560-1591 \
  --name srv1c \
  --net internal \
  -v srv1c-data:/home/usr1cv8 \
  -v srv1c-licenses:/var/1C \
  srv1c:latest
