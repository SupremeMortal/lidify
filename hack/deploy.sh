#!/usr/bin/env bash

set -euox pipefail

DEFAULT_VERSION="1.0.2b"
VERSION="v${VERSION:-${DEFAULT_VERSION}}"

podman build -t ghcr.io/suprememortal/lidify:latest -f Dockerfile .
podman build -t ghcr.io/suprememortal/lidify-backend:latest -f backend/Dockerfile backend
podman build -t ghcr.io/suprememortal/lidify-frontend:latest -f frontend/Dockerfile frontend
podman build -t ghcr.io/suprememortal/lidify-audio-analyzer:latest -f services/audio-analyzer/Dockerfile services/audio-analyzer

podman tag ghcr.io/suprememortal/lidify:latest ghcr.io/suprememortal/lidify:${VERSION}
podman tag ghcr.io/suprememortal/lidify-backend:latest ghcr.io/suprememortal/lidify-backend:${VERSION}
podman tag ghcr.io/suprememortal/lidify-frontend:latest ghcr.io/suprememortal/lidify-frontend:${VERSION}
podman tag ghcr.io/suprememortal/lidify-audio-analyzer:latest ghcr.io/suprememortal/lidify-audio-analyzer:${VERSION}

podman push ghcr.io/suprememortal/lidify:latest
podman push ghcr.io/suprememortal/lidify-backend:latest
podman push ghcr.io/suprememortal/lidify-frontend:latest
podman push ghcr.io/suprememortal/lidify-audio-analyzer:latest

podman push ghcr.io/suprememortal/lidify:${VERSION}
podman push ghcr.io/suprememortal/lidify-backend:${VERSION}
podman push ghcr.io/suprememortal/lidify-frontend:${VERSION}
podman push ghcr.io/suprememortal/lidify-audio-analyzer:${VERSION}