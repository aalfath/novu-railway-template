#!/bin/sh
# Defaults for Railway. Any of them can be overridden with a service variable.
set -e
export NODE_ENV="${NODE_ENV:-production}"
export PORT="${PORT:-3002}"
export IS_SELF_HOSTED=true
export NOVU_ENTERPRISE="${NOVU_ENTERPRISE:-false}"
export LOG_LEVEL="${LOG_LEVEL:-info}"
export TZ="${TZ:-UTC}"
export MONGO_MIN_POOL_SIZE="${MONGO_MIN_POOL_SIZE:-5}"
export MONGO_MAX_POOL_SIZE="${MONGO_MAX_POOL_SIZE:-20}"
export REDIS_FAMILY="${REDIS_FAMILY:-0}"
export REDIS_DB_INDEX="${REDIS_DB_INDEX:-2}"
export NEW_RELIC_ENABLED="${NEW_RELIC_ENABLED:-false}"
export WIDGET_BASE_URL="${WIDGET_BASE_URL:-}"
cd /usr/src/app
exec node dist/main.js
