FROM alpine:3.10

ENV HUGO_VERSION=0.57.2
ENV HUGO_TYPE=_extended

ENV HUGO_ID=hugo${HUGO_TYPE}_${HUGO_VERSION}

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_ID}_Linux-64bit.tar.gz /tmp

RUN tar -xf /tmp/${HUGO_ID}_Linux-64bit.tar.gz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/${HUGO_ID}_linux_amd64 \
    && rm -rf /tmp/${HUGO_ID}_Linux-64bit.tar.gz \
    && rm -rf /tmp/LICENSE.md \
    && rm -rf /tmp/README.md

RUN apk add --update git asciidoctor libc6-compat libstdc++ \
    && apk upgrade \
    && apk add --no-cache ca-certificates

ENTRYPOINT ["hugo"]

EXPOSE 1313