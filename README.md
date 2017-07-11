## Kubernetes Utilities

This project contains [Kubernetes](https://kubernetes.io/) related utilities for use in build/deploy pipelines that have docker.

The following utilities are included:
* [kubectl](https://kubernetes.io/docs/user-guide/kubectl-overview/) is a CLI tool to manage a Kubernetes cluster
* [kops](https://github.com/kubernetes/kops) - CLI tool to create, destroy, upgrade Kubernetes clusters in cloud service providers
* [helm](https://github.com/kubernetes/helm) - Kubernetes packaging/deployment tool

### Why use it

It's mostly meant to be used during continuous integration or as part of an automated build/deployment:

  * So that your machine (e.g. build server) doesn't need `kubectl` or other cli tools to be installed; only Docker.
  * To avoid `kubectl config use-context` and similar to affect your build and other projects' builds.

## Usage

    $ docker run --rm bartlettc22/kubectl kubectl --help

### Usage example 1

For example to access a local Kubernetes cluster you may run:

    $ docker run --rm --net=host --user $UID \
        -v ~/.kube:/config/.kube \
        cbartlett22/kubectl kubectl cluster-info

### Usage: kubectl

```
docker run --rm -it \
  -v ${HOME}/.aws:/config/.aws \
  -e "AWS_PROFILE=$AWS_PROFILE" \
  -e "KOPS_NAME=blue.testcluster.io" \
  -e "KOPS_STATE_STORE=s3://kubectl-state" \
  bartlettc/docker-kubectl \
  sh -c "kops export kubecfg --name \$KOPS_NAME; kubecfg version"
```
