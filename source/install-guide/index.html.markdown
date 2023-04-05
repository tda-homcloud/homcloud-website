---
title: Install HomCloud
lang: ja
---

# インストール

|OS|インストール法|動作するOSバージョン|
|:----:|:----:|:----:|
|OS X|[homebrewによるインストール](install_guide_for_Mac.html)||
|OS X (Apple Silicon)|[M1 Macへのインストール](install_guide_for_M1Mac.html)||
|Ubuntu/Debian|[apt-get、pipによるインストール](install_guide_for_Ubuntu.html)||
|Ubuntu/Debian|[venvを使いpipでインストール](install_guide_for_Ubuntu_venv.html)||
|Linux&miniconda3|[condaによるインストール](install_guide_for_Linux_conda.html)|各種64bit Linux|
|Windows|[直接各パッケージインストール または WSL 上のインストール](install_guide_for_Windows.html)|Windows 10で動作確認|
|Windows|[condaでインストール](install_guide_for_Windows_conda.html)|Windows 10で動作確認|

# アップグレード

pipでHomCloudをインストールした場合は次のようにしてアップグレードできます．

    pip install -U homcloud

condaを使った場合には，次のようにします．

    conda update -c https://homcloud.dev/conda-channel/ homcloud

ただ，condaの場合はバージョンごとに環境を作ったほうがいいかもしれません．
