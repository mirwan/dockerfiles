<match docker.**>
#        type copy
#        <store>
#                type stdout
#        </store>
#        <store>
                type record_reformer
                tag reformed.${tag}.${type}
                renew_record true
                <record>
                service ${tag+"."+key}
                metric ${value}
                description ${type}
                host ${source[0,12]}
                </record>
#        </store>
</match>
<match reformed.**>
#		type copy
#        <store>
#                type stdout
#        </store>
#        <store>
        type riemann
        host {{ RIEMANN_HOST }}
        port {{ RIEMANN_PORT }}
        timeout 5
        protocol tcp
        fields metric,host,service,description
        types metric:integer
        flush_interval 10s
#        </store>
</match>
<source>
  type docker_metrics
  stats_interval 10s
  docker_infos_path /host/var/lib/docker/execdriver/native
  docker_network_stats /host/sys/class/net
  docker_socket unix:///host/var/run/docker.sock
</source>

