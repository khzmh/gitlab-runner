# Gunakan base image GitLab Runner resmi
FROM gitlab/gitlab-runner:latest

# Tambahkan maintainer info (opsional)
LABEL maintainer="ylexrapper@gmail.com"

# Update paket & install tools tambahan (contoh: docker-cli, kubectl, helm)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl wget git unzip ca-certificates \
        docker.io \
        kubectl \
        && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y bash

# Tambah Helm (opsional)
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Tambah entrypoint custom (opsional)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
