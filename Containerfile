FROM quay.io/opendatahub-contrib/workbench-images:vscode-datascience-c9s-py311_2023c_latest

ENV IJAVA_VERSION=1.3.0 \
  JAVA_HOME=/usr/lib/jvm/java-17-openjdk

USER root

# Install pip dependencies
RUN pip install \
  jupyterlab \
  bash_kernel \
  jinja2 \
  ansible
# Install helm
RUN install -d /usr/local/bin/ /usr/local/src
RUN curl -fsSL -o /usr/local/bin/get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 /usr/local/bin/get_helm.sh
RUN env HELM_INSTALL_DIR=/usr/local/bin /usr/local/bin/get_helm.sh --no-sudo
RUN python -m bash_kernel.install
# Install IJava Kernel
WORKDIR /usr/local/opt/ijava
RUN install -d /usr/local/opt/ijava \
  && curl -L https://github.com/SpencerPark/IJava/releases/download/v$IJAVA_VERSION/ijava-$IJAVA_VERSION.zip -o /tmp/ijava-$IJAVA_VERSION.zip \
  && unzip -n /tmp/ijava-$IJAVA_VERSION.zip -d /usr/local/opt/ijava \
  && python3 install.py --prefix /opt/app-root \
  && jupyter kernelspec install /opt/app-root/share/jupyter/kernels/java
# Install java 17 and maven
RUN dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
RUN dnf install -y java-17-openjdk-devel maven jq gh \
  && alternatives --set java java-17-openjdk.x86_64 \
  && alternatives --set javac java-17-openjdk.x86_64

RUN chown -R 1001 /opt/app-root/src

USER 1001
