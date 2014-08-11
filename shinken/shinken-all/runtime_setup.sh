#!/bin/bash
# Graphite by InfluxDB
if [ -z "${GRAPHITE_HOST}" -o -z "${GRAPHITE_PORT}" ];
then
	echo "GRAPHITE_HOST and/or GRAPHITE_PORT are empty"
else
	sed -i -r -e "s/^(.*host).+$/\1 ${GRAPHITE_HOST}/" -e "s/^(.*port).+$/\1 ${GRAPHITE_PORT}/" /etc/shinken/modules/graphite.cfg
fi

# InfluxDB
if [ -z "${INFLUXDB_HOST}" -o -z "${INFLUXDB_PORT}" ];
then
	echo "INFLUXDB_HOST and/or INFLUXDB_PORT are empty"
else
	sed -i -r -e "s/^(.*host).+$/\1 ${INFLUXDB_HOST}/" -e "s/^(.*port).+$/\1 ${INFLUXDB_PORT}/" /etc/shinken/modules/influxdb.cfg
fi

# Riemann
if [ -z "${RIEMANN_HOST}" -o -z "${RIEMANN_PORT}" ];
then
	echo "RIEMANN_HOST and/or RIEMANN_PORT are empty"
else
	sed -i -r -e "s/^(.*host).+$/\1 ${RIEMANN_HOST}/" -e "s/^(.*port).+$/\1 ${RIEMANN_PORT}/" /etc/shinken/modules/riemann.cfg
fi

# MySQL
if [ -z "${MYSQL_HOST}" -o -z "${MYSQL_PORT}" ];
then
	echo "MYSQL_HOST and/or MYSQL_PORT are empty"
else
	sed -i -r -e "s/^(.*host)\s.+$/\1 ${MYSQL_HOST}/" /etc/shinken/modules/import_mysql.cfg
	#iptables -t nat -A PREROUTING -p tcp --dport 3306 -j DNAT --to ${MYSQL_HOST}:${MYSQL_PORT}
	iptables -t nat -A OUTPUT -p tcp --dst ${MYSQL_HOST} --dport 3306 -j DNAT --to-destination ${MYSQL_HOST}:${MYSQL_PORT}
	iptables -t nat -A POSTROUTING -p tcp --dst ${MYSQL_HOST} --dport 3306 -j MASQUERADE
fi

sed -i -r -e "s/^(\s*(host_name|address)\s*).*/\1${HOSTNAME}/" -e 's/\}/alias\tlocalhost\n}/' -e "s/^(\s*use\s*).*/\1docker/" /etc/shinken/hosts/localhost.cfg
