FROM ubuntu:16.04
MAINTAINER kongvc@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y ansible

WORKDIR /workspace
COPY ansible-playbook.yml /workspace/
COPY roles /workspace/

RUN ansible-playbook ansible-playbook.yml --skip-tags \
 ansible-container,jumanpp,pyknp

# Server hosting download data for jumanpp and pyknp are down
# RUN ansible-playbook ansible-playbook.yml --tags jumanpp,pyknp
