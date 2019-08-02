Dockerfile for WKHTMLTOPDF (on alpine:edge)
===

Based on https://github.com/RoseRocket/docker-alpine-wkhtmltopdf-patched-qt

Usage:

`docker pull noomz/wkhtmltopdf-alpine`

Example:

`docker run --rm -v /tmp:/tmp noomz/wkhtmltopdf-alpine:latest https://google.com /tmp/out.pdf`

License: MIT