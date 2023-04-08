---
title: Install HomCloud on M1 Mac
lang: ja
---

# Apple Silicon (M1) Mac へのインストール

ここでは Homebrew を用いたインストールを紹介します。
Homebrewはコマンドラインインターフェースを用いてMacにさまざまなソフトウェアをインストールできるツールです．
HomebrewでインストールしたPythonから，venvというPython用計量仮想環境を作るツールを利用することでHomCloudをインストールします．
venvを利用することでHomCloudが使っているソフトウェアコンポーネントやHomCloud自体のバージョンアップへの対応が簡単になります．

## 1. Homebrewのインストール

[Homebrewのウェウブサイト](https://brew.sh/index_ja)を見てインストールします．リンク先のページに書いているように，

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

でインストールできます．

## 2. Homebrewでパッケージをインストールする

次のようにしてPythonとCGALをインストールします．

    brew install python cgal

## 3. venvで仮想環境を作る

作業用のディレクトリを作ります．`homcloud`という名前にしましょう．

    mkdir homcloud

作業用ディレクトリ内でvenvの設定を作ります．

    cd homcloud
    python3 -m venv venv

venvというディレクトリが作られ，その下に仮想環境に必要なファイルがコピーされます．

## 4. 仮想環境に入る

このディレクトリで次のようにして仮想環境に入ります．これはターミナル（シェル）を起動するたびに必要となります．

    source ./venv/bin/activate

## 5 pip　でインストール

以下のようにタイプして必要なPythonパッケージをインストールします．

     pip install numpy wheel jupyter Cython "pyvista[trame,all]" pyqt6 pyvistaqt

## 6. HomCloudのインストール

HomCloudをインストールします．ターミナルで次のようにタイプします．

    CPLUS_INCLUDE_PATH=/opt/homebrew/include LIBRARY_PATH=/opt/homebrew/lib pip install homcloud

## 7. 自己テストプログラム

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように実行します．

    python -m homcloud.self_check --pyvista

以下のような画像が表示されたウィンドウが開かれます．
開かれたウィンドウは閉じてください．

![PyVistaのウィンドウ](/images/screenshot-selfcheck-pyvista.png){: width="600px" }

最終的にコマンドプロンプトに以下のように表示されていたらOKです(バージョンの値は違っていてかまいません)．

    HomCloud version: 4.0.0a4
    Python version: 3.11.2 (main, Mar 24 2023, 00:16:47) [Clang 14.0.0 (clang-1400.0.29.202)]
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

以上でインストールは完了です．

## 8. チュートリアルの実施

HomCloudのチュートリアルを動かしてみましょう．
[python-tutorial.zip](/download/python-tutorial.zip)
からダウンロードしてhomcloudフォルダに展開してください。
その後，venvの仮想環境に入って

    jupyter notebook

とするとブラウザがポップアップし，jupyter notebookが起動します．
ここでチュートリアルのフォルダからチュートリアルを始めてください．
いくつかチュートリアルがありますが，pointcloudが一番やりやすいでしょう．
