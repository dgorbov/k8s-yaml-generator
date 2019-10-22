apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: ${INGRESS_NAME}
spec:
  rules:
    - host: ${INGRESS_HOST}
      http:
        paths:
%{ for service in BACKEND_SERVICES ~}
          - path: ${service["api_context_path"]}
            backend:
              serviceName: ${service["service_name"]}
              servicePort: ${service["service_port"]}
%{ endfor ~}