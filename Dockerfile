FROM alpine:edge

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

RUN apk add --update \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    libcrypto1.1 libssl1.1 \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family ttf-freefont \
    fontconfig dbus xvfb

RUN apk add --update wkhtmltopdf

RUN mv /usr/bin/wkhtmltopdf /usr/bin/wkhtmltopdf-origin && \
    echo $'#!/usr/bin/env sh\n\
    Xvfb :0 -screen 0 1024x768x24 -ac +extension GLX +render -noreset & \n\
    DISPLAY=:0.0 wkhtmltopdf-origin $@ \n\
    killall Xvfb\
    ' > /usr/bin/wkhtmltopdf && \
    chmod +x /usr/bin/wkhtmltopdf

RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["wkhtmltopdf"]
