FROM quay.io/opendatahub-contrib/workbench-images:vscode-datascience-c9s-py311_2023c_latest

MAINTAINER Christopher Tate <computate@computate.org>

ENV IJAVA_VERSION=1.3.0

USER root

RUN install -d /usr/local/opt/ijava
RUN curl -L https://github.com/SpencerPark/IJava/releases/download/v$IJAVA_VERSION/ijava-$IJAVA_VERSION.zip -o /tmp/ijava-$IJAVA_VERSION.zip
RUN unzip -n /tmp/ijava-$IJAVA_VERSION.zip -d /usr/local/opt/ijava
RUN pip install jupyter jupyterlab notebook
WORKDIR /usr/local/opt/ijava
RUN python3 install.py --prefix /opt/app-root
RUN jupyter kernelspec install /opt/app-root/share/jupyter/kernels/java

USER 1001
