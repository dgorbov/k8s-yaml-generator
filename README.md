# k8s-yaml-generator
Terraform module that generates yaml files for simple k8s app.

Module is not pretend to support all possible scenarious for k8s configuration. 
Module contains basic things that I personally use when deploying applications to k8s cluster.
I hope it will be useful for community. Feel free to suggest improvements!

These types of k8s workloads/resources are supported:
* [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
* [Service](https://kubernetes.io/docs/concepts/services-networking/service/)
* [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)