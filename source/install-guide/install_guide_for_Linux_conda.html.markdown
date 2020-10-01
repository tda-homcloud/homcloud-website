---
title: Install HomCloud on Linux with conda
lang: ja
---

# Linux & conda でのインストール

conda でのインストールはそんなにお勧めはしません．ただし，

* CentOS などを使っていて Ubuntu や Debian での説明からインストールをするのは難しい
* 共用の大型計算機を使っていてOSにパッケージをインストールするのが困難

などの場合には conda (ここでは miniconda を使います) を使うという選択肢もあります．

## 1. miniconda のインストール

[miniconda](https://docs.conda.io/en/latest/miniconda.html) をインストールしてください．
miniconda3 64bit版 4.7.12 で動作確認しています．Linux 64bit版であれば最新版を使えばOKなはずです．

32bit版は対応していません．


## 2. miniconda の設定
`homcloud`という名前の環境を
作ってそこで動かすことにしましょう．
ターミナル上で以下のように入力してください．

    conda create -n homcloud python=3.7
    conda activate homcloud

## 3. 必要なパッケージをインストールします

[conda-forge](https://conda-forge.org/) を使います．
以下のようにして conda のパッケージをインストールします．

    conda install -c conda-forge openmpi cgal paraview ripser msgpack-python pulp imageio pyqt

## 4. homcloud をインストールします．

以下のようにしてインストールします．

    conda install -c conda-forge -c https://homcloud.dev/conda-channel/ dipha homcloud

## 5. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるための自己チェックプログラムを
動かします．

### 5.1 GUI が使える場合

ターミナルで以下のように実行します．

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

### 5.2 GUI が使えない場合

共用の大型計算機で GUI が使えない (ssh でログインしている場合など) は
ターミナルで以下のように実行します．

    python3 -m homcloud.self_check --no-paraview

最終的にターミナルに以下のように表示されていたらOKです．

    Alpha Shape 3 ... ok
    Alpha Shape 3 with weights ... ok
    Alpha Shape 2 ... ok
    Grayscale 2D bitmap ... ok
    Binary 2D bitmap ... ok
    Binary 2D periodic bitmap ... ok
    Rips filtration ... ok
    Plotting PD ... ok

うまくいかない場合は[トラブルシューティングのページ](/faq.html)も参考にしてください．
