# Use an official lightweight base image
FROM debian:bullseye-slim

# Set environment variables to prevent prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install curl and other necessary tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Run the SSHx script
CMD curl -sSf https://sshx.io/get | sh -s run
