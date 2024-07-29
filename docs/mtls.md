# Configuring mTLS between Tempo components

The communication between distributor and ingester, and the communication between query-frontend and querier can be protected via mTLS.

Configure the mTLS setup as follows. 

```yaml
configMapData:
  featureGates:
    builtInCertManagement:
      enabled: true
      caRefresh: 14016h
      caValidity: 17520h
      certRefresh: 7008h
      certValidity: 8760h
    grpcEncryption: true
    httpEncryption: true
```
