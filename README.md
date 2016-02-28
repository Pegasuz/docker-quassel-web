## quassel-webserver ##
Dockerfile for [quassel-webserver](https://github.com/magne4000/quassel-webserver) by magne4000.

Forked from jakexks/dockerfiles with minor edits to work with newer quassel-webserver

A web client for Quassel (requires a running quasselcore)

### Usage ###
Out of the box, it provides a client that can connect to any quassel core.
Note that it always listens on port 64080 as this is the one exposed by the Dockerfile

```
docker run -d --name quassel-webserver -P samdnic/quassel-webserver
```

Alternatively, you can specify advanced options by setting the following environment variables:

  * ```QUASSEL_HOST``` - the address of your quassel core (default empty)
  * ```QUASSEL_PORT``` - the port it is listening on (default 4242)
  * ```FORCE_DEFAULT``` - Only allow connections to the above core (default false)
  * ```WEBSERVER_MODE``` - http or https (default https)

Full example:

```
docker run -d --name quassel-webserver -p 8080:64080 -e QUASSEL_HOST=mybnc.tld -e QUASSEL_PORT=9001 -e FORCE_DEFAULT=true -e WEBSERVER_MODE=http jkaberg/quassel-webserver
```
