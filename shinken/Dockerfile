FROM debian
MAINTAINER mirwan666@gmail.com
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install python-pip libcurl4-gnutls-dev python-dev supervisor
RUN useradd -d /var/lib/shinken -s /bin/sh -m shinken
RUN pip install shinken pycurl 
RUN shinken --init
RUN shinken install mod-influxdb
RUN shinken install livestatus
RUN shinken install mod-riemann
RUN shinken install mysql-import
RUN shinken install syslog-sink
ADD supervisord.conf /etc/supervisor/supervisord.conf
EXPOSE 50000 7768 7769 7770 7771 7772 7773
CMD ["/usr/bin/supervisord"]
