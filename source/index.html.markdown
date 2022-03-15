---
title: "HomCloud"
lang: "ja"
---

# HomCloud

HomCloud はパーシステントホモロジー(persistent homology)にもとづいた
データ解析ソフトウェアです。
[大林](https://i-obayashi.info/)を中心に
[平岡研](https://aip.riken.jp/labs/generic_tech/topology_data_anl/?lang=ja)で開発されています。

## <a name="download"> 最新版ダウンロード

* [HomCloud 最新版(3.5.2)](download/homcloud-3.5.2.tar.gz)
  * HomCloud 3.x は2.9.y以前から多くの非互換な変更を含んでいます．
    既存のコードをそのまま利用したい方は古いバージョンを利用してください．
  * 出力ファイル名を`.idiagram`から`.pdgm`に変更すればそれ以外の非互換性には
    あまり遭遇しないはずです
  * [README](download/README)
  * [NEWS](download/NEWS)
* [HomCloud 2.9.0](download/homcloud-2.9.0.tar.gz)

[pypi](https://pypi.org/project/homcloud/)にも最新版が置いてあり，そちらのほうが便利でしょう．

### Debian バイナリパッケージ (amd64)

* [HomCloud 最新版(3.3.0)](download/homcloud-3.3.0-debfiles.tar.gz)

## ドキュメント

* [インストール](install-guide/index.html)
* [チュートリアル](basic-usage.html)
* [FAQ](faq.html)
* [Python API reference manual](python-api/)

## ライセンス

HomCloud は GPL 3 もしくは任意のそれ以降のバージョンで配布しています。
詳しくは [LICENSE](download/LICENSE) をご覧ください。
また、GPL version 3について
詳しくは <https://www.gnu.org/licenses/gpl-3.0.ja.html>
をご覧ください。

## 開発者

* 大林一平 (中心的開発者)
* 和田 智秀 (Window版やドキュメント整備など)
* 田暾華 (チュートリアルの整備やデバッグ，機能追加など)
* 一部[株式会社TNT](http://www.trans-nt.com/)に外注で頼んでいます
* 宮永 潤 (日本語ドキュメント整備)
* 平岡 裕章
