FROM debian:latest

RUN apt-get update && \
    apt-get install -y curl jq && \
    rm -rf /var/lib/apt/lists/*

COPY main.sh /main.sh 
RUN chmod +x /main.sh 
ENTRYPOINT ["/main.sh"]