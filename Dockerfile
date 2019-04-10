FROM golang:1.12.3-alpine3.9 as builder
RUN mkdir /app 
ENV GODIR /go
ENV WORKDIR ${GODIR}/src/github.com/operry/servicea
ENV GOPATH ${GODIR}
WORKDIR ${WORKDIR}
COPY . ${WORKDIR}
RUN go build -o /app/servicea .

FROM alpine:3.9
COPY --from=builder /app/servicea /servicea
CMD ["/servicea"]