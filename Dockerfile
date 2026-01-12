# Stage 1: Builder
FROM caddy:2.10.2-builder AS builder

RUN xcaddy build \
    --with github.com/hslatman/caddy-crowdsec-bouncer@v0.9.1 \
    --output /usr/bin/caddy

# Stage 2: Final
FROM caddy:2.10.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
