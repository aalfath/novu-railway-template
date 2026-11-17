[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/novu-1?utm_medium=integration&utm_source=button&utm_campaign=novu)

# Novu on Railway

One-click [Novu](https://novu.co) for [Railway](https://railway.com): open-source notification infrastructure. Define a workflow once (in-app inbox, email, SMS, push, chat, with delays and digests) and trigger it from your backend with one API call.

**Version:** Novu **3.20.0** (Community Edition), from the official images `ghcr.io/novuhq/novu/{api,worker,ws,dashboard}`, each pinned by version and digest in its service folder's `Dockerfile`.

## What the template deploys

| Service | Source | Purpose |
|---|---|---|
| **novu-dashboard** | this repo, `dashboard/` | Web app (public URL). Sign up here first. |
| **novu-api** | this repo, `api/` | REST API (public URL), receives triggers and serves the dashboard |
| **novu-ws** | this repo, `ws/` | WebSocket server (public URL) for the real-time in-app inbox |
| **novu-worker** | this repo, `worker/` | Processes the queues and delivers messages (private) |
| **MongoDB** | Railway MongoDB, with volume | Main database |
| **Redis** | Railway Redis, with volume | Queues (BullMQ) and cache |
| **novu-storage** | Railway bucket | Attachments (S3-compatible, private) |

All services talk over Railway's private network. Every Novu service has a health check (`/v1/health-check`, the dashboard `/`).

## First steps

1. Open the **novu-dashboard** URL and create your account. The first account becomes the owner of the instance.
2. After that, sign-up is closed: further registrations are refused, so a stranger who finds the URL can't create an account. To allow more accounts, set `ALLOW_OPEN_REGISTRATION=true` on **novu-api** and redeploy it (set it back afterwards). To close sign-up completely, set `DISABLE_USER_REGISTRATION=true`.
3. Copy your API key under **API Keys**, connect your providers (email, SMS, push, chat) in **Integrations**, and trigger your first workflow. Point SDKs at the **novu-api** URL (`backendUrl`) and the **novu-ws** URL (`socketUrl`).

## Variables

Set by the template, nothing to fill in:

| Variable | Service | Value |
|---|---|---|
| `JWT_SECRET` | api (ws references it) | `${{secret(64)}}` |
| `STORE_ENCRYPTION_KEY` | api (worker references it) | `${{secret(32)}}`, must be exactly 32 characters; encrypts provider credentials. Never change it after setup. |
| `NOVU_SECRET_KEY` | api | `${{secret(64)}}` |
| `MONGO_URL` | api, worker, ws | `${{MongoDB.MONGO_URL}}/novu-db?authSource=admin` |
| `REDIS_HOST`, `REDIS_PORT`, `REDIS_PASSWORD` | api, worker, ws | references to the Redis service |
| `API_ROOT_URL`, `FRONT_BASE_URL` | api, worker | the public API and dashboard URLs (worker uses the API's private address) |
| `S3_*`, `AWS_*` | api, worker | references to the bucket |
| `VITE_API_HOSTNAME`, `VITE_WEBSOCKET_HOSTNAME` | dashboard | the public API and WebSocket URLs |

Fixed settings (self-hosted mode, pool sizes, IPv6-friendly Redis, telemetry to New Relic off) live in each folder's `start.sh` as `export X=${X:-default}`, so any of them can be overridden with a service variable.

## Updates

Railway notifies everyone who deployed this template when a change is merged to `main` here. Each version bump is listed in [`CHANGELOG.md`](CHANGELOG.md), with breaking changes first. Novu creates its MongoDB indexes on start. Back up MongoDB before a major upgrade.

## Local test

```sh
docker build -t novu-api ./api        # likewise worker, ws, dashboard
```

Run them with MongoDB, Redis and an S3-compatible store, passing the variables above (see Novu's [Docker guide](https://docs.novu.co/community/self-hosting-novu/deploy-with-docker)).

Novu is licensed under MIT (Community Edition) by Novu Inc. This repo only contains the Railway wrapper.
