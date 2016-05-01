FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y python2.7 curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L https://bootstrap.pypa.io/get-pip.py | python2.7 && \
    pip install transmissionrpc flexget

ADD bin/entrypoint.sh /entrypoint.sh

VOLUME ["/root/.flexget"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/bin/flexget", "--loglevel", "info", "daemon", "start"]
