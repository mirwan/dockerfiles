FROM ubuntu:trusty
MAINTAINER mirwan666@gmail.com
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install xymon supervisor apache2 python-pip apache2-mpm-prefork
RUN pip install envtpl
EXPOSE 80 1984
ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD hosts.cfg.tpl /etc/xymon/hosts.cfg.tpl
ADD xymon-client.default.tpl /etc/default/xymon-client.tpl
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
RUN mkdir -p /var/lock/apache2 /var/run/apache2
RUN cat /etc/xymon/tasks.cfg | awk '/CMD xymond / {sub(/xymond/,"xymond --flap-count=0")}{print}' >/tmp/tasks.cfg && mv /tmp/tasks.cfg /etc/xymon/tasks.cfg
RUN sed -r -i -e '/^(.+)Order .+$/d' -e 's/^(.+)Allow from .+$/\1Require all granted/g' /etc/apache2/conf.d/xymon 
RUN ln -s ../conf.d/xymon /etc/apache2/conf-available/xymon.conf
RUN a2enmod rewrite authz_groupfile cgid
RUN a2enconf xymon
CMD for file in /etc/default/xymon-client.tpl /etc/xymon/hosts.cfg.tpl; do envtpl --keep-template --allow-missing $file; done && /usr/bin/supervisord
