#!/bin/sh
for i in tsp-moocdb-web tsp-moocdb-postgres
do
    docker stop $(docker ps -a | grep $i:latest | cut -f1 -d ' ')
    docker rm $(docker ps -a | grep $i:latest | cut -f1 -d ' ')
done

