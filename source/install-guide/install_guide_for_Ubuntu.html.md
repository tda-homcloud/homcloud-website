---
title: Install HomCloud on Ubuntu or Debian
lang: ja
---

# UbuntuやDebianでのインストール

## 1. Ubuntu(もしくはDebian)のパッケージをapt-getでインストールします。

以下のように行います。

    sudo apt-get install libcgal-dev libpython3-dev python3-matplotlib python3-numpy python3-scipy python3-pip python3-pyqt5 python3-msgpack python3-pulp python3-sklearn openmpi-bin libopenmpi-dev cmake paraview python3-paraview jupyter

## 2. pipを使ってさらにライブラリを追加します。

以下のようにタイプしてインストールします．

    pip install --user wheel Cython "pyvista[all,trame]"
    pip install --user ripser

## 3. 最新版のhomcloudをインストールします。

以下を実行します。

    pip3 install --user homcloud

### 古いバージョンをインストールする場合

古いバージョンのHomCloud (3.6.0など) をインストールする場合には代わりに次のようにします．

    pip3 install --user homcloud==3.6.0

## 4. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように
実行します．

    python3 -m homcloud.self_check --pyvista

以下のような画像が表示されたウィンドウが開かれます．
開かれたウィンドウは閉じてください．

![PyVistaのウィンドウ](/images/screenshot-selfcheck-pyvista.png){: width="600px" }

最終的にコマンドプロンプトに以下のように表示されていたらOKです(バージョンの値は違っていてかまいません)．

    HomCloud version: 4.0.0
    Python version: 3.10.6 (main, Mar 10 2023, 10:55:28) [GCC 11.3.0]
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
    PyVista 3D drawing (close the pop-up window)... ok


以上でインストールは終わりです。


## 5. (Optional) [http://github.com/DIPHA/dipha](http://github.com/DIPHA/dipha)からdiphaをダウンロードし、インストールします。

Veitoris-Rips 複体(距離行列)や高次元(4次元以上)のボクセルデータの解析のために dipha をインストールします。
もしこれらを使わない場合はここは飛ばしてよいです。

1. <https://github.com/DIPHA/dipha/archive/dipha-2.1.0.zip> からダウンロードしてください。
2. ダウンロードしたファイルを解凍してください。
3. 解凍時に作られたディレクトリに移動してください。
4. "cmake ."とタイプし、makefileを作成します。
5. "make"とタイプし、ビルドします。
6. ビルドされたdiphaの実行ファイルをパスの通ったディレクトリへコピーしてください 

インストール終了後，以下のようにしてHomCloudが正常に動くかチェックします。

    python3 -m homcloud.self_check --dipha
