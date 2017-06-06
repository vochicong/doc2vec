# 日本語文書処理の実験

日本語に対してword2vec, doc2vec等をやってみる。

## 実験

- [Gensim, JUMAN++, KNPで文書類似度算出](notebooks/Gensim.ipynb)
- [fastText, MeCabで文書分類](notebooks/fastText.ipynb)

## 計算環境

以下くらいの環境が必要。

- GCP VM: n1-highmem-2 (2 vCPUs, 13 GB memory)
- Disk: 128 GB

## インストール

Docker imageをpullして、containerを起動

    git clone git@github.com:vochicong/doc2vec.git
    cd doc2vec
    docker-compose pull
    docker-compose up --no-build

手元でDockerfileからDocker imageをビルドするなら

    docker-compose build

Docker内でコマンドを打つなら

    docker-compose exec doc2vec bash

## 内容

Docker imageに含まれているもの

- Ubuntu 16.04
- g++
- python3, pip, Cython
- gensim (word2vec, doc2vec)
- MeCab
- JUMAN, JUMAN++, KNP
- fastText
