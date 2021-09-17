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
* [3次元白黒画像](tutorial/binary-3d.html)

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
* [3次元白黒画像](py-tutorial/binary-3d.html)
* [距離行列(Vietoris-Rips)](py-tutorial/rips.html)
* [周期境界3次元ポイントクラウド](py-tutorial/pointcloud_periodic.html)
* [機械学習との組み合わせ](py-tutorial/ml_pc.html)

[このリンク先のファイルにjupyter notebookのnotebookファイル(.ipynb)や、データファイル等が含まれています。](download/python-tutorial.zip)

このチュートリアルはjupyter notebookを使っています。チュートリアルをする前に
jupyter notebookをインストールしてください。

その後、チュートリアルのnotebookを実行します。
[python-tutorial.zip](download/python-tutorial.zip)をダウンロードし、
zipファイルを展開してください。そこで `tutorial/python-interface/` 
というディレクトリが
作られるので、そこにターミナルで`cd`で移動して、
`jupyter notebook`とするとWebブラウザ上でUIが開かれます。
そこに各チュートリアルに対応してディレクトリがあるので、それを開いてその下にある
`.ipynb`ファイルを開いてチュートリアルを実行してください。

また、Python interface の API のドキュメントは 
[python-api/](python-api/)
から参照できます。

これらのチュートリアルでは Paraview を使って3次元の可視化をします．

### Plotlyによる3次元可視化

Paraview はインストールが面倒，リモートで動かしずらい，等の問題があります．HomCloudは
[plotly](https://plotly.com/python/)による3次元可視化も可能です．以下のチュートリアルでは
Paraviewの代わりにplotlyで逆解析結果など可視化しています．

* [3次元点集合データ(ポイントクラウド)](py-tutorial/pointcloud-3d-visualization-by-plotly.html)
* [3次元白黒画像](py-tutorial/binary-3d-3d-visualization-by-plotly.html)
* [周期境界3次元ポイントクラウド](py-tutorial/pointcloud_periodic-3d-visualization-by-plotly.html)
* [機械学習との組み合わせ](py-tutorial/ml_pc-3d-visualization-by-plotly.html)

### Jupyter notebookに関する話

jupyter notebook、チュートリアルを動かすのには便利だと思いますが
自分で使ってみようとすると何か使いにくいと感じられる人も多いと思います。
ある意味その感覚は妥当で、このソフトウェアはプログラムを書くための
環境のように見えますがそうではありません。100行以上の普通の
プログラムを書くのであればjupyter notebookは使うべきではありません。
まあとりえあえずチュートリアルとかそういうのの専用ツールだと思っておくといいのでは
ないでしょうか。

## Google Colaboratoryによるチュートリアル

最近 HomCloud は[Google Colaboratory](colab.research.google.com/)でも動作するようになりました．
現在Colabへのチュートリアルの移植を進行中です．

* [3次元点集合データ(ポイントクラウド)](https://colab.research.google.com/drive/1TPmO9HJ__BToBIWO97E27syDSUantnq8?usp=sharing)
* [原子配置データ(3次元点集合データ)](https://colab.research.google.com/drive/1TPmO9HJ__BToBIWO97E27syDSUantnq8?usp=sharing)
* [Machine learning](https://colab.research.google.com/drive/1Qhw7Tof0hoiTH6_pnLi3j6VNcUjbR-Sc?usp=sharing)
