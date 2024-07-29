# Configuring Observability

Monitor and observe the operation of Tempo Operator and Tempo using metrics and traces.

## Metrics

The Tempo Operator controller produces Prometheus metrics when the related option is enabled. It also defines the necessary ServiceMonitors objects for the Prometheus Operator or similar solutions to scrape automatically Tempo Operator for metrics.

```yaml
configMapData:
  featureGates:
    prometheusOperator: true
    observability:
      metrics:
        createPrometheusRules: true
        createServiceMonitors: true
```

The Tempo Stack and Tempo Monolothic installations can both produce Prometheus metrics when the related option is enabled. They also define the necessary ServiceMonitors objects for the Prometheus Operator or similar solutions to scrape automatically Tempo for metrics.

```yaml
tempo:
  observability:
    metrics:
      createServiceMonitors: true
```

For more information, check the Tempo Operator documentation for [metrics](https://grafana.com/docs/tempo/latest/setup/operator/monitor/).

## Traces

The Tempo Stack produces Jaeger traces when the related option is enabled.

```yaml
observability:
  tracing:
    jaegerEndpoint: "opentelemetry-collector:6831"
    samplingFraction: "1.0"
```

For more information, check the Tempo Operator documentation for [traces](https://grafana.com/docs/tempo/latest/setup/operator/monitor/).

## Grafana

The Tempo Operator can provision a Grafana Datasource automatically for configuring the Grafana Operator when the related option is enabled.

```yaml
configMapData:
  featureGates:
    grafanaOperator: true

tempo:
  observability:
    grafana:
      createDatasource: true
```

For more information, check the Tempo Operator documentation for [monitoring](https://grafana.com/docs/tempo/latest/setup/operator/monitor/).
