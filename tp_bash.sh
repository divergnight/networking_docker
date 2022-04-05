#!/bin/bash

# Change directory by executable directory
cd "${0%/*}"

# Install git
pacman -Syu
pacman -Sy git

# Clone git repository
git clone https://github.com/divergnight/networking_docker.git
cd networking_docker

# Build all images
for i in mysql apache haproxy; 
do 
	docker build -t $i $i
done


# Create two virtual docker networks
docker network create frontend
docker network create backend


# Run 3 apache containers
for i in {1..3}
do
	docker run -dti --rm --net=frontend --name "apache$i" --hostname apache$i -v $(pwd)/apache/html:/var/www/html apache
	docker network connect backend apache$i
done

# Run sql container
docker run -dti --rm --name mysql --net=backend mysql

# Run haproxy container
docker run -dti --rm -p 80:80 --net=frontend --name haproxy --hostname haproxy -v $(pwd)/haproxy/haproxy.cfg:/etc/haproxy/haproxy.cfg haproxy
