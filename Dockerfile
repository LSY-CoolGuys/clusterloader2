FROM docker.m.daocloud.io/golang:1.19 AS clusterloader2-builder
WORKDIR /app
ADD . /app
RUN cd /app \
    && go env -w GOARCH=amd64 \
    && go env -w GOOS=linux
    && go env -w GOPROXY=https://goproxy.cn,direct \
    && go mod tidy\
    && go build -o clusterloader2 ./cmd/
    
FROM alpine:latest AS final
WORKDIR /app
COPY --from=clusterloader2-builder /app/clusterloader2 /app
COPY --from=clusterloader2-builder /app/run-e2e.sh /app
RUN cd /app \
    && chmod +x clusterloader2

ENTRYPOINT ["./clusterloader2"]
