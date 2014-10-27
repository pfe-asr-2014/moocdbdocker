/* Create user pg_reader using password tpinfint */
CREATE USER pg_reader WITH PASSWORD 'tpinfint';

/* Create user pg_admin using password moocbd */
CREATE USER pg_writer WITH PASSWORD 'tpinfint';

/* Create the vins DB. */
CREATE DATABASE vins;

/* Create the films DB. */
CREATE DATABASE films;

/* Grant USAGE to pg_reader and pg_admin */
GRANT USAGE ON SCHEMA public to pg_reader;
GRANT USAGE ON SCHEMA public to pg_writer;

/* Grant connect rights to pg_reader and pg_admin */
GRANT CONNECT ON DATABASE vins TO pg_reader;
GRANT CONNECT ON DATABASE films TO pg_reader;

GRANT CONNECT ON DATABASE vins TO pg_writer;
GRANT CONNECT ON DATABASE films TO pg_writer;

