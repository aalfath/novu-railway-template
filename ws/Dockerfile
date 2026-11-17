# Novu WebSocket service, official image pinned by version and digest.
FROM ghcr.io/novuhq/novu/ws:3.20.0@sha256:fd3773e82f0f948cc20f66517707dd936b7e4f79219d2808894111837d40e818
COPY --chown=1000:1000 start.sh /usr/src/app/railway-start.sh
ENTRYPOINT ["sh", "/usr/src/app/railway-start.sh"]
