#!/bin/bash
if [ -z "${LIVESTATUS_HOST}" -o -z "${LIVESTATUS_PORT}" ];
then
	echo "LIVESTATUS_HOST and/or LIVESTATUS_PORT are empty"
else
	sed -i -e "s/##LIVESTATUS_HOST##/${LIVESTATUS_HOST}/" -e "s/##LIVESTATUS_PORT##/${LIVESTATUS_PORT}/" /etc/thruk/thruk_local.conf
fi

if [ -z "${THRUK_PASSWORD}" ];
then
	echo "THRUK_PASSWORD is empty"
else
	htpasswd -b -c /etc/thruk/htpasswd thrukadmin ${THRUK_PASSWORD}
fi

