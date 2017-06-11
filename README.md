# 日本語文書処理の実験

日本語に対してword2vec, doc2vec等をやってみる。

## 実験ノート

- [Gensim, JUMAN++, KNPで文書類似度算出](notebooks/Gensim.ipynb)
- [fastText, MeCabで文書分類](notebooks/fastText.ipynb)

## 計算環境

以下くらいの環境を想定

- GCP VM: n1-highmem-2 (2 vCPUs, 13 GB memory)
- Disk: 256 GB
- OS: Ubuntu Linux 16.04

## 内容

インストールされるもの

- Ubuntu 16.04
- vim, wget, git, nkf
- g++
- Python2, Python3, pip, Cython
- gensim (word2vec, doc2vec), pattern
- MeCab
- JUMAN, JUMAN++, KNP
- fastText

注

- Python3だとgensimがslow modeになり、patternはエラー

## git clone

    git clone git@github.com:vochicong/doc2vec.git
    cd doc2vec

以下、３つの方法が選べる。

- build済みのDocker imageを利用
- Docker imageを手元でbuild
- DockerではなくVMにインストール

## build済みのDocker imageを利用

build済みのDocker imageをpullして、containerを起動

### 必要なもの

- docker, docker-compose

### 実行

    docker-compose up

Docker内でコマンドを打つなら

    docker-compose exec nlp-doc2vec bash

## Build Docker image using ansible-container

手元でansible-containerを使ってDocker imageをbuildする。

### 必要なもの

- docker, docker-compose
- ansible-container

### 実行

buildして[vochicong/nlp-doc2vec](https://hub.docker.com/r/vochicong/nlp-doc2vec/)へpush

    ansible-container build
    docker tag nlp-doc2vec:latest vochicong/nlp-doc2vec:latest
    ansible-container push --push-to docker
    docker push vochicong/nlp-doc2vec:latest # push tag latest

## Build Docker image using docker-compose

手元でdocker-composeを使ってDocker imageをbuildする。

### 必要なもの

- docker, docker-compose

### 実行

buildして[vochicong/nlp-doc2vec](https://hub.docker.com/r/vochicong/nlp-doc2vec/)へpush

    docker-compose build
    docker-compose push

## VMにインストール

Dockerではなく、VM(Ubuntu 16.04想定)に環境をインストールする。

### 必要なもの

- ansible

### 実行

初回、データダウンロードを含めて実行

    sudo mkdir -p /workspace/download
    sudo chown -R `whoami` /workspace
    ansible-playbook ansible-playbook.yml  --skip-tags="clean"

2回目以降は、データダウンロードが不要

    ansible-playbook ansible-playbook.yml  --skip-tags="download,clean"

ダウロードしたデータを削除する場合

    ansible-playbook ansible-playbook.yml  --tags="clean"
    rm -Rf /workspace/download/*
