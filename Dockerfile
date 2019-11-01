FROM ubuntu:16.04
MAINTAINER bdhwan@gmail.com



RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install sudo
RUN sudo apt-get update
RUN sudo apt-get install -y mysql-client
RUN sudo apt-get install -y vim
RUN sudo apt-get install -y git

RUN sudo apt-get install -y curl
RUN sudo apt-get install -y php7.0-curl

RUN sudo apt-get install -y nginx postgresql-client php php7.0-fpm php7.0-pgsql php7.0-mysql php7.0-gd php7.0-xml php7.0-intl phpunit 

RUN service php7.0-fpm start

RUN rm -rf /etc/php/7.0/fpm/php.ini
RUN rm -rf /etc/nginx/sites-available/default

ADD conf/php.ini /etc/php/7.0/fpm/php.ini
ADD conf/default /etc/nginx/sites-available/default

RUN service nginx restart
RUN service php7.0-fpm restart


ADD check.sh /home/check.sh

WORKDIR /home
RUN ls
RUN echo "test"
EXPOSE 80
# CMD ["/bin/bash", "-c", "/usr/sbin/service php7.0-fpm start && nginx -g 'daemon off;'"]
ENTRYPOINT ["/bin/sh", "/home/check.sh"]






