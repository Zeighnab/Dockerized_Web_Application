FROM ubuntu:latest

LABEL Author="Zeighnab"

LABEL Project="interior_web_app"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install git -y

RUN apt install apache2 -y

CMD [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]

EXPOSE 80

WORKDIR /var/www/html

VOLUME [ "/var/log/apache2" ]

# This will untar the file
ADD interior.tar.gz /var/www/html/

# This will not untar the file, just dump it
# COPY interior.tar.gz /var/www/html/

