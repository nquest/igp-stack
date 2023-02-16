#!/bin/sh

docker run -d  \
  --restart always \
  -h web1c \
  -p 8080:80 \
  --name web1c \
  --net internal \
  -v www-data:/var/www \
  web1c:latest
