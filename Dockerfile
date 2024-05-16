FROM alpine:3.19 as builder
RUN apk add cargo
RUN cargo install nginx-cache-purge

FROM alpine:3.19
COPY --from=builder /root/.cargo/bin/nginx-cache-purge /usr/bin/nginx-cache-purge
RUN apk --upgrade --no-cache add libgcc
ENTRYPOINT ["nginx-cache-purge", "start"]

