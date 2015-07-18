FROM ryanckoch/docker-ubuntu-14.04
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /install && \
    apt-get update -qq && \
    apt-get install -y python2.7 curl -qq && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L https://bootstrap.pypa.io/get-pip.py | bash
ADD flexget_requirements.txt /install/flexget_requirements.txt

RUN python2.7 /install/get-pip.py && \
    pip install -r /install/flexget_requirements.txt && \
    echo 'export LC_ALL=en_US.UTF-8' >> /root/.bashrc && \
    echo 'export LANG=en_US.UTF-8' >> /root/.bashrc && \
    echo 'export LANGUAGE=en_US.UTF-8' >> /root/.bashrc

VOLUME ["/root/.flexget"]

CMD ["/usr/local/bin/flexget", "--loglevel", "info", "daemon", "start"]
