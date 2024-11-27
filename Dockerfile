# Use a lightweight base image
FROM alpine:latest

# Install curl and bash
RUN apk add --no-cache curl bash

# Set the command to be run
CMD curl -sSf https://sshx.io/get | sh -s run
