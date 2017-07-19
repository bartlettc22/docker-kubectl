FROM alpine:latest

# Install kubectl
# Note: Latest version may be found on:
# https://aur.archlinux.org/packages/kubectl-bin/
# ADD https://storage.googleapis.com/kubernetes-release/release/v1.5.1/bin/linux/amd64/kubectl /usr/local/bin/kubectl

ENV HOME=/config
ENV KUBE_VERSION="1.5.2"
ENV KOPS_VERISON="1.6.1"
ENV HELM_VERSION="2.5.0"

RUN set -x && \
    apk add --no-cache curl ca-certificates openssl bash jq

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v$KUBE_VERSION/bin/linux/amd64/kubectl \
      && chmod +x ./kubectl \
      && mv ./kubectl /usr/local/bin/kubectl \
      # Basic check it works.
      && kubectl version --client

# Install kops
RUN curl -LO https://github.com/kubernetes/kops/releases/download/$KOPS_VERISON/kops-linux-amd64 \
    && chmod +x kops-linux-amd64 \
    && mv kops-linux-amd64 /usr/local/bin/kops \
    && kops version

# Install helm
RUN curl -LO https://kubernetes-helm.storage.googleapis.com/helm-v$HELM_VERSION-linux-amd64.tar.gz \
  && tar -zxvf helm-v$HELM_VERSION-linux-amd64.tar.gz \
  && rm helm-v$HELM_VERSION-linux-amd64.tar.gz \
  && chmod +x linux-amd64/helm \
  && mv linux-amd64/helm /usr/local/bin/helm \
  && rm -rf linux-amd64 \
