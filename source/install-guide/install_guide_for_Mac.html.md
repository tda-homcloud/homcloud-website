---
title: Install HomCloud on Mac OS X
lang: ja
---

# Intel Mac へのインストール

ここではMac用のソフトウェア管理ができる、 homebrew を用いたインストールを紹介します。

## 1. まず以下の３つをインストールします。
   
 * [Xcode](https://developer.apple.com/jp/xcode/)
 * Xcode commandline tools (Xcodeに付属)
 * [homebrew](https://github.com/Homebrew)
  
Xcode からインストールします。Xcode は App Store からインストールできます。
Xcode 6.1以降では、インストールする際、 Xcode commandline tools も
同時にインストールされますが、もし手動でインストールする場合は finder で

    /Applications/Utilities/Terminal.app (または ターミナル.app )

にあるターミナルを起動し、以下のコマンドを入力してインストールします。
以下、コマンドを入力するという説明はこのターミナルに指定の文字列を1行ずつ入力
してエンターボタンを押して実行するという意味になります。
コマンド名+オプション という形をしていることが多いですが、フォントによっては半角スペースが見辛いこともありますので注意してください。
   
    xcode-select --install

Xcode をインストールした後、引き続き以下のコマンドを入力すれば、[ruby](https://www.ruby-lang.org/ja/) によって homebrew もインストールされます。

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

途中、管理者のパスワードを聞かれた場合は適宜入力してください。

## 2. homebrew で以下のパッケージをインストールします。
   
* cgal
* python3
* cmake
* open-mpi
* qt

homebrew を使うことで、様々なパッケージをターミナルからコマンド入力するだけで、依存関係を考慮したり、必要なパッケージ類をまとめてインストールことができます。
例えば、ターミナルで以下のコマンドを実行すれば、インストールされます。

    brew install cgal python3 cmake open-mpi qt

## 3. 続いてpip3で以下のパッケージをインストールします。

手順2で Python がインストールされると pythonのパッケージ管理システム
である、`pip` が使えるようになります。必要な以下の Python パッケージは
`pip` を使ってインストールします。

* numpy
* scipy
* matplotlib
* PyQt5
* scikit-leran
* msgpack-python
* Pillow
* PuLP
* forwardable
* Cython
* ripser
* jupyter

ターミナルで以下のコマンドを入力すればインストールできます。

    pip3 install numpy scipy matplotlib PyQt5 scikit-learn msgpack-python Pillow forwardable Cython jupyter pyvista
    pip3 install ripser

## 4. 最新版のhomcloud をインストールします。

    pip3 install homcloud

以上で、MacOS への homcloud のインストールは完了です。


## 5. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように
実行します．

    python3 -m homcloud.self_check --pyvista

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


## (Optional) Paraview のインストールと設定

以下はParaviewを使う必要のある人だけ設定してください．


[Paraview](https://www.paraview.org/)をインストールします．
<https://www.paraview.org/download/>から適当なパッケージを探してインストールしてください．

Paraview は例えば /Applications/ParaView-5.4.0.app といった名前でインストールされます。
これを HomCloud に教えてやる必要があります。
環境変数 `HOMCLOUD_PARAVIEW_PROGRAMNAME` を設定します。

まずはターミナル上で `echo $SHELL` とすることで使っているシェルを確認します．

### bash の場合 (`/bin/bash`と表示された)
以下のような行を `~/.bash_profile` に追加します。

    export HOMCLOUD_PARAVIEW_PROGRAMNAME=/Applications/ParaView-5.4.0.app

設定を反映させるためにシェルを再起動します．(`exec $SHELL -l`)

### zsh の場合 (`/bin/zsh` と表示された)
以下のような行を `~/.zshenv` に追加します。

    export HOMCLOUD_PARAVIEW_PROGRAMNAME=/Applications/ParaView-5.4.0.app

設定を反映させるためにシェルを再起動します．(`exec $SHELL -l`)

## (Optional) [dipha](http://github.com/dipha) をダウンロードしてインストールします

一部の計算を高速化するために dipah というプログラムをインストールすることができます
(しなくとも大半のことはできます)．

<https://github.com/DIPHA/dipha/archive/dipha-2.1.0.zip> からzipファイルを
ダウンロードしてきてインストールします．

    unzip dipha-dipha-2.1.0.zip
    cd dipha-dipha-2.1.0
    cmake . 
    make

すでに PATH の通っているディレクトリに dipha をコピーします。

    cp diphaのある場所/dipha PATHの通っているディレクトリ
    例) cp ~/dipha/dipha /usr/local/bin/

PATH の通っているディレクトリがどこかは

    echo $PATH

というコマンドで確認することができます。


