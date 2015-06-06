#!/bin/bash

# Create new nginx site config
sed -e "s/XMPP_DOMAIN/$XMPP_DOMAIN/g" \
    -e "s/XMPP_HOST/$XMPP_HOST/g" \
    -e "s/XMPP_PORT/$XMPP_PORT/g" \
    -e "s/HTTP_PORT/$PORT/g" \
    /var/www/jitsi-meet/deploy/conf/nginx-host > "/etc/nginx/sites-enabled/jitsi"

# Generate the new Jitsi config file
sed -e "s/XMPP_DOMAIN/$XMPP_DOMAIN/g" \
    /var/www/jitsi-meet/deploy/conf/config.js > "/var/www/jitsi-meet/config.js"

# Start nginx
echo "Running on port $PORT"
nginx
