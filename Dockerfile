FROM jakexks/nodejs
MAINTAINER Joel Kaaberg <joel.kaberg@gmail.com>

ENV QUASSEL_HOST=localhost
ENV QUASSEL_PORT=4242
ENV FORCE_DEFAULT=true
ENV WEBSERVER_MODE=http
ENV WEBSERVER_PORT=64080

ADD start.sh /start.sh

RUN git clone https://github.com/magne4000/quassel-webserver.git && cd quassel-webserver && cp settings.js settings-user.js && npm install --production && chmod +x /start.sh && rm /data/quassel-webserver/ssl/*

WORKDIR /data/quassel-webserver

EXPOSE 64080

CMD ["/start.sh"]
