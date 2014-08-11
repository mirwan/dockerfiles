FROM    ubuntu:trusty
ENV     DEBIAN_FRONTEND noninteractive
ADD	http://packages.treasuredata.com/GPG-KEY-td-agent /GPG-KEY-td-agent
RUN	apt-key add /GPG-KEY-td-agent
RUN     echo "deb http://packages.treasuredata.com/precise/ precise contrib" > /etc/apt/sources.list.d/treasure-data.list
RUN     apt-get update
RUN     apt-get -y install td-agent python-pip git ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev supervisor docker.io
RUN	ln -sf /usr/bin/docker.io /usr/local/bin/docker
RUN	pip install envtpl
RUN	/usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-statsd --no-ri --no-rdoc
RUN	/usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-docker-metrics --no-ri --no-rdoc
RUN	/usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-record-reformer --no-ri --no-rdoc
RUN	/usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-influxdb --no-ri --no-rdoc
RUN	/usr/lib/fluent/ruby/bin/fluent-gem install statsd-ruby --no-ri --no-rdoc
ADD	td-agent.conf.tpl /etc/td-agent/td-agent.conf.tpl
ADD	mountcgroups.sh /mountcgroups.sh
ADD	supervisord.conf /etc/supervisor/supervisord.conf
CMD     envtpl --allow-missing /etc/td-agent/td-agent.conf.tpl && /mountcgroups.sh && /usr/bin/supervisord
