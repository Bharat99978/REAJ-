# Base image
FROM debian:bullseye-slim

# Set environment variables to prevent prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install tmate and necessary tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    tmate \
    openssh-client \
    curl \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose a port for Render compatibility (not used by tmate but required by Render)
EXPOSE 8888

# Use the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
