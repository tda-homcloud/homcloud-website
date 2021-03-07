---
title: HomCloud 3.x Migration guide (Python interface)
lang: ja
---

# HomCloud 3.x 移行ガイド (Python interface)

## はじめに

HomCloudは2020年10月に3.0.0をリリースしました．このバージョンはいくつかの非互換な変更を含んでいます．
基本的な部分に関してはプログラムの変更なしに動くように考慮していますし，そうでない部分も簡単に移行できるようにはしています．

この文章ではHomCloud 3.xへの移行の仕方について解説します．

## HomCloud 3.xを使う利点

移行の説明をする前に，移行の利点を説明しましょう．

基本的には「新しい機能や高速化の恩恵を受けたければ移行するべき」となります．
3.xでは各種高速化や新機能の実装が進められています．3次元ボクセルデータのPD計算の高速化などは利用者の恩恵も大きいでしょう．

他にもバグ修正などは古いバージョンではあまり対応できないので，そういったバグを回避できない場合には移行する必要があります．


## 一番大きな変化: 新ファイルフォーマット`.pdmg`の導入

HomCloud 2以前では`.idiagram`という拡張子のファイルにPDの情報を格納していました．また，逆解析のためのファイルとして`.p2mt`や`.pht`という拡張子のファイルも利用していました．

これらのファイルフォーマットには以下のような問題がありました．

* 点の数が多いファイルでファイルの読み込み時間が長い
* 逆解析のための似たような情報を持つファイルが複数種類あり，使い分けがよくわからない
* 同じような情報を持つファイルが複数に分かれて管理が面倒
* 構造が複雑なわりに拡張性に乏しい(特にこれはHomCloud開発者の視点から問題が多い)

こういった問題を解決するため，HomCloud 3では`pdgm`フォーマットというのを新たに導入し，これらの機能を統合しました．

## 移行の第一歩 - 新ファイルフォーマットへの対応

というわけでプログラム移行のための解説をしていきましょう．ここは変えなくてもいい，という話も随時していきます．

まずライブラリの読み込み(以下のような内容)は特に変える必要はありません．

    import homcloud.interface as hc
    import homcloud.paraview_interface as pv
    import numpy as np
    import matplotlib.pyplot as plt

まず変更が必要なのはPDの計算の部分です．

    pointcloud = np.loadtxt("pointcloud.txt")
    hc.PDList.from_alpha_filtration(
        pointcloud, 
        save_to="pointcloud.idiagram",
        save_boundary_map=True
    )

上のようなコードは次のように保存するファイル名`save_to`の拡張子を`.pdmg`に変更します．

    pointcloud = np.loadtxt("pointcloud.txt")
    hc.PDList.from_alpha_filtration(
        pointcloud, 
        save_to="pointcloud.pdgm",
        save_boundary_map=True
    )

ファイル名を変えるとそれに合わせて新ファイルフォーマットに対応したプログラムが動作します．PDのファイル読み込みも変更後の名前に変える必要があります．

    pdlist = hc.PDList("pointcloud.pdgm")

可視化やbirth-daeth pairを列挙したりする部分は変更なしで動きます．
例えば以下のようなプログラムは変更なしにHomCloud 3でも動きます．

    pd1 = pdlist.dth_diagram(1)
    pd1.histogram((0, 0.01)).plot(colorbar={"type": "log"})
    print(pd1.births)
    print(pd2.births)
    
## optimal volume(逆解析の一種)について

optimal volumeは`.pdgm`への移行が完了しているならば問題なく動作します．以下のようなプログラムは問題なく動作するはずです．

    pdlist = hc.PDList("pointcloud.pdgm")
    pd1 = pdlist.dth_diagram(1)
    optimal_volume = pair.optimal_volume()
    print(optimal_volume.boundary_points())

`.idiagram`のままだと動作しないので，上で説明した新ファイルフォーマットへの移行は必須です．

## 統計機械学習のためのベクトル化とベクトルのPD化について

機械学習のためのベクトル化とベクトルのPD化については，`PIVectorizerMesh`というクラス名が`PIVectorizeSpec`に変更されたことが大きな変更点です．ただ古い名前(つまり`PIVectorizerMesh`)も非推奨ですが利用可能です．以下に実例を挙げましょう．

    変更前:
    pd = hc.PDList("pointcloud.idiagram").dth_diagram(2)
    vectorizer = hc.PIVectorizerMesh((0, 0.03), 128, sigma=0.002, weight=("atan", 0.01, 3))
    v = vectorizer.vectorize(pd)
    # vが結果のベクトル

    変更後:
    pd = hc.PDList("pointcloud.pdgm").dth_diagram(2)
    vectorizer = hc.PIVectorizeSpec((0, 0.03), 128, sigma=0.002, weight=("atan", 0.01, 3))
    v = vectorizer.vectorize(pd)
    # vが結果のベクトル
    
ベクトルをPDの形に変換するもの次のようにできます．ここは変更の必要がありません．

    # ベクトルvをPDのヒストグラムに変換
    reconstructed_pd = vectorizer.histogram_from_vector(v)
    # 可視化
    reconstructed_pd.plot()
    

## PD2の高速逆解析について

3次元データのPD2の逆解析，もしくは2次元データのPD1の逆解析をしていた場合には`.pht`ファイルを利用した次のような解析をしていた人もいると思います．この部分に関しては大きな変更が必要です．

    # ポイントクラウドデータの読み込み
    pc = np.loadtxt("pc.txt")
    # PDの計算
    PDList.from_alpha_filtration(pc, save_boundary_map=True, save_to="pc.idiagram")
    # PD2を取り出す
    pd2 = hc.PDList("pc.idiagram").dth_diagram(2)
    # PD2 から逆解析のための木構造を計算する
    pd2.phtrees(save_to="pc.pht")
    # 計算した木構造を取りだす
    phtrees = hc.PHTrees("pc.pht")
    # (0.0075, 0.015) に一番近い birth-death pair に対する木のノードを取り出す
    node = phtrees.pair_node_nearest_to(0.0075, 0.015)
    # その birth-death の境界上の頂点を取り出して表示する
    print(node.boundary_points())

大きな変更点は次の通りです．

* 木構造データが`pdgm`ファイルに保存されるようになった
  * つまり別ファイルにしなくてよくなった
* 計算した木構造を取りだすためのプログラムの書きかたが変更された
  * `from_alpha_filtration`に`save_phtrees=True`という引数を渡す
  * すると木構造を計算して同じファイルに保存される
* 読み込みのコードが`PD.load_phtrees()`を使うようになった

具体的に上の例は次のように書き換えます．
    
    # ポイントクラウドデータの読み込み
    pc = np.loadtxt("pc.txt")
    # PDと木構造の計算 (この部分要変更)
    hc.PDList.from_alpha_filtration(pc, save_boundary_map=True, save_phtrees=True,
                                    save_to="pc.pdgm")
    # PD2を取り出す
    pd2 = hc.PDList("pc.pdgm").dth_diagram(2)
    # 木構造を取りだす(この部分要変更)
    phtrees = pd2.load_phtrees()
    # (ここより後は変更する必要はない)
    # (0.0075, 0.015) に一番近い birth-death pair に対する木のノードを取り出す
    node = phtrees.pair_node_nearest_to(0.0075, 0.015)
    # その birth-death の境界上の頂点を取り出して表示する
    print(node.boundary_points())


## ビットマップデータの逆解析について

未執筆
