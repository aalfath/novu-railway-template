#!/bin/sh
# Defaults for Railway. Any of them can be overridden with a service variable.
# The image also loads dist/.env.production, which points at Novu Cloud
# (api.novu.co, dashboard.novu.co, New Relic on), so these must stay explicit.
set -e
export NODE_ENV="${NODE_ENV:-production}"
export PORT="${PORT:-3000}"
export IS_SELF_HOSTED=true
export NOVU_ENTERPRISE="${NOVU_ENTERPRISE:-false}"
export DASHBOARD_URL="${DASHBOARD_URL:-$FRONT_BASE_URL}"
export DISABLE_USER_REGISTRATION="${DISABLE_USER_REGISTRATION:-false}"
export LOG_LEVEL="${LOG_LEVEL:-info}"
export TZ="${TZ:-UTC}"
export MONGO_MIN_POOL_SIZE="${MONGO_MIN_POOL_SIZE:-5}"
export MONGO_MAX_POOL_SIZE="${MONGO_MAX_POOL_SIZE:-20}"
export MONGO_AUTO_CREATE_INDEXES="${MONGO_AUTO_CREATE_INDEXES:-true}"
# Railway's private network is IPv6: family 0 lets ioredis use IPv4 or IPv6.
export REDIS_FAMILY="${REDIS_FAMILY:-0}"
export REDIS_DB_INDEX="${REDIS_DB_INDEX:-2}"
export REDIS_CACHE_SERVICE_HOST="${REDIS_CACHE_SERVICE_HOST:-$REDIS_HOST}"
export REDIS_CACHE_SERVICE_PORT="${REDIS_CACHE_SERVICE_PORT:-$REDIS_PORT}"
export REDIS_CACHE_PASSWORD="${REDIS_CACHE_PASSWORD:-$REDIS_PASSWORD}"
export REDIS_CACHE_FAMILY="${REDIS_CACHE_FAMILY:-0}"
export STORAGE_SERVICE="${STORAGE_SERVICE:-AWS}"
export IS_API_IDEMPOTENCY_ENABLED="${IS_API_IDEMPOTENCY_ENABLED:-false}"
export IS_API_RATE_LIMITING_ENABLED="${IS_API_RATE_LIMITING_ENABLED:-false}"
export IS_NEW_MESSAGES_API_RESPONSE_ENABLED="${IS_NEW_MESSAGES_API_RESPONSE_ENABLED:-true}"
export IS_V2_ENABLED="${IS_V2_ENABLED:-true}"
export SUBSCRIBER_WIDGET_JWT_EXPIRATION_TIME="${SUBSCRIBER_WIDGET_JWT_EXPIRATION_TIME:-15d}"
export NEW_RELIC_ENABLED="${NEW_RELIC_ENABLED:-false}"
export WIDGET_BASE_URL="${WIDGET_BASE_URL:-}"
cd /usr/src/app
exec node dist/main.js
