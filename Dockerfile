FROM ubuntu:16.04
MAINTAINER kongvc@gmail.com

WORKDIR /workspace
COPY ansible-playbook.yml /workspace/
COPY roles /workspace/

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update &&\
 apt-get install -y ansible &&\
 ansible-playbook ansible-playbook.yml --skip-tags ansible-container &&\
 apt-get clean && rm -rf /var/lib/apt/lists/* &&\
 echo DONE
