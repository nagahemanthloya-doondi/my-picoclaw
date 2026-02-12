FROM alpine:latest
RUN apk add --no-cache curl
RUN curl -L https://github.com/sipeed/picoclaw/releases/latest/download/picoclaw-linux-amd64 -o /usr/local/bin/picoclaw
RUN chmod +x /usr/local/bin/picoclaw
COPY config.json /root/.picoclaw/config.json
CMD ["picoclaw", "gateway"]
