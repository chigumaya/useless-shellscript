# 『役に立たないシェルスクリプト読本』のコードなど

ここは技術書典21で頒布した『役に立たないシェルスクリプト読本』のサポートサイトである。本に登場するスクリプトなどを収録している。

## 正誤表

現時点では誤りは発見されていない。


## 本サポートサイトで掲載しているファイル

### Dockerfile

一部のスクリプトは特定の条件を満たした環境でないと正常に動作しない。そこで、その条件を満たした環境を構築するための `Dockerfile` を用意した。

#### `docker` イメージの構築
```
docker build -t useless . 
```

あるいは、`Makefile` を用意しているので `make dockerimage` でもよい。

#### 実行
```
docker run --rm -it useless:latest
```

このコンテナの中であればすべてのスクリプトが筆者の意図したとおりに動くはずだ。

### スクリプト

各章に掲載しているスクリプト。

#### chapter1

- `fib.sh`: リスト1.1
- `arithtest.sh`: リスト1.2
- `fizzbuzz.sh`: リスト1.3
- `amount.sh`: リスト1.4
  - `fruit.csv`, `vuln.csv`: その入力用CSV
- `is_valid_number.function`: リスト1.5
- `bf.sh`: リスト1.7
  - `hello.bf`: リスト1.6
  - `cat.bf`: リスト1.8

#### chapter2

