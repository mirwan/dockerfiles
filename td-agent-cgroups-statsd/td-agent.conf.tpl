<match reformed.**>
        type copy
        <store>
                type stdout
        </store>
        <store>
                type statsd
                host {{ STATSD_HOST }}
                port {{ STATSD_PORT }}
                flush_interval 10s
        </store>
</match>
<match docker.**>
        type record_reformer
        output_tag reformed.${tag}
        remove_keys source,key,value
        statsd_key ${"docker."+${tag_parts[1]+"."+source.gsub(/^.+:([^:]+)$/,'\1')[0,11].key}
        statsd_count ${value}
        statsd_gauge ${value}
        statsd_type ${defined? type ? type : "gauge"}
</match>
<source>
  type docker_metrics
  stats_interval 10s
</source>
