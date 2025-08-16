FROM gitlab/gitlab-runner:latest

LABEL maintainer="ylexrapper@gmail.com"

# Install tools tambahan kalau perlu
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl git ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Salin entrypoint custom
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
