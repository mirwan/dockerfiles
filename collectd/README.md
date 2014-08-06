collectd
========

Basic collectd-based server.
* Sends stats to Graphite, HTTP, Riemann, Network - depending on provided env variables (e.g. if `*_HOST` is not provided, the corresponding plugin is not loaded, the same behaviour applies to `HTTP_URL`).
* Listens for statsd events

Collectd metrics:

* CPU used/free/idle/etc
* Free disk (via the .dockerinit filesystem)
* Load average
* Memory used/free/etc

Highly inspired by (https://github.com/andreasjansson/docker-collectd-write-graphite.git)

Environment variables
---------------------
* `RIEMANN_HOST`
* `RIEMANN_PORT` TCP port (defaults to 5555)
* `GRAPHITE_HOST`
* `GRAPHITE_PORT` (defaults to 2003)
* `COLLECTD_HOST`
* `COLLECTD_PORT` UDP port (defaults to 25826)
* `HTTP_URL`
