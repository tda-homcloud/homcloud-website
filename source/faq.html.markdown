---
title: "HomCloud - よくある質問と解答"
lang: "ja"
---

# よくある質問と解答

[古い内容のFAQへのリンク](faq_old.html)

- toc
{:toc}

- - -


## Q. PDをログスケール表示でプロットしようとすると，「ValueError: Data has no positive values, and therefore can not be log-scaled.」というメッセージがでて何も表示されない．

### A. プロット範囲にデータがありません．

考えられる可能性としては，

* そもそもbirth-death pairが1つもない
* プロット範囲がずれている

の2つがあります．というわけでまずはbirth time，death timeの値を確認してください．2つ目の場合はプロット範囲を調整してください．

## Q. 結晶データを解析するとエラーがでます

### A. データに小さな乱数を加えてください．

データが

* 3点が同一直線上に並んでいる
* 4点が同一平面上に並んでいる
* 5点が同一球面上に並んでいる

場合などには，計算時にエラーが出たり，奇妙な結果(例えば対角線の下にbirth-death pairが現われるなど)になったりします．
この場合入力の頂点座標の値に小さな乱数を加えると回避できます．

数学的にこの小さな乱数は結果にほとんど影響を与えないことが保証されている(詳しくはPHの安定性定理を調べてみてくださ)ので，安心して小さな乱数を加えてください．


## Q. sshで接続したターミナルにInvalid DISPLAY VARIABLEと表示され実行できない

matplotlibがGUIを使おうとしてエラーが発生しています．回避策として「GUIをオフにする」「X forwardingを設定する」の2つがあります．

### A1. GUI表示をオフにする

matplotlibを使用時に、お使いの環境でGUI表示が使えない状況であるため、このエラーが出ていると考えられます。
matplotrcの環境設定でGUIをオフにすることで回避できます。`$HOME/.config/matplotlib/matplotlibrc`に以下の内容を追加します．

    backend: agg

もしくはプログラム上で

    import matplotlib
    matplotlib.rcParams['backend'] = "Agg"

