FROM alpine:latest

# Install kubectl
# Note: Latest version may be found on:
# https://aur.archlinux.org/packages/kubectl-bin/
# ADD https://storage.googleapis.com/kubernetes-release/release/v1.5.1/bin/linux/amd64/kubectl /usr/local/bin/kubectl

ENV HOME=/config
ENV KOPS_VERISON="1.6.1"

RUN set -x && \
    apk add --no-cache curl ca-certificates

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
      && chmod +x ./kubectl \
      && mv ./kubectl /usr/local/bin/kubectl \
      # Basic check it works.
      && kubectl version --client

# Install kops
RUN curl -LO https://github.com/kubernetes/kops/releases/download/$KOPS_VERISON/kops-linux-amd64 \
    && chmod +x kops-linux-amd64 \
    && mv kops-linux-amd64 /usr/local/bin/kops \
    && kops version
