FROM ubuntu:latest
MAINTAINER George Lewis <schvin@schvin.net>

ENV REFRESHED_AT 2016-01-11
RUN apt-get update --fix-missing -y && apt-get upgrade -y 
RUN apt-get install -y curl python procmail heirloom-mailx

RUN cd /tmp && curl -O http://pyropus.ca/software/getmail/old-versions/getmail-4.48.0.tar.gz && tar xfvz getmail-4.48.0.tar.gz
RUN cd /tmp/getmail* && python setup.py install

RUN groupadd s-mail
RUN useradd s-mail -g s-mail -d /home/s-mail
RUN mkdir -p /home/s-mail
RUN chown -R s-mail:s-mail /home/s-mail

ENV HOME /home/s-mail
USER s-mail
WORKDIR /home/s-mail

ENTRYPOINT ["/usr/local/bin/getmail", "-v", "-v"]
#ENTRYPOINT ["/usr/bin/watch", "-n60", "/usr/bin/getmail", "-v", "-v"]
