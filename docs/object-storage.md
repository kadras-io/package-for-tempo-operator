# Configuring object storage for Tempo

When installing Tempo Operator, you can configure to use object storage for the TempoStack or TempoMonolithic installation.

You can pass the object storage credentials via a Secret, which needs to be created in the cluster before installing Tempo Operator and following this [format](https://grafana.com/docs/tempo/latest/setup/operator/object-storage/). 

```yaml
tempo:
  storage:
    backend:
      secret:
        name: tempo-object-storage-credentials
        namespace: kadras-system
```
