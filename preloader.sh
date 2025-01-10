#!/bin/bash

mkdir -p jmx-exporter

# URL для отправки данных (замените на URL вашего NiFi ListenHTTP)
curl https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.19.0/jmx_prometheus_javaagent-0.19.0.jar \
  -o jmx-exporter/jmx_prometheus_javaagent-0.19.0.jar

curl  https://raw.githubusercontent.com/prometheus/jmx_exporter/main/example_configs/kafka-2_0_0.yml \
  -o jmx-exporter/kafka-2_0_0.yml

mkdir -p grafana/provisioning/datasources
mkdir -p grafana/provisioning/dashboards

touch grafana/provisioning/datasources/datasource.yml
touch grafana/provisioning/dashboards/dashboard.yml

curl https://raw.githubusercontent.com/strimzi/strimzi-kafka-operator/main/examples/metrics/grafana-dashboards/strimzi-kafka-exporter.json -o grafana/dashboards/strimzi-kafka-exporter.json
curl https://raw.githubusercontent.com/strimzi/strimzi-kafka-operator/main/examples/metrics/grafana-dashboards/strimzi-kafka.json -o grafana/dashboards/strimzi-kafka.json

