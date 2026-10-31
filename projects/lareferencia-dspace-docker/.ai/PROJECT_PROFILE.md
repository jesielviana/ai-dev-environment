# Docker deployment repositories

- Inspect Compose files, Dockerfiles, `.env.example` and service-specific README.
- Do not overwrite real `.env`, volumes or existing persistent data.
- Prefer pinned compatible images, healthchecks, explicit network boundaries and reproducible builds.
- Validate Compose with `docker compose config` (after supplying safe local env vars).
- Separate dev/test from production and document ports, volumes and backups.
- Never run `docker compose down -v`, prune or destructive cleanup without approval.
