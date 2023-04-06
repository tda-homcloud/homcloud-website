---
title: Install HomCloud under venv envrinment on Ubuntu or Debian 
lang: ja
---

# UbuntuやDebianでのインストール(venv使用)

ここでは python の venv という環境分離ツールを使ってインストールします．
homcloudをインストールする環境を分離することでバージョンの使い分けなどが
簡単になります．

## 1. 以下のパッケージをapt-getでインストールします。

* libcgal-dev
* libpython3-dev
* opnempi-bin
* libopenmpi-dev
* cmake
* paraview
* jupyter

apt-getで各パッケージの追加は以下のように行います。

    sudo apt-get install libcgal-dev libpython3-dev openmpi-bin libopenmpi-dev cmake paraview jupyter python3-paraview

## 2. venvで環境を新しく作る

まず作業用のディレクトリを作ります．ここでは`homcloud`という名前にしましょう．

    mkdir homcloud
    cd homcloud

次のようにして venv の設定を作ります．

    python3 -m venv venv
    
以下のようにして venv の環境に入ります．

    source ./venv/bin/activate
    
## 3. pipを使ってCython，numpy，wheel，pyvistaを追加します。

以下のようにタイプしてインストールします．

    pip install Cython numpy wheel "pyvista[all,trame]"
    
GUIを使いたい場合は PyQt5 もインストールする必要があります．

    pip install pyqt5

## 4. 最新版のHomCloudをインストールします。

以下を実行します。

    pip install homcloud

### 古いバージョンをインストールする場合

古いバージョンのHomCloud (3.6.0など) をインストールする場合には代わりに次のようにします．

    pip install homcloud==3.6.0

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

## 6. (Optional) [http://github.com/DIPHA/dipha](http://github.com/DIPHA/dipha)からdiphaをダウンロードし、インストールします。

Veitoris-Rips 複体(距離行列)や高次元(4次元以上)のボクセルデータの解析のために dipha をインストールします。
もしこれらを使わない場合はここは飛ばしてよいです。

[apt-get、pipによるインストール](install_guide_for_Ubuntu.html)と同じようにしてインストールできるので，そちらを見てください．
