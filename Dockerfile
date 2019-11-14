FROM registry.redhat.io/ubi8/ubi:8.1 AS build

USER root

WORKDIR /tmp

ENV PATH=$PATH:/usr/local/bin PATH=$PATH:/usr/local/go/bin RELEASE_VERSION=v0.12.0

RUN mkdir -p /usr/local/bin && \
    curl -LO https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz && \
    curl -LO https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu && \
    mv operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu /usr/local/bin/operator-sdk && \
    chmod +x /usr/local/bin/operator-sdk && \
    rm -rf /tmp/*

WORKDIR /

RUN groupadd -g 1001 go && \
    useradd -m -u 1001 -g go go

USER go
