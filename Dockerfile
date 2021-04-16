FROM rshop/php:8.0-mssql

RUN apk update \
    && apk add --no-cache \
        apache2 \
        php8-apache2 \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man

COPY apache/* /etc/apache2/
COPY conf.d/* /etc/php8/conf.d/

ENTRYPOINT [ "httpd", "-D", "FOREGROUND" ]

EXPOSE 80
