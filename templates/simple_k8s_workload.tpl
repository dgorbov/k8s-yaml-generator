apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${WORKLOAD_NAME}-deployment
spec:
  selector:
    matchLabels:
      app: ${WORKLOAD_NAME}
  replicas: ${REPLICAS_COUNT}
  template:
    metadata:
      labels:
        app: ${WORKLOAD_NAME}
    spec:
      containers:
      - name: ${WORKLOAD_NAME}
        image: ${IMAGE}
%{ if ENV_VARS != null ~}
        env:
%{ for key in keys(ENV_VARS) ~}
        - name: ${key}
          value: "${ENV_VARS[key]}"
%{ endfor ~}
%{ endif ~}
%{ if CMD != null ~}
        command: ["${CMD}"]
        args: [${CMD_ARGS}]
%{ endif ~}
---

%{ if SERVICE_PORT > 0 ~}
apiVersion: v1
kind: Service
metadata:
  name: ${WORKLOAD_NAME}-service
spec:
  selector:
    app: ${WORKLOAD_NAME}
  ports:
    - name: ${WORKLOAD_NAME}-port
      port: ${SERVICE_PORT}
  type: ClusterIP
---
%{ endif ~}