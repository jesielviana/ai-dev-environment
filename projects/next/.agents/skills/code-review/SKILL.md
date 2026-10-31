---
name: code-review
description: Independent security, correctness, compatibility and performance review of a Git diff. Use before merge or when reviewing AI-generated changes.
---
# Code Review
Review git diff against requirements. Report findings first ordered by severity, each with file/line, concrete failure scenario and recommended fix. Check tests, security, migrations, backward compatibility, accessibility and performance. Do not edit code unless asked. State residual risks.

## Output contract
Provide: summary, files affected, tests run and results, risks/assumptions, and next steps. Do not claim a test passed unless executed. Read repository-local AGENTS.md and applicable project profile first.
