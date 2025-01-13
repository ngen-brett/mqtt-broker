#!/bin/ash
set -e

# Set permissions
user="$(id -u)"
if [ "$user" = '0' ]; then
  if [ ! -f "/mosquitto/config/mosquitto.conf" ]
  then
    cp /mosquitto/default/mosquitto-no-auth.conf /mosquitto/config/
  fi

	[ -d "/mosquitto" ] && chown -R mosquitto:mosquitto /mosquitto || true
fi

exec "$@"
