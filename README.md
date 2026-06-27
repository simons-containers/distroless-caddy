[![Latest](https://ghcr-badge.egpl.dev/simons-containers/distroless-caddy/latest_tag?ignore=latest,sha256*&label=latest)  
![Size](https://ghcr-badge.egpl.dev/simons-containers/distroless-caddy/size?tag=latest)  
![Tags](https://ghcr-badge.egpl.dev/simons-containers/distroless-caddy/tags?ignore=latest,sha256*)](https://github.com/simons-containers/distroless-caddy/pkgs/container/distroless-caddy)

# Distroless Caddy container

Bare-bones distroless Caddy container image.

## Running

Mount configuration at `/etc/caddy/Caddyfile`.

Example:

```bash
docker run -it --rm \
  -v Caddyfile:/etc/caddy/Caddyfile \
  ghcr.io/simons-containers/distroless-caddy:latest
```

## Building

| Arg | Description |
|---|---|
| `CADDY_VERSION` | Version of Caddy to use

Build container using build-args from versions.yaml:

```bash
docker build -t \
  distroless-caddy:$(yq -r .caddy versions.yaml) \
  $(yq -r 'to_entries | .[] | "--build-arg \(.key | ascii_upcase)_VERSION=\(.value)"' versions.yaml) -f Containerfile .
```

## License

Repository contents (e.g., `Containerfile`, build scripts, and configuration) are licensed under the **MIT License**.

Software included in built container images (such as **Caddy**) are provided under their respective upstream licenses and are not covered by the MIT license for this repository.

## Acknowledgements

This project depends on a number of upstream components and data sources:

- **Caddy** - Fast and extensible multi-platform HTTP/1-2-3 web server with automatic HTTPS.  
  https://caddyserver.com
