FROM phusion/baseimage:0.9.15
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get install -y python2.7 -qq

RUN mkdir /install
ADD get-pip.py /install/get-pip.py
ADD flexget_requirements.txt /install/flexget_requirements.txt

RUN python2.7 /install/get-pip.py
RUN pip install -r /install/flexget_requirements.txt
RUN echo 'export LC_ALL=en_US.UTF-8' >> /root/.bashrc
RUN echo 'export LANG=en_US.UTF-8' >> /root/.bashrc
RUN echo 'export LANGUAGE=en_US.UTF-8' >> /root/.bashrc

VOLUME ["/root/.flexget"]

CMD ["/usr/local/bin/flexget", "--loglevel", "info", "daemon", "start"]
