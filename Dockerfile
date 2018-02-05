FROM gcr.io/google_containers/ubuntu-slim:0.14

ARG HELM_VERSION

ENV HELM_VERSION v${HELM_VERSION}
ENV HELM_FILENAME helm-${HELM_VERSION}-linux-amd64.tar.gz

RUN apt-get update && apt-get install --no-install-recommends -y \
  ca-certificates wget git lsb-release curl \
  && rm -rf /var/tmp/* \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/cache/apt/archives/* \
  && wget https://storage.googleapis.com/kubernetes-helm/${HELM_FILENAME} -P /tmp \
  && tar -zxvf /tmp/${HELM_FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /usr/local/bin \
  && chmod +x /usr/local/bin/kubesec \
  && rm -rf /tmp/*

RUN helm init --client-only
RUN helm plugin install https://github.com/databus23/helm-diff

CMD ["helm"]
