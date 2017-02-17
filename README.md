## What is `kubectl`

`kubectl` is a CLI tool to control a cluster [Kubernetes](http://kubernetes.io/).

## Usage

    $ docker run --rm bartlettc22/kubectl kubectl --help

### Usage example 1

For example to access a local Kubernetes cluster you may run:

    $ docker run --rm --net=host --user $UID \
        -v ~/.kube:/config/.kube \
        cbartlett22/kubectl kubectl cluster-info

### Why use it

It's mostly meant to be used during continuous integration or as part of an automated build/deployment:

  * So that your machine (e.g. build server) doesn't need `kubectl` to be installed; only Docker.
  * To avoid `kubectl config use-context` and similar to affect your build and other projects' builds.