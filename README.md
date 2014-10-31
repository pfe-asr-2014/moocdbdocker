
Docker port of the Virtual machine environement devised for the Telecom SudParis' Relational Databases MOOC (originally based on Vagrant).
The original project can be found at https://fusionforge.int-evry.fr/projects/moocbdvm/

Install
=======

Before using these containers, you need to have docker installed on your computer.
[Installation instruction are available on the official website](https://docs.docker.com/installation/), simply choose your OS and follow the procedure :).

If your are on Windows or MacOS, the following manipulation need to be done in the boot2docker VM. To access your vm:

* On MacOS: in a shell, type ```boot2docker init; boot2docker start; boot2docker ssh```
* On Windows, open the "Start boot2docker" shortcut (on your desktop or in the windows menu).

When you have a docker command available, type the following commands to setup the containers:

```
git clone https://github.com/pfe-asr-2014/moocdbdocker.git
cd moocdbdocker/
```

You can now pass to the next part: Using these containers !

Using
=====

Build docker images (can be long):
```sh
docker build -t tsp-moocdb-postgres tsp-moocdb-postgres/
docker build -t tsp-moocdb-web tsp-moocdb-web/
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

How does it works and how can I update the content
==================================================

All the database stuff is in ```tsp-moocdb-postgres```. This container is based on
[the official postgresql image](https://registry.hub.docker.com/_/postgres/) which provides a simple way to
execute initialization scripts: place a ```.sh``` shell script in ```/docker-entrypoint-initdb.d```
and it will be executed at creation.

It is exactly how we do it! We just drop the file 
[```initdb-setupdb.sh```](https://github.com/pfe-asr-2014/moocdbdocker/blob/master/tsp-moocdb-postgres/initdb-setupdb.sh)
which executes several sql commands and that's all!

So if you want to change the generated schema, all you have to do is to change this  ```initdb-setupdb.sh``` (or add another one, if you want to
separate your logic in several files).

The other container (```tsp-moocdb-web```) runs the bdsqlwiz PHP application (directory ```./appli```), PhpPgAdmin and an index for our users.
You can update the application easily: just change the content of the directory and you're ready to ship your new content!

TODO
====

* Integrate manual
* Explain how to use it with boot2docker (script)
* Choose a License
* Improve this README (a lot) -> check the embedded 'TODO's
* more…
