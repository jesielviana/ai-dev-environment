---
name: dspace-backend
description: DSpace Java backend changes, REST endpoints, metadata, Solr search, identifiers, indexing and authorization. Use for DSpace backend implementation and debugging.
---
# Dspace Backend
Inspect DSpace module boundaries, existing REST contracts and integration tests before changing code. Preserve authorization, metadata schemas, migration compatibility and API pagination. For semantic/hybrid search validate vector dimensions, Solr schema compatibility, fallback behavior and query safety. For dARK identifiers require idempotency, retries, and no logging of secrets. Run targeted Maven tests and report unavailable services.

## Output contract
Provide: summary, files affected, tests run and results, risks/assumptions, and next steps. Do not claim a test passed unless executed. Read repository-local AGENTS.md and applicable project profile first.
