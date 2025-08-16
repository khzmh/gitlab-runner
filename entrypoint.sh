#!/bin/bash
set -e

echo "Starting custom GitLab Runner..."
exec /usr/bin/dumb-init /usr/bin/gitlab-runner run --user=gitlab-runner --working-directory=/home/gitlab-runner
