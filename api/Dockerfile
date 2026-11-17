# Novu API, official image pinned by version and digest.
FROM ghcr.io/novuhq/novu/api:3.20.0@sha256:4516bb5a2507303d48287cde50cf5919eb937b9e074b36bb61bd634dada800c0

# Close self-registration once the first (owner) account exists, unless
# ALLOW_OPEN_REGISTRATION=true. The build fails if a future Novu version moves
# this code, so a version bump can't silently drop the guard.
RUN f=dist/app/auth/usecases/register/user-register.usecase.js \
 && grep -q "Account creation is disabled');" "$f" \
 && sed -i "s|throw new _common.BadRequestException('Account creation is disabled');|throw new _common.BadRequestException('Account creation is disabled');\n        if (process.env.ALLOW_OPEN_REGISTRATION !== 'true' \&\& await this.userRepository.estimatedDocumentCount() > 0) throw new _common.BadRequestException('Account creation is disabled: this Novu instance already has its owner account. Set ALLOW_OPEN_REGISTRATION=true on the API service to allow more sign-ups.');|" "$f" \
 && grep -q "ALLOW_OPEN_REGISTRATION" "$f"

COPY --chown=1000:1000 start.sh /usr/src/app/railway-start.sh
ENTRYPOINT ["sh", "/usr/src/app/railway-start.sh"]
