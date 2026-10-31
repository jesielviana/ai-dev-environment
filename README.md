# AI Dev Environment — Universal (one repository at a time)

by Jesiel Viana | @jesielviana

Reusable AI-assisted development environment for VS Code, featuring OpenAI Codex and GitHub Copilot integration, specialized skills, project instructions, and technology-specific profiles to streamline development workflows.

Use **OpenAI Codex in VS Code** as the primary agent and GitHub Copilot as an optional reviewer. Install directly **inside each Git repository**, without a central workspace. The installer **never creates any files inside `.github/`** and **never overwrites** existing files.

## Prerequisites

- Bash, Git, and an existing Git repository (with `.git` in the target or a parent directory).
- Extract this ZIP to a stable location, for example `~/tools/ai-dev-environment`.
- The examples below use `INSTALLER="$HOME/tools/ai-dev-environment/install.sh"`. Adjust this to your actual path.
- Use `bash "$INSTALLER" ...` (no executable permission required).

```bash
INSTALLER="$HOME/tools/ai-dev-environment/install.sh"
```

## 1. Generic — no arguments

The **default profile is `generic`**, and the default target is the **current directory (`$PWD`)**. Enter the project before running:

```bash
cd ~/dev/my-project
bash "$INSTALLER"
```

Preview changes before copying:

```bash
cd ~/dev/my-project
bash "$INSTALLER" --dry-run
```

To explicitly select the generic profile and a repository:

```bash
bash "$INSTALLER" generic ~/dev/my-project
bash "$INSTALLER" generic ~/dev/my-project --dry-run
```

To explicitly install `generic` into the current directory:

```bash
cd ~/dev/my-project
bash "$INSTALLER" generic
```

**Note:** `bash "$INSTALLER" ~/dev/my-project` **is not valid**: the first argument is interpreted as a **profile name**, not a destination. Use `generic ~/dev/my-project`.

## 2. Technology profiles

The first argument is the profile; the optional second argument is the repository path.

| Technology | Profile | Example |
| --- | --- | --- |
| Java / Spring Boot | `java-spring` | `bash "$INSTALLER" java-spring ~/dev/api` |
| Angular | `angular` | `bash "$INSTALLER" angular ~/dev/frontend` |
| PHP | `php` | `bash "$INSTALLER" php ~/dev/site` |
| React | `react` | `bash "$INSTALLER" react ~/dev/react-app` |
| Next.js | `next` | `bash "$INSTALLER" next ~/dev/next-app` |
| Docker / Compose | `docker` | `bash "$INSTALLER" docker ~/dev/infra` |
| Python | `python` | `bash "$INSTALLER" python ~/dev/python-service` |

If you are **already inside the repository**, omit the path:

```bash
cd ~/dev/api && bash "$INSTALLER" java-spring
cd ~/dev/frontend && bash "$INSTALLER" angular
cd ~/dev/site && bash "$INSTALLER" php
cd ~/dev/react-app && bash "$INSTALLER" react
cd ~/dev/next-app && bash "$INSTALLER" next
cd ~/dev/infra && bash "$INSTALLER" docker
cd ~/dev/python-service && bash "$INSTALLER" python
```

To preview any profile:

```bash
bash "$INSTALLER" java-spring ~/dev/api --dry-run
bash "$INSTALLER" angular ~/dev/frontend --dry-run
bash "$INSTALLER" php ~/dev/site --dry-run
bash "$INSTALLER" react ~/dev/react-app --dry-run
bash "$INSTALLER" next ~/dev/next-app --dry-run
bash "$INSTALLER" docker ~/dev/infra --dry-run
bash "$INSTALLER" python ~/dev/python-service --dry-run
```

You can also use `bash "$INSTALLER" --dry-run` to preview the generic profile in the current directory.

## 3. LA Referencia project profiles

These are the exact directory names under `projects/`:

