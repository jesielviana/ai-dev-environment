# Embedding service

- Inspect language, package manager, runtime, model API and deployment configuration before implementation.
- Record model ID/version, vector dimensions, normalization, batching, timeout, retry and resource limits.
- Never send confidential metadata to third-party model providers without approval.
- Include deterministic test fixtures or mocked inference and compatibility checks with indexing/search consumers.
