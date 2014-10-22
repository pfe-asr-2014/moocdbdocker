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
RUN sed -i "s/\$conf\['servers'\]\[0\]\['host'\] = 'localhost';/\$conf\['servers'\]\[0\]\['host'\] = 'tspmoocdbpostgres_1';/g" /etc/phppgadmin/config.inc.php

EXPOSE 80

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
