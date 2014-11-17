#!/bin/sh
docker run -d --name tsp-moocdb-postgres tsp-moocdb-postgres
docker run -d -p 8080:80 --name tsp-moocdb-web --link tsp-moocdb-postgres:tsp-moocdb-postgres tsp-moocdb-web
