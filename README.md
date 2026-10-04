# AgentoolRank MCP server

Search and compare open-source AI agent tools from your AI assistant, ranked by live GitHub activity.

[AgentoolRank](https://agentoolrank.com) tracks hundreds of open-source AI agent tools (frameworks, coding agents, memory, RAG, evals, MCP servers) and ranks them by GitHub activity: stars, star pace, commits, releases and package downloads, refreshed daily. This repository documents how to connect to its hosted MCP server and JSON API. The server runs on agentoolrank.com; there is nothing to install or self-host.

- **MCP endpoint:** `https://agentoolrank.com/api/mcp` (Streamable HTTP, no auth required)
- **Official MCP Registry:** `com.agentoolrank/agent-tools`
- **Optional API key:** one click, no signup, at [agentoolrank.com/api-key](https://agentoolrank.com/api-key). Send it as `Authorization: Bearer <key>` to identify your agent.

## Tools

| Tool | What it does |
|---|---|
| `search_tools(query, limit?)` | Find tools for a job, ranked by relevance then GitHub activity. |
| `get_tool(slug)` | Stars, 30-day star growth, capabilities, limitations and who it is best for. |
| `get_alternatives(slug)` | Open-source alternatives to a tool, with their GitHub stats. |
| `submit_tool(url, name, tagline, email, …)` | List a tool. The response shows every pricing option up front, including the free one. |
| `get_submission_status(submission_id, status_token)` | Review status of a submission. |
| `recommend_directories(product_type)` | Launch directories our own products went through, with free-tier conditions and the steps only a person can do. The top 10 are free. |

## Connect

### Claude Code

```sh
claude mcp add --transport http agentoolrank https://agentoolrank.com/api/mcp
```

### Cursor

Add to `~/.cursor/mcp.json` (or `.cursor/mcp.json` in a project). See [examples/cursor-mcp.json](examples/cursor-mcp.json):

```json
{
  "mcpServers": {
    "agentoolrank": { "url": "https://agentoolrank.com/api/mcp" }
  }
}
```

### Claude Desktop

Add it under Settings → Connectors as a custom connector with the URL above. Or use the `mcp-remote` bridge in `claude_desktop_config.json`. See [examples/claude_desktop_config.json](examples/claude_desktop_config.json).

### Codex CLI

Add to `~/.codex/config.toml`. See [examples/codex-config.toml](examples/codex-config.toml).

## JSON API

The same data is also available without MCP. See [examples/curl.sh](examples/curl.sh).

```
GET  https://agentoolrank.com/api/v1/tools?q=rag&limit=10
GET  https://agentoolrank.com/api/v1/tools/{slug}
POST https://agentoolrank.com/api/v1/submissions
```

## About

AgentoolRank is run by TENSO LLC. Questions or corrections: hello@agentoolrank.com. [Privacy](https://agentoolrank.com/privacy) · [Terms](https://agentoolrank.com/terms).

The contents of this repository (documentation and configuration examples) are MIT licensed. The AgentoolRank website, data and service are not part of this repository.
