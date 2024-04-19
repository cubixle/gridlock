FROM golang:1 as build
COPY . /app
WORKDIR /app
RUN CGO_ENABLED=0 go build -o /app/bin main.go

FROM alpine:latest
WORKDIR /app
COPY --from=build /app/bin /app/bin
RUN chmod +x ./bin
CMD ["./bin"]
