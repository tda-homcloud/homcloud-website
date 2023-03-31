---
title: "HomCloud - 古いFAQ"
lang: "ja"
---

# 古いFAQ

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
