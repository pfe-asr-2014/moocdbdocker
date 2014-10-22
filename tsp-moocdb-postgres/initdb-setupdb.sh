POSTGRES="gosu postgres postgres"

$POSTGRES --single -E <<EOSQL
CREATE USER pg_reader WITH PASSWORD 'tpinfint';
CREATE DATABASE vins;
CREATE DATABASE films;
EOSQL

$POSTGRES --single -j < /db-creation/setup.sql
