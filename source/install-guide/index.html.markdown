---
title: Install HomCloud
lang: ja
---

# インストール

## お勧めのインストール方法

|OS|方法|OSのバージョンなど|
|:----|:----|:----|
|Ubuntu/Debian|[venvを使いpipでインストール](install_guide_for_Ubuntu_venv.html)|Ubuntu 22.04.2 LTSで確認|
|OS X (Apple Silicon Mac)|[M1 Macへのインストール](install_guide_for_M1Mac.html)|macOS 13.3で確認|
|OS X (Intel Mac)|[homebrewによるインストール](install_guide_for_Mac.html)||
|Windows|[直接各パッケージインストール または WSL 上のインストール](install_guide_for_Windows.html)|Windows 10 Proで確認|

## その他のインストール方法

|OS|方法|OSのバージョンなど|
|:----|:----|:----|
|Docker|[HomCloudのDockerイメージを利用する](install_guide_for_Docker.html)||
|Ubuntu/Debian|[apt-get、pipによるインストール](install_guide_for_Ubuntu.html)||
|Linux&miniconda3|[condaによるインストール](install_guide_for_Linux_conda.html)|各種64bit Linux|
|Windows|[condaでインストール](install_guide_for_Windows_conda.html)||

# アップグレード

pipでHomCloudをインストールした場合は次のようにしてアップグレードできます．

    pip install -U homcloud

condaを使った場合には，次のようにします．

    conda update -c https://homcloud.dev/conda-channel/ homcloud

ただ，condaの場合はバージョンごとに環境を作ったほうがいいかもしれません．
