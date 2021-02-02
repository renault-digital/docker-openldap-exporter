# docker-openldap-exporter

![Docker Image CI Push](https://github.com/renault-digital/docker-openldap-exporter/workflows/Docker%20Image%20CI%20Push/badge.svg)
![Docker Image Trivy](https://github.com/renault-digital/docker-openldap-exporter/workflows/Docker%20Image%20Trivy/badge.svg)

Auto-trigger docker build for [Docker OpenLdap Exporter](https://github.com/renault-digital/openldap_exporter) when new release is announced.

[![DockerHub Badge](http://dockeri.co/image/renaultdigital/openldap-exporter)](https://hub.docker.com/r/renaultdigital/openldap-exporter/)

## NOTES

The latest docker tag is the latest release version (https://github.com/tomcz/openldap_exporter/releases/latest)

Please avoid to use `latest` tag for any production deployment. Tag with right version is the proper way, such as `renaultdigital/openldap-exporter:v2.1`

### Github Repo

https://github.com/renault-digital/docker-openldap-exporter

### Daily Github Action CI build logs

https://github.com/renault-digital/docker-openldap-exporter/actions

### Docker image tags

https://hub.docker.com/r/renaultdigital/openldap-exporter/tags/

# Usage

    # mount local folders in container.
    docker run -ti --rm renaultdigital/openldap-exporter

    # Run openldap-exporter with special version. The tag is openldap-exporter's version
    docker run -ti --rm renaultdigital/openldap-exporter:v2.1

    # run container as command
    alias openldap-exporter="docker run -ti --rm renaultdigital/openldap-exporter"
    openldap-exporter --help

    # example in ~/.bash_profile
    aliasopenldap-exporter='docker run -ti --rm renaultdigital/openldap-exporter'

# Why we need it

Mostly it is used during CI/CD (continuous integration and continuous delivery) or as part of an automated build/deployment

# The Processes to build this image

* Enable GITHUB ACTIONS CI cronjob on this repo to run build daily on main branch
* Check if there are new tags/releases announced via Github REST API
* Match the exist docker image tags via Hub.docker.io REST API
* If not matched, build the image with release version and push to https://hub.docker.com/
* Get the latest version from https://github.com/tomcz/openldap_exporter/releases/latest, pull the image with that version, tag as `renaultdigital/openldap-exporter:latest` and push to hub.docker.com

# Contribution

Before any contribution, test your code :

- using our testing script: `.githooks/pre-commit`
- by registering our githooks: `git config --local core.hooksPath .githooks/`
