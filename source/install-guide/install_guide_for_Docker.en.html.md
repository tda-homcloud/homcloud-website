---
title: Docker image for HomCloud
lang: en
---

# Use HomCloud via Docker 

[Docker images for HomCloud are available at dockerhub](https://hub.docker.com/r/ohai9/homcloud).
This document explains how to use the images.

## About docker

[Docker](https://www.docker.com/) is a popular platform to build, distribute, and execute container-type virtual environments.
Please refer to [official Docker documentation](https://docs.docker.com/) and other documents to learn how to use Docker.
In the following, it is assumed that Docker is already installed.


## 1. Pull a docker image

Please pull any favorite image from <https://hub.docker.com/r/ohai9/homcloud/tags>.
In this guide, we use 4.4.1-python3.12.2-slim-bookworm (HomCloud version 4.4.1 on Python 3.12.2).
The following command pulls the image from Dockerhub.

    docker pull ohai9/homcloud:4.4.1-python3.12.2-slim-bookworm
    

## 2. Test the image

The following command will run the test.

    docker run -it ohai9/homcloud:4.4.1-python3.12.2-slim-bookworm  /usr/local/bin/python3 -m homcloud.self_check

The image works well if you get the following output.

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

## 3. Invoke Jupyter lab

The following command will invoke Jupyter Lab in which HomCloud is available.

    docker run -p "127.0.0.1:8888:8888" -it ohai9/homcloud:4.4.1-python3.12.2-slim-bookworm /usr/local/bin/start-jupyterlab.sh

The following output is fine.

    [I 2024-03-27 17:22:36.766 ServerApp] jupyter_lsp | extension was successfully linked.
    [I 2024-03-27 17:22:36.766 ServerApp] jupyter_server_proxy | extension was successfully linked.
          :
          :
    [I 2024-03-27 17:22:37.041 ServerApp]     http://127.0.0.1:8888/lab
    [I 2024-03-27 17:22:37.041 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
    [I 2024-03-27 17:22:37.053 ServerApp] Skipped non-installed server(s): bash-language-server, dockerfile-language-server-nodejs, javascript-typescript-langserver, jedi-language-server, julia-language-server, pyright, python-language-server, python-lsp-server, r-languageserver, sql-language-server, texlab, typescript-language-server, unified-language-server, vscode-css-languageserver-bin, vscode-html-languageserver-bin, vscode-json-languageserver-bin, yaml-language-server


After that, please go to <http://127.0.0.1:8888/lab> in your browser to get access to the jupyer environment.

