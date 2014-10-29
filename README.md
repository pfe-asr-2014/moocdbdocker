
Using
=====

Build docker images (can be long):
```sh
docker build -t tsp-moocdb-postgres tsp-moocdb-postgres/
docker build -t tsp-moocdb-web tsp-moocdb-web
```

Launch (order is important):
```sh
docker run -d --name tsp-moocdb-postgres tsp-moocdb-postgres
docker run -d -p 8080:80 --name web --link tsp-moocdb-postgres:tsp-moocdb-postgres tsp-moocdb-web
```

Use:
* Visit http://localhost:8080/
* Login to phpPgAdmin with:
  *  ```pg_reader/tpinfint``` for read access
  *  ```pg_writer/tpinfint``` for read/write access

TODO
====

* Integrate manual
* Explain how to use it with boot2docker (script)
* Choose a License
* Improve this README (a lot)
* more…
