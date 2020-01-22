---
title: Install HomCloud on Ubuntu or Debian
lang: ja
---

# UbuntuやDebianでのインストール

## 1. 以下のパッケージをapt-getでインストールします。

* libcgal-dev
* libpython3-dev
* python3-matplotlib
* python3-numpy
* python3-scipy
* python3-pip
* python3-pyqt5
* python3-msgpack
* python3-pulp
* python3-sklearn
* opnempi-bin
* libopenmpi-dev
* cmake
* paraview
* jupyter

apt-getで各パッケージの追加は以下のように行います。

    sudo apt-get install libcgal-dev libpython3-dev python3-matplotlib python3-numpy python3-scipy python3-pip python3-pyqt5 python3-msgpack python3-pulp python3-sklearn openmpi-bin libopenmpi-dev cmake paraview jupyter

## 2. [http://github.com/DIPHA/dipha](http://github.com/DIPHA/dipha)からdiphaをダウンロードし、インストールします。

1. <https://github.com/DIPHA/dipha/archive/dipha-2.1.0.zip> からダウンロードしてください。
2. ダウンロードしたファイルを解凍してください。
3. 解凍時に作られたディレクトリに移動してください。
4. "cmake ."とタイプし、makefileを作成します。
5. "make"とタイプし、ビルドします。
6. ビルドされたdiphaの実行ファイルをパスの通ったディレクトリへコピーしてください 

## 3. pipを使ってscikit-learn、forwardable、imageio、Cython、ripserを追加します。

以下のようにタイプしてインストールします．

    pip3 install --user forwardable imageio Cython
    pip3 install --user ripser

または使用している `python` からモジュールとして 

    python3.6 -m pip install --user forwardable imageio Cython
    python3.6 -m pip install --user ripser

とタイプししてください。`pip` でインストールされるパッケージは `python` の各バージョン毎にインストールされている必要があります。`python` のアップデートなどがあった場合に必要なパッケージがそのバージョン用にインストールされているか、注意してください。


## 4. 最新版のhomcloudをダウンロードし、インストールします。

[最新版のhomcloudをダウンロード](/index.html#download)してください．

ダウンロードしたディレクトリに移動し、以下を実行します。

    pip3 install --user --no-deps homcloud-x.y.z.tar.gz

もしグローバルにインストールしたくない場合はvenvなどを使ってください。

## 5. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように
実行します．

    python3 -m homcloud.self_check

2回，Paraviewのウィンドウが開かれます．
最初に開かれたときは，"Apply"ボタンを押して何か表示されてからウィンドウを
閉じてください．
2回目に開かれたときは，赤と白の点が表示されていることを確認してからウィンドウを
閉じてください．

最終的にコマンドプロンプトに以下のように表示されていたらOKです．`/usr/bin/paraview`
は異なる表示になっていると思いますが，okが以下のように表示されていれば問題ありません．


    Alpha Shape 3 ... ok
    Alpha Shape 3 with weights ... ok
    Alpha Shape 2 ... ok
    Grayscale 2D bitmap ... ok
    Binary 2D bitmap ... ok
    Binary 2D periodic bitmap ... ok
    Rips filtration ... ok
    Plotting PD ... ok
    Paraview path: /usr/bin/paraview
    Paraview fake invoke ... ok
    Paraview real invoke (VTK voxel) => Click "Apply" button and close opened window ... ok
    Paraview real invoke (python pointcloud) => Close opened window ... ok


以上でインストールは終わりです。

