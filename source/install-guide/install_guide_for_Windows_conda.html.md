---
title: Install HomCloud on Windows
lang: ja
---

# Windows 64bitマシンでCondaを使う場合のインストール

HomCloudの作者としてはあまりcondaの利用は勧めませんが，以下のような方法でAnaconda/Minicondaを用いてインストールできます．

HomCloudはcondaのパッケージが<https://homcloud.dev/conda-channel/>に用意されており，[conda-forge](https://conda-forge.org/)のパッケージと組み合わせて利用できます．

## 0. 環境チェック

Windows へのインストールにあたって，

* ログイン名がかな漢字を含んでいる
* 空白を含んでいる

などの場合にはうまく動作しません．これは HomCloud の問題というよりも Python の問題です．
海外製のソフトウェアにはよくある問題です．

この問題の確認のためにコマンドプロンプトを起動します．
コマンドプロンプトはスタートメニューから`Windowsシステムツール`→`コマンドプロンプト`と探せば見つかるでしょう。
すると次のようなウィンドウが表示されます．

![コマンドプロンプト](/images/screenshot-windows-cmd.png){: width="600px" }

このスクリーンショットだと `C:\Users\ohai` と表示されている所の `ohai` に対応する場所を見てください．
ここに日本語が含まれていると問題が発生します．

解決策ですが新しいアカウントを作るのが一番手っ取り早い気がします．

## 1. Anacondaのインストール

[Miniconda](https://docs.conda.io/en/latest/miniconda.html)，もしくは
[Anaconda](https://www.anaconda.com/products/individual)をインストールします．
**64bit版**をインストールしてください．32bit版は対応していません．

## 2. Anaconda promptの起動

Anaconda promptを起動します．以下の操作はすべてここからやります．
スタートメニューなどから起動できます．

## 3. Conda-forgeのセットアップ

conda-forgeは公開的なコミュニティ主体で運営されているAnaconda互換パッケージの
リポジトリです．以下のようにしてconda-forgeを利用可能にします．

    conda config --add channels conda-forge
    conda config --set channel_priority strict 

## 4. Condaの設定

`homcloud`という名前の環境を
作ってそこで動かすことにしましょう．
ターミナル上で以下のように入力してください．

    conda create -n homcloud python=3.9
    conda activate homcloud

Pythonのバージョンは3.8，3.9が利用できます(20220315現在，アップグレードでバージョンは変更されます)．

## 5. HomCloudパッケージをインストールする
必要なパッケージを上で起動したコマンドプロンプトよりインストールします。
以下のように打ち込みます．コピー&ペーストでもOKです。

    conda install -c https://homcloud.dev/conda-channel/ pyvista trame homcloud

## 6. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように
実行します．

    python -m homcloud.self_check --pyvista

以下のような画像が表示されたウィンドウが開かれます．
開かれたウィンドウは閉じてください．

![PyVistaのウィンドウ](/images/screenshot-selfcheck-pyvista.png){: width="600px" }

最終的にコマンドプロンプトに以下のように表示されていたらOKです(バージョンの値は違っていてかまいません)．

    HomCloud version: 4.0.0
    Python version: 3.8.4 (tags/v3.10.11:7d4cc5a, Apr  5 2023, 00:38:17) [MSC v.1929 64 bit (AMD64)]
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

## 7. チュートリアルの実行

せっかくなのでチュートリアルを動かしてみましょう。
[python-tutorial.zip](/download/python-tutorial.zip)
からダウンロードして展開してください。

次にチュートリアルで利用する jupyter notebook をインストールします。

    conda install jupyter

でインストールできます。インストール後、tutorialフォルダで

    jupyter notebook

とするとブラウザがポップアップし、jupyter notebookが起動します。
ここでチュートリアルのフォルダから
チュートリアルを始めてください。いくつかチュートリアルがありますが、
pointcloudが一番やりやすいでしょう。
