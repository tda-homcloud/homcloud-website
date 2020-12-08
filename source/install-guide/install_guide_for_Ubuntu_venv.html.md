---
title: Install HomCloud on Ubuntu or Debian
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

    sudo apt-get install libcgal-dev libpython3-dev openmpi-bin libopenmpi-dev cmake paraview jupyter

新しい Ubuntu (20.04など) では python3-paraview もインストールする必要があります．

    sudo apt-get install python3-paraview

## 2. venvで環境を新しく作る

まず作業用のディレクトリを作ります．ここでは`homcloud`という名前にしましょう．

    mkdir homcloud
    cd homcloud

次のようにして venv の設定を作ります．

    python3 -m venv venv
    
以下のようにして venv の環境に入ります．

    source ./venv/bin/activate
    
## 3. pipを使ってCython，numpy，wheelを追加します。

以下のようにタイプしてインストールします．

    pip3 install Cython numpy wheel
    
GUIを使いたい場合は PyQt5 もインストールする必要があります．

    pip3 install pyqt5

次のようなエラーが出た場合は `pip3 install PyQt5==5.14` としてください．これは
PyQtの特定のバージョンでの問題です．

    Collecting pyqt5
      Installing build dependencies ... done
        Complete output from command python setup.py egg_info:
        Traceback (most recent call last):
          File "<string>", line 1, in <module>
          File "/usr/lib/python3.7/tokenize.py", line 447, in open
            buffer = _builtin_open(filename, 'rb')
        FileNotFoundError: [Errno 2] No such file or directory: '/tmp/pip-install-bvg6_fyh/pyqt5/setup.py'

        ----------------------------------------
    Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-install-bvg6_fyh/pyqt5/


## 4. 最新版のhomcloudをインストールします。

以下を実行します。

    pip3 install homcloud

### 古いバージョンをインストールする場合

古いバージョンのHomCloud (2.9.0など) をインストールする場合には代わりに次のようにします．

    pip3 install --user homcloud==2.9.0

## 5. HomCloudの自己チェックプログラムを動かす

後に正常にインストールされているかどうかを調べるためにターミナルで以下のように
実行します．

    python3 -m homcloud.self_check --no-dipha

2回，Paraviewのウィンドウが開かれます．
最初に開かれたときは，"Apply"ボタンを押して何か表示されてからウィンドウを
閉じてください．
2回目に開かれたときは，赤と白の点が表示されていることを確認してからウィンドウを
閉じてください．

最終的にコマンドプロンプトに以下のように表示されていたらOKです．`/usr/bin/paraview`
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

## 6. (Optional) [http://github.com/DIPHA/dipha](http://github.com/DIPHA/dipha)からdiphaをダウンロードし、インストールします。

Veitoris-Rips 複体(距離行列)や高次元(4次元以上)のボクセルデータの解析のために dipha をインストールします。
もしこれらを使わない場合はここは飛ばしてよいです。

1. <https://github.com/DIPHA/dipha/archive/dipha-2.1.0.zip> からダウンロードしてください。
2. ダウンロードしたファイルを解凍してください。
3. 解凍時に作られたディレクトリに移動してください。
4. "cmake ."とタイプし、makefileを作成します。
5. "make"とタイプし、ビルドします。
6. ビルドされたdiphaの実行ファイルをパスの通ったディレクトリへコピーしてください 

インストール終了後，以下のようにしてHomCloudが正常に動くかチェックします。

    python3 -m homcloud.self_check
