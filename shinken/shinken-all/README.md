shinken-all
===================

Dockerfile for shinken
* Each shinken-\* process is started with supervisor
* Install from naparuba/shinken GIT master with following modules:
	* livestatus (enabled)
	* mod-riemann (enabled)
	* mod-influxdb (enabled)
	* mysql-import
	* syslog-sink
	* logstore-sqlite (enabled via livestatus)
	* simple-log
