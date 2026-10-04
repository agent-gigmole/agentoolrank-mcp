#!/usr/bin/env sh
# Search tools
curl -s 'https://agentoolrank.com/api/v1/tools?q=rag&limit=5'
# One tool by slug
curl -s 'https://agentoolrank.com/api/v1/tools/langgraph'
# MCP over plain HTTP: list the tools
curl -s https://agentoolrank.com/api/mcp \
  -H 'content-type: application/json' -H 'accept: application/json, text/event-stream' \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}'
