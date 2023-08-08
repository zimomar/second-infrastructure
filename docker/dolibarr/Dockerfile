FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    apache2 ca-certificates \
    apt-transport-https software-properties-common \
    wget curl lsb-release gnupg2

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" \
    | tee /etc/apt/sources.list.d/sury-php.list
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

RUN apt-get update && apt-get install -y --no-install-recommends \
    php7.4 libapache2-mod-php7.4 php7.4-cli php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath

COPY ./html/ /var/www/html/

RUN rm /etc/apache2/sites-enabled/000-default.conf

COPY ./000-default.conf /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

