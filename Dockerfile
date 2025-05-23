
FROM python:3.11-slim

RUN apt-get update

RUN yes | apt-get install build-essential

# Install curl and gnupg (required for NodeSource setup)
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Add NodeSource Node.js 20.x repo and install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Optional: Verify installation
RUN node -v && npm -v

# Install Yarn globally
RUN corepack enable && corepack prepare yarn@stable --activate

# Create a non-root user
RUN useradd -m -d /home/aider aider

# Set up directories with correct permissions
WORKDIR /home/aider/app
RUN mkdir -p /home/aider/.aider/caches && \
    chown -R aider:aider /home/aider

# Install pip and required packages
RUN python -m pip install --upgrade pip setuptools wheel

# Install aider directly with pip instead of using aider-install
RUN pip install aider-chat

# Switch to non-root user
USER aider

ENTRYPOINT ["aider"]