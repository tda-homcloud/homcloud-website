---
title: HomCloud チュートリアル
lang: ja
---
{::options parse_block_html="true" /}

# HomCloud チュートリアル

HomCloudにはコマンドラインインターフェース(CLI)とPythonインターフェースの2つのインターフェスが用意されています．
それぞれのインターフェースに対していくつかのチュートリアルが用意されています．
まずはポイントクラウドのチュートリアルから始めてください．

CLIとPythonではPythonのインターフェースの方がお勧めです．
Pythonの科学技術計算エコシステムと組み合わせることでより便利にHomCloudを活用できます．

## Pythonインターフェース

* [3次元点集合データ(ポイントクラウド)](py-tutorial/pointcloud.html)
* [白黒画像](py-tutorial/binary-image.html)
* [グレイスケール画像](py-tutorial/grayscale-image.html)
* [3次元白黒画像](py-tutorial/binary-3d.html)
* [距離行列(Vietoris-Rips)](py-tutorial/rips.html)
* [周期境界3次元ポイントクラウド](py-tutorial/pointcloud_periodic.html)
* [機械学習との組み合わせ](py-tutorial/ml_pc.html)
* [材料科学データの解析](py-tutorial/analysis_of_atomic_configurations.html)

このチュートリアルはjupyter notebookを使っています．チュートリアルをする前に
jupyter notebookをインストールしてください．

その後，[python-tutorial.zip](download/python-tutorial.zip)をダウンロードし，zipファイルを展開してください．
そこで `tutorial/python-interface/` というディレクトリが作られるので，そこにターミナルで`cd`で移動して，`jupyter notebook`とするとWebブラウザ上でUIが開かれます．
そこに各チュートリアルに対応してディレクトリがあるので，それを開いてその下にある
`.ipynb`ファイルを開いてチュートリアルを実行してください．

また，Python interface の API のドキュメントは [python-api/](python-api/)から参照できます．

## Google Colaboratoryによるチュートリアル

最近 HomCloud は[Google Colaboratory](colab.research.google.com/)でも動作するようになりました．
現在Colabへのチュートリアルの移植を進行中です．

* [3次元点集合データ(ポイントクラウド)](https://colab.research.google.com/drive/1TPmO9HJ__BToBIWO97E27syDSUantnq8?usp=sharing)
* [白黒画像の解析](https://colab.research.google.com/drive/1Zu51FPnGyLGLwZeck3_79euQFTYTk5A8?usp=sharing)
* [グレイスケール画像の解析](https://colab.research.google.com/drive/1BzrPy3Cq2rgnz1dhBu6xqPEFO3qUkaiB?usp=sharing)
* [三次元二値画像の解析](https://colab.research.google.com/drive/1oxcWPZhlktb-z2vGU9Q35ZrY10VKg2NC?usp=sharing)
* [原子配置データ(3次元点集合データ)](https://colab.research.google.com/drive/14flPjPRuzvxIxqBKsB2za5vD7EYr3__E?usp=sharing)
usp=sharing)
* [機械学習](https://colab.research.google.com/drive/1Qhw7Tof0hoiTH6_pnLi3j6VNcUjbR-Sc?usp=sharing)

### Jupyter notebookに関する話

Jupyter notebookは勉強するのに使ったり試行錯誤には便利ですが，ある程度やることが固まってくると使いにくいと思います．
そういうときは脱Jupyter notebookが必要なのでがんばってください．

### Plotlyによる3次元可視化

* [3次元点集合データ(ポイントクラウド)](py-tutorial/pointcloud-3d-visualization-by-plotly.html)
* [3次元白黒画像](py-tutorial/binary-3d-3d-visualization-by-plotly.html)
* [周期境界3次元ポイントクラウド](py-tutorial/pointcloud_periodic-3d-visualization-by-plotly.html)
* [機械学習との組み合わせ](py-tutorial/ml_pc-3d-visualization-by-plotly.html)


## コマンドラインインターフェース版

* [3次元点集合データ(ポイントクラウド)](tutorial/pointcloud.html)
* [白黒画像](tutorial/binary-image.html)
* [グレイスケール画像](tutorial/grayscale-image.html)
* [3次元白黒画像](tutorial/binary-3d.html)

[このリンク先のファイルにjupyter notebookのnotebookファイル(.ipynb)や，データファイル等が含まれています．](donwload/bash-tutorial.zip)

### このチュートリアルのための準備について

このチュートリアルは jupyter notebook に bash_kernel というものを組み合わせて使っています．
インストール方法は以下の通りです．

1. jupyter notebook をインストールする
   * すでに HomCloud をインストールしているということはpythonもインストールしているはずです．
     そこから jupyter notebook をインストールすることはそんなに難しくないでしょう．

2. bash_kernel をインストールする
   * https://github.com/takluyver/bash_kernel を使います．インストール方法はこのリンク先にも書いてありますが，
  
         pip3 install bash_kernel
         python3 -m bash_kernel.install
      
    とします．

3. チュートリアルのnotebookを実行する．
   * [bash-tutorial.zip](tutorial/bash-tutorial.zip)をダウンロードし，
     zipファイルを展開してください．そこで `tutorial/bash/` というディレクトリが
     作られるので，そこにターミナルで`cd`で移動して，
     `jupyter notebook`とするとWebブラウザ上でUIが開かれます．
     そこに3つのディレクトリ(`pointcloud`, `binary-image`, `grayscale-image`)
     があるので，チュートリアルを実行してください．


