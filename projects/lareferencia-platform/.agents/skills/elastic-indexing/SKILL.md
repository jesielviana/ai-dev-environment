---
name: elastic-indexing
description: Elasticsearch mappings, queries, aliases, reindexing and migrations. Use for LA Referencia Elasticsearch tasks.
---
# Elastic Indexing
Inspect cluster version, mapping, index settings, aliases and document counts. Prefer zero-downtime new index plus _reindex, validation and atomic alias switch. Preserve source index and provide rollback. Do not run destructive delete or alias switch without explicit authorization. Validate nested vs object query semantics.

## Output contract
Provide: summary, files affected, tests run and results, risks/assumptions, and next steps. Do not claim a test passed unless executed. Read repository-local AGENTS.md and applicable project profile first.
