FROM golang:1.17 as build
WORKDIR /home
RUN git clone https://github.com/Jigsaw-Code/outline-ss-server.git
WORKDIR /home/outline-ss-server
RUN CGO_ENABLED=0 GOOS=linux go build .

FROM alpine:3.14
COPY --from=build /home/outline-ss-server/outline-ss-server /usr/bin/outline-ss-server
ENTRYPOINT [ "/usr/bin/outline-ss-server" ]