# Stage 1: Builder
FROM caddy:2.11.2-builder AS builder

RUN xcaddy build \
    --with github.com/hslatman/caddy-crowdsec-bouncer@v0.10.0 \
    --output /usr/bin/caddy

# Stage 2: Final
FROM caddy:2.11.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
