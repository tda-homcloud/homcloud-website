---
title: WindowsでのParaviewの環境変数の設定
lang: ja
---

# WindowsでのParaviewの環境変数の設定

Paraviewのインストールはすでに終わっているものとします．

まず，スタートメニューから設定を選びます．

![スタートメニューの設定](/images/screenshot-windows-envvar-1.png){: width="600px" }

下の図のようなウィンドウがでるので「設定の検索」の所に「環境変数」と入力します．

![設定の検索](/images/screenshot-windows-envvar-2.png){: width="600px" }

「環境変数を編集」を選択します．

![環境変数を編集を選択](/images/screenshot-windows-envvar-3.png){: width="600px" }

次のようなウィンドウがポップアップするので「新規」ボタンをクリックします．

![環境変数を編集のウィンドウ](/images/screenshot-windows-envvar-4.png){: width="600px" }

次のようなウィンドウがポップアップするので，変数名の所には`HOMCLOUD_PARAVIEW_PROGRAMNAME`を入力します．

![新しいユーザー変数](/images/screenshot-windows-envvar-5.png){: width="600px" }

変数値を入力するには，「ファイルの参照」ボタンを押します．
ポップアップしたウィンドウで`paraview.exe`を探します．左側のペインで「PC」をクリックすると
次のような表示がされるので 「Windows (C:)」 をダブルクリックし，

![変数値の選択1](/images/screenshot-windows-envvar-6.png){: width="600px" }

その後「Program Files」「Paraview X.Y.Z…」(これは
インストールしたバージョンで異なります)「bin」「paraview.exe」と探していきます．最終的に次のスクリーンショットのように
paraview.exeを探し，ダブルクリックします．

![変数値の選択2](/images/screenshot-windows-envvar-7.png){: width="600px" }

最終的には次のようになるはずです．OKボタンをクリックします．

![ユーザー変数設定](/images/screenshot-windows-envvar-8.png){: width="600px" }

「環境変数」ウィンドウのOKボタンを押して完了です．

![変数設定 - OK](/images/screenshot-windows-envvar-9.png){: width="600px" }
