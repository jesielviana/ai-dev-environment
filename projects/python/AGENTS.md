# Agent instructions — Python

Operate only in this repository unless explicitly authorized. Read `.ai/PROJECT_PROFILE.md` and inspect the codebase before changes.

## Workflow
1. Explain scope and plan for nontrivial changes.
2. Make minimal, reversible changes aligned with project conventions.
3. Do not invent build commands, APIs, versions or test outcomes.
4. Do not access or expose secrets, edit `.env` values, or run destructive commands without approval.
5. Run relevant tests when feasible and summarize outcomes.
6. Use skills under `.agents/skills/` when relevant.

## Technology focus
pyproject.toml, venv, type hints, pytest, Ruff, dependency pinning, async behavior and secure configuration.
