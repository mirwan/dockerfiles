#!/bin/bash

sed -i -e "s/##LIVESTATUS_HOST##/${LIVESTATUS_HOST}/" -e "s/##LIVESTATUS_PORT##/${LIVESTATUS_PORT}/" /etc/thruk/thruk_local.conf
htpasswd -b -c /etc/thruk/htpasswd thrukadmin -b ${THRUK_PASSWORD}

