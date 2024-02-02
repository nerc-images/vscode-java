# vscode-java

## Build the container with podman

```bash
cd ~/.local/src/vscode-java
podman build -t computateorg/vscode-java:latest .
```

## Test the container locally
```bash
podman run --rm -it computateorg/vscode-java:latest /bin/bash
```

## Push the container up to quay.io
```bash
podman login quay.io
podman push computateorg/vscode-java:latest quay.io/computateorg/vscode-java:latest
```
