dockerfiles/shinken
===================

Dockerfile for shinken
* Each shinken-\* process is started with supervisor
* Basic pip install with following modules:
	* livestatus
	* mod-riemann
	* mod-influxdb
	* mysql-import
	* syslog-sink
