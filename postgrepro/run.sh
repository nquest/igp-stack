#!/bin/bash
docker run -d \
	--restart always \
	--name psql \
	--net internal \
	-h psql \
	-p 5432:5432 \
	-v postgres-data:/var/lib/postgresql/data postgrespro-14:latest
