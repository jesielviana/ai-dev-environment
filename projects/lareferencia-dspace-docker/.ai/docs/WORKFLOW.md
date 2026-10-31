# Daily workflow: Codex primary, Copilot secondary
1. Open lareferencia-ai.code-workspace in VS Code and select the target repository.
2. Confirm git status, branch, task acceptance criteria and relevant skill.
3. Ask Codex to inspect and plan before edits; constrain file scope.
4. Ask Codex to implement incremental patch and run focused tests.
5. Ask Copilot with Claude/Gemini/Codex for an independent read-only diff review.
6. Resolve confirmed findings with Codex, rerun tests, review git diff and commit manually.
7. For cross-repo changes, document API contracts, SHA per repo, migration sequence and rollback.

Suggested prompts: `prompts/plan.md`, `prompts/implement.md`, `prompts/review.md`.
