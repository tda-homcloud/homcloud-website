---
title: Install HomCloud under venv envrinment on Ubuntu or Debian 
lang: ja
---

# UbuntuやDebianでのインストール(venv使用)

ここでは python の venv という仮想環境ツールを使ってインストールします．
homcloudをインストールする環境を分離することでバージョンの使い分けなどが簡単になります．

## 1. 以下のパッケージをapt-getでインストールします。

以下のように行います。
    
    sudo apt-get update
    sudo apt-get install python3-all-dev python3-venv

## 2. venvで環境を新しく作る

まず作業用のディレクトリを作ります．ここでは`homcloud`という名前にしましょう．

    mkdir homcloud
    cd homcloud

次のようにして venv の設定を作ります．

    python3 -m venv venv

## 3. venvの環境に入る

作業用のディレクトリで以下のようにして venv の環境に入ります．

    source ./venv/bin/activate

これはシェルを起動するごとに必要です．

## 4. 最新版のHomCloudをインストールします。

以下を実行します。

    pip install wheel
    pip install "homcloud[recommended]"

## 5. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように
実行します．

    python -m homcloud.self_check --pyvista

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

## 6. チュートリアルの実施

HomCloudのチュートリアルを動かしてみましょう．
[python-tutorial.zip](/download/python-tutorial.zip)
からダウンロードしてhomcloudフォルダに展開してください。
その後，venvの仮想環境に入って

    jupyter notebook

とするとブラウザがポップアップし，jupyter notebookが起動します．
ここでチュートリアルのフォルダからチュートリアルを始めてください．
いくつかチュートリアルがありますが，pointcloudが一番やりやすいでしょう．

## 7. (Optional) [http://github.com/DIPHA/dipha](http://github.com/DIPHA/dipha)からdiphaをダウンロードし、インストールします。

高次元(4次元以上)のボクセルデータの解析のために dipha をインストールします。
もしこれらを使わない場合はここは飛ばしてよいです。

1. `sudo apt-get install openmpi-bin libopenmpi-dev cmake` で Dipha のビルドに必要なライブラリをインストールします
2. <https://github.com/DIPHA/dipha/archive/dipha-2.1.0.zip> からダウンロードしてください．
3. ダウンロードしたファイルを解凍してください．
4. 解凍時に作られたディレクトリに移動してください．
5. "cmake ."とタイプし，makefileを作成します．
6. "make"とタイプし，ビルドします．
7. ビルドされたdiphaの実行ファイルをパスの通ったディレクトリへコピーしてください 
8. インストール終了後，以下のようにしてHomCloudが正常に動くかチェックします．

        python3 -m homcloud.self_check --dipha

