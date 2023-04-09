# Airgap webhook

This microservice acts as a [validating admission webhook](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/) in a Kubernetes cluster. It maintains a stateful inventory of all images that are deployed to the cluster.

## TL;DR

```console
helm repo add imperialops https://imperialops.github.io/helm-charts
helm install airgap-webhook airgap-webhook/airgap-webhook
```

## Introduction

Read more from the [source repository](https://github.com/ImperialOps/airgap-webhook).

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release imperialops/airgap-webhook
```

The command deploys airgap-webhook on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## License

This microservice is licensed under the MIT License. See the LICENSE file for more information.
