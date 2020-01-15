---
title: "CLI documents"
lang: "ja"
---

# コマンドリファレンス (Ver.1.1.1以降)

### 使い方

homcloud の各プログラムは

	python3 -m homcloud.****

のように python のモジュールとして実行します。

上の `python3 -m` を使うことで全てのOSで共通のpythonスクリプトからの呼び出しとして使うことができます。
Linux や MacOS 版では `homcloud-****` のような形でシェルコマンドとしても実行できます。

- TOC
{:toc}

- - -

<<<<<<< HEAD
## [base] diagram-to-text
=======
## birth_death_area

birth-death-area - birth-death-areas を探し、可視化します。

### 書式

    python3 -m homcloud.birth_death_area
                                 [-h] [-V] -d DEGREE -x X_RANGE -y Y_RANGE
                                 [-o OUTPUT] [-a ALGORITHM]
                                 [-O DRAW_OUTLINE_ONLY]
                                 [-B DRAW_BIRTH_SIMPLICES]
                                 [-D DRAW_DEATH_SIMPLICES]
                                 input

### エイリアス

    homcloud-birth-death-area

### 解説

このプログラムは birth-death-areas の対を X_RANGE と Y_RANGE の範囲から探します。

<<<<<<< HEAD
もし -o オプションが与えられれば、vtk ファイルが出力されます。
-o オプションが与えられなければ、paraview によって結果が表示されます。
=======
もし -o オプションが与えられれば、 vtk ファイルが出力されます。
-o オプションが与えられなければ、 paraview によって結果が表示されます。
>>>>>>> e3a9292bbb0b54bfd25d1b919921d8060da942aa

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE
<<<<<<< HEAD
                          PHの次数
=======
                          ホモロジーの字数 (デフォルト: 1)
>>>>>>> e3a9292bbb0b54bfd25d1b919921d8060da942aa
    -x X_RANGE, --x-range X_RANGE
                          birth range
    -y Y_RANGE, --y-range Y_RANGE
                          death range
    -o OUTPUT, --output OUTPUT
                          出力ファイルのパス
    -a ALGORITHM, --algorithm ALGORITHM
                          アルゴリズム
    -O DRAW_OUTLINE_ONLY, --draw-outline-only DRAW_OUTLINE_ONLY
                          draw outline only (True/False, default: True)
    -B DRAW_BIRTH_SIMPLICES, --draw-birth-simplices DRAW_BIRTH_SIMPLICES
                          draw birth simplices (True/False, default: True)
    -D DRAW_DEATH_SIMPLICES, --draw-death-simplices DRAW_DEATH_SIMPLICES
                          --draw death simplices (True/False, default: True)

### 例

    python3 -m homcloud.pc2diphacomplex -d 3 -I -D points3d.txt points3d.idiagram
    python3 -m homcloud.birth_death_area -d 2 -x "[4.5:5.8]" -y "[6:7]" points3d.idiagram

