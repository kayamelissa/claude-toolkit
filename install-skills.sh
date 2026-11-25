#!/usr/bin/env bash
# Installs the 13 Claude skills (plus HyperFrames) for Claude Code, user-wide.
# Requires Node.js 18+ (HyperFrames needs Node 22+). Safe to re-run.
#   bash install-skills.sh            # install all
#   bash install-skills.sh --project  # install into the current project instead of user-wide
set -uo pipefail
SCOPE="-g"; [ "${1:-}" = "--project" ] && SCOPE=""

SKILLS=(
  "mattpocock/skills grill-me"
  "juliusbrussee/caveman caveman"
  "vercel-labs/agent-browser agent-browser"
  "vercel-labs/skills find-skills"
  "github/awesome-copilot anti-ui-slop"
  "vercel-labs/agent-skills web-design-guidelines"
  "anthropics/skills canvas-design"
  "coreyhaines31/marketingskills seo-audit"
  "coreyhaines31/marketingskills ai-seo"
  "kar2phi/video-lens video-lens"
  "browser-use/video-use video-use"
  "coreyhaines31/marketingskills content-strategy"
  "coreyhaines31/marketingskills pricing"
  "heygen-com/hyperframes hyperframes"
)

ok=0; fail=0
for entry in "${SKILLS[@]}"; do
  read -r repo skill <<<"$entry"
  if npx -y skills add "https://github.com/$repo" --skill "$skill" $SCOPE -a claude-code -y >/dev/null 2>&1; then
    echo "✓ $skill  ($repo)"; ok=$((ok+1))
  else
    echo "✗ $skill  ($repo) — run manually: npx skills add https://github.com/$repo --skill $skill"; fail=$((fail+1))
  fi
done
echo "Done: $ok installed, $fail failed. Restart Claude Code if a skill does not show up."
