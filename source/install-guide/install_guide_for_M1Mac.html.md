---
title: Install HomCloud on M1 Mac
lang: ja
---

# Apple Silicon (M1) Mac へのインストール

ここでは Homebrew を用いたインストールを紹介します。
Homebrewはコマンドラインインターフェースを用いてMacにさまざまなソフトウェアをインストールできるツールです．
HomebrewでインストールしたPythonから，venvというPython用計量仮想環境を作るツールを利用することでHomCloudをインストールします．
venvを利用することでHomCloudが使っているソフトウェアコンポーネントやHomCloud自体のバージョンアップへの対応が簡単になります．

## 1. Homebrewのインストール

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

## 5. pipでインストール

以下のようにタイプして必要なPythonパッケージをインストールします．

     pip install "numpy<2" wheel jupyter Cython "pyvista[trame,all]" pyqt6 pyvistaqt

## 6. HomCloudのインストール

HomCloudをインストールします．ターミナルで次のようにタイプします．

    CPLUS_INCLUDE_PATH=/opt/homebrew/include LIBRARY_PATH=/opt/homebrew/lib pip install homcloud

## 7. 自己テストプログラム

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように実行します．

    python -m homcloud.self_check --pyvista

以下のような画像が表示されたウィンドウが開かれます．
開かれたウィンドウは閉じてください．

![PyVistaのウィンドウ](/images/screenshot-selfcheck-pyvista.png){: width="600px" }

最終的にコマンドプロンプトに以下のように表示されていたらOKです(バージョンの値は違っていてかまいません)．

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

以上でインストールは完了です．

## 8. チュートリアルの実施

HomCloudのチュートリアルを動かしてみましょう．
[python-tutorial.zip](/download/python-tutorial.zip)
からダウンロードしてhomcloudフォルダに展開してください。
その後，venvの仮想環境に入って

    jupyter notebook

とするとブラウザがポップアップし，jupyter notebookが起動します．
ここでチュートリアルのフォルダからチュートリアルを始めてください．
いくつかチュートリアルがありますが，pointcloudが一番やりやすいでしょう．

## トラブルシューティング

### Xcodeの問題
「5. pipでインストール」の所で次のようなエラーが出た場合は，普通のXcodeが利用させる設定になっています．
HomebrewではXcodeのCommand Line Toolsを使う前提になっているため，Command Line Toolsに切り替える必要があります．

          /Applications/Xcode-14.3.1.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/c++/v1/__memory/unique_ptr.h:610:45: error: unknown type name 'nullptr_t'
          operator!=(const unique_ptr<_T1, _D1>& __x, nullptr_t) _NOEXCEPT
                                                      ^
          fatal error: too many errors emitted, stopping now [-ferror-limit=]
          220 warnings and 20 errors generated.
          error: command '/usr/bin/clang' failed with exit code 1
          [end of output]

      note: This error originates from a subprocess, and is likely not a problem with pip.
      ERROR: Failed building wheel for ripser
      Building wheel for hopcroftkarp (setup.py) ... done
      Created wheel for hopcroftkarp: filename=hopcroftkarp-1.2.5-py2.py3-none-any.whl size=18102 sha256=90695ae1fb96c91e6da1391bc7a75635e2c8011d9b19f41ad5fb496d9ce34716
      Stored in directory: /Users/distiller/Library/Caches/pip/wheels/1f/cc/2d/de23a8b9ae586817b0b44de4a4b1a08f23473e248a644b312f
    Successfully built msgpack-python hopcroftkarp
    Failed to build ripser
    ERROR: Could not build wheels for ripser, which is required to install pyproject.toml-based projects

    Exited with code exit status 1

切り替えは次のようにします．

    sudo xcode-select -s /Library/Developer/CommandLineTools/
    

