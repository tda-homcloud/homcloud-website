[戻る](index.html)

# よくある質問のトラブルシューティング
- toc
{:toc}

- - -

## Q. linuxサーバーにインストールしたhomcloudをsshでクライアントマシンからログインして使う時にXwindowが表示されない

### A. X forwardingの設定を行い、ウィンドウが表示されるようにするか、ウィンドウ表示をオフにします

matplotlibによるグラフの表示や、新規にXwindowでグラフを表示する場合など、クライアント側にウィンドウ表示の設定がされていない場合はグラフを表示するプログラムでエラーが出ます。

Windowsの場合、teratermやPuttyなどでログインしている場合は以下にあるXウィンドウ表示ためのプログラムをインストールし、 X11 forwarding の設定を適宜行ってください。

- Xming: <https://ja.osdn.net/projects/sfnet_xming/releases/>
- VcXsrv: <https://sourceforge.net/projects/vcxsrv/>

Macの場合は ssh でログインするときに

    ssh -X server
    ssh -Y server

として -X か -Y のオプションをつけてください。

ウィンドウ表示をオフにするには

    import matplotlib
    matplotlib.rcParams['backend'] = "Agg"

のようにし、グラフは直接画像ファイルへ出力します。

より詳細な情報は <https://matplotlib.org/index.html> を参考にしてください。


## Q. optimal-cycleやfull-ph-treeでダンプしたjsonを二次利用したい

### A. pythonから読み込み、整形する方法とjqによる整形ができます。

#### A1. pythonから読み込んで整形する

例として以下のようなコードでjsonファイルを読み込みすることができます。

    import json
    import numpy as np
    f = open(jf, 'r')
    jsonData = json.load(f)
    f.close()
    var=np.array(jsonData['hoge'])

homcloudから出力されるjsonは完全な辞書形式ではありませんので注意してください。

#### A2. jqを使って整形する

