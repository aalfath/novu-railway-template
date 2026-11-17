# Novu worker, official image pinned by version and digest.
FROM ghcr.io/novuhq/novu/worker:3.20.0@sha256:bc04a067256787c20ccacd1724a734b732581d58d277bcf75d61b71e27f325bb
COPY --chown=1000:1000 start.sh /usr/src/app/railway-start.sh
ENTRYPOINT ["sh", "/usr/src/app/railway-start.sh"]
