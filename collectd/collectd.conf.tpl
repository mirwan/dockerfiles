#Hostname "{{ HOSTNAME }}"

FQDNLookup False
Interval 10
Timeout 2
ReadThreads 5
AutoLoadPlugin False

LoadPlugin cpu
LoadPlugin logfile
LoadPlugin df
LoadPlugin load
LoadPlugin memory
{% if GRAPHITE_HOST is defined %}
LoadPlugin write_graphite
{% endif %}
{% if COLLECTD_HOST is defined %}
LoadPlugin network
{% endif %}
{% if RIEMANN_HOST is defined %}
LoadPlugin write_riemann
{% endif %}
{% if HTTP_URL is defined %}
LoadPlugin write_http
{% endif %}
LoadPlugin statsd

<Plugin logfile>
       LogLevel "info"
       File "/var/log/collectd.log"
       Timestamp true
       PrintSeverity true
</Plugin>


<Plugin statsd>
  Host "0.0.0.0"
  Port "8125"
  DeleteSets     true
  #TimerPercentile 90.0
</Plugin>

<Plugin df>
  Device "hostfs"
  MountPoint "/.dockerinit"
  IgnoreSelected false
  ReportByDevice false
  ReportReserved true
  ReportInodes true
</Plugin>

<Plugin network>
	Server "{{ COLLECTD_HOST }}" "{{ COLLECTD_PORT }}"
</Plugin>

<Plugin write_riemann>
    <Node "{{ RIEMANN_HOST }}">
        Host "{{ RIEMANN_HOST }}"
        Port {{ RIEMANN_PORT | default("5555") }}
        Protocol TCP
        StoreRates true
        AlwaysAppendDS false
        Delay 10
    </Node>
    Tag "collectd"
</Plugin> 

<Plugin write_graphite>
 <Carbon>
   Host "{{ GRAPHITE_HOST }}"
   Port "{{ GRAPHITE_PORT | default("2003") }}"
   EscapeCharacter "_"
   Postfix ".collectd"
   SeparateInstances true
   StoreRates true
   AlwaysAppendDS false
 </Carbon>
</Plugin>

<Plugin write_http>
  <URL "{{ HTTP_URL }}">
    Format "JSON"
  </URL>
</Plugin>