- - -
[このページのトップへ戻る](#section)

- - -

## diagram-to-text
>>>>>>> remotes/origin/edit_example

ダイアグラムをテキストに変換します。

### 書式

    python3 -m homcloud.diagram_to_text [-h] [-V] -d DEGREE [-S SHOW_BIRTHDEATH_INFO]
                                        [-o OUTPUT]
                                        input

### エイリアス

    homcloud-diagram-to-text

### 解説

### オプション

    -h, --help          ヘルプを表示し、終了する
    -V, --version       バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE ホモロジーの字数 (デフォルト: 1)
    -S SHOW_SIMPLICES, --show-simplices SHOW_SIMPLICES
                        birth/death を与える単体を表示します。(yes/no, デフォルト:yes)
			(ノート: もしyesの場合、essentialなbirth-death pairは無視される)  
    -o OUTPUT, --output OUTPUT
                        出力ファイル

### 例

    python3 -m homcloud.diagram_to_text -d 1 -S  yes -o tmp.txt output.idiagram    

- - -
[このページのトップへ戻る](#section)

- - -


## [base] dipha

dipha - diphaを呼び出します。

### 書式

    python3 -m homcloud.dipha
            [-h] [-T TYPE] [-n PARALLELS] input output

### エイリアス

    homcloud-dipha

### 解説

このプログラムは dipha コマンドのラッパーとして動作します。
主に index-combined data に対して使われます。

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -T TYPE, --type TYPE  input type (dipha, idipha)
    -n PARALLELS, --parallels PARALLELS
                          並列して計算する数 (デフォルトは1)
    -d, --dual            dual algorithmを使う


### 例

    python3 -m homcloud.dipha -T idipha -n 2 input.idiagram output.icomplex

- - -
[このページのトップへ戻る](#section)

- - -


## [advanced] dump_diagram

dump_diagram - birth-death-pairs を表示します。

### 書式

    python3 -m homcloud.dump_diagram
            [-h] [-d DEGREE] [-T TYPE] [-o output] input [input ...]


### エイリアス

    homcloud-dump-diagram

### 解説

このプログラムは birth-death-pairs をコンソールへ出力します。

もし、-o オプションが与えられれば、結果はファイルに出力されます。

もし入力データが index-map の情報を持っていれば、birth/death を与える単体が表示されます。

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE
                          ホモロジーの字数 (デフォルト: 1)
    -T TYPE, --type TYPE  入力ファイルの書式 (dipha(デフォルト), idipha)
    -N, --negate          birth/death 時間の符号を反転し、superleve persistence を出力する (デフォルト: False)
    -o OUTPUT, --output OUTPUT
                          出力テキストファイル名
    -S SHOW_SIMPLICES, --show-simplices SHOW_SIMPLICES
                          birth/death を与える単体を表示します。(yes/no, デフォルト:yes)

### 出力形式

#### INDEX-MAP がない場合

birth time は第一列、death time は第二列に表示されます。
列の間はスペースで分けられています。

##### 例:
    b1 d1
    b2 d2
      :

#### CUBICAL FILTRATION についての INDEX-MAP の場合

<<<<<<< HEAD
Birth times are shown on the 1st column, 
death times are shown on the 2nd column,
positions of birth pixels are shown on the 3rd column, and
positions of death pixels are shown on the 4th column.
The columns are separated by a space.

=======
>>>>>>> e3a9292bbb0b54bfd25d1b919921d8060da942aa
birth time は第一列、death time は第二列に表示されます。
birth pixel の位置は第三列、death pixel の位置は第四列に表示されます。
列の間はスペースで分けられています。

##### 例:

    b1 d1 (x_b1,y_b1) (x_d1,y_d2)
    b2 d2 (x_b2,y_b2) (x_d2,y_d2)
        :

#### ALPHA FILTRATION についての INDEX-MAP の場合

birth time は第一列、death time は第二列に表示されます。
birth を与える単体の頂点は第三列、death を与える単体の頂点は第四列に表示されます。
列の間はスペースで分けられています。

##### 例:

    b1 d1 {(x_b11,y_b11,z_b11),(x_b12,y_b12,z_b12)} {(x_d11,y_d11,z_d11),(x_d12,y_d12,z_d12),(x_d13,y_d13,z_d13)}
    b2 d2 {(x_b21,y_b21,z_b21),(x_b22,y_b22,z_b22)} {(x_d21,y_d21,z_d21),(x_d22,y_d22,z_d22),(x_d23,y_d23,z_d23)}
        :

- - -
[このページのトップへ戻る](#section)

- - -

## [advanced] full-ph-tree

全PHツリーを計算します。

### 書式

    python3 -m homcloud.full_ph_tree
			[-h] [-V] -d DEGREE [-j DUMP_JSON] input output

### エイリアス

    homcloud-full-ph-tree

### 解説

全PHツリーを計算します。

### オプション

    -h, --help          ヘルプを表示し、終了する
    -V, --version       バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE
<<<<<<< HEAD
                        PHの次数
=======
                        ホモロジーの字数 (デフォルト: 1)
>>>>>>> e3a9292bbb0b54bfd25d1b919921d8060da942aa
    -j DUMP_JSON, --dump-json DUMP_JSON
                        jsonへダンプ出力する。

### 例

    python3 -m homcloud.full_ph_tree -d 2 output.idiagram output.2.pht -j output-tree.2.json


- - -
[このページのトップへ戻る](#section)

- - -

## [advanced] optimal-cycle

pmaxsat による optimal-cycle を計算します。

### 書式

    usage: homcloud-optimal-cycle [-h] [-V] -d DEGREE [-x X] [-y Y] [-X X_RANGE]
                                  [-Y Y_RANGE] [-c CUTOFF_RADIUS] [-T TYPE]
                                  [-j JSON_OUTPUT] [-v VTK_OUTPUT] [-P] [-n RETRY]
                                  [-C OPTIMAL_CYCLE_CHILDREN]
                                  [--integer-programming INTEGER_PROGRAMMING]
                                  [--debug DEBUG] [--solver SOLVER]
                                  [--constrain-on-birth-simplex]
                                  [--skip-infeasible SKIP_INFEASIBLE]
                                  input

### エイリアス

    homcloud-optimal-cycle

### 解説

### オプション

    -h, --help          ヘルプを表示し、終了する
    -V, --version       バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE
                        ホモロジーの字数 (デフォルト: 1)
    -x X                birth/death ペアの生成時刻
    -y Y                birth/death ペアの消滅時刻
    -X X_RANGE, --x-range X_RANGE
                        ペアの生成時刻
    -Y Y_RANGE, --y-range Y_RANGE
                        ペアの消滅時刻
    -c CUTOFF_RADIUS, --cutoff-radius CUTOFF_RADIUS
                        R^n でのカットオフ半径
    -T TYPE, --type TYPE  optimal cycle のタイプ (現在は volume のみ)
    -j DUMP_JSON, --dump-json DUMP_JSON
                        json へダンプ出力する
    -v VTK_OUTPUT, --vtk-output VTK_OUTPUT
                        vtk へダンプ出力する
    -P, --invoke-paraview
                        paraview を起動して可視化する
    -n RETRY, --retry RETRY
                        リトライの回数
    -C OPTIMAL_CYCLE_CHILDREN, --optimal-cycle-children OPTIMAL_CYCLE_CHILDREN
    --integer-programming INTEGER_PROGRAMMING
                        use integer programming (on/*off*)
    --debug DEBUG       デバッグモード (on/*off*)
    --solver SOLVER     LP solver
    --constrain-on-birth-simplex
                        constrain on the birth simplex
    --skip-infeasible SKIP_INFEASIBLE
                        skip infeasible (on/*off*)

### 例

    python3 -m homcloud.optimal_cycle -d 1 -X 0.2:0.25 -Y 0.35:0.4 -j optimal-cycles.json -c 1.0 -n 3 output.idiagram

- - -
[このページのトップへ戻る](#section)

- - -


## [base] pc2diphacomplex

pc2diphacomplex - point clouds から dipha のためのアルファ複体のフィルトレーションを作成します。

### 書式

    python3 -m homcloud.pc2diphacomplex
            [-h] [-t TYPE] [-n NOISE] 
            [-d DIMENSION] [-w] [--no-square] [-I]
            INPUT OUTPUT

### エイリアス

    homcloud-pc2diphacomplex

### 解説

このプログラムは dipha のための（重み付き）アルファ複体のフィルトレーションを（重み付き）point clouds から計算します。

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -t TYPE, --type TYPE  入力ファイルの書式
    -n NOISE, --noise NOISE
                          付加ノイズレベル
    -d DIMENSION, --dimension DIMENSION
                          入力ファイルの次元
    -w, --weighted        重み付きアルファ複体の filtration を使う
    --no-square           出力値を 1/2 乗する （birth を与える半径 r が負の時は -sqrt(abs(r)) を出力する）
    --square              出力値を 2 乗する （birth を与える半径 r が負の時は -sqrt(abs(r)) を出力する）
    -I, --combine-index-map
                          出力する filtration でインデックスマップを結合する
    -D, --convert-to-diagram
                          dipha を呼び出し、直接パーシステント図へ変換する
    -P, --partial-filtration
			  partial filtration を計算する (relative homology)
    -A, --check-acyclicity
                          paritial filtration のためにacyclicityをチェックする

### 入力ファイルの書式

使用するアルファ複体のフィルトレーションは、重み付きでも重み無しでも扱えます。

重み無し 3 次元 point cloud の場合の入力:

    # A line starting with sharp sign is ignored
    x_1 y_1 z_1
    x_2 y_2 z_2
    :

二次元ポイントクラウドデータを使うこともできます:

    x_1 y_1
    x_2 y_2
      :

重み付き 3 次元 point cloud の場合の入力:

    x_1 y_1 z_1 w_1
    x_2 y_2 z_2 w_2
       :

重みは ２ 乗の値を使ってください(例えば、ファンデルワールス半径の 2 乗を与えて下さい)。
\# から始まる行は無視されます。

現在、cgal の制約より、二次元重み付きアルファ複体はサポートしていません。

### 出力ファイル

出力ファイルの書式は dipha の WEIGHTED_BOUNDARY_MATRIX です。
詳しくは <https://github.com/DIPHA/dipha#file-formats> をご覧ください。

もし、オプション `-I` が与えられた場合は、いくつかの付加データが msgpack によって dipha の `WEIGHTED_BOUNDARY_MATRIX` へ追加されます

もし、`-D` オプションが与えられたら、出力ファイルは boundary matrix data ではなく、diagram data です。
この場合、パーシステント図が boundary matrix から計算されます。
もし`-I` オプションが与えられなければ、dipha のダイアグラムファイルが書き出され、
`-I` オプションが与えられれば、 indexed-diagram ファイル( idiagram ファイル)が書き出されます。

- - -
[このページのトップへ戻る](#section)

- - -


## [base] pict_binarize

`pict.binarize-dipha` のための二次元の cubical filtration 二値画像から作成されます。

### 書式

    python3 -m homcloud.pict.binarize [-h] [-V] [-m MODE] [-t THRESHOLD] [--gt GT]
                                      [--lt LT] [-T TYPE] [--metric METRIC] [-I] [-s]
                                      [-w WEIGHT] [-a ANGLE] [-M MASK] [-D]
                                      input output  

### エイリアス

    homcloud-pict-binarize

### 解説

このプログラムはデジタル画像データから dipha のための cubical filtration を計算します。

入力画像は閾値が与えられた二値画像です。
黒の領域からの市街地距離(マンハッタン距離)がそれぞれの白ピクセルに割り当てられます。
もし `-m` オプションが与えられたら、白い領域から (-distance + 1) がそれぞれの黒い領域から割り当てられます。
正の距離は二値化画像が膨張され、負の距離は収縮されることを意味しています。


もし、黒と白のピクセルの役割を入れ替えたいなら、`-m` オプションを追加します。

市街地距離以外の、計測法を使いたいのであれば、`--metric` オプショ
ンを用いてください。現在、ユークリッド距離、マハラノビス距離が使えます。

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -m MODE, --mode MODE  dipha で計算する方法を指定する (黒を基準 or 白を基準、デフォルトは黒を基準)
    -t THRESHOLD, --threshold THRESHOLD
                          二値化の閾値 (デフォルト: 128)
    --gt GT               lower threshold
    --lt LT               upper threshold
    -T TYPE, --type TYPE  入力ファイル書式 (picture(デフォルト), text)
    --metric METRIC       二値画像の距離の測定法 (manhattan, euclidean, and mahalanobis. デフォルト: manhattan)
    -I, --combine-index-map
                          出力する filtration でインデックスマップを結合する
    -s, --ensmall         収縮の処理も行う
    -w WEIGHT, --weight WEIGHT
                          マハラノビス距離の重み
    -a ANGLE, --angle ANGLE
                          angle for mahalanobis metric
    -M MASK, --mask MASK  bitmap のマスクを設定する (白い領域がマスクとして使われる)
    -D, --convert-to-diagram
                          dipha を呼び出し、ダイアグラムに直接変換する
  
### 入力ファイルの書式

グレースケールの PNG と TIFF が入力ファイルになります。
他の形式の画像については Pillow (pythonの画像ライブラリ)をお使いください。

もし入力ファイルが16ビットのグレースケールの場合は、ピクセルの値は0から255に規格化されます。

### 出力形式

出力の書式は dipha の IMAGE_DATA format です。
dipha のファイルの書式についての詳細は <https://github.com/DIPHA/dipha#file-formats> をご覧ください。

もし、`-I` オプションが与えられたら、追加のデータが msgpack によって dipha のIMAGE_DATA で追加されます。

もし、`-D` オプションが与えられたら、出力ファイルは boundary matrix data にはならず、ダイアグラムデータになります。
この場合、パーシステント図は cubical filtration から計算されます。
もし`-I` オプションが与えられなければ、dipha のダイアグラムファイルが書き出され、`-I` オプションが与えられれば、 indexed-diagram ファイル( idiagram ファイル)が書き出されます。

- - -
[このページのトップへ戻る](#section)

- - -

## [base] pict_binarize-nd

N次元の erosion-dilation filtration を作ります。

### 書式

    python3 -m homcloud.pict.binarize_nd [-h] [-V] [-T TYPE] [-m MODE] [-t THRESHOLD]
                                         [--gt GT] [--lt LT] -o OUTPUT [-s] [-I]
                                         [--metric METRIC] [-D]
                                         [input [input ...]]

### エイリアス

    homcloud-pict-binarize-nd

### 解説

N次元の erosion-dilation filtration を作ります。
    
### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -m MODE, --mode MODE  dipha で計算する方法を指定する (黒を基準 or 白を基準、デフォルトは黒を基準)
    -t THRESHOLD, --threshold THRESHOLD
                          二値化の閾値 (デフォルト: 128)
    --gt GT               lower threshold
    --lt LT               upper threshold
    -o OUTPUT, --output OUTPUT
                          出力する complex file の名前
    -s, --ensmall         収縮の処理も行う
    -t THRESHOLD, --threshold THRESHOLD
                          二値化の閾値 (binarize modeでのみ使用化)
    -I, --combine-index-map
                          出力する filtration でインデックスマップを結合する
    --metric METRIC       二値画像の距離の測定法 (manhattan, euclidean, and mahalanobis. デフォルト: manhattan)
    -D, --convert-to-diagram
                          dipha を呼び出し、ダイアグラムに直接変換する
    
- - -
[このページのトップへ戻る](#section)

- - -
    
## [base] pict_binarize3d

pict.binarize3d - 二値化したデジタル画像の三次元 cubical dilation-erosion filtration が画像のスタックとして作成されます。

### 書式

    python3 -m homcloud.pict.binarize3d [-h] [-V] [-m MODE] [-t THRESHOLD] [--gt GT] [--lt LT]
                                        -o OUTPUT [-s] [-I] [--metric METRIC] [-D]
                                        [input [input ...]]

### エイリアス

    homcloud-pict-binarize3d

### 解説

このプログラムはデジタル画像から 三次元 cubical filtration を計算します。

入力画像は (-t)　を閾値として与えて二値化され、スタックされます。
その後 dilation-erosion filtration が計算され、計算された filtlationが OUTPUT として計算されます。

もし、黒と白のピクセルの役割を入れ替えたいなら、`-m` オプションをお使いください。

デフォルトでは市街地距離が使われます。もし、他の計測法を使いたいのであれば、`--metric` オプションを用いてください。現在、ユークリッド距離、チェビシェフ距離が使えます。

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -m MODE, --mode MODE  dipha で計算する方法を指定する (黒を基準 or 白を基準、デフォルトは黒を基準)
    -t THRESHOLD, --threshold THRESHOLD
                          二値化の閾値 (デフォルト: 128)
    --gt GT               lower threshold
    --lt LT               upper threshold
    -o OUTPUT, --output OUTPUT
                          出力する complex file の名前
    -s, --ensmall         収縮処理も行う
    -t THRESHOLD, --threshold THRESHOLD
                          二値化の閾値 (binarize modeでのみ使用化)
    -I, --combine-index-map
                          出力する filtration でインデックスマップを結合する
    --metric METRIC       二値画像の距離の測定法 (manhattan, euclidean, and mahalanobis. デフォルト: manhattan)
    -D, --convert-to-diagram
                          dipha を呼び出し、ダイアグラムに直接変換する
    
### 入力ファイルの書式

グレースケールの PNG と TIFF が入力ファイルになります。
他の形式の画像については Pillow (pythonの画像ライブラリ)をお使いください。

全ての画像のピクセルサイズは同じである必要があります。もし違う場合はエラーとなります。

もし入力ファイルが16ビットのグレースケールの場合は、ピクセルの値は0から255に規格化されます。

### 出力形式

出力の書式は dipha の IMAGE_DATA format です。
dipha のファイルの書式についての詳細は <https://github.com/DIPHA/dipha#file-formats> をご覧ください。

もし、`-I` オプションが与えられた場合、msgpack によって、dipha の IMAGE_DATA でいくつかの追加のデータが加えられます。

もし、`-D` オプションが与えられたら、出力ファイルは boundary matrix data にはならず、ダイアグラムデータになります。
<<<<<<< HEAD
この場合、パーシステンスダイアグラムは cubical filtration から計算されます。
もし`-I` オプションが与えられなければ、dipha のダイアグラムファイルが書き出され、`-I` オプションが与えられれば、indexed-diagram ファイル( idiagram ファイル)が書き出されます。
=======
この場合、パーシステント図は cubical filtration から計算されます。
もし`-I` オプションが与えられなければ、dipha のダイアグラムファイルが書き出され、`-I` オプションが与えられれば、 indexed-diagram ファイル( idiagram ファイル)が書き出されます。
>>>>>>> e3a9292bbb0b54bfd25d1b919921d8060da942aa

- - -
[このページのトップへ戻る](#section)

- - -

## [base] pict-merge-tree-levelset 

### 書式

     python3 -m homcloud.pict.merge_tree_levelset [-h] [-V] [-m MODE] [-T TYPE] [-t OUTPUT_TYPE]
                                                  -o OUTPUT
                                                  [input [input ...]]

### エイリアス

    homcloud-pict-merge-tree-levelset

### 解説

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -m MODE, --mode MODE  dipha で計算する方法を指定する (superlevel or sublevel、デフォルトは sublevel)
    -T TYPE, --type TYPE  入力ファイル書式 (text2d, text_nd(デフォルト), picture2d, picture3d, npy)
    -t OUTPUT_TYPE, --output-type OUTPUT_TYPE
                          出力ファイル書式 (json, msgpack(デフォルト))
    -o OUTPUT, --output OUTPUT
                          出力ファイル名

### 例

- - -
[このページのトップへ戻る](#section)

- - -


## [base] pict_pixel_levelset

pict.pixel_levelset - デジタル画像から dipha の 二次元 cubical filtaration がそのピクセル値を使って作成されます。

### 書式

    python3 -m homcloud.pict.pixel_levelset [-h] [-V] [-m MODE] [-u UPPER_BOUND] [-l LOWER_BOUND]
                                            [-I] [-T TYPE] [-D]
                                            input output

### エイリアス

    homcloud-pict-pixel-levelset

### 解説

このプログラムはデジタル画像データから dipha の cubiacal filtaration を計算します。

それぞれのピクセル値はそのピクセルの birth time として使われます。

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -m MODE, --mode MODE  dipha で計算する方法を指定する (superlevel or sublevel、デフォルトは sublevel)
    -u UPPER_BOUND, --upper-bound UPPER_BOUND
                          ピクセル値の上限
    -l LOWER_BOUND, --lower-bound LOWER_BOUND
                          ピクセル値の上限
    -I, --combine-index-map
                          出力する filtration でインデックスマップを結合する
    -T TYPE, --type TYPE  入力ファイル書式 (picture(デフォルト), text)
    -D, --convert-to-diagram
                          dipha を呼び出し、ダイアグラムに直接変換する

### 入力ファイルの書式

グレースケールの PNG と TIFF が入力ファイルになります。
他の形式の画像については Pillow (pythonの画像ライブラリ)をお使いください。

もし入力ファイルが16ビットのグレースケールの場合は、ピクセルの値は0から255に規格化されます。

`-T text` オプションを明示的に与えた場合、テキストファイルを画像ファイルの代わりに使うことができます。テキストファイルの書式は以下になります。

    v11 v12 ... v1N
    v21 v22 ... v2N
     :   :       :
    vM1 vM2 ... vMN

### 出力形式

出力の書式は dipha の IMAGE_DATA format です。
dipha のファイルの書式についての詳細は <https://github.com/DIPHA/dipha#file-formats> をご覧ください。

もし、`-I` オプションが与えられた場合、msgpack によって、dipha の IMAGE_DATA でいくつかの追加のデータが加えられます。

もし、`-D` オプションが与えられたら、出力ファイルは boundary matrix data にはならず、ダイアグラムデータになります。
この場合、パーシステント図は cubical filtration から計算されます。
もし`-I` オプションが与えられなければ、dipha のダイアグラムファイルが書き出され、`-I` オプションが与えられれば、 indexed-diagram ファイル( idiagram ファイル)が書き出されます。

- - -
[このページのトップへ戻る](#section)

- - -

## [base] pict_pixel_levelset-nd

pict.pixel_levelset - デジタル画像から dipha の 二次元 cubical filtaration がそのピクセル値を使って作成されます。

### 書式

    python3 -m homcloud.pict.pixel_levelset_nd [-h] [-V] [-m MODE] [-u UPPER_BOUND]
                                               [-l LOWER_BOUND] [-I] [-T TYPE] [-D] -o OUTPUT
                                               [input [input ...]]

### エイリアス

    homcloud-pict-pixel-levelset-nd

### 解説

pict.pixel_levelset - デジタル画像から dipha の 二次元 cubical filtaration がそのピクセル値を使って作成されます。
	
### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -m MODE, --mode MODE  dipha で計算する方法を指定する (superlevel or sublevel、デフォルトは sublevel)
    -u UPPER_BOUND, --upper-bound UPPER_BOUND
                          ピクセル値の上限
    -l LOWER_BOUND, --lower-bound LOWER_BOUND
                          ピクセル値の上限
    -I, --combine-index-map
                          出力する filtration でインデックスマップを結合する
    -T TYPE, --type TYPE  入力ファイル書式 (text2d,text_nd(デフォルト),picture2d,pictures3d,npy)
    -D, --convert-to-diagram
                          dipha を呼び出し、ダイアグラムに直接変換する
    -o OUTPUT, --output OUTPUT
                          出力ファイル

- - -
[このページのトップへ戻る](#section)

- - -

## [base] pict_tree

０次のパーシステンスツリーと (n-1)-th のパーシステンスツリーを計算する
(和訳正しいか確認してください 9/20)

### 書式

    python3 -m homcloud.pict.tree [-h] [-V] -m MODE [-t THRESHOLD] [--gt GT] [--lt LT] [-s]
                                  [--metric METRIC] [-T TYPE] [-O OUTPUT_TYPE] -o OUTPUT
                                  [input [input ...]]

### エイリアス

    homcloud-pict-tree

### 解説

0次のパーシステントツリーとn-1次のパーシステントツリーを計算する。
						       
### オプション

positional arguments:

    input                 input files

optional arguments:						     
						       
    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -m MODE, --mode MODE  モード (２値画像については白基準か黒基準か、superlevelかsublevelについてはレベルセット)

	
二値化について:

    -t THRESHOLD, --threshold THRESHOLD
    --gt GT               lower threshold
    --lt LT               upper threshold
    -s, --ensmall         収縮処理も行う
    --metric METRIC       二値画像の距離の測定法 (manhattan, euclidean, and mahalanobis. デフォルト: manhattan)

入出力について:
    -T TYPE, --type TYPE  入力ファイル書式 (text2d, text_nd(デフォルト), picture2d, picture3d, npy)
    -O OUTPUT_TYPE, --output-type OUTPUT_TYPE
                          出力ファイル書式 (json, msgpack(デフォルト))
    -o OUTPUT, --output OUTPUT
                          出力ファイル名

- - -
[このページのトップへ戻る](#section)

- - -

						       
## [advanced] plot_PD

plot_PD - dipha の出力をプロットします。

### 書式

    python3 -m homcloud.plot_PD [-h] [-V] -d DEGREE [-T TYPE] [-N] [-p POWER] [-l]
                                [--loglog] [--linear-midpoint LINEAR_MIDPOINT] [-m MAX]
                                [--vmin VMIN] [-c COLORMAP] [-s STYLE] [-t TITLE]
                                [-U UNIT_NAME] [--font-size FONT_SIZE] [--aspect ASPECT]
                                [-D SCATTERING_SIZE] [-o OUTPUT] [-x X_RANGE] [-X XBINS]
                                [-y Y_RANGE] [-Y YBINS] [-n NORMALIZE_CONSTANT] [-M MARKER]
                                [--dpi DPI]
	                        INPUT [INPUT ...]

### エイリアス

    homcloud-plot-PD

### 解説

このプログラムは dipha の出力データをプロットします。

RANGE-MIN　、RANGE-MAX 、BINS はデータをプロットするために常に明示してください。
RANGE-MIN と RANGE-MAX はプロットする範囲を表し、BINS はヒストグラムの分割数を表します。
						       
また、ヒストグラムのスケールは `-p`、`-l`、`--loglog`、`-m` によって明示します。

複数のファイルを入力できます。この場合、全ての対が一つの図として表示されます。
						       
### オプション

positional arguments:
	
    INPUT                 Input file path

optional arguments:
	
    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE
                          ホモロジーの字数 (デフォルト: 1)
    -T TYPE, --type TYPE  入力ファイル書式 (dipha, idipha, text) (デフォルト: autodetect)
    -N, --negate          birth/death 時間の符号を反転し、superleve　persistence を出力する (デファルト: False)
    -p POWER, --power POWER
                          それぞれの x の値に対して x^POWER を出力する
    -l, --log             それぞれの x の値に対して log(x+1) を出力する
    --loglog              log(log(x+1)+1) を出力する
    --linear-midpoint LINEAR_MIDPOINT
                          線形補間する。
    -m MAX, --vmax MAX    カラーバーの最大値 (デフォルト: autoscale)
    --vmin VMIN           カラーバーの最小値
    -c COLORMAP, --colormap COLORMAP
                          matplotlibのカラーマップの名前
    -s STYLE, --style STYLE
                          プロットスタイル (colorhistogram(デフォルト), contour)
    -t Title, --title Title
                          タイトルの文字列
    -U UNIT_NAME, --unit-name UNIT_NAME
                          birth/death 軸の単位の名前
    --font-size FONT_SIZE
		          フォントサイズ (デフォルト: 12)
    --aspect ASPECT       ヒストグラムのアスペクト (デフォルト: 自動) 
    -D SCATTERING_SIZE, --diffuse-pairs SCATTERING_SIZE
                          標準偏差 SCATTERING_SIZE のガウス分布を使って各 birth/death 対を拡散させる
    -o OUTPUT, --output OUTPUT
                          出力ファイル名
    -x X_RANGE, --x-range X_RANGE
                          birth の範囲
    -X XBINS, --xbins XBINS
                          birth軸についての bin の数
    -y Y_RANGE, --y-range Y_RANGE
                          death の範囲
    -Y YBINS, --ybins YBINS
                          death 軸の分割数
    -n NORMALIZE_CONSTANT, --normalize-constant NORMALIZE_CONSTANT
                          ヒストグラムの高さについての規格化定数
    -M MARKER, --marker MARKER
                          マーカーファイル
    --dpi DPI             output DPI (used with -o option, デフォルト is
                          savefig.dpi of matplotlib)

### 入力形式

dipha の PERSISTENCE_DIAGRAM format、index-combined dipha diagram format、テキストが使えます。

index-combined dipha diagram format は pict.binarize、pict.pixel-levelset、pict.binarize3d の `-I` オプションによって生成されます。

テキストの書式は以下の書式になります。

    birth1 death1
    birth2 death2
       :

テキストを使う場合、`-d` オプションは無視されます。

### 出力形式

もし出力の引数が与えられないと、プロット内容はディスプレイへ表示されます。
出力が引数として与えられた場合は、出力の書式はその拡張子によって決定されます。
PNG(.png)、PDF(.pdf)、または EPS(.eps) が出力できます。
他にも matplotlib がサポートするファイルタイプであれば出力できます。

- - -
[このページのトップへ戻る](#section)

- - -

## [advanced] plot-PD-gui

plot_PD_gui -- plot_PD - dipha の出力を対話形式でプロットします。
						       
### 書式

    python3 -m homcloud.plot_PD_gui [-h] [-V] -d DEGREE [-T TYPE] [-N] [-x X_RANGE]
                                    [-X XBINS] [-y Y_RANGE] [-Y YBINS] [-t TITLE]
                                    [-U UNIT_NAME] [--font-size FONT_SIZE] [--aspect ASPECT]
                                    [-n NORMALIZE_CONSTANT] [-p PH_TREES]
                                    [--optimal-cycle OPTIMAL_CYCLE]
                                    [--optimal-cycle-options OPTIMAL_CYCLE_OPTIONS]
                                    input [input ...]

### エイリアス

    homcloud-plot-PD-gui

### 解説

このプログラムを使うと、dipha の出力を対話形式でプロットでき、範囲や分割数を GUI で変更することができます。

複数のファイルを入力できます。この場合、全ての対が一つの図として表示されます。

### オプション

positional arguments:

    input                 input file
						       
positional arguments:
						       
    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE
                          ホモロジーの字数 (デフォルト: 1)
    -T TYPE, --type TYPE  入力ファイル書式 (dipha(デフォルト), idipha, text)
    -N, --negate          birth/death 時間の符号を反転し、superleve persistence を出力する (デフォルト: False)
    -x X_RANGE, --x-range X_RANGE
                          birth の範囲 (必須)
    -X XBINS, --xbins XBINS
                          birth軸の分割数 (必須)
    -y Y_RANGE, --y-range Y_RANGE
                          death の範囲
    -Y YBINS, --ybins YBINS
                          death軸の分割数
    -t Title, --title Title
                          タイトルの文字列
    -U UNIT_NAME, --unit-name UNIT_NAME
                          birth/death 軸の単位の名前
    --font-size FONT_SIZE
                          フォントサイズ (デフォルト: 12)
    --aspect ASPECT       ヒストグラムのアスペクト (デフォルト: 自動)
    -n NORMALIZE_CONSTANT, --normalize-constant NORMALIZE_CONSTANT
                          ヒストグラムの高さの規格化定数
    -p PH_TREES, --ph-trees PH_TREES
                          ph ツリーファイル (.pht)
    --optimal-cycle OPTIMAL_CYCLE
			  optimal cycle のスイッチ (on/off)
    --optimal-cycle-options OPTIMAL_CYCLE_OPTIONS
                          optimal_cycle モジュールのためのオプション
						       
### 動作環境

このプログラムは numpy、scipy、matplotlib に加えて、pyqt5 が必要になります。

### 既存のバグ

現在、`xrange == yrange` のチェックボックスは動作しません。常に `xrange == yrange` の設定が使われます。

- - -
[このページのトップへ戻る](#section)

- - -
						       
## [advanced] plot_PD_slice

パーシステント図のヒストグラムの一次元スライスを表示する。
						     	     
### 書式						       
			      
    pythom -m homcloud.plot_PD_slice [-h] [-V] -d DEGREE [-T TYPE] [-N] [-l LEFT_LABEL]
                                     [-r RIGHT_LABEL] [-b BINS] [--log] [-o OUTPUT]
                                     [--text-output] [-t TITLE] [--dpi DPI]
                                     birth1 death1 birth2 death2 width input [input ...]

### エイリアス

       homcloud-plot-PD-slice

### 解説

このプラグラムは (birth1, death1) から (birth2, death2) のパーシステント図のヒストグラムの一次元スライス(断面図)を表示します。
`width`の幅で切り取られたセグメント上の点が1次元ヒストグラムへカウントされます。
				     						    
### オプション

positional arguments:
									     
  birth1                birth of starting point
  death1                death of starting point
  birth2                birth of end point
  death2                death of end point
  width                 width for histogram
  input                 input file path     

optional arguments:
									     
    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE
                          ホモロジーの字数 (デフォルト: 1)
    -T TYPE, --type TYPE  入力ファイル書式 (dipha(デフォルト), idipha, text)
    -N, --negate          birth/death 時間の符号を反転し、superleve persistence を出力する (デフォルト: False)
    -l LEFT_LABEL, --left-label LEFT_LABEL
                          出発点のラベル
    -r RIGHT_LABEL, --right-label RIGHT_LABEL
                          終点のラベル
    -b BINS, --bins BINS  分割数
    --log                 対数表示にする
    -o OUTPUT, --output OUTPUT
                          出力ファイルのパス
    --text-output         output histgram data into a text file
    -t TITLE, --title TITLE
         		  タイトル
    --dpi DPI             出力解像度(dpi)
						       
### 例	

    python3 -m homcloud.plot_PD_slice -d 1 -l 0.1 -r 0.2 -b 50 0.1 0.1 0.1 0.2 0.02 output.idiagram -o output.1.slice1.png
    python3 -m homcloud.plot_PD_slice -d 1 -l 0.1 -r 0.2 -b 50 0.1 0.2 0.2 0.2 0.02 output.idiagram -o output.1.slice2.png
    python3 -m homcloud.plot_PD_slice -d 1 -l 0.1 -r 0.2 -b 50 0.1 0.1 0.1 0.2 0.02  --text-output -o tmp.txt output.idiagram
	
- - -
[このページのトップへ戻る](#section)

- - -						      
						       

## [base] plot-diagram

ダイアグラムをプロットします。

### 書式

    python3 -m homcloud.plot_diagram [-h] [-V] -d DEGREE [-x RANGE] [-X BINS] [-l] [-m VMAX]
                                     [-N] [-o OUTPUT]
                                     input[-h] [-V] -d DEGREE [-x RANGE] [-X BINS] [-l]

### エイリアス

    homcloud-plot-diagram

### 解説

diphaによって出力された idiagram　からパーシステント図をプロットします。
	
### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE
                          ホモロジーの字数 (デフォルト: 1)
    -x RANGE, --range RANGE
                          プロットレンジの指定
    -X BINS, --bins BINS  プロットするビンの指定 (デフォルト: 128)
    -l, --log             ログスケールのヒストグラムを描く
    -m VMAX, --vmax VMAX  カラーバーの最大値
    -N, --negate          birth/death 時間の符号を反転し、superleve persistence を出力する (デフォルト: False)
    -o OUTPUT, --output OUTPUT
                          output file

### 例

    python3 -m homcloud.plot_diagram -d 1 -x "[0:0.5]" -X 256 -l -m 100 output.idiagram -o tmp.png
	
- - -
[このページのトップへ戻る](#section)

- - -

## [advanced] pwgk

pgwk -- PWGKのカーネルを使って、gram matrix を計算します。

### 書式

    python3 -m homcloud.pwgk [-h] [-V] -d DEGREE [-T TYPE] -D GAUSSIAN_SD [-C C] [-p P]
                             [-s SECOND_GAUSSIAN_SD] [-N NUM_SAMPLES] [-o OUTPUT]
                             input [input ...]

### エイリアス

    homcloud-pwgk

### 解説

与えられたパーシステント図から、PWGK カーネルを使って gram matrix を計算します。

重み関数は以下になります。:

    atan(C * pers(x)^p)

ここで、pers(x) は birth-death pair x の寿命、C と p は `-C` と `-p` オプションで与えられるパラメータです。

もし `-o` オプションが与えられないと、gram matrix は標準出力されます。

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE
                          ホモロジーの字数 (デフォルト: 1)
    -T TYPE, --type TYPE  入力ファイル書式 (dipha, idipha, text) (デフォルト: autodetect)
    -D GAUSSIAN_SD, --gaussian-sd GAUSSIAN_SD
                          standard deviation of gaussian diffusion
    -C C                  定数 C の重み
    -p P                  定数 p の重み
    -s SECOND_GAUSSIAN_SD, --second-gaussian-sd SECOND_GAUSSIAN_SD
                          second gaussian parameter
    -N NUM_SAMPLES, --num-samples NUM_SAMPLES
                          number of samples for computing PWGK with Monte-Carlo
    -o OUTPUT, --output OUTPUT
                          出力ファイル名

### 出力形式

与えられたダイアグラム D1、D2、... Dn について、その出力はカーネル関数 k に対する gram matrix となります。

    k(D1, D1) k(D1, D2) ... K(D1, Dn)
    k(D2, D1) k(D2, D2) ... K(D2, Dn)
        :        :              :
    k(Dn, D1) k(Dn, D2) ... K(Dn, Dn)

番号はスペースによって区切られています。matrix は numpy (numpy.loadtxt) によって読み込みできます。

- - -
[このページのトップへ戻る](#section)

- - -

## [advanced] query-full-ph-tree

full_ph_tree によって作られたPHツリーを尋ねます。

### 書式

    python3 -m homcloud.query_full_ph_tree [-h] [-V] [-c COMMAND] [-C COLOR]
                                           [-B DRAW_BIRTH_SIMPLICES]
                                           [-D DRAW_DEATH_SIMPLICES]
                                           input

### エイリアス

    homcloud-query-full-ph-tree

### 解説

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -c COMMAND, --command COMMAND
                          コマンド???外部コマンドでも呼んでる?
    -C COLOR, --color COLOR
                          write-* で使われるカラー
    -B DRAW_BIRTH_SIMPLICES, --draw-birth-simplices DRAW_BIRTH_SIMPLICES
                          birth simplices を描く(True/False, デフォルト: False)
    -D DRAW_DEATH_SIMPLICES, --draw-death-simplices DRAW_DEATH_SIMPLICES
                          death simplices を描く(True/False, デフォルト: False)

### 例

- - -
[このページのトップへ戻る](#section)

- - -

## [advanced] vectorize-PD

ダイアグラムをテキストに変換します。

### 書式

    python3 -m homcloud.vectorize_PD [-h] [-V] -d DEGREE [-T TYPE] [-N] [-x X_RANGE]
                                     [-X XBINS] [-y Y_RANGE] [-Y YBINS] -D GAUSSIAN_SD
                                     [-C C] [-p P] [-c COORDINATES]
                                     [-H HISTOGRAM_INFORMATION] [-o OUTPUT] [-w WEIGHT_TYPE]
                                     [--reorder-process]
                                     input

### エイリアス

    homcloud-vectorize-PD
    
### 解説

ダイアグラムをPWGKによる処理を行ってから一次元のベクトルデータに変換し、テキストとして保存します。
	
### オプション
						       
    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -T TYPE, --type TYPE  入力ファイル書式 (dipha, idipha, text) (デフォルト: autodetect)
    -N, --negate          birth/death 時間の符号を反転し、superleve persistence を出力する (デフォルト: False)
    -x X_RANGE, --x-range X_RANGE
                          birth range
    -X XBINS, --xbins XBINS
                          birth軸についての bin の数
    -y Y_RANGE, --y-range Y_RANGE
                          death range
    -Y YBINS, --ybins YBINS
                          death軸についての bin の数
    -D GAUSSIAN_SD, --gaussian-sd GAUSSIAN_SD
                          拡散のためのガウス関数の標準偏差
    -C C                  定数 C の重み
    -p P                  定数 p の重み
    -c COORDINATES, --coordinates COORDINATES
                          座標を書き出すためのファイル
    -H HISTOGRAM_INFORMATION, --histogram-information HISTOGRAM_INFORMATION
                          ヒストグラムの情報を書き出すためのファイル
    -o OUTPUT, --output OUTPUT
                          出力ファイル名
    -w WEIGHT_TYPE, --weight-type WEIGHT_TYPE
                          重みのタイプ (atan(デフォルト),linear,none)
    --aspect ASPECT       ヒストグラムのアスペクト (デフォルト: 自動)
    --reorder-process     説明なし
									     
### 例

    python3 -m homcloud.vectorize_PD -d 1 -x "0:0.5" -X 64 -D 0.008 -C 30 -p 3.0 -H histoinfo.json -o vector.txt output.idiagram
	
- - -
[このページのトップへ戻る](#section)

- - -
						       
## [advanced] view_index_pict

view_index_pict -- デジタル画像によって作られた二次元 cubical filtration に対して、birth と death ピクセルを指定します。

### 書式

    python3 -m homcloud.view_index_pict [-h] [-V] -d DEGREE [-T TYPE] [-N] [-f FILTER]
                                        [-v VECTORIZED_HISTOGRAM_MASK] [-H HISTOINFO]
                                        [-B] [-D] [-L] [-s SCALE] [-M MARKER_TYPE]
                                        [-S MARKER_SIZE] [--show-command SHOW_COMMAND]
                                        [--no-label] [--birth-color BIRTH_COLOR]
                                        [--death-color DEATH_COLOR]
                                        [--line-color LINE_COLOR] [-o OUTPUT]
                                        picture diagram

### エイリアス

    homcloud-view-index-pict

### 解説

デジタル画像によって作られた二次元の cubical filtration birth と death ピクセルを指定します。
pict.binarize 、pict.pixel_levelset、または dipha によって作られたダイアグラムを使うことができます。

二つのファイル、画像とダイアグラム、を明示する必要があります。
画像はオリジナルの画像ファイルであること、ダイアグラムは dipha の PERSISTENCE_DIAGRAM ファイルまたは index-combined dipha diagram file でなければいけません。

birth と death のピクセル値をインタラクティブに見たい場合、view_index_pict_gui を代わりに使ってください。

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE
                          ホモロジーの字数 (デフォルト: 1)
    -T TYPE, --type TYPE  入力ファイル書式 (dipha, idipha, text) (デフォルト: autodetect)
    -N, --negate          birth/death 時間の符号を反転し、superleve persistence を出力する (デフォルト: False)
    -f FILTER, --filter FILTER
                          フィルター (例: "lifetime > 5.0")
    -v VECTORIZED_HISTOGRAM_MASK, --vectorized-histogram-mask VECTORIZED_HISTOGRAM_MASK
                          マスクのための 0-1 のベクトルのテキストファイル
    -H HISTOINFO, --histoinfo HISTOINFO
                          ベクトル化したヒストグラムの情報 ( -V と -H の両方が必要 )
                          required)
    -B, --birth           birth pixels をプロットする
    -D, --death           death pixels をプロットする
    -L, --line            death pixel と birth pixel の間に線を引く
    -s SCALE, --scale SCALE
                          イメージのスケーリング因子 (1, 3, 5, ...)
    -M MARKER_TYPE, --marker-type MARKER_TYPE
                          マーカーのタイプ (point, filled-diamond(デフォルト), square,
                          filled-square, circle, filled-circle)
    -S MARKER_SIZE, --marker-size MARKER_SIZE
                          マーカーのサイズ (デフォルト: 1)
    --show-command SHOW_COMMAND
                          image display command
    --no-label            birth-death ラベルを表示しない
    --birth-color BIRTH_COLOR
                          birth pixel color
    --death-color DEATH_COLOR
                          death pixel color
    --line-color LINE_COLOR
			  birth-death line color
    -o OUTPUT, --output 出力ファイル名

- - -
[このページのトップへ戻る](#section)

- - -

## [advanced] view_index_pict_gui

view_index_pict_gui -- デジタル画像によって作られた2次元 cubical filtration に対する birth と death のピクセル値を対話形式で見ます。

### 書式

    python3 -m homcloud.view_index_pict_gui [-h] -d DEGREE [-T TYPE] [-N]
                                            picture diagram

### エイリアス

    homcloud-view-index-pict-gui

### 解説

パーシステント図の二次元 cubical filstration に対する birthと death のピクセル値をインタラクティブに見ることができます。
pict.binarize、pict.pixel_levelset と dipha によって作られたダイアグラムを使うことができます。

このプログラムを使う場合、pict.binarize または、pict.pixel_levelset
`-i/-I` オプションと共に実行し、index_map を作成しておく必要があります。

二つのファイル、画像とダイアグラム、を明示する必要があります。
画像はオリジナルの画像ファイルであること、ダイアグラムは dipha の PERSISTENCE_DIAGRAM ファイルまたは index-combined dipha diagram file でなければいけません。

### オプション

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -d DEGREE, --degree DEGREE
                          ホモロジーの字数 (デフォルト: 1)
    -T TYPE, --type TYPE  Input file format (dipha(デフォルト), idipha)
    -N, --negate          birth/death 時間の符号を反転し、superleve persistence を出力する (デフォルト: False)

### 動作環境

このプログラムは numpy、scipy、matplotlib に加えて、pyqt5 が必要になります。

- - -
[このページのトップへ戻る](#section)

- - -

## [advanced] view_vectorized_PD

このプログラムは、vectorize_PDによって生成された、ベクトル化されたパーシステント図をヒストグラムスタイルでプロットします。
						       
### 書式

    pythom3 -m homcloud.view_vectorized_PD [-h] [-V] [-o OUTPUT] [-p POWER] [-l] [--loglog]
                                            [--linear-midpoint LINEAR_MIDPOINT] [-m MAX]
                                            [--vmin VMIN] [-c COLORMAP] [-s STYLE] [-t TITLE]
                                            [-U UNIT_NAME] [--font-size FONT_SIZE]
                                            [--aspect ASPECT]
                                            input vectorization_info

### エイリアス

    homcloud-view-vectorized-PD

### 解説

このプログラムは、vectorize_PDによって生成された、ベクトル化した PD をヒストグラムスタイルでプロットします。

### オプション

positional arguments:

    input                 ベクトルデータファイル
    vectorization_info    ベクトル化の情報を持った json データファイル

optional arguments:

    -h, --help            ヘルプを表示し、終了する
    -V, --version         バージョンを表示し、終了する
    -o OUTPUT, --output OUTPUT
                          出力画像ファイル名
    -p POWER, --power POWER
                          それぞれの x について x^POWER を出力する
    -l, --log             それぞれの x について log(x+1) を出力する
    --loglog              それぞれの x について log(log(x+1)+1) を出力する
    --linear-midpoint LINEAR_MIDPOINT
                          線形補間する
    -m MAX, --vmax MAX    カラーバーの最大値 (デフォルト: autoscale)
    --vmin VMIN           カラーバーの最小値
    -c COLORMAP, --colormap COLORMAP
                          matplotlibのカラーマップの名前
    -s STYLE, --style STYLE
                          プロットスタイル (colorhistogram(デフォルト), contour)
    -t Title, --title Title
                          タイトルの文字列
    -U UNIT_NAME, --unit-name UNIT_NAME
                          birth/death 軸の単位の名前
    --font-size FONT_SIZE
                          フォントサイズ (デフォルト: 12)
    --aspect ASPECT       ヒストグラムのアスペクト比 (デフォルト: 自動)
									     
### 例

    homcloud-vectorize-PD -d 0 -x "[-20.25:20.25]" -X 81 -D 0.5 -C 6 -p 4 -H histoinfo.json -o vect.txt data.idiagram
    # do something statistical processing
    # v.txt is created by the processing
    
    # View v.txt
    homcloud-view-vectorized-PD v.txt histoinfo.json
