FROM alpine:3.18 AS runner
  LABEL maintainer="Nuvolaris"
  ENV PORT=5252
  ENV DIR=/home
  ARG BUILD_ENVIRONMENT=docker
  WORKDIR ${DIR}
  COPY . .

  RUN \
    apk add -U bash nodejs npm && \
    npm install -g gulp-cli

  CMD ["gulp", "preview"]
  EXPOSE ${PORT}