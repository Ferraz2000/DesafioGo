FROM golang:latest AS builder
# Set destination for COPY
WORKDIR /app
COPY go.mod ./
COPY DesafioGo.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o desafio DesafioGo.go


FROM scratch
WORKDIR /app
COPY --from=builder /app/desafio ./

EXPOSE 8080

ENTRYPOINT [ "/app/desafio" ] 

