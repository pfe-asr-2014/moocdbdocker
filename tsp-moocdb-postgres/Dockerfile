FROM postgres:9.3

ADD ./db-creation /db-creation

RUN mkdir -p /docker-entrypoint-initdb.d

COPY ./initdb-setupdb.sh /docker-entrypoint-initdb.d/setupdb.sh
