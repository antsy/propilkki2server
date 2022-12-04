FROM debian:latest
RUN adduser --disabled-password --gecos '' pi

RUN apt-get update
RUN apt-get install -y wget gnupg procps

RUN wget http://procyon.ddns.net:8080/propilkki_pub.gpg.key
RUN apt-key add propilkki_pub.gpg.key
RUN echo "deb http://procyon.ddns.net:8080/repos/apt/debian stretch main" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install pp2host

COPY autohost.ini /etc/pp2host/static/autohost.ini
COPY settings.dat /etc/pp2host/static/settings.dat
COPY pp2host.conf /etc/pp2host/pp2host.conf
COPY launch.sh /etc/pp2host/launch.sh
EXPOSE 4500

RUN chown pi:pi -R /etc/pp2host/*
USER pi
ENTRYPOINT /etc/pp2host/launch.sh

WORKDIR /etc/pp2host
