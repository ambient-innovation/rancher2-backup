FROM docker:18.03.1-ce

WORKDIR /srv

ENV TZ Europe/Berlin
RUN apk update && apk add --no-cache tzdata\
    && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD rancher-backup /usr/bin/rancher-backup
ADD entry-point.sh /

RUN chmod +x /entry-point.sh /usr/bin/rancher-backup
ENTRYPOINT  ["/entry-point.sh"]