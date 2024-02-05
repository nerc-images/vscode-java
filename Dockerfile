FROM quay.io/opendatahub-contrib/workbench-images:vscode-datascience-c9s-py311_2023c_latest

ENV IJAVA_VERSION=1.3.0 \
  JAVA_HOME=/usr/lib/jvm/java-17-openjdk

USER root

# Install pip dependencies
RUN pip install \
  jupyter \
  jupyterlab \
  notebook \
  ansible \
  bash_kernel
RUN python -m bash_kernel.install
# Install IJava Kernel
WORKDIR /usr/local/opt/ijava
RUN install -d /usr/local/opt/ijava \
  && curl -L https://github.com/SpencerPark/IJava/releases/download/v$IJAVA_VERSION/ijava-$IJAVA_VERSION.zip -o /tmp/ijava-$IJAVA_VERSION.zip \
  && unzip -n /tmp/ijava-$IJAVA_VERSION.zip -d /usr/local/opt/ijava \
  && python3 install.py --prefix /opt/app-root \
  && jupyter kernelspec install /opt/app-root/share/jupyter/kernels/java
# Install java 17 and maven
RUN dnf install -y java-17-openjdk-devel maven \
  && alternatives --set java java-17-openjdk.x86_64 \
  && alternatives --set javac java-17-openjdk.x86_64

USER 1001
