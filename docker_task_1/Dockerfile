FROM ubuntu:20.04

RUN apt update && apt install -y apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html

RUN echo 'Maksym Serhieiev' > /var/www/index.html

EXPOSE 8080
ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]