FROM golang:1.18-alpine as base
LABEL maintainer="Irakli Nadareishvili"

# Commented-out because these are defaults anyway
# ENV GOPATH=/go
# ENV PATH=${GOPATH}/bin:${PATH}
ENV APP_USER=appuser
ENV SRC_PATH=/app
ENV GIN_MODE=release
# ENV GO111MODULE=on

COPY . ${SRC_PATH}
WORKDIR ${SRC_PATH}

USER root

RUN adduser -s /bin/false -D ${APP_USER} \
 && echo "Installing git and bash support" \
 && apk update && apk upgrade \
 && apk add --no-cache bash git \
 && echo "Installing code hot re-loader" \
 #&& go get -u github.com/cespare/reflex \
 && go install github.com/cespare/reflex@latest \
 && echo "Installing go dependencies…" \
 && go mod tidy \
 && echo "Fixing permissions..." \
 && chown -R ${APP_USER}:${APP_USER} ${GOPATH} \
 && chown -R ${APP_USER}:${APP_USER} ${SRC_PATH} 

USER ${APP_USER}

EXPOSE ${PORT}

FROM base as builder
# USER ${APP_USER}
# Build the binary.
RUN CGO_ENABLED=0 go build -ldflags "-s -w -extldflags '-static'" -buildvcs=false -o /go/bin/microservice-bin


FROM scratch as release
ENV APP_ENV=production
ENV GIN_MODE=release
ENV PORT=3737
WORKDIR /go/bin
# Copy the user and group files
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group
# Copy the microservice binary
COPY --from=builder /go/bin/microservice-bin /go/bin/microservice-bin
USER ${APP_USER}
CMD ["/go/bin/microservice-bin"]

FROM base as devworkspace
ENV APP_ENV=development
ENV PORT=3737

# RUN echo "Cleaning up installation caches to reduce image size" \
# && rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/*

EXPOSE ${PORT}
