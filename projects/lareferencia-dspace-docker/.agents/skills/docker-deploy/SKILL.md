---
name: docker-deploy
description: Docker Compose development environments, networks, healthchecks and deployments. Use for Docker troubleshooting and configuration.
---
# Docker Deploy
Inspect Compose files and env examples; do not expose credentials. Prefer pinned versions, healthchecks, named volumes and least privilege. Separate development from production settings. Run docker compose config before suggesting up/down. Never prune volumes or delete persistent data without approval.

## Output contract
Provide: summary, files affected, tests run and results, risks/assumptions, and next steps. Do not claim a test passed unless executed. Read repository-local AGENTS.md and applicable project profile first.
