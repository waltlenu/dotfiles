FROM nlknguyen/alpine-shellcheck
MAINTAINER waltlenu

# Install a few basic utilities
RUN set -ex \
    && apk upgrade --no-cache \
    && apk add --no-cache --virtual .base-system \
         bash \
         ca-certificates \
         tar \
         tini \
         wget

# Install dash/zsh shells
RUN set -ex \
    && echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add --no-cache --virtual .shells dash@testing zsh

# Install BATS (github.com/sstephenson/bats)
ARG BATS_DOWNLOAD_URL=https://github.com/sstephenson/bats/archive/v0.4.0.tar.gz
ARG BATS_DOWNLOAD_SHA=480d8d64f1681eee78d1002527f3f06e1ac01e173b761bc73d0cf33f4dc1d8d7
RUN set -ex \
    && mkdir /usr/src \
    && wget -q -O /usr/src/bats.tgz $BATS_DOWNLOAD_URL \
    && echo "$BATS_DOWNLOAD_SHA  /usr/src/bats.tgz" | sha256sum -c - \
    && tar \
           --extract \
           --file /usr/src/bats.tgz \
           --directory /usr/src \
           --strip-components 1 \
    && /usr/src/install.sh /usr/local \
    && rm -rf /usr/src

# Set entrypoint
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/docker-entrypoint.sh"]
