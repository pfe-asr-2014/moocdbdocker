/* Grant read access to pg_reader */
GRANT USAGE ON SCHEMA public to pg_reader;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO pg_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO pg_reader;

/* Grant write access to pg_writer */
GRANT USAGE ON SCHEMA public to pg_writer;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO pg_writer;
