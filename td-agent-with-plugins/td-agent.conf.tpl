<match reformed.**>
	# STDOUT copy is commented, you can enable it and then kill processes (supervisor will restart it)
        type copy
        #<store>
        #        type stdout
        #</store>
        <store>
                type statsd
                host {{ STATSD_HOST }}
                port {{ STATSD_PORT }}
                flush_interval 10s
        </store>
	<store>
		type influxdb
		host {{ INFLUXDB_HOST }}
		port {{ INFLUXDB_PORT }}
		dbname fluentd
		user  root
		password  root
		time_precision s
	</store>
</match>
<match docker.**>
        #type copy
        #<store>
        #        type stdout
        #</store>
        #<store>
        type record_reformer
        tag reformed.${tag}
	# Seems that remove_keys does not work...
        renew_record true
	<record>
		# Assuming tag_prefix is docker.subcgroup, and that we use short docker ids
		statsd_key ${tag_prefix[1]+"."+source.gsub(/^.+:([^:]+)$/,'\1')[0,12]+"."+key}
		# As I am not a beefy rubyman, I copied values and then defined statsd_type
		statsd_count ${value}
		statsd_gauge ${value}
		statsd_type ${if type =='counter' then "count" else "gauge" end }
	</record>
	#</store>
</match>
<source>
  type docker_metrics
  stats_interval 10s
</source>
