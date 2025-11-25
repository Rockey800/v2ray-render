FROM debian:latest

RUN apt update && apt install -y ca-certificates wget unzip && update-ca-certificates

WORKDIR /app

RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip && \
    chmod +x xray

COPY config.json /app/config.json

CMD ["/app/xray", "-config", "/app/config.json"]
