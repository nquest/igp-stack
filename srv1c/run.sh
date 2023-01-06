#!/bin/sh

docker run  -d  \
  -h srv1c \
  -p 1540-1545:1540-1545 \
  -p 1560-1591:1560-1591 \
  --name srv1c \
  -v /home/nquest/1cdata:/home/usr1cv8 \
  srv1c:latest
