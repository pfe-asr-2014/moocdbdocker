POSTGRES="gosu postgres postgres"

# Fix acl
echo "host all all 0.0.0.0/0 md5" >> "$PGDATA"/pg_hba.conf

# Initialize the databases
$POSTGRES --single < /db-creation/script-init.sql
# Populate the databases
$POSTGRES --single -j vins < /db-creation/script-vins.sql
$POSTGRES --single -j films < /db-creation/script-film.sql
# Set permissions on the databases
$POSTGRES --single -j vins < /db-creation/script-permissions.sql
$POSTGRES --single -j films < /db-creation/script-permissions.sql
