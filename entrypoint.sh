#!/bin/bash
set -e

# Auto-register kalau REGISTRATION_TOKEN diset
if [ -n "$REGISTRATION_TOKEN" ]; then
  echo "Registering GitLab Runner with token..."
  gitlab-runner register \
    --non-interactive \
    --url https://gitlab.com/ \
    --registration-token "glrt-LqEKBitRENeKvS_mZKaF5W86MQpwOjE3a2VqYgp0OjMKdTpob3BsNBg.01.1j00155he" \
    --executor docker \
    --docker-image alpine:latest \
    --description "zeabur-runner" \
    --tag-list "zeabur" \
    --run-untagged="true" \
    --locked="false"
else
  echo "No REGISTRATION_TOKEN provided. Skipping registration..."
fi

# Start the runner
exec gitlab-runner run --user=gitlab-runner --working-directory=/home/gitlab-runner
