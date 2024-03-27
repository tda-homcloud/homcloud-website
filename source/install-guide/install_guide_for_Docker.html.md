---
title: Docker image for HomCloud
lang: ja
---

# Docker を使って HomCloud を利用する

[HomCloud用Dockerイメージがdockerhubから利用可能](https://hub.docker.com/r/ohai9/homcloud)です。
この文書ではこのDockerイメージを利用したHomCloudの利用法について説明します。

## Dockerについて

[Docker](https://www.docker.com/)はコンテナ型の仮想環境を作成、配布、実行するためのプラットフォームです。
特に配布に関する利便性がDockerの人気の鍵となっています。
Dockerの使い方等については[Dockerの公式のドキュメント](https://docs.docker.com/)や各種解説などを参考にして身に付けてください。
以下の解説ではDockerは既にインストール済であるとして説明をします。


## 1. Dockerイメージの取得

https://hub.docker.com/r/ohai9/homcloud/tags から適当なイメージを選んで pull してください。
このガイドでは 4.4.1-python3.12.2-slim-bookworm (HomCloudのバージョン4.4.1で，pythonのバージョンが3.12.2のものです)を使いましょう。
以下のようにします。

    docker pull ohai9/homcloud:4.4.1-python3.12.2-slim-bookworm
    

## 2. イメージの起動テスト

シェルから以下のように入力して動作テストをします。

    docker run -it ohai9/homcloud:4.4.1-python3.12.2-slim-bookworm  /usr/local/bin/python3 -m homcloud.self_check
    
以下のような出力が得られればOKです。

    HomCloud version: 4.4.1
    Python version: 3.12.2 (main, Mar 12 2024, 11:13:18) [GCC 12.2.0]
    CGAL version: 5.6.1 (1050611000)
    Alpha Shape 3 ... ok
    Alpha Shape 3 with weights ... ok
    Periodic Alpha Shape 3 with weights ... ok
    Alpha Shape 2 ... ok
    Grayscale 2D bitmap ... ok
    Binary 2D bitmap ... ok
    Binary 2D periodic bitmap ... ok
    Rips filtration ... ok
    Plotting PD ... ok
    Optimal Volume ... ok

## 3. Jupyter labの起動

それではDocker内でJupyter Labを起動します。シェルから以下のように入力します。

    docker run -p "127.0.0.1:8888:8888" -it ohai9/homcloud:4.4.1-python3.12.2-slim-bookworm /usr/local/bin/start-jupyterlab.sh
    
以下のような出力が得られるはずです(細かい出力は異っていてかまいません)。

    [I 2024-03-27 17:22:36.766 ServerApp] jupyter_lsp | extension was successfully linked.
    [I 2024-03-27 17:22:36.766 ServerApp] jupyter_server_proxy | extension was successfully linked.
          :
          :
    [I 2024-03-27 17:22:37.041 ServerApp]     http://127.0.0.1:8888/lab
    [I 2024-03-27 17:22:37.041 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
    [I 2024-03-27 17:22:37.053 ServerApp] Skipped non-installed server(s): bash-language-server, dockerfile-language-server-nodejs, javascript-typescript-langserver, jedi-language-server, julia-language-server, pyright, python-language-server, python-lsp-server, r-languageserver, sql-language-server, texlab, typescript-language-server, unified-language-server, vscode-css-languageserver-bin, vscode-html-languageserver-bin, vscode-json-languageserver-bin, yaml-language-server


そこで http://127.0.0.1:8888/lab にアクセスするとHomCloudが動くJupyterLab環境にアクセスできます。

