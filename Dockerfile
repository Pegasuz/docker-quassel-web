FROM mhart/alpine-node
MAINTAINER Joel Kaaberg <joel.kaberg@gmail.com>

ENV QUASSEL_HOST=localhost
ENV QUASSEL_PORT=4242
ENV FORCE_DEFAULT=true
ENV WEBSERVER_MODE=http
ENV WEBSERVER_PORT=64080

ADD ./start.sh /start.sh

RUN apk add --update --no-cache git openssl

RUN mkdir /data && cd /data && git clone https://github.com/magne4000/quassel-webserver.git && cd quassel-webserver && cp settings.js settings-user.js && npm install --production
RUN chmod +x /start.sh

WORKDIR /data/quassel-webserver

EXPOSE 64080

CMD ["/start.sh"]
