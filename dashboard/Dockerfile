# Novu dashboard (static web app), official image pinned by version and digest.
# Its entrypoint writes the VITE_* variables into index.html at start.
FROM ghcr.io/novuhq/novu/dashboard:3.20.0@sha256:c24929178f4a10968ab7511af19c3f2ae157096aba6e16e5b042cafb835b2bc2
ENV VITE_SELF_HOSTED=true
EXPOSE 4000
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["sh", "-c", "exec http-server dist -p ${PORT:-4000} -d false --proxy http://localhost:${PORT:-4000}?"]
