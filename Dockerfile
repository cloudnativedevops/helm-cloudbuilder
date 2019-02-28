FROM alpine

ENV HELM_VERSION="v2.13.0"
ENV KUBEVAL_VERSION="0.7.3"

RUN apk add --update ca-certificates \
 && apk add --update -t deps wget \
 && wget https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && wget https://github.com/garethr/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz \
 && tar -xvf kubeval-linux-amd64.tar.gz \
 && mv kubeval /usr/local/bin \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && rm -f helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && rm -f kubeval-linux-amd64.tar.gz

RUN helm init --client-only

CMD ["helm"]
