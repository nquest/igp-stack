#!/bin/sh

docker run --rm -it  \
  -h web1c \
  -p 8080:80 \
  --name web1c \
  -v /home/nquest/1cwww:/var/www \
  web1c:latest \
  /bin/bash