| Repository | Profile | Example |
| --- | --- | --- |
| lareferencia-platform | `lareferencia-platform` | `bash "$INSTALLER" lareferencia-platform ~/dev/lareferencia-platform` |
| DSpace (Java backend) | `dspace-java` | `bash "$INSTALLER" dspace-java ~/dev/DSpace` |
| dspace-angular | `dspace-angular` | `bash "$INSTALLER" dspace-angular ~/dev/dspace-angular` |
| lareferencia-dspace-docker | `lareferencia-dspace-docker` | `bash "$INSTALLER" lareferencia-dspace-docker ~/dev/lareferencia-dspace-docker` |
| lareferencia-vufind-docker | `lareferencia-vufind-docker` | `bash "$INSTALLER" lareferencia-vufind-docker ~/dev/lareferencia-vufind-docker` |
| VuFind | `vufind` | `bash "$INSTALLER" vufind ~/dev/vufind` |
| lareferencia-embedding-service | `lareferencia-embedding-service` | `bash "$INSTALLER" lareferencia-embedding-service ~/dev/lareferencia-embedding-service` |

To install **from inside the project**, without specifying a path:

```bash
cd ~/dev/lareferencia-platform && bash "$INSTALLER" lareferencia-platform
cd ~/dev/DSpace && bash "$INSTALLER" dspace-java
cd ~/dev/dspace-angular && bash "$INSTALLER" dspace-angular
cd ~/dev/lareferencia-dspace-docker && bash "$INSTALLER" lareferencia-dspace-docker
cd ~/dev/lareferencia-vufind-docker && bash "$INSTALLER" lareferencia-vufind-docker
cd ~/dev/vufind && bash "$INSTALLER" vufind
cd ~/dev/lareferencia-embedding-service && bash "$INSTALLER" lareferencia-embedding-service
```

To preview, append `--dry-run` to any of these commands.

## 4. Running from the kit directory

When running from the extracted kit directory (which is **not** necessarily a Git repository), provide **both profile and target**:

```bash
cd ~/tools/ai-dev-environment
bash ./install.sh generic ~/dev/my-project
bash ./install.sh java-spring ~/dev/api
bash ./install.sh dspace-java ~/dev/DSpace --dry-run
```

If the kit is inside a Git repository and you run `bash ./install.sh` without arguments, the target will be the current directory — potentially **the kit**, not the intended project. Specify the target explicitly in this case.

## 5. Installer behavior

Syntax:

```text
bash install.sh [profile] [repository-path] [--dry-run]
```

- No arguments: `generic` in the current directory.
- Profile only: selected profile in the current directory.
- Profile + path: install into the specified repository.
- `--dry-run`: list `ADD` and `SKIP` without writing files. Use it alone for generic mode or append it after the profile and target.
- Missing directory, non-Git target, or unknown profile: the installer exits with an error.
- Existing files: `SKIP existing`, **no merge and no overwrite**.
- Does not create any files in `.github/` (including PR templates and Copilot instructions).
- Adds `.agents/`, `.ai/`, `/AGENTS.md`, `/README-AI.md`, `/.vscode/settings.json`, and `/.vscode/extensions.json` to the repository root `.gitignore`. These cover all files the installer currently creates. Existing rules are preserved and duplicate exact rules are avoided. `--dry-run` only previews changes. The `.gitignore` file itself is intentionally tracked.
- Ignore rules do not untrack already committed files. Check with `git ls-files AGENTS.md README-AI.md .agents .ai .vscode/settings.json .vscode/extensions.json`. Remove from the index with `git rm --cached` only if you intend to stop tracking those files.
- Profiles are not auto-detected from the stack: select a profile or use `generic`.

## 6. After installation

```bash
cd ~/dev/my-project
git status --short
git check-ignore .agents/skills .ai/PROJECT_PROFILE.md
code .
```

Read `AGENTS.md` and `.ai/PROJECT_PROFILE.md`, adapt commands and conventions to the repository, and review the diff before committing. Skills are in `.agents/skills/`; prompts and documentation are in `.ai/`.

**Switching profiles:** because the installer never overwrites existing files, installing a different profile **does not automatically update** `AGENTS.md`, `PROJECT_PROFILE.md`, or skills. Compare and merge manually, or test in a clean checkout.

**Security:** never put credentials, tokens, or secrets in committed instructions; review destructive operations and external access before enabling them.

## Branch policy

No project profile pins a branch. Work on the currently checked-out branch unless the task explicitly requires another branch. Inspect `git status` before changing files, and never switch branches automatically.
