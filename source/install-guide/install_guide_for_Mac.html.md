---
title: Install HomCloud on Mac OS X
lang: ja
---

# Mac へのインストール

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

    brew install cgal python3 cmake opem-mpi qt

## 3. Paraviewをインストールします

[Paraview](https://www.paraview.org/)もインストールします．
<https://www.paraview.org/download/>から適当なパッケージを探してインストールしてください．

## 4. 続いてpip3で以下のパッケージをインストールします。

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

    pip3 install numpy scipy matplotlib PyQt5 scikit-learn msgpack-python Pillow forwardable Cython jupyter
    pip3 install ripser

## 5. 最新版のhomcloud をインストールします。

    pip3 install homcloud

以上で、MacOS への homcloud のインストールは完了です。

## 6. Paraviewの設定をする

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

### それ以外の場合

それ以外を使っている人は自分でなんとかしてください．

## 7. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように
実行します．

    python3 -m homcloud.self_check --no-dipha

2回，Paraviewのウィンドウが開かれます．
最初に開かれたときは，"Apply"ボタンを押して何か表示されてからウィンドウを
閉じてください．
2回目に開かれたときは，赤と白の点が表示されていることを確認してからウィンドウを
閉じてください．

最終的にターミナルに以下のように表示されていたらOKです．`/usr/bin/paraview`
は異なる表示になっていると思いますが，okが以下のように表示されていれば問題ありません．


    Alpha Shape 3 ... ok
    Alpha Shape 3 with weights ... ok
    Alpha Shape 2 ... ok
    Grayscale 2D bitmap ... ok
    Binary 2D bitmap ... ok
    Binary 2D periodic bitmap ... ok
    Plotting PD ... ok
    Paraview path: /usr/bin/paraview
    Paraview fake invoke ... ok
    Paraview real invoke (VTK voxel) => Click "Apply" button and close opened window ... ok
    Paraview real invoke (python pointcloud) => Close opened window ... ok


以上でインストールは終わりです。

## 8. [dipha](http://github.com/dipha) をダウンロードしてインストールします (任意)

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


