---
title: Install HomCloud on Ubuntu or Debian
lang: ja
---

# UbuntuやDebianでのインストール

## 1. Ubuntu(もしくはDebian)のパッケージをapt-getでインストール

以下のように行います．

    sudo apt-get install libcgal-dev libpython3-dev python3-matplotlib python3-numpy python3-scipy python3-pip python3-msgpack python3-pulp python3-sklearn paraview python3-paraview jupyter

## 2. pipを使ってさらにライブラリを追加

以下のようにタイプしてインストールします．

    pip install --user wheel Cython pyqt6 "pyvista[all,trame]" pyvistaqt
    pip install --user ripser

## 3. 最新版のhomcloudをインストール

以下を実行します．

    pip3 install --user homcloud

### 古いバージョンをインストールする場合

古いバージョンのHomCloud (3.6.0など) をインストールする場合には代わりに次のようにします．

    pip3 install --user homcloud==3.6.0

## 4. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように実行します．

    python3 -m homcloud.self_check --pyvista

以下のような画像が表示されたウィンドウが開かれます．
開かれたウィンドウは閉じてください．

![PyVistaのウィンドウ](/images/screenshot-selfcheck-pyvista.png){: width="600px" }

最終的にコマンドプロンプトに以下のように表示されていたらOKです(バージョンの値は違っていてかまいません)．

    HomCloud version: 4.4.0
    Python version: 3.10.12 (main, Nov 20 2023, 15:14:05) [GCC 11.4.0]
    CGAL version: 5.6 (1050601000)
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

以上でインストールは終わりです．


## 5. (Optional) [http://github.com/DIPHA/dipha](http://github.com/DIPHA/dipha)からdiphaをダウンロードし，インストール

Veitoris-Rips 複体(距離行列)や高次元(4次元以上)のボクセルデータの解析のために dipha をインストールします．
もしこれらを使わない場合はここは飛ばしてよいです．

1. `sudo apt-get install openmpi-bin libopenmpi-dev cmake` で Dipha のビルドに必要なライブラリをインストールします
2. <https://github.com/DIPHA/dipha/archive/dipha-2.1.0.zip> からダウンロードしてください．
3. ダウンロードしたファイルを解凍してください．
4. 解凍時に作られたディレクトリに移動してください．
5. "cmake ."とタイプし，makefileを作成します．
6. "make"とタイプし，ビルドします．
7. ビルドされたdiphaの実行ファイルをパスの通ったディレクトリへコピーしてください 
8. インストール終了後，以下のようにしてHomCloudが正常に動くかチェックします．

        python3 -m homcloud.self_check --dipha
