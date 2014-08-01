FROM debian:wheezy
MAINTAINER mirwan666@gmail.com
ENV DEBIAN_FRONTEND noninteractive
RUN echo 'deb http://labs.consol.de/repo/testing/debian wheezy main' >/etc/apt/sources.list.d/labs.consol.de.list
RUN gpg --keyserver keys.gnupg.net --recv-keys F8C1CA08A57B9ED7
RUN gpg --armor --export F8C1CA08A57B9ED7 | apt-key add -
RUN apt-get update
RUN apt-get -y install libapache2-mod-fcgid nagios-images apache2
RUN chmod g+w,o+w /tmp
RUN apt-get -y install thruk
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
RUN mkdir -p /var/run/apache2
ADD vhost.conf /etc/apache2/sites-available/default
ADD thruk_local.conf /etc/thruk/thruk_local.conf
ADD runtime_setup.sh /runtime_setup.sh
RUN chmod +x runtime_setup.sh
RUN a2enmod fcgid rewrite
EXPOSE 80
CMD /runtime_setup.sh && /usr/sbin/apache2 -D FOREGROUND
