# vscode-java

An OpenShift AI Image running VSCode for Java development.
- Based on the [IJava project by SpencerPark](https://github.com/SpencerPark/IJava) on GitHub for Jupyter Lab Notebook integration.
- Uses java-17-openjdk-devel and maven package support.
- Used by the Smarta Byar Smart Village Community using AI/ML code generation technology for Smart Data Model APIs.

Base image: [quay.io/opendatahub-contrib/workbench-images:vscode-datascience-c9s-py311_2023c_latest](https://github.com/opendatahub-io-contrib/workbench-images)

| Python packages | Description |
| --- | --- |
| jupyterlab | A web-based user interface to work with Jupyter notebooks, editors, terminals, and custom components |
| bash_kernel | A Jupyter kernel for bash |
| ansible | For running Ansible Playbooks from Jupyter Notebooks, like deploying applications to an OpenShift Project with the [Smart Village Operator](https://github.com/smartabyar-smartvillage/smartvillage-operator). |

| Downloaded packages | Description |
| --- | --- |
| IJava | We download IJava 1.3.0 with curl, unzip it, and install it with the provided install.py into /opt/app-root. |

| System packages | Description |
| --- | --- |
| java-17-openjdk-devel | We provide the full Java 17 OpenJDK SDK to run and compile Java applications cloned from git in the terminal and Java inline Jupyter Notebooks. |
| maven | Maven is provided for compiling, installing, and deploying Java packages to Maven Central. |

You can pull the latest [vscode-java container image](https://github.com/nerc-images/vscode-java/pkgs/container/vscode-java) below:

```
podman pull ghcr.io/nerc-images/vscode-java:main
```