- `fib1.sh`: リスト2.1
- `hello-tr.sh`: リスト2.3
- `fib2.sh`: リスト2.4
- `quine.sh`: リスト2.5
- `hello-hash.sh`: リスト2.6
- `hello-ext-bash.sh`: リスト2.7
- `hello-err.sh`: リスト2.8
- `hello-arithmetic.sh`: リスト2.9
- `hello.zsh`: リスト2.10
- `hello-posix.sh`: リスト2.11
- `bf.sh`: リスト2.12
   - `mandelbrot.bf`(リスト2.13) は[こちら](https://github.com/erikdubbelboer/brainfuck-jit/blob/master/mandelbrot.bf)から
- `hello-7sym.sh`: リスト2.14

#### chapter3

- `prime.sh`: リスト3.1, 3.8 (*)
- `hello.rb`: リスト3.2
- `hello.sh`: リスト3.3
  - `bye.rb`, `bye.sh`: 本文p.62-64
- `hello-inifinite.sh`: リスト3.4 (*)
- `hello-finite.rb`: リスト3.5 (*)
- `rmtest.sh`: リスト3.6
- `hello-readall.sh`: リスト3.7
- `fizzbuzz.sh`: リスト3.9 (*)
- `primes-posix.sh`: リスト3.10 (*)
- `fizzbuzz-posix.sh`: リスト3.11 (*)
- `fib.sh`: リスト3.12 (*)
- `bf.sh`: リスト3.13 (*)

(*) を付したファイルは、実行すると自己追記してファイルを破壊することに注意。

#### chapter4

- `Makefile`: この章で紹介したスクリプトから画像を一括生成するための `Makefile`
- `ml.SVG`: リスト4.1 (`make clean` で消されないように拡張子をあえて大文字にしている)
- `hermann-svg.sh`: リスト4.2
- `hermann-pbm.sh`: リスト4.3
- `../chapter3/fib1.sh`: リスト4.4 (リスト3.1再掲)
- `fib-spiral.sh`: リスト4.5
- `fib-fractal.sh`: リスト4.6
- `mandelbrot.zsh`: リスト4.7 (実行にかなり時間がかかるので注意)
- `mandelbrot.sh`: リスト4.8 (同上)
- `koch.sh`: リスト4.9
- `koch-snowflake.sh`: リスト4.10
- `fib-fractal-l.sh`: リスト4.11
- `lsystem.function`: リスト4.12
- `dragon.sh`: リスト4.13
- `gosper.sh`: リスト4.14
- `fractalplant.sh`: リスト4.15
- `fractalplant2.sh`: 図4.13のソース(本文掲載なし)
- `lifegame.sh`: リスト4.16のワンライナーをシェルスクリプトの形に修正したもの
  - `sh lifegame.sh < input.jpg > output.gif` の形で実行する
- `sierpinski.sh`: リスト4.17

`sierpinski.sh` と `lifegame.sh` **以外**のスクリプトは、stdout に PNM/SVG 形式のデータを出力する。それを `convert` や `rsvg-convert` で PNG などの形式に変換すればよい。

`lifegame.sh` はアニメーションGIFを stdout に出力する。

`sierpinski.sh` はPGMからPNG形式への変換および `sierpinski.png` というファイルへの保存までを一括でおこなう。また、これは2章の自己追記スクリプトでもあるので、実行すると元のスクリプトが破壊されることにも注意。

#### cover

本書の表紙画像を生成するためのスクリプト。

- `Makefile`: 以下のスクリプトを実行し、必要な範囲を切り取って保存するラッパー
- `cover.sh`: 表紙、裏表紙、背表紙を連結した1枚の画像を生成(裏表紙に記載のスクリプト)
- `trial.sh`: お試し版の表紙(「お試し版」の文字を入れる)
- `adjust.sh`: 位置調整用の補助線を追加

カラー印刷用の350dpiのデータをドットバイドットで出力するので、かなり大きな画像になる(4244x2976ピクセル)。

### omake

本文に収録しなかった役に立たないスクリプト。

#### 1章、2章関連

- `fib.sh`
  - フィボナッチ数列を計算する(算術式+記号化; `sha1sum`を利用)
  - ぐれさんによる[解説記事](https://gist.github.com/greymd/455a13bb6f757c5ccd00bfb155d525e2)
- `primes.sh`
  - 100までの素数を求める(算術式+記号化; `m4`を利用)
- `primes2.sh`
  - 100までの素数を求める(`primes.sh`を記号化する前のもの)
- `pascal.sh`
  - 記号だけで[パスカルの三角形](https://ja.wikipedia.org/wiki/%E3%83%91%E3%82%B9%E3%82%AB%E3%83%AB%E3%81%AE%E4%B8%89%E8%A7%92%E5%BD%A2)(二項係数)
  - 文字の出力には `dd` を使うため、stderr に `dd` からのメッセージが大量に出力される
  - `bash pascal.sh 2>/dev/null` のように実行するとよい

#### 4章関連

`Makefile` を用意しているので、`make` 一発でスクリプトから画像を生成できる。

L-systemを使うものでも、本文で紹介した `lsystem.function` は利用していない。

シェルピンスキーのギャスケット

- `sierpinski.md`
  - 本文リスト4.17の解説
- `sierpinski-nosym.md`
  - 本文リスト4.17の記号・特殊変数をわかりやすい文字列に置換したもの
- `sierpinski-lsystem.sh`
  - L-systemによるシェルピンスキーのギャスケットその1
- `sierpinski-arrowhead.sh`
  - L-systemによるシェルピンスキーのギャスケットその2
  - こちらはとくに [Sierpinski arrowhead curve](https://en.wikipedia.org/wiki/Sierpi%C5%84ski_curve#Arrowhead_curve)と呼ばれる
- `sierpinski.sh`
  - 本文では紹介していない[IFS (反復関数系)](https://ja.wikipedia.org/wiki/%E5%8F%8D%E5%BE%A9%E9%96%A2%E6%95%B0%E7%B3%BB)というアルゴリズムを利用
  - 図形を構成する点の集合のいずれかをランダムでドットを打つ
  - 100回ドットを打つごとに1枚画像を生成し、それを300回計3万ドット繰り返したものを連結してGIFアニメにする

L-system

- `penrosetile.sh`
  - 表紙画像からペンローズタイル部分だけを抜き出したもの
  - 4000x4000ピクセルの巨大なPNGファイルを生成する
- `hilbert.sh`
  - 空間充填曲線のひとつ、ヒルベルト曲線

シェルスクリプト以外で画像を生成する例

- `mandelbrot.dc`
  - マンデルブロ集合を描く dc スクリプト
- `hexaflake.m4`
  - L-systemでヘキサフレークを描くm4マクロ
  - いくつものコッホ雪片を内包するフラクタル図形
- `barnsleyfern.awk`
  - IFSでBarnsley fern (フラクタルなシダ植物) を描くawkスクリプト

#### そのほかの役に立たないスクリプト

- `bf2c.sh`
  - brainfuckをCのプログラムに変換するトランスレータ
- `hello-vertical.sh`
  - 「スクリプト自身の各行の1文字目」を出力するスクリプト
  - 各行の先頭を縦読みすると…？
- `wordle.awk`
  - 何年か前に流行した WORDLE という単語ゲーム
  - わずか1行、[tweetable](https://x.com/yamaya/status/1487764102462140421)(このtweetからちょっと修正してもっと短縮している)
  - `awk -f wordle.awk` で実行
  - 本家に準じて、1日1問
  - debian 系のディストリビューションでは事前に `apt install wamerican` が必要

## 履歴

`fa44b46`などの文字列は奥付に記載されているリビジョン。

- 2026/11/23 `fa44b46` 初版第1刷 (技術書典21)
<!-- - 2026/11/xx `ce9a5e6` お試し版 -->
