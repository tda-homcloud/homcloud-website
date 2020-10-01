---
title: Install HomCloud on Debian buster
lang: ja
---

# Debian buster でのインストール

ここでは Debian GNU/Linux amd64 の buster (10.x) のコンパイル済みパッケージを使って
インストールします．ことガイドは64bit OSにしか対応していないので注意してください．

## 1. 以下のパッケージをapt-getを用いてインストールします。

* libcgal13
* python3
* python3-imageio
* python3-matplotlib
* python3-numpy
* python3-scipy
* python3-pyqt5
* python3-msgpack
* python3-pulp
* python3-sklearn
* cython3
* openmpi-bin
* mpi-default-bin
* paraview
* jupyter

apt-getで各パッケージの追加は以下のように行います。

    sudo apt-get install libcgal13 python3 python3-imageio python3-matplotlib python3-numpy python3-scipy python3-pyqt5 python3-msgpack python3-pulp python3-sklearn cython3 openmpi-bin mpi-default-bin paraview jupyter

		
## 2. [最新版のhomcloudのDebianのパッケージ](/index.html#download)をダウンロードする

ダウンロードした tar.gz ファイルは以下のようにして展開します．

    tar xf homcloud-3.0.0-debfiles.tar.gz


## 3. ダウンロードしたファイルを以下のようにdpkgを使ってインストールします。

    sudo dpkg -i *.deb

## 4. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように
実行します．

    python3 -m homcloud.self_check

2回，Paraviewのウィンドウが開かれます．
最初に開かれたときは，"Apply"ボタンを押して何か表示されてからウィンドウを
閉じてください．
2回目に開かれたときは，赤と白の点が表示されていることを確認してからウィンドウを
閉じてください．

最終的にターミナルに以下のように表示されていたらOKです．

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
