[OS選択に戻る](OS_selects.html) | [戻る](index.html)

# Debian jessie でのインストール

## 1. 以下のパッケージをapt-getを用いてインストールします。

   * libcgal-dev
   * python3-matplotlib
   * python3-numpy
   * python3-scipy
   * python3-pip
   * python3-pyqt5
   * python3-msgpack
   * mpi-default-bin
   * paraview

   apt-getで各パッケージの追加は以下のように行います。

   `sudo apt-get install libcgal-dev python3-matplotlib python3-numpy python3-scipy python3-pip python3-pyqt5 python3-msgpack python3-pulp mpi-default-bin paraview`
		
## 2. 以下のファイルを [jessie-packages directory](https://packages.debian.org/stable/) からダウンロードします。

   * dipha_2.1.0-1_amd64.deb
   * python3-sklearn-lib_0.17.1-2_amd64.deb
   * python3-sklearn-0.17.1-2_all.deb
   * python3-homcloud_0.6.7_amd64.deb
   * python3-joblib_0.9.4-1_all.deb

上記のファイルよりも新しいバージョンがある場合は、最新版をダウンロードしてください。
   
## 3. ダウンロードしたファイルを以下のようにdpkgを使ってインストールします。

   `sudo dpkg -i dipha_2.1.0-1_amd64.deb python3-joblib_0.9.4-1_all.deb python3-sklearn-lib_0.17.1-2_amd64.deb python-sklearn-doc_0.17.1-2_all.deb python3-sklearn_0.17.1-2_all.deb python3-homcloud_0.6.7_amd64.deb`

## 4. 最新版のhomcloudを[ウェブサイト](http://www.wpi-aimr.tohoku.ac.jp/hiraoka_labo/homcloud.html)からダウンロードし、インストールします。

以下の二つをダウンロードします。x、y、zは最新のバージョン番号に置き換えてください。

* homcloud-x.y.z.tar.gz (最新版)
* homcloud-base-x.y.z.tar.gz (旧バージョン:1.3.1以下)
* homcloud-advanced-x.y.z.tar.gz (旧バージョン:1.3.1以下)

ダウンロードしたディレクトリに移動し、以下を実行します。

    pip3 install --user --no-deps homcloud-x.y.z.tar.gz

ver. 1.3.1以下をお使いの場合は以下のようにします。特別な事情がない限り、最新版をお使いください。

    pip3 install --user --no-deps homcloud-base-x.y.z.tar.gz
    pip3 install --user --no-deps homcloud-advanced-x.y.z.tar.gz

もしグローバルにインストールしたくない場合はvirtualenvかvenvを使ってください。

## 5. HomCloudの自己チェックプログラムを動かす

最後に正常にインストールされているかどうかを調べるためにターミナルで以下のように
実行します．

    python3 -m homcloud.self_check

2回，Paraviewのウィンドウが開かれます．
最初に開かれたときは，"Apply"ボタンを押して何か表示されてからウィンドウを
閉じてください．
2回目に開かれたときは，赤と白の点が表示されていることを確認してからウィンドウを
閉じてください．

最終的にターミナルに以下のように表示されていたらOKです．


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

- - -
[OS選択に戻る](OS_selects.html) | [戻る](index.html)
