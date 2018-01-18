---
title: Install HomCloud
---

{::options parse_block_html="true" /}

# インストール

HomCloud は現在 Linux もしくは MacOS X での利用が可能です。
Windows 版は現在準備中です。

* [Linux でのインストール](#linux)
* [OS X でのインストール](#osx)


<div class="guide">
## <a name="linux"> Linux(Ubuntu, Debian) でのインストール

Ubuntu では apt と pip を利用したインストールを推奨しています。
Anaconda での利用はお勧めしません。
Linuxのディストリビューションは Ubuntu 16.04 LTS 以降、もしくは
Debian 9 (stretch) 以降を利用してください。古いバージョンはサポートしていません。

### 1. 以下のパッケージをapt-getでインストールします。

* libcgal-dev
* libpython3-dev
* python3-matplotlib
* python3-numpy
* python3-scipy
* python3-pip
* python3-msgpack
* opnempi-bin
* libopenmpi-dev
* cmake

apt-getで各パッケージの追加は以下のように行います。

    sudo apt-get install libcgal-dev libpython3-dev python3-matplotlib python3-numpy python3-scipy python3-pip python3-msgpack openmpi-bin libopenmpi-dev cmake

### 2. [http://github.com/DIPHA/dipha](http://github.com/DIPHA/dipha)からdiphaをダウンロードし、インストールします。

1. 最新のdiphaを「Download Zip」ボタンからダウンロードしてください。
2. ダウンロードしたファイルを解凍してください。
3. 解凍時に作られたディレクトリに移動してください。
4. "cmake ."とタイプし、makefileを作成します。
5. "make"とタイプし、ビルドします。
6. ビルドされたdiphaの実行ファイルをパスの通ったディレクトリへコピーしてください 
   
### 3. pipを使ってscikit-learnを追加します。

    pip3 install --user scikit-learn

または使用している `python` からモジュールとして

    python3.6 -m pip install --user scikit-learn

とタイプししてください。`pip` でインストールされるパッケージは `python` の各バージョン毎にインストールされている必要があります。`python` のアップデートなどがあった場合に必要なパッケージがそのバージョン用にインストールされているか、注意してください。


### 4. 最新版のhomcloudを[ダウンロード](index.html#download)し、インストールします。

homcloud-base-x.y.z.tar.gz というファイルをダウンロードしてください。
x、y、zは最新のバージョン番号に置き換えてください。

ダウンロードしたディレクトリに移動し、以下を実行します。

    pip3 install --user --no-deps homcloud-base-x.y.z.tar.gz

もしグローバルにインストールしたくない場合はvirtualenvかvenvを使ってください。

</div>

<div class="guide">
## <a name="osx"> OSX でのインストール

MacOS X では [homebrew](https://brew.sh/index_ja.html) での利用を推奨しています。
Anaconda での利用はお勧めしません。

### 1. まず以下の３つをインストールします。
   
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

### 2. homebrew で以下の６つのパッケージをインストールします。
   
* cgal
* python3
* cmake
* open-mpi

homebrew を使うことで、様々なパッケージをターミナルからコマンド入力するだけで、依存関係を考慮したり、必要なパッケージ類をまとめてインストールことができます。
例えば、ターミナルで以下のコマンドを実行すれば、インストールされます。

    brew install パッケージ名

### 3. 続いてpip3で以下の６つのパッケージをインストールします。

手順2で Python がインストールされると pythonのパッケージ管理システム
である、`pip` が使えるようになります。必要な以下の Python パッケージは
`pip` を使ってインストールします。

* numpy
* scipy
* matplotlib
* scikit-leran
* msgpack-python
* Pillow

ターミナルで以下のコマンドを入力すればインストールできます。

    pip3 install numpy scipy matplotlib scikit-learn msgpack-python Pillow

### 4. dipha を <http://github.com/DIPHA/dipha> からダウンロードしてインストールします。

dipha のソースコードを取得するには [Git](https://github.com/git/git) を利用すると便利です。
例えば、以下のように homebrew で Git をインストールしてから dipha のソー
スを取得し、ビルドします。

    brew install git 
    git clone https://github.com/DIPHA/dipha.git 
    cd dipha/   
    cmake . 
    make

作成した実行ファイル dipha の場所を確認し、PATH を通します。
通常は make したディレクトリ dipha の中に実行ファイルが入っています。  
以下のコマンドで dipha のある場所が探せます。場所の確認には3通りの方法があります。

また別の
簡単な設定方法として、すでに PATH の通っているディレクトリに dipha を
コピーするだけでもかまいません。この場合は .bashrc への追記は不要です。
以下のようにコマンドを打ちます。

    cp diphaのある場所/dipha PATHの通っているディレクトリ
    例) cp ~/dipha/dipha /usr/local/bin/

PATH の通っているディレクトリがどこかは

    echo $PATH

というコマンドで確認することができます。


#### (1) `find` を使う

ルートディレクトリ以下について dipha という名前のファイルを探します。

     find / -name  'dipha'

途中で検索をやめたい場合は `control + c` で止まります。

#### (2) `locate` を使う。

ファイルのデータベースを参考に dipha という名前のファイルを探します。

    locate dipha

初めて `locate` を実行した場合、データベースが存在しないというエラーが出ます。
エラーに基づき以下を実行し、データベースを作成します。

    sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

データベースが作成されるまでには時間がかかります。データベースが作成されたら
以下のコマンドを実行し、データベースを更新してください。

    sudo /usr/libexec/locate.updatedb

これで `locate dipha` が使えるようになります。

#### (3) `mdfind` を使う。

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

### 5. 最新版のhomcloudを[ダウンロード](index.html#download)し、インストールします。
homcloud-base-x.y.z.tar.gz をダウンロードしてください。
x、y、z は最新のバージョン番号に置き換えてください。

上記の二つのファイルをダウンロードしたら、 ターミナルを起動して、以下のように入力して、 ダウンロードしたファイルのあるディレクトリに移動し(ここでは例として~/Donwloads)、homcloud のインストールを行ってください。
   
    cd Downloads/ 
    pip3 install homcloud-base-x.y.z.tar.gz 

以上で、MacOS への homcloud のインストールは完了です。

</div>

