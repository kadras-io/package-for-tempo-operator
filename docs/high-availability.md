# Configuring High Availability

High availability can be configured using different strategies for the Tempo Operator and for Tempo Stack.

## High availability for Tempo Operator

The Tempo Operator can be scaled horizontally to achieve high availability.

The Tempo Operator controller support high availability following an active/passive model based on the leader election strategy. To achieve high availability, you can increase the number of replicas for the controller.

```yaml
controller:
  replicas: 2
configMapData:
  leaderElection:
    leaderElect: true
    leaseDuration: 60s
    renewDeadline: 40s
    retryPeriod: 10s
```

## High availability for Tempo Stack

High availability for the Tempo Stack can be enabled by configuring at least 2 replicas. You can configure the number of replicas for each component in the stack or apply the same strategy across all components. This package supports the latter strategy out of the box.

```yaml
tempo:
  tempoStack:
    replicationFactor: 2
```

## High availability for Tempo Monolithic

Tempo Monolithic doesn't support horizontal scaling so you cannot run more than 1 replica at a time. For production use cases, the Tempo Stack option is preferred.
