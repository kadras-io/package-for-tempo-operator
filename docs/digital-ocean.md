# Deploying Tempo Operator on Digital Ocean Kubernetes Service

The Persistent Volume used by the Ingester component is expected to by owned by `1001:1001`.
The Digital Ocean Kubernetes Service creates volumes with a filesystem owned by `root:root`, which means the Ingester component will fail to start. Since Digital Ocean doesn't support the `mountOptions` settings to change the file permissions in the mounted volume, a custom SecurityContext must be configured for the Ingester component in order to make it work.

```yaml
tempo:
  tempoStack:
    ingester:
      podSecurityContext:
        fsGroup: 10001
```

For more information, check [gh-996](https://github.com/grafana/tempo-operator/issues/996).
