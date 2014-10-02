docker td-agent-with-plugins
============================

Docker used to test some fluentd plugins' usage.
So far, the only plugins used are docker-metrics (from https://github.com/philalex/fluent-plugin-docker-metrics) and riemann (from https://github.com/mirwan/fluent-plugin-riemann)

* It uses envtpl to replace Riemann connection variables in td-agent.conf at runtime
* It expects /var/run/docker.sock, /sys, /var/lib/docker to be mounted (via --volume parameters) inside the docker, according to docker-metrics plugin's configuration
* It needs to be run with --privileged


