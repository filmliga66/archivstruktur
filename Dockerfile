# syntax=docker/dockerfile:1.7

FROM squidfunk/mkdocs-material:latest AS build
WORKDIR /docs
COPY . /docs
RUN mkdocs build --strict

FROM nginx:alpine
COPY --from=build /docs/site /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1/ || exit 1
