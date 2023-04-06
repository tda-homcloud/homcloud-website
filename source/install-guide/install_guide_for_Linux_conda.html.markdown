---
title: Install HomCloud on Linux with conda
lang: ja
---

# Linux & conda でのインストール

conda でのインストールはそんなにお勧めはしません．ただし，

* CentOS や RHEL などを使っていて Ubuntu や Debian での説明からインストールをするのは難しい
* 共用の大型計算機を使っていてOSにパッケージをインストールするのが困難

などの場合には conda (ここでは miniconda を使います) を使うという選択肢もあります．

## 1. miniconda のインストール

[miniconda](https://docs.conda.io/en/latest/miniconda.html) をインストールしてください．
miniconda3 64bit版 4.7.12 で動作確認しています．Linux 64bit版であれば最新版を使えばOKなはずです．

32bit版は対応していません．


## 2. miniconda の環境作成
`homcloud`という名前の環境を作ってそこで動かすことにしましょう．
ターミナル上で以下のように入力してください．

    conda create -c conda-forge -n homcloud python=3.9
    conda activate homcloud

## 3. HomCloudのインストール

[conda-forge](https://conda-forge.org/) を組み合わせてインストールします．
以下のようにしてインストールします．

    conda install -c conda-forge -c https://homcloud.dev/conda-channel/ pyvista trame homcloud


## 4. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるための自己チェックプログラムを
動かします．

### 4.1 GUI が使える場合

ターミナルで以下のように実行します．

    python -m homcloud.self_check --pyvista

以下のような画像が表示されたウィンドウが開かれます．
開かれたウィンドウは閉じてください．

![PyVistaのウィンドウ](/images/screenshot-selfcheck-pyvista.png){: width="600px" }

最終的にコマンドプロンプトに以下のように表示されていたらOKです(バージョンの値は違っていてかまいません)．

    HomCloud version: 4.0.0
    Python version: 3.9.16 | packaged by conda-forge | (main, Feb  1 2023, 21:39:03)  [GCC 11.3.0]
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

### 5.2 GUI が使えない場合

共用の大型計算機で GUI が使えない (ssh でログインしている場合など) は
ターミナルで以下のように実行します．

    python3 -m homcloud.self_check

最終的にターミナルに以下のように表示されていたらOKです．

    HomCloud version: 4.0.0
    Python version: 3.9.16 | packaged by conda-forge | (main, Feb  1 2023, 21:39:03)  [GCC 11.3.0]
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

以上でインストールは終わりです．

うまくいかない場合は[トラブルシューティングのページ](/faq.html)も参考にしてください．
