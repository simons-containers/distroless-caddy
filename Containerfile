FROM archlinux:base-devel-20260308.0.497099 AS builder

ARG CADDY_VERSION
ARG CADDY_RELEASE=https://github.com/caddyserver/caddy/releases/download/v2.11.1/caddy_${CADDY_VERSION}_linux_amd64.tar.gz

WORKDIR /extract/caddy
RUN curl --silent --show-error --location --output caddy.tar.gz \
  "${CADDY_RELEASE}" \
  && unzip caddy.tar.gz

FROM scratch
ARG CADDY_VERSION

COPY --from=builder /extract/caddy/caddy /usr/bin/caddy

WORKDIR /var/lib/caddy
ENV HOME=/var/lib/caddy

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["run", "--config", "/etc/caddy/Caddyfile"]

LABEL org.opencontainers.image.title="distroless caddy"
LABEL org.opencontainers.image.description="distroless caddy"
LABEL org.opencontainers.image.version="${CADDY_VERSION}"
LABEL org.opencontainers.image.source="https://github.com/simons-containers/distroless-caddy"
LABEL org.opencontainers.image.volumes.config="/etc/caddy/Caddyfile"
LABEL org.opencontainers.image.volumes.data="/var/lib/caddy"
