# Claude Toolkit

My Claude Code setup: **14 skills** and **5 MCP tools**, installable with one command
each. This repo holds installers and config only. Every skill and server is
fetched from its official source, so you always get the maintained version under
its own license.

> 🇹🇷 **Kısaca:**
> - `bash install-skills.sh` 14 skill'i kurar.
> - `bash install-mcp.sh` 5 MCP aracını Claude Code'a ekler. Önce anahtarları ortam değişkeni olarak ayarla.
> - Bu repoyu Claude Code'da açarsan `.mcp.json` sayesinde MCP araçları projeye otomatik gelir.

## Quick start

```bash
git clone https://github.com/kayamelissa/claude-toolkit.git
cd claude-toolkit

bash install-skills.sh          # 14 skills, user-wide (needs Node.js 18+, HyperFrames needs 22+)

export PERPLEXITY_API_KEY=...   # optional, paid per use
export FIRECRAWL_API_KEY=...    # optional, free tier available
bash install-mcp.sh             # adds the MCP servers to Claude Code
```

Restart Claude Code afterwards. `npx skills find <topic>` searches for more skills.

## Skills

| Skill | What it does | Source | License |
|---|---|---|---|
| `grill-me` | Questions you until a request is fully clear | [mattpocock/skills](https://github.com/mattpocock/skills) | MIT |
| `caveman` | Terse replies that use far fewer tokens | [juliusbrussee/caveman](https://github.com/juliusbrussee/caveman) | Apache-2.0 |
| `agent-browser` | Drives a real browser: open, click, fill, read | [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) | Apache-2.0 |
| `find-skills` | Finds the right skill for a task | [vercel-labs/skills](https://github.com/vercel-labs/skills) | MIT |
| `anti-ui-slop` | Removes generic "AI-made" UI patterns | [github/awesome-copilot](https://github.com/github/awesome-copilot) | MIT |
| `web-design-guidelines` | Reviews UI against web design and accessibility guidelines | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | MIT |
| `canvas-design` | Designs posters and visuals as PNG/PDF | [anthropics/skills](https://github.com/anthropics/skills) | Apache-2.0 |
| `seo-audit` | Technical and on-page SEO audit | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) | MIT |
| `ai-seo` | Visibility in AI answers (ChatGPT, Gemini, Perplexity, AI Overviews) | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) | MIT |
| `content-strategy` | Content plan, pillars and topic clusters | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) | MIT |
| `pricing` | Pricing for a product or service | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) | MIT |
| `video-lens` | Summarises a YouTube video from its transcript | [kar2phi/video-lens](https://github.com/kar2phi/video-lens) | MIT |
| `video-use` | Cuts and edits video files from the chat | [browser-use/video-use](https://github.com/browser-use/video-use) | MIT |
| `hyperframes` | Motion graphics and video from HTML (HeyGen) | [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) | Apache-2.0 |

Some skills need a helper tool:
- `agent-browser` needs `npm i -g agent-browser`.
- `video-use` needs Python and `ffmpeg`.
- `hyperframes` needs Node.js 22 or later.

Each skill's `SKILL.md` lists what it needs.

## MCP tools

| Tool | What it does | Key | Source |
|---|---|---|---|
| Playwright | Real browser automation (navigate, click, fill forms) | none | [microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp) |
| Chrome DevTools | Controls and inspects a live Chrome (network, console, performance) | none | [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) |
| Perplexity | Live, cited web search inside Claude | `PERPLEXITY_API_KEY` (paid) | [perplexityai/modelcontextprotocol](https://github.com/perplexityai/modelcontextprotocol) |
| Firecrawl | Scrapes and crawls pages into clean markdown | `FIRECRAWL_API_KEY` (free tier) | [firecrawl/firecrawl-mcp-server](https://github.com/firecrawl/firecrawl-mcp-server) |
| HyperFrames | Video and motion graphics (skill pack + Claude connector) | none | [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) |

Two ways to use them:
- **Claude Code, all projects:** `bash install-mcp.sh`. It adds the servers at user scope.
- **Claude Code, this project only:** open the repo. [`.mcp.json`](.mcp.json) loads the servers, and keys come from your environment as `${PERPLEXITY_API_KEY}` and `${FIRECRAWL_API_KEY}`.

In the Claude app, Firecrawl and HyperFrames are also available as connectors in Settings → Connectors.

## Security

- No keys in this repo: scripts read them from the environment, and `.env` is gitignored.
- Skills run with your agent's permissions. Read a skill's `SKILL.md` before installing it.
- Installs come from each project's GitHub repo via the [`skills`](https://github.com/vercel-labs/skills) CLI. Pin a commit if you need fully reproducible installs.

## Credits

Skill list inspired by Doruk Yalçınsoy's posts:
- [Claude skill listesi](https://dorukyalcinsoy.com/blog/claude-skill-listesi/)
- [Claude Code MCP araçları](https://dorukyalcinsoy.com/blog/claude-code-mcp-araclari/)

All skills and servers belong to their authors and keep their own licenses. The scripts in this repo are MIT.
