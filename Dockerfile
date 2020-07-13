FROM alpine:3.8

RUN apk --no-cache add python py-pip py-setuptools && \
    pip install elasticsearch-curator==5.8.1 && \
    apk del py-pip

ENV CRONTABS /etc/crontabs/root

RUN echo '@daily /usr/bin/curator --config /config/config.yaml /config/action.yaml' >> ${CRONTABS}

ENTRYPOINT ["crond", "-f"]
