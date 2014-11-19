FROM ubuntu:trusty
MAINTAINER George Lewis <schvin@schvin.net>

ENV REFRESHED_AT 2014-11-19
RUN apt-get update --fix-missing -y && apt-get upgrade -y 
RUN apt-get install -y getmail4 procmail heirloom-mailx

RUN groupadd s-mail
RUN useradd s-mail -g s-mail -d /home/s-mail
RUN mkdir -p /home/s-mail
RUN chown -R s-mail:s-mail /home/s-mail

ENV HOME /home/s-mail
USER s-mail
WORKDIR /home/s-mail

ENTRYPOINT ["/usr/bin/getmail", "-v", "-v"]
#ENTRYPOINT ["/usr/bin/watch", "-n60", "/usr/bin/getmail", "-v", "-v"]
