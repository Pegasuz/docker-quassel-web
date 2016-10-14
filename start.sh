#!/bin/sh
[ -z "$QUASSEL_HOST" ] && export QUASSEL_HOST=""
[ -z "$QUASSEL_PORT" ] && export QUASSEL_PORT="4242"
[ -z "$FORCE_DEFAULT" ] && export FORCE_DEFAULT="false"
[ -z "$WEBSERVER_MODE" ] && export WEBSERVER_MODE="https"
[ ! -e ssl/key.pem ] && openssl req -x509 -newkey rsa:2048 -keyout ssl/key.pem -out ssl/cert.pem -nodes -subj "/C=GB/ST=London/L=London/O=Quassel Webserver/OU=Quassel Webserver/CN=quassel-webserver.com"
echo "module.exports = { default: { host: '$QUASSEL_HOST', port: $QUASSEL_PORT }, forcedefault: $FORCE_DEFAULT, prefixpath: '', theme: 'default'  };" > /data/quassel-webserver/settings.js
node app.js -m $WEBSERVER_MODE -p 64080
