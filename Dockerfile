FROM alpine:3 as downloader

ARG OPENLDAP_EXPORTER_VERSION=v2.1

ENV OPENLDAP_EXPORTER_SOURCE="https://github.com/tomcz/openldap_exporter/releases/download/${OPENLDAP_EXPORTER_VERSION}/openldap_exporter-linux"

ADD ${OPENLDAP_EXPORTER_SOURCE} openldap_exporter

RUN chmod +x openldap_exporter

FROM gcr.io/distroless/base:debug-nonroot

WORKDIR /

COPY --from=downloader openldap_exporter /openldap_exporter

USER nonroot:nonroot

ENTRYPOINT ["/openldap_exporter"]
