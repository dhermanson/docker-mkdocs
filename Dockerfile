# Use an official Python runtime as a parent image
# FROM python:2.7-slim

FROM alpine:3.7

WORKDIR /app

RUN apk add --update \
    curl \
    graphviz \
    openjdk8-jre \
    py-pip \
    python \
    ttf-droid \
    ttf-droid-nonlatin \
  && pip install --trusted-host pypi.python.org mkdocs \
  && mkdir -p /opt/plantuml \
  && curl -L https://sourceforge.net/projects/plantuml/files/1.2017.20/plantuml.1.2017.20.jar/download -o /opt/plantuml/plantuml.jar \
  && apk del curl

ADD bin /usr/local/bin
