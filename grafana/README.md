grafana
===================

Dockerfile for grafana
* Install from grafana/grafana GIT master
* Includes ElasticSearch
* InfluxDB databases: graphite, shinken
	* Expected variables: InfluxDB host, port (default to 8086), login (default root), password (default root)
* /es to access ElasticSearch
