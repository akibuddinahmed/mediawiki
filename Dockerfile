FROM ubuntu:18.04

RUN apt-get update 
RUN apt install -y apache2
RUN sed -i "s/Options Indexes FollowSymLinks/Options FollowSymLinks/" /etc/apache2/apache2.conf


#RUN DEBIAN_FRONTEND=noninteractive apt install -y php php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl
RUN apt install -y software-properties-common && add-apt-repository ppa:ondrej/php

RUN DEBIAN_FRONTEND=noninteractive apt install -y php7.4 php7.4-intl php7.4-cli php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath

RUN apt install -y curl vim wget tar

RUN cd /tmp && wget https://releases.wikimedia.org/mediawiki/1.39/mediawiki-1.39.2.tar.gz


RUN mkdir -p /var/www/html/mediawiki
RUN tar -zxvf /tmp/mediawiki*.tar.gz
RUN mv /mediawiki-1.39.2/* /var/www/html/mediawiki


RUN chown -R www-data:www-data /var/www/html/mediawiki/ &&  chmod -R 755 /var/www/html/mediawiki/
ADD config/mediawiki.conf /etc/apache2/sites-available/


RUN a2dissite 000-default.conf
RUN a2ensite mediawiki.conf
RUN a2enmod rewrite

EXPOSE 80
EXPOSE 8002


CMD apachectl -D FOREGROUND
