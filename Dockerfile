FROM ubuntu:16.04
MAINTAINER kongvc@gmail.com

WORKDIR /workspace

ENV DEBIAN_FRONTEND noninteractive
ENV JUMANPP jumanpp-1.02
ENV JUMAN juman-7.01
ENV KNP knp-4.17
ENV PYKNP pyknp-0.3

RUN apt-get update \
 && apt-get install -y apt-utils apt-transport-https \
      g++ google-perftools libboost-dev zlib1g-dev \
      python3-pip python3-venv \
      vim wget \
 && apt-get clean && rm -rf /var/lib/apt/lists/*
 
RUN wget http://lotus.kuee.kyoto-u.ac.jp/nl-resource/jumanpp/$JUMANPP.tar.xz \
 && tar xJvf $JUMANPP.tar.xz \
 && cd $JUMANPP && ./configure && make all install clean \
 && rm ../$JUMANPP.tar.xz
 
RUN wget http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/$JUMAN.tar.bz2 \
 && tar xvfj $JUMAN.tar.bz2 \
 && cd $JUMAN && ./configure && make all install clean \
 && rm ../$JUMAN.tar.bz2
 
RUN wget http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/knp/$KNP.tar.bz2 \ 
 && tar xvfj $KNP.tar.bz2 \
 && cd $KNP && ./configure && make all install clean \
 && rm ../$KNP.tar.bz2
 
RUN wget http://lotus.kuee.kyoto-u.ac.jp/nl-resource/pyknp/$PYKNP.tar.gz \
 && tar xvfz $PYKNP.tar.gz \
 && rm $PYKNP.tar.gz \
 && ldconfig \
 && echo "knpとjumanを組み合わせる" | jumanpp | knp

SHELL ["/bin/bash", "-c"]
RUN python3 -m venv .env \
 && source .env/bin/activate \
 && pip3 install --upgrade pip \
 && pip3 install six simplegeneric jupyter gensim \
 && cd $PYKNP && python setup.py install
