# LA Referencia Platform (Java / Spring)

- Workspace multi-repo: inspect `workspace.ini`, `githelper.md`, root `pom.xml` and module POMs.
- Prefer Java 17 baseline unless the checkout specifies otherwise; use project Maven wrapper if present.
- Respect Spring Boot 3/Jakarta conventions and boundaries between core, entity, shell, harvester and REST modules.
- Do not replace the `./githelper` workflow with ad hoc Git operations.
- Preserve OAI-PMH compatibility, incremental validation/indexing and storage invariants.
- For new configuration keys, update documented `.model` configuration files when applicable.
- Validate migrations, transaction boundaries, asynchronous jobs and idempotency.
- Build targeted modules and run focused tests before full reactor builds.
