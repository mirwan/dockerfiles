#!/bin/bash
# Graphite by InfluxDB
if [ -z "${GRAPHITE_HOST}" -o -z "${GRAPHITE_PORT}" ];
then
	echo "GRAPHITE_HOST and/or GRAPHITE_PORT are empty"
else
	sed -i -r -e "s/^(.*host).+$/\1 ${GRAPHITE_HOST}/" -e "s/^(.*port).+$/\1 ${GRAPHITE_PORT}/" /etc/shinken/modules/graphite.cfg
fi

# Riemann
if [ -z "${RIEMANN_HOST}" -o -z "${RIEMANN_PORT}" ];
then
	echo "RIEMANN_HOST and/or RIEMANN_PORT are empty"
else
	sed -i -r -e "s/^(.*host).+$/\1 ${RIEMANN_HOST}/" -e "s/^(.*port).+$/\1 ${RIEMANN_PORT}/" /etc/shinken/modules/riemann.cfg
fi
