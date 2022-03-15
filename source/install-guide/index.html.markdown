---
title: Install HomCloud
lang: ja
---

# インストール

|OS|インストール法|動作するOSバージョン|
|:----:|:----:|:----:|
|OS X|[homebrewによるインストール](install_guide_for_Mac.html)||
|OS X (Apple Silicon)|[M1 Macへのインストール](install_guide_for_M1Mac.html)||
|Ubuntu/Debian|[apt-get、pipによるインストール](install_guide_for_Ubuntu.html)|18.04 lts/buster 以降|
|Ubuntu/Debian|[venvを使いpipでインストール](install_guide_for_Ubuntu_venv.html)|18.04 lts/buster 以降|
|Linux&miniconda3|[condaによるインストール](install_guide_for_Linux_conda.html)|各種64bit Linux|
|Windows|[直接各パッケージインストール または WSL 上のインストール](install_guide_for_Windows.html)|Windows 10で動作確認|
|Windows|[condaでインストール](install_guide_for_Windows_conda.html)|Windows 10で動作確認|

<!-- |Debian|[apt-getによるインストール](install_guide_for_Debian.html)|buster| -->
<!-- |Debian|[apt-get、dpkgによるインストール](install_guide_for_Debian.html)|Jessie またはそれ以降| -->

# アップグレード

homcloudのバージョン管理にはpipを使うことができます。
homcloudの最新版へのアップグレードは古いバージョンを削除してからインストールします。
<!-- 旧バージョン(ver 1.3.1以下)をお使いの場合は以下の手順でファイル名に base と adavanced をつけた2つのファイル名に置き換えてください。-->

## Mac版、Linux版

アンインストールには以下のコマンドを入力します。

	pip3 uninstall homcloud

インストールはには以下のコマンドを入力します。

	pip3 install homcloud-x.y.z.tar.gz

x、y、zはバージョン番号です。できるだけ最新版をお使いください。
Linuxのシステムではローカルの環境にインストールするために、 `--user` のオプションを末尾に足します。

## Windows版

アンインストールには以下のコマンドを入力します。

	pip uninstall homcloud

インストールはには以下のコマンドを入力します。

	pip install homcloud-x.y.z.tar.gz

x、y、zはバージョン番号です。できるだけ最新版をお使いください。

[戻る](index.html)
