---
title: Install HomCloud
lang: ja
---

# インストール

|OS|インストール法|動作するOSバージョン|
|:----:|:----:|:----:|
|OS X|[homebrewによるインストール](install_guide_for_Mac.html)||
|Ubuntu/Debian|[apt-get、pipによるインストール](install_guide_for_Ubuntu.html)|16.04 lts 以降|
|Windows|[直接各パッケージインストール または WSL 上のインストール](install_guide_for_Windows.html)|Windows 10で動作確認|

<!-- |Debian|[apt-get、dpkgによるインストール](install_guide_for_Debian.html)|Jessie またはそれ以降| -->

# アップグレード

homcloudのバージョン管理にはpipを使うことができます。詳細は [インストール](OS_selects.html) を参照してください。
homcloudの最新版へのアップグレードは古いバージョンを削除してからインストールします。
旧バージョン(ver 1.3.1以下)をお使いの場合は以下の手順でファイル名に base と adavanced をつけた2つのファイル名に置き換えてください。

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
