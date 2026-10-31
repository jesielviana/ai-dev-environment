# VS Code: Codex and Copilot workflow

## Roles

- **OpenAI Codex for VS Code:** primary agent for repository exploration, planning, implementation, and testing. Read the repository `AGENTS.md` first.
- **GitHub Copilot Chat:** optional secondary assistant for quick questions and independent code review. Choose Claude, Codex, or Gemini in the Copilot interface according to availability.

## Work in one repository

1. Open the target repository directly in VS Code using `code /path/to/repository`.
2. Review `AGENTS.md` and `.ai/PROJECT_PROFILE.md` and adjust them to match the checkout.
3. Check the active branch and `git status`. Do not switch branches unless explicitly requested.
4. Ask Codex to inspect relevant code and propose a plan before significant changes.
5. Ask Codex to implement the smallest safe change and run targeted tests.
6. Use Copilot with a different model to review the diff independently, without editing files.
7. Verify tests, migrations, APIs, persistent data, and deployment implications before committing.

## Example prompts

- Codex: `Read AGENTS.md and the relevant code. Propose a plan without editing files.`
- Codex: `Implement the approved plan, run focused tests, and summarize the diff.`
- Copilot: `Review the current diff for correctness, regressions, security, and missing tests. Do not modify files.`

## Safety

- Never commit credentials, secrets, or real environment files.
- Do not enable unrestricted execution or blanket approvals; confirm destructive commands and external access.
- Infer Java, Node, PHP, and Python versions from the repository rather than assuming them.
- This kit intentionally does not create `.github/copilot-instructions.md`.
