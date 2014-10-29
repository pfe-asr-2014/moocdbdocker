# Use same base as postgres to minimize total size
FROM debian:wheezy

RUN apt-get update

# Install phppgadmin without postgres
RUN apt-get install phppgadmin -y --force-yes --no-install-recommends

# Let phppgadmin be accessible for everyone
RUN sed -i "s/# allow from all/allow from all/g" /etc/apache2/conf.d/phppgadmin
RUN sed -i "s/\$conf\['extra_login_security'\] = true;/\$conf\['extra_login_security'\] = false;/g" /etc/phppgadmin/config.inc.php

# Connect phppgadmin to docker postgres 
RUN sed -i "s/\$conf\['servers'\]\[0\]\['desc'\] = 'My-distant-server';/\$conf\['servers'\]\[0\]\['desc'\] = 'TSP MOOCDB';/g" /etc/phppgadmin/config.inc.php
RUN sed -i "s/\$conf\['servers'\]\[0\]\['host'\] = 'localhost';/\$conf\['servers'\]\[0\]\['host'\] = 'tsp-moocdb-postgres';/g" /etc/phppgadmin/config.inc.php

# Set the default ServerName
RUN echo "ServerName tspmoocdbweb" >> /etc/apache2/apache2.conf

# Lower mpm-prefork minimum servers
RUN sed -i "s/StartServers          5/StartServers          1/g" /etc/apache2/apache2.conf
RUN sed -i "s/MinSpareServers       5/MinSpareServers       1/g" /etc/apache2/apache2.conf

# Forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/apache2/access.log
RUN ln -sf /dev/stderr /var/log/apache2/error.log

# Copy the index file
COPY ./index.html /var/www/

# Copy the bdsqlwiz application
COPY ./appli /var/www/bdsqlwiz

# Connect bdsqlwiz to docker postgres
RUN sed -i "s/PGSERVER/tsp-moocdb-postgres/g" /var/www/bdsqlwiz/execpostgres.php
RUN sed -i "s/PGUSER/pg_reader/g" /var/www/bdsqlwiz/execpostgres.php
RUN sed -i "s/PGPASS/tpinfint/g" /var/www/bdsqlwiz/execpostgres.php

# Set owner of web files
RUN chown -R www-data. /var/www

EXPOSE 80

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
