FROM alpine:3 as downloader

# variable "VERSION" must be passed as docker environment variables during the image build
# docker build --no-cache --build-arg HELM_VERSION=3.2.1 --build-arg YQ_VERSION=3.3.0 -t renaultdigital/helm:2.12.0 .

ARG OPENLDAP_EXPORTER_VERSION=v2.1

ENV OPENLDAP_EXPORTER_SOURCE="https://github.com/tomcz/openldap_exporter/releases/download/${OPENLDAP_EXPORTER_VERSION}/openldap_exporter-linux"

RUN apk add --update --no-cache git curl ca-certificates && rm -f /var/cache/apk/* && \
    curl -L ${OPENLDAP_EXPORTER_SOURCE} --output openldap_exporter-linux && \
    chmod +x openldap_exporter-linux

FROM gcr.io/distroless/base:debug-nonroot

WORKDIR /

COPY --from=downloader openldap_exporter-linux /openldap_exporter

USER nonroot:nonroot

ENTRYPOINT ["/openldap_exporter"]
