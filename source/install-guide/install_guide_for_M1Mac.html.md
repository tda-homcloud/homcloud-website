---
title: Install HomCloud on M1 Mac
lang: ja
---

# Apple Silicon (M1) Mac へのインストール

M1 Macは新しいアーキテクチャを採用しているため，様々な科学技術ソフトウェアの対応が途上にあります．
numpy, scipy, matplotlibのようなPythonの基本的科学技術ソフトウェアも色々対応が中途半端な状態です．
HomCloudで可視化に使っている Paraview などは 2021/08 現在では対応していません．
そのためあまりM1 MacでのHomCloudの利用はお勧めしませんが，それでも利用したい場合には以下のようにしてください．

## 1. Conda を miniforge でインストールする
conda-forge のパッケージは M1 Mac　への対応が比較的進んでいるのでこれを利用します．
Conda は妙なところが多いのであまりお勧めしませんがこれ以外の選択肢は今のところないので利用します．
<https://github.com/conda-forge/miniforge> を見てインストールしてください．リンク先の Web サイトに書いているようにターミナルで

    curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh
    bash Miniforge3-$(uname)-$(uname -m).sh

とするとインストールできます．

### Conda

CondaはHomebrew と併用すると問題を起こす等，面倒な問題が多いです．そのため
Condaの利用は最低限にしたいことは多いでしょう．その場合は以下のようにするとよいでしょう．

インストール時に

    Do you wish the installer to initialize Miniforge3
    by running conda init? [yes|no]
    
と聞かれるので，このときに no と答えます．すると

    You have chosen to not have conda modify your shell scripts at all.
    To activate conda's base environment in your current shell session:
    
    eval "$(/Users/YOUR_ID/miniforge3/bin/conda shell.YOUR_SHELL_NAME hook)" 
        :

というメッセージが流れると思います．そこにあるようにcondaを利用するときだけターミナルで

    eval "$(/Users/YOUR_ID/miniforge3/bin/conda shell.YOUR_SHELL_NAME hook)" 
    
とするとそのセッションでだけ有効になります(`YOUR_ID`と`YOUR_SHELL_NAME`は適切なものに
置き換えてください．`YOUR_SHELL_NAME`はおそらく`zsh`でしょう)．

## 2. condaの環境を作る

HomCloud用の環境を作ります．homcloudという名前にします．ターミナルで以下のようにします．

    conda create -n homcloud python=3.9

## 3. homcloud環境に入ってHomCloudをインストールする

ターミナルで以下のようにします．

    conda activate homcloud
    conda install -c conda-forge -c https://homcloud.dev/conda-channel/ homcloud

以上でインストールは完了です．

## 4. 自己チェックプログラムを動かす

以下のようにして自己チェックプログラムを動かします．

    python -m homcloud.self_check --no-dipha --no-paraview

すると以下のような内容が表示されるはずです．

    HomCloud version: 3.4.1
    Python version: 3.9.6 | packaged by conda-forge | (default, Jul 11 2021, 03:35:11)  [Clang 11.1.0 ]
    Alpha Shape 3 ... ok
    Alpha Shape 3 with weights ... ok
    Periodic Alpha Shape 3 with weights ... ok
    Alpha Shape 2 ... ok
    Grayscale 2D bitmap ... ok
    Binary 2D bitmap ... ok
    Binary 2D periodic bitmap ... ok
    Rips filtration ... ok
    Plotting PD ... ok
    Optimal Volume ... ok

もし上手くいかなかった場合は詳しい人に聞いてください．

## 5. チュートリアルについて

上で書いたように Paraview は動きません．可視化にPlotlyを使ってるほうのチュートリアルをやりましょう．
