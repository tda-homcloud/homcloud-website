---
title: Install HomCloud on Windows
lang: ja
---

# Windows 64bitマシンでのインストール

Windowsでインストールするには、以下の2通りあります。お使いの環境に合わせて設定してください。

 * Windows用の個々のパッケージをインストール (以下の説明を参考にインストールをする)
 * WSL(Windows Subsystem for Linux)の ubuntu linux などのlinux 環境でインストールする ([ubuntu用のインストールガイド](install_guide_for_Ubuntu.html)にしたがってインストールをすすめる)。ubuntu linux以外での WSL をお使いの場合は必要な各パッケージをそれぞれのOS用に置き換えてインストールをお試しください。GUIツールを使うためには Xwindow の動作環境が必要になります

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

解決策ですが新しいアカウントを作るのが一番手っ取り早いでしょう．

## 1. Pythonのインストール

[https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)
から**64bit版**のpythonのインストーラー(ここでは例としてWindows x86-64 web-based installerをとりあげます。)をダウンロードし、クリックしてインストールをします。
Pythonのバージョンは**3.11**，**3.12** のいずれかを選んでください．
以下では3.11を使う例を示します．

Pythonをインストールする場所(パス)に日本語(全角文字)が入らない場所を選んでください。
現状では全角文字がパスに含まれてしまうと python からファイルの読み書きを行う時にエラーになります。

## 2. venvによる環境構築

ここでは venv という環境分離機構を使って環境を設定します。
まずは環境構築のためのフォルダを作ります。まずは homcloud というフォルダを作ります。
例えばコマンドプロントを起動して次のようにするとフォルダが作られます．

    mkdir homcloud

次に venv をセットアップします。 コマンドプロントを起動して、以下のコマンドを打つことで`homcloud`のフォルダ下に`venv311`フォルダが作成されます。

    cd homcloud
    py -3.11 -m venv venv311

ここでの注意として，フォルダ名に英数字以外の文字が含まれているとうまく動きません．親フォルダも含んでいていはいけないことに注意してください．

## 3. venvの環境内に移動する

次のように打ち込むと環境内に移動できます。

    venv311\Scripts\activate

**この操作はコマンドプロンプトを起動するごとにやる必要がある**ことに注意してください。

## 4. pythonのパッケージをインストールする

必要なパッケージを上で起動したコマンドプロンプトよりインストールします。
以下のように打ち込みます．コピー&ペーストでもOKです。

    pip install numpy pyqt5 pyqt6 wheel "pyvista[all,trame]" pyvistaqt

## 5. HomCloudのインストール

以下のようにインストールします。

    pip install homcloud

## 6. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように実行します．

    python -m homcloud.self_check --pyvista

以下のような画像が表示されたウィンドウが開かれます．
開かれたウィンドウは閉じてください．

![PyVistaのウィンドウ](/images/screenshot-selfcheck-pyvista.png){: width="600px" }

最終的にコマンドプロンプトに以下のように表示されていたらOKです(バージョンの値は違っていてかまいません)．

    HomCloud version: 4.4.0
    Python version: 3.10.12 (main, Nov 20 2023, 15:14:05) [GCC 11.4.0]
    CGAL version: 5.6 (1050601000)
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
からダウンロードして homcloud フォルダに展開してください。

次にチュートリアルで利用する jupyter notebook をインストールします。

    pip install jupyter

でインストールできます。インストール後、homcloudフォルダで

    jupyter notebook

とするとブラウザがポップアップし、jupyter notebookが起動します。
ここでチュートリアルのフォルダから
チュートリアルを始めてください。いくつかチュートリアルがありますが、
pointcloudが一番やりやすいでしょう。


## (Optional) paraview のインストール

paraview はhomcloudでは主にポイントクラウドのデータを表示する場合のビューワーとして使います。
[https://www.paraview.org/](https://www.paraview.org/)
から最新版をダウンロードし、インストールをします。そしてインストール先を
環境変数 `HOMCLOUD_PARAVIEW_PROGRAMNAME` によって設定する必要があります。
`C:\Program Files\ParaView 5.6.0-Windows-msvc2015-64bit\bin\paraview.exe`のような
paraviewのパスを調べて環境変数を設定してください。

あまり詳しくない方は[WindowsでのParaviewの環境変数の設定](windows_envvar_paraview.html)を参照してください．


## (Optional) MSMPI と dipha のインストール

ここから先はオプショナルな内容なので必ずしもやる必要はありません．
Rips filtrationを上限を指定して計算したい場合に使います．

MSMPIは dipha が並列化してホモロジーを計算するために使います。
[MicrosoftのMPIのページ](https://docs.microsoft.com/en-us/message-passing-interface/microsoft-mpi)
から

* msmpisetup.exe
* msmpisdk.msi

をダウンロードし、クリックしてインストールをします。

dipha は [dipha.exe](/download/win/dipha.exe) からダウンロードし，`venv37\Scripts` にコピーしてください．
