#!/bin/ash
set -e

# Set permissions
user="$(id -u)"
if [ "$user" = '0' ]; then
  echo "Updating ownership for /mosquitto to mosquitto:mosquitto" 
	[ -d "/mosquitto" ] && chown -R mosquitto:mosquitto /mosquitto || true
fi

if [ ! -f "/mosquitto/config/mosquitto.conf" ]
then
  echo "Populating minimal config - remote without authentication"
  cp /mosquitto/default/mosquitto-no-auth.conf /mosquitto/config/mosquitto.conf
fi

exec "$@"
