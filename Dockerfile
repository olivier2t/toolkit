FROM alpine:latest
RUN apk add --update --no-cache curl ca-certificates openssh-client bash git curl tar sed gawk jq yq && \
    curl -sL https://get.helm.sh/helm-v3.17.1-linux-amd64.tar.gz | tar -xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64
RUN curl -sLO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl
RUN curl -sLO "https://github.com/cycloidio/cycloid-cli/releases/download/v5.1.151/cy" && \
    mv cy /usr/bin/cy && \
    chmod +x /usr/bin/cy
