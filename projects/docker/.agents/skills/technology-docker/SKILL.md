---
name: technology-docker
description: Apply Docker engineering conventions when implementing, reviewing, debugging or testing Docker projects. Use only when the repository actually uses this technology.
---
# Docker workflow
1. Inspect manifests, source tree and existing CI before deciding versions or commands.
2. Follow existing architecture and avoid unrelated refactors.
3. Check: Compose, Dockerfile layers, non-root runtime, healthchecks, volumes, networking, multi-stage builds and secret handling.
4. Add focused tests; execute only commands supported by the repository.
5. Report exact verification performed and any unverified assumptions.
