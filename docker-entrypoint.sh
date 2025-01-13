#!/bin/ash
set -e

# Set permissions
user="$(id -u)"
if [ "$user" = '0' ]; then
  [ ! -f "/mosquitto/config/mosquitto.conf" ] && cp /mosquitto/default/mosquitto-no-auth.conf /mosquitto/config/ || true
	[ -d "/mosquitto" ] && chown -R mosquitto:mosquitto /mosquitto || true
fi

exec "$@"
