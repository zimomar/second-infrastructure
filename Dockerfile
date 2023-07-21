FROM debian:bookworm-slim

RUN apt-get update
RUN apt-get install apache2 ca-certificates \ 
apt-transport-https software-properties-common \
wget curl lsb-release -yq

RUN curl -sSL https://packages.sury.org/php/README.txt | bash -x

RUN apt-get update

RUN apt-get install php8.1 libapache2-mod-php8.1 -yq

FROM php:8.1-apache
COPY . /var/www/html/
EXPOSE 80
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]


CMD service apache2 start
