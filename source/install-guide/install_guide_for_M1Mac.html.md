---
title: Install HomCloud on M1 Mac
lang: ja
---

# Apple Silicon (M1) Mac へのインストール

M1 Macは新しいアーキテクチャを採用しているため，様々な科学技術ソフトウェアの対応が途上にあります．

## 1. Conda を miniforge でインストールする
conda-forge のパッケージは M1 Mac　への対応が比較的進んでいるのでこれを利用します．
Conda は妙なところが多いのであまりお勧めしませんがcondaが一番ちゃんとしているようなのでこれを利用します．
<https://github.com/conda-forge/miniforge> を見てインストールしてください．
リンク先の Web サイトに書いているようにターミナルで

    curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
    bash Mambaforge-$(uname)-$(uname -m).sh

とするとインストールできます．

### Conda

CondaはHomebrew と併用すると問題を起こす等，面倒な問題が多いです．そのため
Condaの利用は最低限にしたいことは多いでしょう．その場合は以下のようにするとよいでしょう．

インストール時に

    Do you wish the installer to initialize Mambaforge
    by running conda init? [yes|no]
    
と聞かれるので，このときに no と答えます．すると

    You have chosen to not have conda modify your shell scripts at all.
    To activate conda's base environment in your current shell session:
    
    eval "$(/Users/YOUR_ID/mambaforge/bin/conda shell.YOUR_SHELL_NAME hook)" 
        :

というメッセージが流れると思います．そこにあるようにcondaを利用するときだけターミナルで

    eval "$(/Users/YOUR_ID/mambaforge/bin/conda shell.YOUR_SHELL_NAME hook)" 
    
とするとそのセッションでだけ有効になります(`YOUR_ID`と`YOUR_SHELL_NAME`は適切なものに
置き換えてください．`YOUR_SHELL_NAME`はおそらく`zsh`でしょう)．

## 2. condaの環境を作る

HomCloud用の環境を作ります．homcloudという名前にします．ターミナルで以下のようにします．

    conda create -n homcloud python=3.9

## 3. homcloud環境に入ってHomCloudをインストールする

ターミナルで以下のようにします．

    conda activate homcloud
    conda install -c conda-forge -c https://homcloud.dev/conda-channel/ pyvista panel trame homcloud

以上でインストールは完了です．

## 4. 自己チェックプログラムを動かす

以下のようにして自己チェックプログラムを動かします．

    python -m homcloud.self_check --pyvista

以下のような画像が表示されたウィンドウが開かれます．
開かれたウィンドウは閉じてください．

![PyVistaのウィンドウ](/images/screenshot-selfcheck-pyvista.png){: width="600px" }

最終的にコマンドプロンプトに以下のように表示されていたらOKです(バージョンの値は違っていてかまいません)．

    HomCloud version: 4.0.0
    Python version: 3.9.16 | packaged by conda-forge | (main, Feb 1 2022, 21:38:11)  [Clang 14.0.6 ]
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
## 5. チュートリアルについて

上で書いたように Paraview は動きません．可視化にPlotlyを使ってるほうのチュートリアルをやりましょう．


# Mac へのインストール

ここでは Homebrew を用いたインストールを紹介します。
Homebrewはコマンドラインインターフェースを用いてMacにさまざまなソフトウェアをインストールできるツールです．
HomebrewでインストールしたPythonから，venvというPython用計量仮想環境を作るツールを利用することでHomCloudをインストールします．
venvを利用することでHomCloudが使っているソフトウェアコンポーネントやHomCloud自体のバージョンアップへの対応が簡単になります．

## 1. Homebrew　のインストール

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

以下のようにタイプして必要なPythonパッケージ（NumPy, wheel, Jupyter notebook, Cython, PyVista, PyQt6）をインストールします．

     pip install numpy wheel jupyter Cython "pyvista[trame,all]" pyqt6

## 6. HomCloudのインストール

HomCloudをインストールします．ターミナルで次のようにタイプします．

    CPLUS_INCLUDE_PATH=/opt/homebrew/include LIBRARY_PATH=/opt/homebrew/lib pip install homcloud

## 7. 自己テストプログラム

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように実行します．

    python -m homcloud.self_check --pyvista

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

## 8. チュートリアルの実施

HomCloudのチュートリアルを動かしてみましょう．
[python-tutorial.zip](/download/python-tutorial.zip)
からダウンロードしてhomcloudフォルダに展開してください。
その後，

    jupyter notebook

とするとブラウザがポップアップし，jupyter notebookが起動します．
ここでチュートリアルのフォルダからチュートリアルを始めてください．
いくつかチュートリアルがありますが，pointcloudが一番やりやすいでしょう．