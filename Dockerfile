FROM mcr.microsoft.com/devcontainers/base:alpine

# Set build arguments for versions
ARG GLEAM_VERSION=1.3.1
ARG ERLANG_VERSION=25.3.2.2-r0
ARG TARGETARCH

# Set default architecture in case TARGETARCH is not set
ARG ARCH=${TARGETARCH:-amd64}

# Install Erlang
RUN apk --no-cache add curl erlang=${ERLANG_VERSION} erlang-dev=${ERLANG_VERSION}

# Download and install Gleam based on architecture
RUN case ${ARCH} in \
      "amd64") \
        GLEAM_BINARY_URL="https://github.com/gleam-lang/gleam/releases/download/v${GLEAM_VERSION}/gleam-v${GLEAM_VERSION}-x86_64-unknown-linux-musl.tar.gz" ;; \
      "arm64" | "aarch64") \
        GLEAM_BINARY_URL="https://github.com/gleam-lang/gleam/releases/download/v${GLEAM_VERSION}/gleam-v${GLEAM_VERSION}-aarch64-unknown-linux-musl.tar.gz" ;; \
      *) echo "Unsupported architecture: ${ARCH}"; exit 1 ;; \
    esac && \
    curl -Lo /tmp/gleam.tar.gz ${GLEAM_BINARY_URL} && \
    tar -xzf /tmp/gleam.tar.gz -C /tmp/ && \
    mv /tmp/gleam /usr/local/bin/gleam && \
    curl -o /usr/local/bin/rebar3 https://s3.amazonaws.com/rebar3/rebar3 && \
    chmod +x /usr/local/bin/rebar3 && \
    rm -rf /tmp/*

WORKDIR /app
