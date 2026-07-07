FROM debian:stable-slim
LABEL maintainer="kelvl"

# Minimal WireGuard + Python base image.
#
# It ships only the toolchain needed to *be* a VPN container: the WireGuard
# userspace tools plus a stdlib Python 3 (for provisioners such as the Privado
# client) and curl. The actual provisioning / entrypoint scripts are mounted at
# runtime (e.g. a Kubernetes ConfigMap) and the command is overridden by the
# caller, so this image stays provider-agnostic and reusable.

ENV LC_ALL="C.UTF-8" LANG="C.UTF-8"
ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get -y update && apt-get install -y --no-install-recommends \
        wireguard-tools \
        iproute2 \
        iptables \
        nftables \
        bash \
        procps \
        python3 \
        curl \
        ca-certificates \
    && apt-get -y clean && rm -rf /var/lib/apt/lists/*

# wg-quick shells out to `iptables`; on Debian this is the nft-based backend.
# python3 is stdlib-only here (no pip) — provisioners must not require packages.

# Harmless default; real workloads override the command to run their entrypoint.
CMD ["/bin/bash"]
