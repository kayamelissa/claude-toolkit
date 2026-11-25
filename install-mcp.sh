#!/usr/bin/env bash
# Adds the 5 MCP tools to Claude Code (user scope). Keys are read from your
# environment and never written to this repo:
#   export PERPLEXITY_API_KEY=...   (https://www.perplexity.ai/settings/api)
#   export FIRECRAWL_API_KEY=...    (https://www.firecrawl.dev/app/api-keys)
#   bash install-mcp.sh
set -uo pipefail
command -v claude >/dev/null || { echo "Claude Code CLI not found (npm i -g @anthropic-ai/claude-code)"; exit 1; }

claude mcp add -s user playwright -- npx -y @playwright/mcp@latest
claude mcp add -s user chrome-devtools -- npx -y chrome-devtools-mcp@latest --no-usage-statistics

if [ -n "${PERPLEXITY_API_KEY:-}" ]; then
  claude mcp add -s user perplexity --env PERPLEXITY_API_KEY="$PERPLEXITY_API_KEY" -- npx -yq @perplexity-ai/mcp-server
else
  echo "skip perplexity: set PERPLEXITY_API_KEY first"
fi

if [ -n "${FIRECRAWL_API_KEY:-}" ]; then
  claude mcp add -s user firecrawl --env FIRECRAWL_API_KEY="$FIRECRAWL_API_KEY" -- npx -y firecrawl-mcp
else
  echo "skip firecrawl: set FIRECRAWL_API_KEY first"
fi

# HyperFrames is a skill pack (installed by install-skills.sh). In the Claude app
# it is also available as the "HyperFrames by HeyGen" connector.
claude mcp list
