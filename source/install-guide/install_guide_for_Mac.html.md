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
* pyqt5

homebrew を使うことで、様々なパッケージをターミナルからコマンド入力するだけで、依存関係を考慮したり、必要なパッケージ類をまとめてインストールことができます。
例えば、ターミナルで以下のコマンドを実行すれば、インストールされます。

    brew install パッケージ名

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
* scikit-leran
* msgpack-python
* Pillow
* PuLP
* forwardable
* Cython
* ripser
* jupyter

ターミナルで以下のコマンドを入力すればインストールできます。

    pip3 install numpy scipy matplotlib scikit-learn msgpack-python Pillow forwardable Cython jupyter
    pip3 install ripser

## 5. [dipha](http://github.com/dipha) をダウンロードしてインストールします。

<https://github.com/DIPHA/dipha/archive/dipha-2.1.0.zip> からzipファイルを
ダウンロードしてきてインストールします．

    unzip dipha-dipha-2.1.0.zip
    cd dipha-dipha-2.1.0
    cmake . 
    make

   作成した実行ファイル `dipha` の場所を確認し、PATHを通します。
   以下のコマンドで dipha のある場所が探せます。場所の確認には3通りの方法があります。

### (1) `find` を使う

     find / -name  'dipha'

途中で検索をやめたい場合は `control + c` で止まります。

### (2) `locate` を使う。

ファイルのデータベースを参考に dipha という名前のファイルを探します。

    locate dipha

初めて `locate` を実行した場合、データベースが存在しないというエラーが出ます。
エラーに基づき以下を実行し、データベースを作成します。

    sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

データベースが作成されるまでには時間がかかります。データベースが作成されたら
以下のコマンドを実行し、データベースを更新してください。

    sudo /usr/libexec/locate.updatedb

これで `locate dipha` が使えるようになります。

### (3) `mdfind` を使う。

以下を実行します。

    mdfind dipha

上記(1)〜(3)のどれかを使って dipha の場所がわかったら、 ~/.bashrc に以下の1行を記述します。

    export PATH=/usr/local/bin:$PATH:dhipaのある場所
    例) export PATH=/usr/local/bin:$PATH:/Users/username/dipha

設定を反映させるため、以下を実行します。

    source ~/.bashrc

次回以降、常に追加した新しい PATH の設定を反映させるためには

    ~/.bash_profile

というテキストファイルを作成し、中に

    if [ -f ~/.bashrc ]; then
       . ~/.bashrc
    fi

と書きます。
このファイルが存在しない場合は テキストエディット.app(TextEdit.app) な
どで新規作成します(メニューのフォーマットから、標準テキストにするを選んで
プレーンテキストファイルにしてください)。
デフォルトの環境ではファイル名の先頭に.(ドット)がついたファイルをエディタで作成できないことがありますが、この場合は

    open -e /Applications/TextEdit.app/Contents/MacOS/TextEdit ~/.bashrc
  
とすれば新規に .bashrc という名前でテキストファイルが作成できます。  

PATHの通す簡単な設定方法として、すでに PATH の通っているディレクトリに dipha を
コピーするだけでもかまいません。この場合は .bashrc への追記は不要です。
以下のようにコマンドを打ちます。

    cp diphaのある場所/dipha PATHの通っているディレクトリ
    例) cp ~/dipha/dipha /usr/local/bin/

PATH の通っているディレクトリがどこかは

    echo $PATH

というコマンドで確認することができます。

## 6. 最新版のhomcloud をダウンロードし、インストールします。

[最新版の homcloud をダウンロード](/index.html#download)します。
上記のファイルをダウンロードしたら、 ターミナルを起動して、以下のように入力して、 ダウンロードしたファイルのあるディレクトリに移動し(ここでは例として~/Donwloads)、homcloud のインストールを行ってください。x、y、z は最新のバージョン番号に置き換えてください。

    cd Downloads/
    pip3 install homcloud-x.y.z.tar.gz 

以上で、MacOS への homcloud のインストールは完了です。

## 7. Paraviewの設定をする

Paraview は例えば /Applications/ParaView-5.4.0.app といった名前でインストールされます。
これを HomCloud に教えてやる必要があります。
環境変数 `HOMCLOUD_PARAVIEW_PROGRAMNAME` を設定します。
以下のような行を `~/.bash_profile` に追加します。

    export HOMCLOUD_PARAVIEW_PROGRAMNAME=/Applications/ParaView-5.4.0.app

設定を反映させるためにシェルを再起動します．(`exec $SHELL -l`)

## 8. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように
実行します．

    python3 -m homcloud.self_check

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
    Rips filtration ... ok
    Plotting PD ... ok
    Paraview path: /usr/bin/paraview
    Paraview fake invoke ... ok
    Paraview real invoke (VTK voxel) => Click "Apply" button and close opened window ... ok
    Paraview real invoke (python pointcloud) => Close opened window ... ok


以上でインストールは終わりです。

