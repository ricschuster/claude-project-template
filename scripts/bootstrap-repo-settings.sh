#!/usr/bin/env bash
# Applies repo settings that a GitHub template does not carry over:
# branch protection on main, auto-merge, and a starter label set.
#
# Run once, from the repo root of a freshly created repo, after "Use this
# template". Requires the GitHub CLI (gh) authenticated with repo admin
# access.
#
# Usage: scripts/bootstrap-repo-settings.sh [owner/repo]
# If owner/repo is omitted, it is inferred from the current git remote.

set -euo pipefail

REPO="${1:-$(gh repo view --json nameWithOwner --jq .nameWithOwner)}"
echo "Bootstrapping settings for $REPO"

echo "Enabling auto-merge..."
gh api "repos/$REPO" -X PATCH -f allow_auto_merge=true >/dev/null

echo "Setting branch protection on main..."
# Requires at least one status check context; update the array below once a
# CI job name is known (for example after adding your stack's own job to
# .github/workflows/ci.yml). "repo-hygiene" is the job defined in the
# template's stack-neutral CI workflow.
gh api "repos/$REPO/branches/main/protection" -X PUT \
  -f required_status_checks='{"strict":true,"contexts":["repo-hygiene"]}' \
  -f enforce_admins=false \
  -f required_pull_request_reviews='{"required_approving_review_count":0}' \
  -f restrictions=null >/dev/null

echo "Creating labels..."
declare -A LABELS=(
  ["enhancement"]="a2eeef"
  ["bug"]="d73a4a"
  ["chore"]="cfd3d7"
  ["docs"]="0075ca"
  ["question"]="d876e3"
)
for name in "${!LABELS[@]}"; do
  gh label create "$name" --color "${LABELS[$name]}" --force >/dev/null
done

echo "Done. Review branch protection and labels in the repo settings to confirm they fit."
