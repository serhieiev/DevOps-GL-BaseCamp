# creates a layer from the ubuntu:20.04 Docker image
FROM ubuntu:20.04

# sets timezone to avoid manual interaction
ENV CONTAINER_TIMEZONE="Europe/Kyiv"
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

# updates the packages information, installs Apache server
RUN apt update && apt install -y apache2

# sets Apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html

# overwrites default index.html with first and last name
RUN echo 'Maksym Serhieiev' > /var/www/html/index.html

# instructs Docker to expose the 80 HTTP port to the host OS, runs Apache in the foreground
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]