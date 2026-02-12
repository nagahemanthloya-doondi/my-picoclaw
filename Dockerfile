FROM alpine:latest

# Install necessary tools
RUN apk add --no-cache curl wget

# Download the PicoClaw binary for x86_64
RUN wget https://github.com/sipeed/picoclaw/releases/download/v0.1.0/picoclaw-linux-amd64 -O /usr/local/bin/picoclaw \
    && chmod +x /usr/local/bin/picoclaw

# Create config directory
RUN mkdir -p /root/.picoclaw

# Copy your config from the repo to the correct internal folder
COPY config.json /root/.picoclaw/config.json

# TRICK FOR KOYEB: This starts a tiny fake web server and the bot at the same time
CMD (echo -e "HTTP/1.1 200 OK\n\n Hello" | nc -l -p 8000 &) && picoclaw gateway
