---
title: Install HomCloud on Windows
lang: ja
---

# Windows 10 64bitマシンでのインストール

Windowsでインストールするには、以下の2通りあります。お使いの環境に合わせて設定してください。

 * Windows用の個々のパッケージをインストール (以下の説明を参考にインストールをすすめる)
 * WSL(Windows Subsystem for Linux)の ubuntu linux などのlinux 環境でインストールする ([ubuntu用のインストールガイド](install_guide_for_Ubuntu.html)にしたがってインストールをすすめる)。ubuntu linux以外での WSL をお使いの場合は必要な各パッケージをそれぞれのOS用に置き換えてインストールをお試しください。GUIツールを使うためには Xwindow の動作環境が必要になります

## インストールの前に

Microsoft Edgeを使うとはこのガイドで指示されているファイルをダウンロードしようとすると
`.whl`という識別子のファイルが`.man`という識別子でダウンロードされてしまう場合があります。
ChromeやFirefoxなど他のブラウザを使ったほうがよいでしょう。

## 1. Pythonのインストール

[https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)
から64bit版のpythonのインストーラー(ここでは例としてWindows x86-64 web-based installerをとりあげます。)をダウンロードし、クリックしてインストールをします。
Pythonのバージョンは **3.7** の最新版 (2019/11/1時点では 3.7.5) をインストールしてください。

Pythonをインストールする場所(パス)に日本語(全角文字)が入らない場所を選んでください。
現状では全角文字がパスに含まれてしまうと python からファイルの読み書きを行う時にエラーになります。

## 2. paraview のインストール

paraview はhomcloudでは主にポイントクラウドのデータを表示する
場合のビューワーとして使います。
[https://www.paraview.org/](https://www.paraview.org/)
から最新版をダウンロードし、インストールをします。そしてインストール先を
環境変数 `HOMCLOUD_PARAVIEW_PROGRAMNAME` によって設定する必要があります。
`C:\Program Files\ParaView 5.6.0-Windows-msvc2015-64bit\bin\paraview.exe`のような
paraviewのパスを調べて環境変数を設定してください。

環境変数の設定の仕方は検索エンジンなどで調べてください。
paraviewのパスの調べかたは、

* エクスプローラーを開く
* PC→ローカルディスク→Program Filesと移動して右上の検索フィールドに
  paraview.exeとうちこむ
* みつかったファイルを右クリックして「ファイルの場所を開く」

などとします。

## 3. venvによる環境構築

ここでは venv という環境分離機構を使って環境を設定します。
まずは環境構築のためのフォルダを作ります。
ドキュメントフォルダの下に homcloud というフォルダを作ります。

次に venv をセットアップします。 まず、venv環境を作っていきます。コマンドプロントを起動して、以下のコマンドを打つことでhomcloudのフォルダ下にvenv37フォルダが作成されます。

    cd Documents\homcloud
    py -3.7 -m venv venv37

## 4. venvの環境内に移動する
`コマンドプロンプト`を起動します。
`Windows管理ツール`→`コマンドプロンプト`と探せば見つかるでしょう。
開いだウィンドウに

    venv37\Scripts\activate

と打ち込むと環境内に移動できます。この操作はコマンドプロンプトを起動するごとに
やる必要があることに注意してください。

コマンドプロンプトを素早く起動するためにショートカット等を作成しておくとよいでしょう。
入力できる基本コマンドについてはウェブサイトなどで確認してください。

よく使う基本的なコマンドとして以下を紹介します

    cd c:\dev\work # カレントフォルダの移動
    dir # フォルダ内のファイルの一覧表示

## 5. python パッケージをインストールする
必要なパッケージを上で起動したコマンドプロンプトよりインストールします。
以下のように打ち込みます．コピー&ペーストでもOKです。

    pip install numpy scipy pyqt5 matplotlib scikit-learn msgpack-python Pillow PuLP forwardable imageio ripser

## 6. HomCloud のインストール
[homcloud-3.0.0-cp37-cp37m-win_amd64.whl](download/win/homcloud-3.0.0-cp37-cp37m-win_amd64.whl)からダウンロードして、homcloudフォルダに置きます。その後以下のようにインストールします。

    pip install homcloud-3.0.0-cp37-cp37m-win_amd64.whl

## 7. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにコマンドプロンプトで以下のように実行します。

    python -m homcloud.self_check --no-dipha

2回、Paraviewのウィンドウが開かれます。
最初に開かれたときは、"Apply"ボタンを押して何か表示されてからウィンドウを
閉じてください。
2回目に開かれたときは，赤と白の点が表示されていることを確認してからウィンドウを
閉じてください。

最終的にコマンドプロンプトに以下のように表示されていたらOKです。
`/usr/bin/paraview`
は異なる表示になっていると思いますが、okが以下のように表示されていれば問題ありません。

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


## 8. チュートリアルの実行

せっかくなのでチュートリアルを動かしてみましょう。
[python-tutorial.zip](/download/python-tutorial.zip)
からダウンロードして homcloud フォルダに展開してください。

次にチュートリアルで利用する jupyter notebook をインストールします。

    pip install jupyter

でインストールできま。　インストール後、homcloudフォルダで

    jupyter notebook

とするとブラウザがポップアップし、jupyter notebookが起動します。
ここでチュートリアルのフォルダから
チュートリアルを始めてください。いくつかチュートリアルがありますが、
pointcloudが一番やりやすいでしょう。


## 9. (オプショナル) MSMPI と dipha のインストール

ここから先はオプショナルな内容なので必ずしもやる必要はありません．
Rips filtrationを上限を指定して計算したい場合に使います．

MSMPIは dipha が並列化してホモロジーを計算するために使います。
[MicrosoftのMPIのページ](https://docs.microsoft.com/en-us/message-passing-interface/microsoft-mpi)
から

* msmpisetup.exe
* msmpisdk.msi

をダウンロードし、クリックしてインストールをします。

dipha は [dipha.exe](/donwload/win/dipha.exe) からダウンロードし，`venv37\Scripts` にコピーしてください．
