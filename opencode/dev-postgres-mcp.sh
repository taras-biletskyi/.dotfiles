#!/usr/bin/env bash
set -euo pipefail

set -a
source /home/taras/.config/opencode/dev-postgres-mcp.env
set +a

exec npx -y @bytebase/dbhub@0.23.0 \
	--transport stdio \
	--config /home/taras/.config/opencode/dev-postgres-dbhub.toml
