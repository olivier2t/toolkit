FROM alpine:latest
RUN apk add --update --no-cache curl ca-certificates openssh-client bash git curl tar sed gawk jq yq envsubst && \
    curl -sL https://get.helm.sh/helm-v3.17.1-linux-amd64.tar.gz | tar -xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64
RUN curl -sLO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl
RUN curl -sLO "https://github.com/cycloidio/cycloid-cli/releases/download/v5.1.153/cy" && \
    mv cy /usr/bin/cy && \
    chmod +x /usr/bin/cy
RUN curl -sLO "https://github.com/concourse/concourse/releases/download/v7.9.1/fly-7.9.1-linux-amd64.tgz" && \
    tar xvf fly-7.9.1-linux-amd64.tgz && \
    mv fly /usr/bin/ && \
    chmod +x /usr/bin/fly
