FROM alpine

RUN apk add --no-cache \
      --repository http://dl-cdn.alpinelinux.org/alpine/latest/community \
      webhook su-exec

RUN addgroup -g 1000 -S webhook \
 && adduser  -u 1000 -S -G webhook -h /etc/webhook webhook

WORKDIR /default
COPY hooks.json /default/hooks.json

RUN mkdir -p /config/webhook \
 && cp /default/hooks.json /config/webhook/hooks.json \
 && chown -R webhook:webhook /config/webhook

WORKDIR /config/webhook
VOLUME ["/config/webhook"]

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["-verbose", "-hooks=/config/webhook/hooks.json", "-hotreload"]