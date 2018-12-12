---
title: 基本的な使い方
lang: ja
---
{::options parse_block_html="true" /}

# HomCloudの基本的な使い方

ここでは、

* 3次元点集合データ(ポイントクラウド)
* 白黒画像
* グレイスケール画像

を解析する場合についてチュートリアル的に解説します。

チュートリアルには2種類あり、コマンドラインインターフェースを使うものと、
PythonのAPIを使うものです。

## コマンドラインインターフェース版

* [3次元点集合データ(ポイントクラウド)](tutorial/pointcloud.html)
* [白黒画像](tutorial/binary-image.html)
* [グレイスケール画像](tutorial/grayscale-image.html)

[このリンク先のファイルにjupyter notebookのnotebookファイル(.ipynb)や、データファイル等が含まれています。](donwload/bash-tutorial.zip)

### このチュートリアルのための準備について

このチュートリアルは jupyter notebook に bash_kernel というものを組み合わせて使っています。
インストール方法は以下の通りです。Windowsでは標準では bash はインストールされていないので、
以下の「Jupyter notebook を使わないチュートリアル実行法について」を参考にして
チュートリアルを動かしてください。

1. jupyter notebook をインストールする
   * すでに HomCloud をインストールしているということはpythonもインストールしているはずです。
     そこから jupyter notebook をインストールすることはそんなに難しくないでしょう。

2. bash_kernel をインストールする
   * https://github.com/takluyver/bash_kernel を使います。インストール方法はこのリンク先にも書いてありますが、
  
         pip3 install bash_kernel
         python3 -m bash_kernel.install
      
    とします。

3. チュートリアルのnotebookを実行する。
   * [bash-tutorial.zip](tutorial/bash-tutorial.zip)をダウンロードし、
     zipファイルを展開してください。そこで `tutorial/bash/` というディレクトリが
     作られるので、そこにターミナルで`cd`で移動して、
     `jupyter notebook`とするとWebブラウザ上でUIが開かれます。
     そこに3つのディレクトリ(`pointcloud`, `binary-image`, `grayscale-image`)
     があるので、チュートリアルを実行してください。

### Jupyter notebook を使わないチュートリアル実行法について

Jupyter notebookを使いたくない場合はターミナルから以下の例を直接実行することもできます。
ただし `display < 画像ファイル` という画像表示機能は使えないのでそこは自分で別の方法で画像表示してください。

Windows を使っている方もコマンドプロンプトから入力することでおおよそ同じことができます。ただしいくつかのコマンド (`head`, `tail`) など
はないのでそちらはスキップしてください。


## Python Inteface版

* [3次元点集合データ(ポイントクラウド)](py-tutorial/pointcloud.html)
* [白黒画像](py-tutorial/binary-image.html)
* [グレイスケール画像](py-tutorial/grayscale-image.html)
* [機械学習との組み合わせ](py-tutorial/ml_pc.html)

[このリンク先のファイルにjupyter notebookのnotebookファイル(.ipynb)や、データファイル等が含まれています。](download/python-tutorial.zip)

このチュートリアルは jupyter notebook を使っています。そのため実行前に jupyter notebook を
インストールしてください。

その後、チュートリアルのnotebookを実行します。
[python-tutorial.zip](download/python-tutorial.zip)をダウンロードし、
zipファイルを展開してください。そこで `tutorial/python-interface/` 
というディレクトリが
作られるので、そこにターミナルで`cd`で移動して、
`jupyter notebook`とするとWebブラウザ上でUIが開かれます。
そこに3つのディレクトリ(`pointcloud`, `binary-image`, `grayscale-image`)
があるので、チュートリアルを実行してください。

また、Python interface の API のドキュメントは 
[https://www.wpi-aimr.tohoku.ac.jp/hiraoka_labo/homcloud/python-api/](https://www.wpi-aimr.tohoku.ac.jp/hiraoka_labo/homcloud/python-api/)
から参照できます。
