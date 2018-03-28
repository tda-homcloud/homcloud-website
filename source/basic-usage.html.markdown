---
title: 基本的な使い方
lang: ja
---
{::options parse_block_html="true" /}

# HomCloudの基本的な使い方

ここでは、

* [3次元点集合データ(ポイントクラウド)](#pointcloud)
* [白黒画像](#binary-image)
* [グレイスケール画像](#grayscale-image)

を解析する場合についてチュートリアル的に解説します。

<div class="guide">
## <a name="pointcloud"> 3次元点集合データ(ポイントクラウド)の解析

この文章で解説するのは

1. 3次元の点データからパーシステント図を計算する
2. その図をパラメータを変えながら可視化する
3. テキストデータにbirth-death pairを出力する
4. 基本的な逆解析(birth simplex, death simplexの出力)を行う

の4つです。ここまではおよそどのようなポイントクラウドデータでも
共通ですので、ここまでできるようになると良いでしょう。

### パーシステント図の計算 

まず、[pointcloud-example.zip](download/pointcloud-example.zip)をダウンロードし、
zipファイルを展開してください。すると `pointcloud` というディレクトリができますので、
ターミナルから `cd` コマンドでこのディレクトリに移動します。

ディレクトリには `pointcloud.txt` というファイルがあります。これは
[-1, 1]×[-1, 1]×[-1, 1]の立方体領域に
一様ランダムに点を5000個撒き散らしたものです。これを解析してみましょう。

まず最初に、

    python3 -m homcloud.pc2diphacomplex -I -D -d 3 pointcloud.txt pointcloud.idiagram
    
とします。すると pointcloud.idiagram というファイルが生成されます。これが
パーシステント図の情報を収めたファイルです。`-d 3`というのが入力データの次元
(ここでは3)で、`pointcloud.txt` で入力データを、`pointcloud.idiagram`で出力データを
指定します。`-I`, `-D`というのはHomCloudの便利機能を有効にするもので常に指定しておくと
良いです。

### パーシステント図の可視化

次に、ここからパーシステント図をプロットしてみましょう。

    python3 -m homcloud.plot_diagram -d 1 pointcloud.idiagram
    
とします。ここで`-d 1`というのは1次のパーシステント図(つまりリングの情報)を
可視化することを意味します。`-d 2`とすると1次のパーシステント図(つまり空隙の情報)を
可視化します。すると以下のような画像が表示されます。

![PD1 pointcloud](images/pointcloud-pd1-1.png){: width="256"}

左下のほうに何かちょっと見えてあとは何も見えません。というのは
このデータは左下のほうにデータ(birth-death pair)が偏っているからです。
そこで色付けを log scale にしましょう。`-l` オプションを使います。

    python3 -m homcloud.plot_diagram -d 1 -l pointcloud.idiagram

すると以下のような図が表示されます。

![PD1 pointcloud logscale](images/pointcloud-pd1-2.png){: width="256"}

基本的にはパーシステント図の点は対角線から離れるほど「意味のある」リング構造と対応し、
またY軸が大きい値になるほど大きなリング構造を表しています。
つまり(0.5, 0.7)のあたりにある点がこのランダムな点がなすリング構造のなかで最も
ちゃんとしたリング構造を持っているものと対応していると言えそうです。

ここで注意しておくと、パーシステント図のX、Y軸は点に貼り付ける球の半径と対応していると
よくある教科書には書かれています。HomCloudでは実はこれは半径の2乗が使われています。
つまり√0.5≒0.7と√0.7≒0.84が実際の半径になります。これは主には内部のアルゴリズムの都合に
よるものですが、各点に重みづけをしたときにはこのほうが自然に見えるという事情もあり、
HomCloudでは2乗の値が使われます。これを止めたいときはパーシステント図を
`homcloud.pc2diphacomplex` で計算するときに `--no-square` オプションを付けると
半径パラメータそのものがX、Y軸に現れます。

さて、次にbirth-death pairが集中している
左下の 0.0〜0.1 のあたりを拡大して調べてみましょう。デフォルトでは
すべてのbirth-death pairが含まれるような範囲でプロットするので、これを変更します。
このときは以下のようなコマンドを使います。

    python3 -m homcloud.plot_diagram -d 1 -l -x "[0:0.1]" pointcloud.idiagram
    
`-x`オプションで範囲を指定します。以下のような図が表示されるでしょう。
もちろん一様ランダムデータですので意味のあるリング構造があるわけでは
ないのですが、一様ランダムだとこういうヒストグラムの分布が見えるんだなあ、というのは
知っておくと役に立ちます。

![PD1 pointcloud zoomup](images/pointcloud-pd1-zoomup.png){: width="256"}

`-X`オプションで解像度を変えることができます。デフォルトでは
128x128でヒストグラムを描きますが、もっと細かく256x256にしてみましょう。
以下のコマンドです。

    python3 -m homcloud.plot_diagram -d 1 -l -x "[0:0.1]" -X 256 pointcloud.idiagram

![PD1 pointcloud zoomup 256x256](images/pointcloud-pd1-zoomup-fine.png){: width="256"}

これらの画像を保存するのには、表示されたウィンドウにあるフロッピーディスクの
アイコンをクリックします。ただ、これだと何枚も画像を保存したいときには
不便なのでターミナルのコマンドラインからウィンドウを出さずに保存する方法を
覚えましょう。`-o`オプションです。

    python3 -m homcloud.plot_diagram -d 1 -l -x "[0:0.1]" -X 256 pointcloud.idiagram -o pointcloud-pd1.png
    
これで`pointcloud-pd1.png`というファイルに保存されます。

### テキストデータでの解析
次にパーシステント図をテキストデータとして出力してみましょう。
計算したパーシステント図をさらに統計処理したい、といった場合には
テキスト出力をしてそれを使うのが手軽です。以下のコマンドです。

    python3 -m homcloud.diagram_to_text -d 1 pointcloud.idiagram
    
すると2列の数値データが出力されます。これは1次のbirth-death pairすべてを列挙していて、
左側の数値がbirth time、右側の数値がdeath timeです。これも
半径の2乗の値が出力されます。`-d 1`の所を`-d 2`にすると2次のbirth death pairが
出力されます。

さて、実際に利用するときにはファイルに保存したいでしょうから、`-o`オプションを使って
やってみましょう。

    python3 -m homcloud.diagram_to_text -d 1 pointcloud.idiagram -o pointcloud-pd1.txt

すると pointcloud-pd1.txt に1次のbirth-death pairの情報がテキストで保存されます。

### 簡単な逆解析について

パーシステント図の個々の点は何らかの意味で元のポイントクラウドのリング構造、空隙構造と
対応しているはずです。しかしそれがどのようなものであるのかを特定するのは実は
そんなに簡単ではないです。このような解析を逆解析と呼びます。HomCloudの
基本的な逆解析のツールであるbirth simplex、death simplexというものを使ってみましょう
(実はもっと強力な逆解析のツールもあるのですが、そちらは homcloud-advanced のほうに
含まれています)。birth/death simplexについては
[大林のサーベイ論文](https://doi.org/10.11540/bjsiam.26.4_7)が理解に有用です。
これには`homcloud.diagram_to_text`の`-S`オプションを使います。

    python3 -m homcloud.diagram_to_text -d 1 -S yes pointcloud.idiagram

すると以下のようなテキストデータが出力されます。

    0.0005037159143533377 0.0005579705552885796 {(0.957826751985,-1.02576376749,0.584557432918),(0.950995498828,-1.00684503611,0.544429148124)} {(0.957826751985,-1.02576376749,0.584557432918),(0.950995498828,-1.00684503611,0.544429148124),(0.949185316562,-1.0446271794,0.553072016288)}
    0.0009259080093991961 0.0009586588306071996 {(-0.339241447596,0.193383603721,0.0879432393893),(-0.285082787425,0.181717125153,0.113129839874)} {(-0.339241447596,0.193383603721,0.0879432393893),(-0.285082787425,0.181717125153,0.113129839874),(-0.340910140206,0.168486056354,0.0955091671374)}
      :
      
これの最初の2列はbirth time、death timeです。次の2つの列
(よく見ると、`{...} {...}`という形をしています)
がそれぞれbirth simplex、death simplexです。
これの最初の行は(0.0005037159143533377, 0.0005579705552885796)というbirth death pairに
対応するリング構造は、

    (0.957826751985,-1.02576376749,0.584557432918)
    (0.950995498828,-1.00684503611,0.544429148124)

の2つの点を結んだ辺が「現れた」タイミングで生じ、

    (0.957826751985,-1.02576376749,0.584557432918)
    (0.950995498828,-1.00684503611,0.544429148124)
    (0.949185316562,-1.0446271794,0.553072016288)
    
の3つの点を頂点とする3角形が「現れた」タイミングで消えたことを意味します。
上で上げたサーベイ論文が理解の助けになるでしょう。特に実際的なデータ解析では
death simplexのほうが重要です。death simplexの重心あたりがリング構造の
中心になることが多いと考えられるためです。この出力結果は`-o`オプションで
ファイルに保存できますのでそれをさらに解析することでリングの空間分布を調べる
ようなこともできます。

同じディレクトリにある`run.sh`は上で解説した
ことをまとめたシェルスクリプトです。これを動かすと上の計算が一通り行われ、いくつかの
画像やテキストファイルが出力されます。何か自分のデータを解析したい場合には
これを改造して使うとよいかもしれません。

以上で基本的な使い方の説明は終わりです。
</div>

<div class="guide">
## <a name="binary-image"> 白黒画像の解析

ここでは白黒の画像をパーシステントホモロジーで解析します。
ここで解説する内容は以下の通りです。

1. 画像からパーシステント図を計算する
2. その図をパラメータを変えながら可視化する
3. テキストデータにbirth-death pairを出力する
4. 基本的な逆解析(birth pixle, death pixelの出力)を行う

基本的にやっていることは、与えられた白黒画像の黒い領域を
膨らませたり萎ませたりして島や穴の生成と消滅を調べています。
https://arxiv.org/abs/1706.10082 の論文の2.3節、特にFig.2が参考になるでしょう。


### パーシステント図の計算
まず、[binary-image-example.zip](download/binary-image-example.zip)をダウンロードし、
zipファイルを展開してください。すると `binary-image` というディレクトリができますので、
ターミナルから `cd` コマンドでこのディレクトリに移動します。

ディレクトリには `binary-image.png` というファイルがあります。以下のような画像です。
これを解析してみましょう。

![入力画像](images/binary-image.png){: width="256"}

まず最初に、

    python3 -m homcloud.pict.binarize_nd -T picture2d -m black-base -t 128 -I -D -s -o binary-image.idiagram binary-image.png
    
とします。すると `binary-image.idiagram` というファイルが生成されます。これが
パーシステント図の情報を収めたファイルです。

* `-T picture2d` というので入力データが2次元画像であることを指定
  * 他にもテキストデータ(`text2d`)やnumpyのnpyやnpz(`npy`)などのフォーマットが指定できます。
* `-m black-base` というので黒の領域に注目することを指定
* `-t 128` というので白黒の閾値を128に決める(この入力画像では黒=0、白=255なのでどんな値でも
  あまり問題にはなりません)
* `-I -D` はHomCloudの便利機能を有効にするもので常に指定しておくと良いです
* `-o binary-image.idiagram`で出力ファイルを指定
* `-s` で画像が縮んでいくのと広がっていくのと両方を考慮することを指定(これは
  白黒画像の解析では常に有効にしておいて良いでしょう)

という意味です。

## パーシステント図の可視化

次に計算結果の0次のパーシステント図、つまり連結成分、島構造、を可視化しましょう。
上の計算で`-m black-base`と指定したので黒の島構造に注目します。

    python3 -m homcloud.plot_diagram -d 0 -l binary-image.idiagram

と指定します。`-d 0`で0次であることを、`-l`でヒストグラムの色付けを
log scaleにすることを指定します。このあたりは pointcloud での場合と同じです。
すると以下のような図が表示されます。

![PD0 binary image](images/binary-image-pd0-1.png){: width="256"}

何か小さい点が図の上にぽうぽつと現れます。実はbirth time、death timeは
この画像解析ルールだと整数の値しかとりません。デフォルトのヒストグラムは
128x128で計算しますから、これは細かすぎるのです。またこの図からすべての
birth time, death timeは-20〜+7 くらいの範囲にあることがわかりますので、
これらをうまく表示されるようにプロットの領域や解像度を調整します。そこで
次のようにしてみましょう。

    python3 -m homcloud.plot_diagram -d 0 -l -x "[-20.5:7.5]" -X 28 binary-image.idiagram

`-x "[-20.5:7.5]"`でプロットする範囲を -20.5 から 7.5 に、
ヒストグラムの分割を28x28に指定します。birth time、death timeは整数値なので、
ヒストグラムの各ビンの中心が整数になるように、±0.5の余裕を取るようにしています。
これで以下の図が得られます。

![PD0 binary image](images/binary-image-pd0-2.png){: width="256"}

これを画像に保存するのも、フロッピーのアイコンをクリックするか、以下のように
`-o`オプションを使うかでできます。

    python3 -m homcloud.plot_diagram -d 0 -l -x "[-20.5:7.5]" -X 28 binary-image.idiagram -o binary-image-pd0.png
    
### テキストファイルへの出力

ここはポイントクラウドの場合と同じです。つまり

    python3 -m homcloud.diagram_to_text -d 0 binary-image.idiagram -o binary-image-pd0.txt
    
とすると、以下のようなテキストが`binary-image-pd0.txt`に保存されます。

    -19 inf
    -19 -18
    -18 -17
    -18 -17
    -18 -17
        :
        
この一番最初の行は death time が+∞であるようなbirth death pairです。
これはある意味で0次のパーシステントホモロジー特有のもので、最初に生まれて
最後まで生き延びる島を表現しています。データ解析をするにあたっては
これは特別扱いする必要があるので気をつけてください。

### 逆解析(birth pixel, death pixel)

さて、上のパーシステント図を見ると(-5,-4)の所に何かbirth death pairが
集中しているようです。これが何か調べてみましょう。HomCloudのbirth pixel、
death pixel出力機能を使ってみましょう。これは島(連結成分)が生まれた/死んだ
ときのピクセルの位置を出力するものです。birth/death pixelについて詳しくは
https://arxiv.org/abs/1706.10082 の論文の2.3節、特にFig.2が参考になる
と思います(この論文ではbirth/death positionという名前で呼んでいます)。
birth/death positionを出力するには以下のコマンドをターミナルから実行します。
`-S yes`によって出力をonにします。

    python3 -m homcloud.diagram_to_text -d 0 -S yes binary-image.idiagram

とすると、以下のようなデータが出力されます。

    -19 -18 (57,121) (56,121)
    -18 -17 (46,111) (53,119)
    -18 -17 (47,112) (46,112)
    -18 -17 (48,113) (47,113)
          :

これは各行、1列目がbirth time、2列目がdeath time、3列目が
birth pixelの座標、4列目がdeath pixelの座標です。
ここで注意すべきは、座標は(y,x)の順に並んでいるということです。
これはHomCloudの仕様の問題ですが、全体の整合性を保つためどうしても
こうなっているので気を付けてください。

さて、ここから(-5,-4)に対応するものだけを取り出しましょう。パイプ機能と
grepというコマンドを利用すると必要なものだけ取り出せます(grepについて詳しくはご自分で
勉強してください)。

    python3 -m homcloud.diagram_to_text -d 0 -S yes binary-image.idiagram | grep "^-5 -4"
    
すると以下のような出力がされます。

    -5 -4 (9,35) (8,35)
    -5 -4 (10,36) (9,36)
    -5 -4 (11,37) (10,37)
    -5 -4 (18,45) (17,45)
    -5 -4 (19,46) (18,46)
    -5 -4 (20,48) (19,48)
    -5 -4 (21,49) (20,49)
    -5 -4 (25,103) (24,103)
        :
        
うまく行っているようです。0次のパーシステントホモロジーの場合には
birth pixelのほうが重要です(その構造の中心におよそ対応します)。
そこでこのピクセルを入力画像の上に表示してみましょう。
同じディレクトルに入っている `plot_birth_pixel.py` でその機能を実装しています。
次のようにやってみましょう。

    python3 -m homcloud.diagram_to_text -d 0 -S yes binary-image.idiagram -o binary-image-bdpixels.txt
    python3 plot_birth_pixel.py -5 -4 binary-image-bdpixels.txt binary-image.png binary-image-birth-pixels.png

以下のような結果が得られます。

![binary image birth pixels](images/binary-image-birth-pixels.png){: width="256"}

黒い道路状の部分に赤い点が表示されています。これは(-5, -4)というのは
幅の1/2が5ピクセルくらいの道状の形状に対応していることを意味しています。

もしもっと色々なことをこのbirth/death pixelを用いてしたいときは、
plot_birth_pixel.py を参考にしてご自分でプログラミングをしてください。
もしくは `homcloud-advanced` には同じようなことをより高度に実現する
プログラムがあります。

以上で白黒画像解析の解説は終わりです。

</div>

<div class="guide">
## <a name="grayscale-image"> グレイスケール画像の解析

ここではグレイスケール画像をパーシステントホモロジーで解析します。
ここで解説する内容は以下の通りです。白黒画像との共通点は非常に多いです。

1. 画像からパーシステント図を計算する
2. その図を可視化する
3. テキストデータにbirth-death pairを出力する
4. 基本的な逆解析(birth pixle, death pixelの出力)を行う

ここでは入力データとしてはテキストデータを使いますが、
普通の画像でも基本は同じです。

注: この解析は HomCloud 1.1.0 が必要です。

### データの基本的な情報を調べる
まず、[grayscale-example.zip](download/grayscale-example.zip)をダウンロードし、
zipファイルを展開してください。すると `grayscale-image` というディレクトリができますので、
ターミナルから `cd` コマンドでこのディレクトリに移動します。

ディレクトリには `grayscale.txt` というファイルがあります。数値が2次元に200x200で並んでいます。これを解析してみましょう。

パーシステント図を計算する前に、このデータの基本的な情報を調べていきましょう。
ここでは `python` というプログラミング言語を使って解析をします。
特に `ipython` というツールを使います。データ解析をする際には基本的なプログラミングは
必須なので適当に勉強してください。

    ipython3

でプログラムを起動します。

    Python 3.5.3 (default, Jan 19 2017, 14:11:04) 
    Type "copyright", "credits" or "license" for more information.

    IPython 5.1.0 -- An enhanced Interactive Python.
    ?         -> Introduction and overview of IPython's features.
    %quickref -> Quick reference.
    help      -> Python's own help system.
    object?   -> Details about 'object', use 'object??' for extra details.

    In [1]: 

のように表示されればOKです。まずはテキストデータを読み込みます。

    import numpy as np
    pict = np.loadtxt("grayscale.txt")
    
で読み込みます。まずこれを画像として表示します。

    import scipy.misc
    scipy.misc.imshow(pict)
    
で以下のような画像が表示されるでしょう。

![grayscale picture](images/grayscale.png){: width="256"}

次に画素値の分布を調べましょう。`#`から先は入力しなくて良いです。

    np.max(pict) # => 3.72602997298875
    np.min(pict) # => -1.8280215091732186
    np.mean(pict) # => -6.821210263296961e-17
    np.std(pict) # => 1.0

データの範囲はこの領域にあるようです。次にヒストグラムを表示しましょう。

    import matplotlib.pyplot as plt
    plt.hist(pict, range=(-4, 4))
    plt.show()

次のようなヒストグラムが得られます。

![grayscale histogram](images/grayscale-hist.png){: width="256"}

複数のピークが見えています。まったく値がない領域があり
ちょっと不自然にも見えますがこれは人工的にデータを作ったせいなので
あまり気にする必要はありません。

一通り見たので、ipython を終了させます。`exit`と打って改行すると終了します。

### パーシステント図の計算

パーシステント図の計算は

    python3 -m homcloud.pict.pixel_levelset_nd -m superlevel -T text2d -I -D grayscale.txt -o grayscale.idiagram
    
とします。`grayscale.idiagram`というファイルが生成されます。
これがパーシステント図の情報を収めたファイルです。

* `-m superlevel` はスーパーレベルフィルトレーションを使うことを意味します。`-m sublevel`とするとサブレベルフィルトレーションを代わりに使います。
* `-T text2d` で入力データがテキストデータの2次元画像であることを指定します。白黒の場合と同じで二次元画像(`picture2d`)やnumpyのnpyやnpz(`npy`)などのフォーマットが指定できます。
* `-I -D` はHomCloudの便利機能を有効にするもので常に指定しておくと良いです
* `-o grayscale.idiagram` で出力ファイルを指定します。

ここでちょっと注意しておくと、スーパーレベルフィルトレーションの計算は
単純に各ピクセル値の符号を反転させてサブレベルフィルトレーションを計算しています。
そのため後で符号を反転させたりする必要がある場合があります。詳しくは可視化の
所で説明します。

### パーシステント図の可視化

次に計算結果の0次のパーシステント図、つまり連結成分、島構造、を可視化しましょう。
スーパーレベルを使っているので、値の高い部分、つまり白色のピークの構造などが捉えられます。

    python3 -m homcloud.plot_diagram -d 0 -l grayscale.idiagram
    
で以下のような図が表示されます。

![grayscale PD0](images/grayscale-superlevel-0.png){: width="256"}

ちょっとヒストグラムのグリッドが細かすぎてわかりにくいようです(デフォルトは
128x128です)。グリッドを荒くしましょう。

    python3 -m homcloud.plot_diagram -d 0 -l -X 64 grayscale.idiagram

![grayscale PD0](images/grayscale-superlevel-0-1.png){: width="256"}

この図ではbirth-death pairは図の右下のほうに来ています。
通常は birth < death なので左上のほうに現れるのですが、
スーパーレベルフィルトレーションを使うということは閾値を大きいほうから
小さいほうに下げていく過程での島の生成と消滅を見ているので
birth のほうが閾値では大きくなるのです。

練習問題: birth-death pairは[0,1.5]x[0,1.5]のあたりに多く分布しているようです。
このあたりを拡大して表示しましょう。また、その画像をファイルに保存しましょう。

### テキストファイルへの出力

これはどの入力データでも同じです。

    python3 -m homcloud.diagram_to_text -d 0 grayscale.idiagram -o grayscale-superlevel-0.txt
    
とすると、以下のようなテキストが`grayscale-superlevel-0.txt`に保存されます。

    3.72602997298875 -inf
    3.72049834765332 3.7197502020373268
    3.7163519029875003 3.7158144776672444
    3.621999565745782 3.613981730748671
    1.2988804792640827 0.2385550375924738
        :
        
1列目がbirth time、2列目がdeath timeです。
このデータからも birth > death となっていることがわかります。
この一番最初の行は death time が-∞であるようなbirth death pairです。
これは白黒の場合と同じ、
0次のパーシステントホモロジー特有のもので、最初に生まれて
最後まで生き延びる島を表現しています。上から閾値を変えるので
「最後まで生き延びる=-∞」となります。
データ解析をするにあたっては
これは特別扱いする必要があるので気をつけてください。

### 逆解析(birth pixel, death pixel)

対角線から離れた birth-death pairが重要な構造を表現しているわけなので、上で
見たパーシステント図から、death - birth < -0.3 となるような点の
由来を元データに戻って調べてみることにしましょう。下図の
丸を付けたものです。

逆解析の手法も基本的には白黒画像の場合と同じです。
HomCloudのbirth pixel、death pixel出力機能を使います。島(連結成分)が生まれた/死んだ
ときのピクセルの位置を出力します。

    python3 -m homcloud.diagram_to_text -d 0 -S yes grayscale.idiagram

以下のようなテキストが出力されます。

    3.72049834765332 3.7197502020373268 (92,195) (92,196)
    3.7163519029875003 3.7158144776672444 (94,194) (93,194)
    3.621999565745782 3.613981730748671 (94,186) (94,188)
    1.2988804792640827 0.2385550375924738 (199,56) (182,85)
    1.2152244583757872 0.7406097154584625 (86,100) (96,134)

1列目がbirth time、2列目death time、3列目がbirth pixel、4列目がdeath pixelです。
0次のパーシステントホモロジーの場合、birth pixelがその島のピーク位置になるので
重要です。つまり3列目ですね。これを可視化してみましょう。
このピクセルを入力画像の上に表示してみます。
同じディレクトルに入っている `plot_birth_pixel.py` でその機能を実装しています。
次のようにやってみましょう。

    python3 -m homcloud.diagram_to_text -d 0 -S yes grayscale.idiagram -o grayscale-bdpixels.txt
    python3 plot_birth_pixel.py grayscale-bdpixels.txt grayscale.txt grayscale-birth-pixels.png

以下のような画像が`grayscale-birth-pixels.png`に出力されます。
赤い丸がbirth pixelの位置です。

![grayscale birth pixels](images/grayscale-birth-pixels.png){: width=256}

画像の特徴的な白のピーク位置が捉えられています。では一番のピークの
位置はどうなっているのでしょう？実はこれはdeath timeが-∞となるものと対応しています。
そしてdeath timeが-∞のものに関してはbirth/death pixelが出力されていないので
こうなっています。

グレイスケール画像の解析はここまででとりあえず完了です。
ここまでの内容は 同じディレクトリの `run.sh` に含まれています。
自分のデータを使って解析したい場合にはこのシェルスクリプトを改造して
いくとよいかもしれません。

また、同じような画像をランダム生成する generate.py、
ヒストグラムを描画する histogram.py、
テキストデータから画像を生成する show.py などのプログラムもあります。
ここまでで説明したものと同じ内容ですが、参考にしてください。

</div>


