#!/bin/sh
set -e

if [ ! -f /config/webhook/hooks.json ]; then
  mkdir -p /config/webhook
  cp /default/hooks.json /config/webhook/hooks.json
  chown webhook:webhook /config/webhook/hooks.json
fi

exec su-exec webhook /usr/bin/webhook "$@"