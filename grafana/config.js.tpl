define(['settings'],
function (Settings) {
  "use strict";

  return new Settings({

    // datasources, you can add multiple
    datasources: {
      influxdbgraphite: {
        type: 'influxdb',
        url: "http://{{INFLUXDB_HOST}}:{{INFLUXDB_PORT | default("8086")}}/db/graphite",
        username: '{{INFLUXDBUSER | default("root")}}',
        password: '{{INFLUXDBPSWD | default("root")}}',
        default: true
      },
      influxdbshinken: {
        type: 'influxdb',
        url: "http://{{INFLUXDB_HOST}}:{{INFLUXDB_PORT | default("8086")}}/db/shinken",
        username: '{{INFLUXDBUSER | default("root")}}',
        password: '{{INFLUXDBPSWD | default("root")}}',
        default: false
      },
    },

    // elasticsearch url
    // used for storing and loading dashboards, optional
    // For Basic authentication use: http://username:password@domain.com:9200
            elasticsearch: "/es",

    // default start dashboard
    default_route: '/dashboard/file/default.json',

    // Elasticsearch index for storing dashboards
    grafana_index: "grafana-dash",

    timezoneOffset: null,

    // set to false to disable unsaved changes warning
    unsaved_changes_warning: true,

    // set the default timespan for the playlist feature
    // Example: "1m", "1h"
    playlist_timespan: "1m",

    // Add your own custom pannels
    plugins: {
      panels: []
    }

  });
});

