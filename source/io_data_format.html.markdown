---
title: "IO Format"
lang: "ja"
---

[戻る](index.html)

# 入出力データ形式

Homcloud では msgpack をバイナリデータの保存用に、
json をテキストデータの保存に使います。

この文章ではこれらのデータ構造を typescript の型定義に似た書き方で説明します。

## 共通データ構造

Homcloud では 点 や 単体 として共通のデータ構造を使います。

### Point 点

点はn列の配列によってn次元の点を表します。

    type Point = number[];

### IndexedSimplex

IndexSimplex は n-simplex を意味し、それらの頂点はインデックスによって表します。

内部的には、単体は頂点の配列によって表されます。頂点は漸進的に増加する非負の整数によって表されます。
もし頂点の実際の座標を知りたい場合は、IndexMapForAlphaFiltration.points などのデータを参照してください。

配列の長さは単体の頂点の数です。

    type IndexedSimplex = int[];

### Simplex

単体は n-simplex を表し、その頂点は点によって表されます。

リストの長さは単体の頂点の数です。

    type Simplex = Point[];

### IndexMap

インデックスマップはtrue time と index time の関係を保持します。

homcloud では時間は主に増大する非負の整数として扱われます。すなわち、全ての時刻は昇べきの順でソートされ、0, 1, 2, ... のように置き換えられます。
これらの indexed time は homcloud 全体で使われ、実時刻は indexed time からユーザーインターフェイスへ再構築されます。

IndexMap はオリジナルの入力データの様々な追加の情報を保持しています。
IndexMap のサブタイプ(IndexMapForBitmap や IndexMapForAlphaFiltration)によってその追加情報は主に保持されています。

    type IndexMap = {
        // this property identify IndexMapForBitmap or IndexMapForAlphaFiltration
        type: "alpha" | "bitmap";
        /* True birth times.
           internally, all simplices/pixels are ordered by their birth times and
           numbered by 0, 1, 2, ... */
        levels: number[];
        // version of IndexMap data format, incremented when changed
        format-version: int;
        // dimension of the input data
        dimension: int;
    }

### IndexMapForBitmap

入力したビットマップデータについての追加の情報は IndexMap で以下のようになります。

    type IndexMapForBitmap = IndexMap & {
        // list of the positions of pixels, ordered by the indexed times.
        positions: Point[];
    }

### IndexMapForAlphaFiltratoin

アルファフィルトレーションについての追加の情報は IndexMap で以下のようになります。

    type IndexMapForAlphaFiltration = IndexMap & {
        // list of points in the input data
        points: Point[];
        // list of simplices constructed by the triangulation
        simplices: IndexedSimplex[];
    }

## 特定の目的のデータ構造

### IndexedComplex

IndexedComplex は IndexMap の情報でフィルトレーションを保持します。
それは .icomplex ファイルのデータ構造で使われます。

    type IndexedComplex = {
        // filtration data encoded in the format of dipha's filtration.
        dipha-data: string;
        index-map: IndexMap;
    }

### IndexedDiagram

IndexedDiagram は IndexMap の情報でパーシステント図を保持します。
それは .idiagram ファイルのデータ構造で使われます。

index-map データは入力された icomplex ファイルから引き継がれます。

    type IndexedDiagram = {
        // persistence diagram encoded in the format of dipha's persistence diagram.
        diagram: string;
        index-map: IndexMap;
    }

### PHTrees

PHTrees は full_ph_trees モジュールによって計算されたパーシステントツリーを保持します。
この構造には .pht の書式のファイルが使われます。

    type PHTrees = {
        trees: { [id:int]: PHTreeNode };
        index-map: IndexMap;
    }
    type PHTreeNode = {
        index: int;
        birth-index: int;
        parent: int | null;
    }

### PHTreesForUser

PHTrees full_ph_trees モジュールによって計算されたパーシステントツリーを保持します。
この構造には .json ファイルの書式が使われます。

    type PHTreesForUser = {
        // dimension of the data
        dim: int;
        // number of nodes
        num-nodes: int;
        /* A dictionary of nodeid->node */
        nodes: { [id:string]: PHTreeForUserNode };
    }
    type PHTreeForUserNode = {
        // The id string of the node
        id: string;
        // The id string of the parent node, if null the node have no parent
        parent: string | null;
        // birth and death times of the birth-death pair
        birth-time: number;
        death-time: number;
        // all vertices contained in the optimal volume
        points: Point[];
        // all simplices contained in the optimal volume
        simplices: Simplex[];
        // birth and death simplices
        birth-simplex: Simplex;
        death-simplex: Simplex;
    }

### VolumeOptimalCycle

VolumeOptimalCycle は optimal_cycleによって計算された Volume optimal cycles を json の書式で保持します。

    type VolumeOptimalCycle = {
        // Birth and death times of the pair
        birth-time: number;
        death-time: number;
        // All points contained in the optimal volume
        points: Point[];
        // All simplices comtained in the optimal volume
        simplices: Simplex[];
        // All simplices contained in the volume optimal cycle
        boundary: Simplex[];
        // All points contained in the volume optimal cycles
        boundary-points: Point[];
        /* All children birth-death pairs.
           If --optimal-cycle-children option is activated,
           volume optimal cycles are computed and stored in this property.
           If not activated, only birth-death pairs are stored here.
        */
        children: BirthDeathPair[] | VolumeOptimalCycle[];
    }
    type BirthDeathPair = {
        // Birth and death times of the pair
        birth-time: number;
        death-time: number;
    }

### PHTreesUpperLowerPair

PHTreesUpperLowerPair は pict.treeによって計算された PH tree を保持します。
json と msgpack の書式を用いることができます。
この構造は .p2mt ファイルとして使うことができます。

    type PHTreesUpperLowerPair = {
        // dimension of the input data
        dim: int;
        // 0-th PH trees
        lower: PHTreesForBitmap;
        // (dim-1)-th PH trees
        upper: PHTreesForBitmap;
    }
    type PHTreesForBitmap = {
        // degree of homology
        degree: int;
        // all nodes in the PH trees
        nodes: {[id:string]: PHTreesForBitmapNode};
    }
    type PHTreesForBitmapNode = {
        // The id string of the node
        id: string;
        // The id string of the parent node, if null the node have no parent
        parent: string | null;
        // birth and death times of the birth-death pair
        birth-time: number;
        death-time: number;
        // The position of birth and death pixels
        birth-pixel: Point;
        death-pixel: Point;
        // optimal volume, the list of pixel coordinates
        volume: Point[];
    }

- - -
[戻る](index.html)
