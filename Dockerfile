FROM alpine

ENV HELM_VERSION="v3.7.1"
ENV KUBEVAL_VERSION="v0.16.1"

RUN apk add --update ca-certificates \
    && apk add --update -t deps wget \
    && wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin \
    && wget https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz \
    && tar -xvf kubeval-linux-amd64.tar.gz \
    && mv kubeval /usr/local/bin \
    && apk del --purge deps \
    && rm /var/cache/apk/* \
    && rm -f helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && rm -f kubeval-linux-amd64.tar.gz

CMD ["helm"]
