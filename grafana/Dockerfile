FROM debian:wheezy
MAINTAINER mirwan666@gmail.com
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install wget default-jre-headless supervisor
RUN wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elasticsearch.org/elasticsearch/1.1/debian stable main" >>/etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install elasticsearch apache2 git
RUN rm -rf /var/www
RUN git clone https://github.com/grafana/grafana.git /grafana
WORKDIR /grafana
RUN git checkout v1.6.1
RUN ln -s /grafana/src /var/www
ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD es.conf /etc/apache2/conf.d/es.conf
RUN mkdir -p /var/run/apache2
RUN mkdir -p /usr/share/elasticsearch/data && chown elasticsearch:elasticsearch /usr/share/elasticsearch/data
RUN a2enmod proxy_http
EXPOSE 80
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
CMD /usr/bin/supervisord
