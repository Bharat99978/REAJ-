#!/bin/bash

# Generate SSH keys for Tmate
if [ ! -f /root/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 2048 -f /root/.ssh/id_rsa -q -N ""
fi

# Start Tmate session
echo "Starting Tmate session..."
tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready

# Display connection info
TMATE_SSH=$(tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}')
TMATE_WEB=$(tmate -S /tmp/tmate.sock display -p '#{tmate_web}')
echo "Tmate SSH: ${TMATE_SSH}"
echo "Tmate Web: ${TMATE_WEB}"

# Keep the container running
while :; do sleep 60; done
