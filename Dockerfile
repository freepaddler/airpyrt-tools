FROM alpine:3.15
LABEL authors="Victor Chu"
LABEL maintainer="chu@vchu.net"
RUN apk add --update --no-cache python2 py2-setuptools
RUN apk add --update --no-cache -t build python2-dev build-base
COPY . /src/
RUN <<EOF
    #apk add --update --no-cache -t build python2-dev py2-setuptools build-base || exit 1
    cd src && python setup.py install || exit 1
    cd / && rm -rf /src && apk del build
EOF
ENTRYPOINT ["acp"]