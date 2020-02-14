FROM golang:1.12-alpine3.9 as builder
COPY main.go .
RUN go build -o /go-app main.go

FROM alpine:3.9  
EXPOSE 8080
COPY --from=builder /go-app .
ENTRYPOINT ["./go-app"]
