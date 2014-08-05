FROM debian
MAINTAINER mirwan666@gmail.com
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install python-pip libcurl4-gnutls-dev python-dev supervisor nagios-plugins git python-setuptools python-cherrypy3
RUN useradd -d /var/lib/shinken -s /bin/sh -m shinken
RUN pip install pycurl 
RUN pip install riemann-client
RUN git clone https://github.com/naparuba/shinken.git /shinken
WORKDIR /shinken
RUN python setup.py install
WORKDIR /
RUN shinken --init
RUN shinken install mod-influxdb
RUN pip install influxdb
RUN shinken install livestatus
RUN sed -i -r 's/^([^#]+modules).*/\1 livestatus, mod-riemann, mod-influxdb, graphite/' /etc/shinken/brokers/broker-master.cfg
#RUN sed -i -r 's/^([^#]+modules).*/\1 named-pipe, mysql-import, collectd/' /etc/shinken/arbiters/arbiter-master.cfg
RUN sed -i -r 's/^([^#]+modules).*/\1 named-pipe, Collectd/' /etc/shinken/arbiters/arbiter-master.cfg
RUN shinken install mod-riemann
RUN shinken install mod-collectd
RUN sed -i -r -e 's/.*grouped_collectd_plugins\s*$/grouped_collectd_plugins cpu, df, tcpconns, disk, interface, apache, nfs, bind, mysql/' /etc/shinken/modules/collectd.cfg
RUN shinken install graphite
RUN sed -i -r -e 's/^([^#]+port).+$/\1 2004/' -e 's/.*graphite_data_source.*/graphite_data_source shinken/' /etc/shinken/modules/graphite.cfg
RUN sed -i -r -e 's/^([^#]+database).+$/\1 shinken/' /etc/shinken/modules/influxdb.cfg
RUN shinken install mysql-import
RUN shinken install syslog-sink
RUN shinken install logstore-sqlite
RUN shinken install simple-log
ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD runtime_setup.sh /runtime_setup.sh
EXPOSE 50000 7768 7769 7770 7771 7772 7773 25826/udp
CMD /runtime_setup.sh && /usr/bin/supervisord
