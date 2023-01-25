FROM ubuntu:20.04

ENV CONTAINER_TIMEZONE="Europe/Kyiv"
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt update && apt install -y apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html

RUN echo 'Maksym Serhieiev' > /var/www/index.html
RUN sed '/Listen/{s/\([0-9]\+\)/8080/; :a;n; ba}' /etc/apache2/ports.conf

EXPOSE 8080
ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]