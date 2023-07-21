FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    apache2 ca-certificates \
    apt-transport-https software-properties-common \
    wget curl lsb-release gnupg2

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" \
    | tee /etc/apt/sources.list.d/sury-php.list
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

RUN apt-get update && apt-get install -y --no-install-recommends \
    php8.0 libapache2-mod-php8.0

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

