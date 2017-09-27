FROM alpine:3.6
MAINTAINER Simon Wydooghe <simon@wydooghe.com>

ARG VERSION=v2017.06.05-1

RUN apk --no-cache add python2

RUN mkdir /app
RUN apk --no-cache add --virtual build-dependencies curl \
 && curl -L https://github.com/SickRage/SickRage/archive/$VERSION.tar.gz \
    | tar xz -C /app --strip 1 \
 && apk del build-dependencies

VOLUME /data

EXPOSE 8081

CMD ["/app/SickBeard.py", "--datadir", "/data"]