* [jq](https://stedolan.github.io/jq/)

をお使いのPCへインストールします。
ターミナルからjsonファイルの標準出力をパイプで jq につなぐことで整形が簡単にできます。

    #ノードの数の確認
    cat optimal-cycles2.json | jq -c '. | length'
    #result の中身の表示
    cat optimal-cycles2.json | jq '.result'
    #resultの中の boundary-points の内容表示
    cat optimal-cycles2.json | jq -c '.result[]."boundary-points"'
    #boundary-points の中の0番目の成分を簡易表示にして出力
    cat optimal-cycles2.json | jq -c '.result[]."boundary-points"[0]'

## Q. 点配列(pointcloud)のサンプルデータを自前で用意してサンプルコードを実行してみたがエラーが出た

### A. いくつか可能性がありますが、よくある例と解決法を以下に2つ紹介します。

#### A1. ログスケール表示(-lオプション使用)でパーシステント図を作る場合(plot-PDを使う)にプロットレンジ内に0以外の値が一つもなかった場合

    File "/usr/local/lib/python3.6/site-packages/matplotlib/ticker.py", line 1956, in tick_values
    "Data has no positive values, and therefore can not be "
    ValueError: Data has no positive values, and therefore can not be log-scaled.

プロットレンジをオプション `-x "[xmin:xmax]"` を適宜調節します。

    python3 -m homcloud.plot_PD -d 1 -x "[0:10.0]" -X 256 -l output.idiagram -o output.1.png

#### A2. サンプルデータが綺麗な繰り返し構造を持っている


サンプルデータが

* 3点が同一直線上に並んでいる
* 4点が同一平面上に並んでいる
* 5点が同一球面上に並んでいる

といった場合には計算時にエラーが出たり，出力結果が奇妙(例えば対角線の下に
birth-death pairが現われるなど)します．
例えば、正方格子データなどでこういったエラーが生じます．
このエラーは入力の頂点座標の値をわずかにずらすと回避できます。

## Q. paraviewをアップデートしたら optimal-cycle や full-ph-tree を使った plot-PD-gui から paraview が起動しなくなった

### A. paraviewについての環境変数を事前に設定します。

paraview-5.4を

    brew install caskroom/cask/paraview

をインストールすると、インストール先が /Applications/ParaView-5.4.0.app となってバージョン名が名前に追加されます。
homcloud側で呼び出しに使っている名前と一致しなくなるので以下のようなエラーが出ます。
解決するには、0.9.5以降で実装された、paraviewの環境設定を行います。


    Traceback (most recent call last):
    File "/usr/local/lib/python3.6/site-packages/homcloud/plot_PD_gui.py", line 602, in show_descendants_volumes
    utils.invoke_paraview(tmpfile)
    File "/usr/local/lib/python3.6/site-packages/homcloud/utils.py", line 153, in invoke_paraview
    subprocess.check_call(["open", "-a", "paraview"] + list(args), **redirect)
    File "/usr/local/Cellar/python3/3.6.3/Frameworks/Python.framework/Versions/3.6/lib/python3.6/subprocess.py", line 291, in check_call
    raise CalledProcessError(retcode, cmd)
    subprocess.CalledProcessError: Command '['open', '-a', 'paraview', '/tmp/tmpy5ms2cya/e340e825-81c4-4eb5-9c67-7437132775a2.vtk']' returned non-zero exit status 1.
    Abort trap: 6

シェルコマンドとして実行する時には mac や linux の環境では

    export HOMCLOUD_PARAVIEW_PROGRAMNAME=/Applications/ParaView-5.4.0.app

のようにparaviewのアプリケーションのパスを明示してください。

windowsでは parabiew がインストールされている場所を調べておき、

    set HOMCLOUD_PARAVIEW_PROGRAMNAME=C:\Program Files\ParaView 5.4.1-Qt5-OpenGL2-MPI-Windows-64bit\bin\paraview.exe

のように設定します。


## Q. バージョン0.8.5で c++11 のオプションが原因で alpha_shape3.cc1 にエラーが出てインストールできない

### A. setup.pyを修正し、パッケージの作成をやりなおしてからインストールします。

`ext/alpha_shape3.cc`や`ext/alpha_shape2.cc`が原因でインストールに失敗する場合は、一旦パッケージを解凍し、内部のsetup.pyを以下のように編集してから再度インストールを行います。

	tar zxvf homcloud-base-0.8.5.tar.gz
	cd homcloud-base-0.8.5

`setup.py`の13行目、`EXT_MODULES`へ以下のように`extra_compile_args`を追記します。

	EXT_MODULES = [
	Extension("homcloud.alpha_shape3",
                   include_dirs=[np.get_include()],
                   libraries=LIBS,
                   extra_compile_args=["-std=c++11"], <- 追加
                   sources=["ext/alpha_shape3.cc"]),
    	Extension("homcloud.alpha_shape2",
                   include_dirs=[np.get_include()],
                   libraries=LIBS,
                   extra_compile_args=["-std=c++11"], <- 追加
                   sources=["ext/alpha_shape2.cc"]),
	]

python3でパッケージを作成しなおします。

	python3 setup.py sdist

`dist/homcloud-base-0.8.5.tar.gz `が生成されているので、これをインストールします。

	cd dist
	pip3 install homcloud-base-0.8.5.tar.gz 

DebianやUbuntuなどのLinux環境でローカルにインストール場合には `--user` をつけます。

	pip3 install homcloud-base-0.8.5.tar.gz --user


[このページのトップへ戻る](#section)

- - -

## Q. sshで接続したターミナルにInvalid DISPLAY VARIABLEと表示され実行できない
   
### A. GUI表示をオフにする。

matplotlibを使用時に、お使いの環境でGUI表示が使えない状況であるため、このエラーが出ていると考えられます。
matplotrcの環境設定でGUIをオフにすることで回避できます。

`$HOME/.config/matplotlib/matplotlibrc`

について、backendの部分を

`backend: agg`

とします。

[このページのトップへ戻る](#section)

- - -
							 
## Q. MacOS上で実行時にOpenmpiからパス名が長すぎるというエラーが出て実行できない

以下のようなメッセージがOpenmpiから出て実行できないことがあります。

	[[46339,0],0] ORTE_ERROR_LOG: Bad parameter in file orted/pmix/pmix_server.c at line 262
	[[46339,0],0] ORTE_ERROR_LOG: Bad parameter in file ess_hnp_module.c at line 666`

### A1. TMPDIRを定義しなおします。

実行時にシェルスクリプトを用意し、短いパス名のTMPDIRを定義しなおします。
例えばrun.shの行頭部分(2行目)に

	export TMPDIR=/tmp

のような記述をして実行します。

### A2. Openmpiのバージョンを下げます。

以下の例のようにバージョンを以前のものに戻すことでエラーを回避できます。
最新版のOpenmpiを使う場合はA1を試してください。

- 問題が起こったバージョン　2.1.0
- 使用可能になるバージョン　2.0.1

参考: <https://github.com/LLNL/spack/issues/3567>

- - -
[このページのトップへ戻る](#section)

- - -
