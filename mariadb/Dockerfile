FROM mariadb:10.3.5

RUN apt-get update & apt-get upgrade -y

ENV MYSQL_USER=www-data \
    MYSQL_PASSWORD=www-data \
    MYSQL_DATABASE=mediawiki \
    MYSQL_ROOT_PASSWORD=www-data

ADD . /

WORKDIR /
