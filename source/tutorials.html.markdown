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

* [3次元点群データ(ポイントクラウド)](py-tutorial/pointcloud.html)
* [二値画像](py-tutorial/binary_image.html)
* [グレイスケール画像](py-tutorial/grayscale_image.html)
* [3次元二値画像](py-tutorial/binary_3d.html)
* [機械学習との組み合わせ](py-tutorial/ml_pc.html)
* 材料科学データの解析(原子配置データ)
  * [銅の結晶データ](py-tutorial/analysis_of_atomic_configurations_1.html)
  * [アモルファスシリカのデータ](py-tutorial/analysis_of_atomic_configurations_2.html)
* [距離行列(Vietoris-Rips)](py-tutorial/rips.html)
* [周期境界3次元ポイントクラウド](py-tutorial/pointcloud_pbc.html)
* [周期境界画像](py-tutorial/pbc_bitmap.html)
* [点群の相対PH](py-tutorial/relative.html)

3次元可視化にPlotlyを使ったバージョン:

* [3次元点群データ(ポイントクラウド)](py-tutorial/pointcloud_3d_visualization_by_plotly.html)
* [3次元二値画像](py-tutorial/binary_3d_3d_visualization_by_plotly.html)
* [機械学習との組み合わせ](py-tutorial/ml_pc_3d_visualization_by_plotly.html)

このチュートリアルはjupyter notebookを使っています．チュートリアルをする前に
jupyter notebookをインストールしてください．

その後，[python-tutorial.zip](download/python-tutorial.zip)をダウンロードし，zipファイルを展開してください．
そこで `tutorial/python-interface/` というディレクトリが作られるので，そこにターミナルで`cd`で移動して，`jupyter lab`とするとWebブラウザ上でUIが開かれます．
そこに各チュートリアルに対応してディレクトリがあるので，それを開いてその下にある
`.ipynb`ファイルを開いてチュートリアルを実行してください．

また，Python interface の API のドキュメントは [python-api/](python-api/)から参照できます．

## Google Colaboratoryによるチュートリアル

HomCloudは [Google Colaboratory](https://colab.research.google.com/) でも動作します。

* [3次元点群データ(ポイントクラウド)](https://colab.research.google.com/drive/1wEoc7VVNRLkC7anxdwvsOCwyyv0HTTFG?usp=sharing)
* [二値画像](https://colab.research.google.com/drive/11hMP5-7EL_eqPas9bCvlY0mMpwQrsJcf?usp=sharing)
* [グレイスケール画像](https://colab.research.google.com/drive/109s2MC2OL9cLv1Wz7dJf-4Q31s1T1S3p?usp=sharing)
* [3次元二値画像](https://colab.research.google.com/drive/1LHdIVE06fo2OVnrPOhmrbSdW7pTVPuX7?usp=sharing)
* [機械学習との組み合わせ](https://colab.research.google.com/drive/125NW3j9ii9JtsR_Oz1pv7waOln3m48DT?usp=sharing)
* 材料科学データの解析(原子配置データ)
  * [銅の結晶データ](https://colab.research.google.com/drive/1Nxyhd1gJzuMIPglIeZLF4t8wVwZHE0yR?usp=sharing)
  * [アモルファスシリカのデータ](https://colab.research.google.com/drive/1Xnzhj7_sowwBF4D-aj0skmFMu5H4gYqW?usp=sharing)
* [距離行列(Vietoris-Rips)](https://colab.research.google.com/drive/1tD2naiqjd6lsHYIodkiCHYyhfN1hEt5G?usp=sharing)
* [周期境界画像](https://colab.research.google.com/drive/1tpHgUomj8QHuFEGUOG2nuwWE5psUBKpM?usp=sharing)

### Jupyter notebookに関する話

Jupyter notebookは勉強するのに使ったり試行錯誤には便利ですが，ある程度やることが固まってくると使いにくいと思います．
そういうときは脱Jupyter notebookが必要なのでがんばってください．

