
Using
=====

Install fig:
```sh
curl -L https://github.com/docker/fig/releases/download/1.0.0/fig-`uname -s`-`uname -m` > ./fig
chmod +x ./fig
```

Build docker images (can be long):
```sh
docker build -t tsp-moocdb-postgres tsp-moocdb-postgres/
docker build -t tsp-moocdb-web tsp-moocdb-web
```

Launch:
```sh
./fig up
```

Use:
Visit http://localhost:8080/phppgadmin/
Login with credentials ```pg_reader/tpinfint```

TODO
====

* Integrate site web
* Integrate manual
* Explain how to use it with boot2docker (script)
* Choose a License
* Improve this README (a lot)
* more…