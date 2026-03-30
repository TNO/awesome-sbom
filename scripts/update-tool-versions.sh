#!/usr/bin/env bash
# Update latest_version and latest_release in content/tools/*.md
# using the GitHub CLI (gh). Requires gh to be authenticated.
#
# Usage: ./scripts/update-tool-versions.sh [--dry-run]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLS_DIR="$SCRIPT_DIR/../content/tools"

DRY_RUN=false
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
  echo "Running in dry-run mode — no files will be modified."
  echo ""
fi

# Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
DIM='\033[2m'
NC='\033[0m'

updated=0
skipped=0
failed=0

for file in "$TOOLS_DIR"/*.md; do
  name="$(basename "$file" .md)"

  # Skip section index
  [[ "$name" == _* ]] && continue

  # Extract the link field value
  link=$(grep -m1 '^link:' "$file" | sed 's/^link: *"\(.*\)".*/\1/' | sed 's|/$||')

  # Require a GitHub link
  if [[ ! "$link" =~ github\.com/([^/]+)/([^/]+) ]]; then
    echo -e "${YELLOW}SKIP${NC}    $name ${DIM}(not a GitHub link)${NC}"
    ((skipped++))
    continue
  fi

  repo="${BASH_REMATCH[1]}/${BASH_REMATCH[2]}"

  # Fetch the latest release tag and publish date in one call
  if ! result=$(gh release view -R "$repo" --json tagName,publishedAt \
      --jq '.tagName + "\t" + .publishedAt[:10]' 2>/dev/null); then
    echo -e "${RED}FAIL${NC}    $name ${DIM}($repo — no releases or not found)${NC}"
    ((failed++))
    continue
  fi

  IFS=$'\t' read -r new_tag new_date <<< "$result"

  # Read current values (fields may be absent)
  current_version=$(grep -m1 '^latest_version:' "$file" | sed 's/^latest_version: *"\(.*\)".*/\1/' || true)
  current_release=$(grep -m1 '^latest_release:' "$file" | sed 's/^latest_release: *"\(.*\)".*/\1/' || true)

  # Determine what needs updating
  version_changed=false
  release_changed=false

  [[ -n "$current_version" && "$current_version" != "$new_tag" ]] && version_changed=true
  [[ "$current_release" != "$new_date" ]] && release_changed=true

  if ! $version_changed && ! $release_changed; then
    echo -e "${DIM}UP-TO-DATE${NC} $name ${DIM}($new_tag, $new_date)${NC}"
    continue
  fi

  # Report changes
  changes=""
  $version_changed && changes+=" version: $current_version → $new_tag"
  $release_changed && changes+=" date: $current_release → $new_date"
  echo -e "${GREEN}UPDATE${NC}  $name:$changes"

  $DRY_RUN && continue

  # Apply sed updates (macOS and Linux compatible)
  SED_INPLACE=(-i)
  [[ "$OSTYPE" == darwin* ]] && SED_INPLACE=(-i '')

  if $version_changed; then
    sed "${SED_INPLACE[@]}" \
      "s/^latest_version: \".*\"/latest_version: \"$new_tag\"/" "$file"
  fi

  if $release_changed; then
    sed "${SED_INPLACE[@]}" \
      "s/^latest_release: \".*\"/latest_release: \"$new_date\"/" "$file"
  fi

  ((updated++))
done

echo ""
echo -e "Done: ${GREEN}$updated updated${NC}, ${DIM}$skipped skipped${NC}, ${RED}$failed failed${NC}"
