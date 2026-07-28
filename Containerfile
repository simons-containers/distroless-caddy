FROM archlinux:base-devel-20260308.0.497099 AS builder

ARG CADDY_VERSION
ARG GOLANG_VERSION

ARG CADDY_SOURCE
ARG GOLANG_RELEASE

RUN pacman -Sy --noconfirm git

WORKDIR /opt/go
RUN curl --silent --show-error --location \
  "${GOLANG_RELEASE}" \
  | tar xzf - --strip-components=1
ENV PATH=$PATH:/opt/go/bin

WORKDIR /src/caddy
RUN git clone --branch v${CADDY_VERSION} --depth 1 --single-branch \
  ${CADDY_SOURCE} .

ENV CGO_ENABLED=0
RUN go build \
    -trimpath \
    -buildmode=pie \
    -ldflags="-s -w" \
    -o caddy \
    ./cmd/caddy

FROM ghcr.io/simons-containers/distroless-glibc:2.44
ARG CADDY_VERSION

COPY --from=builder /src/caddy/caddy /usr/bin/caddy

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
