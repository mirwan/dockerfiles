FROM debian
MAINTAINER mirwan666@gmail.com
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install python-pip libcurl4-gnutls-dev python-dev supervisor nagios-plugins git python-setuptools python-cherrypy3
RUN apt-get -y install wget
RUN wget http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
RUN dpkg -i influxdb_latest_amd64.deb
RUN useradd -d /var/lib/shinken -s /bin/sh -m shinken
RUN pip install pycurl 
RUN pip install riemann-client
RUN git clone https://github.com/naparuba/shinken.git /shinken
WORKDIR /shinken
RUN python setup.py install
RUN shinken --init
RUN shinken install mod-influxdb
RUN shinken install livestatus
RUN sed -i -r 's/^(.+modules)/\1 livestatus, mod-riemann, mod-influxdb/' /etc/shinken/brokers/broker-master.cfg
RUN shinken install mod-riemann
RUN shinken install mysql-import
RUN shinken install syslog-sink
RUN shinken install logstore-sqlite
RUN shinken install simple-log
ADD supervisord.conf /etc/supervisor/supervisord.conf
EXPOSE 50000 7768 7769 7770 7771 7772 7773
CMD ["/usr/bin/supervisord"]