のようにするのも可能です．
より詳細な情報は[Matplotlibのドキュメント](https://matplotlib.org/index.html)を参考にしてください。

### A2. X forwardingの設定を行い，ウィンドウが表示されるようにする

matplotlibによるグラフの表示や、新規にXwindowでグラフを表示する場合など、クライアント側にウィンドウ表示の設定がされていない場合はグラフを表示するプログラムでエラーが出ます。

Windowsの場合、teratermやPuttyなどでログインしている場合は以下にあるXウィンドウ表示ためのプログラムをインストールし、 X11 forwarding の設定を適宜行ってください。

- Xming: <https://ja.osdn.net/projects/sfnet_xming/releases/>
- VcXsrv: <https://sourceforge.net/projects/vcxsrv/>

Macの場合は ssh でログインするときに

    ssh -X server
    ssh -Y server

として -X か -Y のオプションをつけてください。

## Q. ParaViewが正常に動かない

### A. HomCloudをアップグレードする．ParaViewをダウングレードする．

まず，HomCloud自体の問題があるのでできるだけ新しいバージョンをインストールしてください．

もう一つ，ParaViewのバージョンが新しすぎるとうまく動かない問題も判明しているので古いバージョン(5.6くらい)を使うようにしてください．

最新のHomCloudではPyVistaを使った可視化をもっており，こちらのほうがバージョン問題が生じにくいのでこちらの利用をお勧めします．

## Q. ParaView のインターフェースはどうなりましたか？

チュートリアルからParaViewへの言及がなくなりました．
ParaViewインターフェースはどうなったのですか？

### A. ParaViewインターフェースは利用可能予定ですが徐々にフェードアウトさせる予定です

ParaViewインターフェースはHomCloud 4.xでも利用可能です．
ParaViewによる3次元可視化機能はしばらくこのまま維持する予定です．

しかし，一つ上のQ&AにもあるようにHomCloudはParaViewのバージョンアップについていけていません．
HomCloudはParaViewのPython APIを使っていますが，このAPIはあまり安定しておらず，ドキュメントも不足しています．
そのためサポートには消極的です．
新しいバージョンへのParaViewへの対応などは優先順位が低いです．
HomCloudのParaViewサポートは徐々にフェードアウトさせる予定です．

[PyVista](https://pyvista.org)によるインターフェースが代わりに利用可能です．
Pythonでコードを書いてParaView的な3次元可視化ができます．

## Q. Dockerで動かない

### A. root以外で動作させる，もしくはOpenMPIの設定を変える

HomCloudは内部的にOpenMPIを使っています．そしてOpenMPIはrootではデフォルトでは
動作拒否をします．一方一般的にDockerでは内部的にrootで動かしていることが多いです．
そのためDockerではエラーが発生して止まります．

対応策は以下のいずれかです．

1. root以外のユーザを使う．詳しくはDockerのドキュメントなどを見てください．
2. OpenMPIにDockerでの動作を許容させる．OpenMPIのバージョンに依存しますが，以下の2つの環境変数を`1`に指定するとROOTでも動作します．

   * `OMPI_ALLOW_RUN_AS_ROOT`
   * `OMPI_ALLOW_RUN_AS_ROOT_CONFIRM`

## Q. RHELやその互換ディストリビューション(Rocky Linuxなど)でインストールできませんか？

### A. condaを使うのがよいでしょう

[CGAL](https://www.cgal.org/index.html) のパッケージがないようなのでインストールが面倒です．どうしてもRHELやRocky Linuxが使いたい場合は[condaを使う](/install-guide/install_guide_for_Linux_conda.html)ほうがいいかもしれません．

## Q. PyQt のインストールで問題が生じる

`pip install pyqt5`とすると次のようなエラーがでる．

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

### A. PyQtの特定のバージョンの問題なので，問題ないバージョンを指定します

`pip install pyqt5`の代わりに`pip3 install pyqt5==5.14`としてください．

## Q. 3次元可視化が遅い

もっと高速に動かしたい．特に3次元ボクセルデータの描画がするまでが遅い．

### A. PyVista インターフェースで別ウィンドウで動かすのが一番高速

次のように `pyvista.Plotter` に `notebook=False` を渡すと，Jupyter notebook の inline *ではなく*別のウィンドウで描画されます．
これが現状では一番高速のようです．

    import pyvsta as pv
    
    pl = pv.Plotter(notebook=False)
    pl.add_mesh(...)
    pl.show()
    
## Q. ポイントクラウドデータ解析で，異なる半径を持つ粒子を解析したい．

### A. `homcloud.interface.PDList.from_alpha_filtration` の `weight` パラメータに半径の二乗を渡す

`homcloud.interface.PDList.from_alpha_filtration`のweightパラメータを使うと各粒子の初期半径を指定できます．
初期半径の二乗を渡してください．詳しくは[リファレンスマニュアルの`from_alpha_filtration`の項](https://homcloud.dev/python-api/interface.html#homcloud.interface.PDList.from_alpha_filtration)を参考にしてください．

## Q. 3次元のグレイスケール画像は解析できる？

チュートリアルには3次元白黒画像と2次元グレイスケール画像の例しかないのですが，3次元のグレイスケール画像は解析できますか？

### A. できます

チュートリアルは準備されていませんが可能です．
解析法については2次元グレイスケール画像のチュートリアルを，可視化については3次元白黒画像のチュートリアルを，それぞれ参考にしてください．

## Q. HomCloud は商用利用可能か？

### A. HomCloudはGPL3ライセンスの下で配布されており，その範囲で利用可能です

HomCloud は [GPL 3](https://www.gnu.org/licenses/gpl-3.0.ja.html) で配布されており，使用は常に自由です．
HomCloudを組み込んだソフトウェアを配布する場合には，GPL3に従わなければなりません．
詳しくはライセンスを読んでください．
またあなたの所属する組織の法務部に相談してください．

## Q. Linux / Windows / Mac はどれも使えるようですがどれがお勧めですか？

### A. Linux > Windows > Mac の順です．

どれでもそれなりにちゃんと動きますが，開発者がLinuxをメインで使っているのでこれが一番確実に動作します．
またエラー報告があったときにLinuxが一番対応が早いです．
Linux以外は後回しになります．

WindowsとMacだとWindowsのほうが動作の確実度は高い気がします．
MacはIntel Macはフェイドアウト最中なので積極的に対応する予定はありませんのでApple Silicon Macのほうがよいでしょう．
