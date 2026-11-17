# Changelog

## 3.20.0 (2026-11-17)

- First release of the Railway template: Novu 3.20.0 (`api`, `worker`, `ws`, `dashboard`, official images pinned by digest), Railway MongoDB and Redis with volumes, a Railway bucket for attachments.
- Sign-up closes once the first (owner) account exists; set `ALLOW_OPEN_REGISTRATION=true` on `novu-api` to allow more.
- Health checks on every Novu service; all traffic between services stays on the private network.
