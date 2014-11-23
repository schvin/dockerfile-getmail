#!/bin/sh

while :;
do
  date
  docker run -it --volumes-from=$USER-mutt schvin/getmail
  sleep 15
done
