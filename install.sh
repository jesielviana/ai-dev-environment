#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
usage() { echo "Usage: $0 [generic|java-spring|angular|php|react|next|docker|python|existing-project-profile] [repo-path] [--dry-run]"; echo "No arguments: install generic into current directory"; }
profile="generic"; target="$PWD"; dry=0
if [[ $# -gt 0 ]]; then
  if [[ "$1" == "--dry-run" ]]; then dry=1; shift
  else profile="$1"; shift; fi
fi
if [[ $# -gt 0 && "$1" != "--dry-run" ]]; then target="$1"; shift; fi
if [[ $# -gt 0 && "$1" == "--dry-run" ]]; then dry=1; shift; fi
if [[ $# -ne 0 ]]; then usage; exit 2; fi
source_dir="$root/projects/$profile"
if [[ ! -d "$source_dir" ]]; then echo "Unknown profile: $profile" >&2; usage; exit 2; fi
if [[ ! -d "$target" ]]; then echo "Missing directory: $target" >&2; exit 2; fi
if ! git -C "$target" rev-parse --show-toplevel >/dev/null 2>&1; then echo "Not a Git repository: $target" >&2; exit 2; fi
target="$(cd "$target" && pwd)"
while IFS= read -r -d '' file; do
  rel="${file#"$source_dir"/}"; dest="$target/$rel"
  [[ "$rel" == .github/* ]] && continue
  if [[ -e "$dest" ]]; then echo "SKIP existing: $rel"; continue; fi
  echo "ADD: $rel"
  if [[ "$dry" -eq 0 ]]; then mkdir -p "$(dirname "$dest")"; cp "$file" "$dest"; fi
done < <(find "$source_dir" -type f -print0)

# Keep all installed AI configuration files out of version control.
# Ignore VS Code files individually to avoid hiding unrelated workspace files.
# Preserve all existing ignore rules and avoid duplicate entries.
gitignore="$target/.gitignore"
for entry in '.agents/' '.ai/' '/AGENTS.md' '/README-AI.md' '/.vscode/settings.json' '/.vscode/extensions.json'; do
  if [[ -f "$gitignore" ]] && grep -Fqx "$entry" "$gitignore"; then
    echo "SKIP existing .gitignore rule: $entry"
  else
    echo "ADD .gitignore rule: $entry"
    if [[ "$dry" -eq 0 ]]; then
      if [[ -f "$gitignore" && -s "$gitignore" ]] && [[ "$(tail -c 1 "$gitignore" | wc -l | tr -d ' ')" == "0" ]]; then
        printf '\n' >> "$gitignore"
      fi
      printf '%s\n' "$entry" >> "$gitignore"
    fi
  fi
done
