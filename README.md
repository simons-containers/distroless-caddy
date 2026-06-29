[![Current Version](https://raw.githubusercontent.com/simons-containers/distroless-caddy/badges/.badges/main/release.svg)](https://github.com/simons-containers/distroless-caddy/pkgs/container/distroless-caddy)
[![Tags](https://raw.githubusercontent.com/simons-containers/distroless-caddy/badges/.badges/main/tags.svg)](https://github.com/simons-containers/distroless-caddy/pkgs/container/distroless-caddy)  
![Current Size](https://raw.githubusercontent.com/simons-containers/distroless-caddy/badges/.badges/main/size.svg)
![Wasted Size](https://raw.githubusercontent.com/simons-containers/distroless-caddy/badges/.badges/main/wasted.svg)
![Efficiency](https://raw.githubusercontent.com/simons-containers/distroless-caddy/badges/.badges/main/efficiency.svg)  
![Critical](https://raw.githubusercontent.com/simons-containers/distroless-caddy/badges/.badges/main/critical.svg)
![High](https://raw.githubusercontent.com/simons-containers/distroless-caddy/badges/.badges/main/high.svg)
![Medium](https://raw.githubusercontent.com/simons-containers/distroless-caddy/badges/.badges/main/medium.svg)
![Low](https://raw.githubusercontent.com/simons-containers/distroless-caddy/badges/.badges/main/low.svg)  
[![status](https://github.com/simons-containers/distroless-caddy/actions/workflows/deploy.yaml/badge.svg)](https://github.com/simons-containers/distroless-caddy/actions/workflows/deploy.yaml)
[![status](https://github.com/simons-containers/distroless-caddy/actions/workflows/update-versions.yaml/badge.svg)](https://github.com/simons-containers/distroless-caddy/actions/workflows/update-versions.yaml)

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

## License

Repository contents (e.g., `Containerfile`, build scripts, and configuration) are licensed under the **MIT License**.

Software included in built container images (such as **Caddy**, **glibc**, etc.) are provided under their respective upstream licenses and are not covered by the MIT license for this repository.

## Acknowledgements

This project depends on a number of upstream components and data sources:

- **Caddy** - Fast and extensible multi-platform HTTP/1-2-3 web server with automatic HTTPS.  
  https://caddyserver.com

- **glibc** – GNU C Library providing the standard C runtime and POSIX interfaces used by most Linux systems.  
  https://www.gnu.org/software/libc/

- **tzdata** – The IANA Time Zone Database, which provides the canonical global timezone definitions used for correct time handling.  
  https://www.iana.org/time-zones

- **Mozilla CA Certificates** – The curated set of trusted root Certificate Authorities maintained by Mozilla and used by many systems for TLS verification.  
  https://wiki.mozilla.org/CA
