FROM python:3.13-alpine AS base
FROM base
RUN pip install --no-cache-dir ansible \
  && apk update \
  && apk add --no-cache curl openssh-client 
# sshpass
ENTRYPOINT [ "/bin/sh" ]
