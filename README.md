# neticon
サーバーの稼働状態を Windows のタスクバーの通知領域上のアイコンで監視する為のツールです。

## 使用方法

下のような感じで引数を与えてください。ポート番号を省略すると ping(icmp) による確認となり、監視間隔を省略すると60秒単位となります。(全て省略すると usage が表示されます。)

> `neticon.exe` [リモートホスト名[:ポート番号][@監視間隔(秒単位)] [アイコンファイル名 [アイコンインデックス値]]]

Windows のログイン時に自動的に起動するような仕組みは作ってないので必要に応じて [ファイル名を指定して実行] ( [田]+[R] ) から `shell:startup` を開いてショートカットを登録してください。

### 使用例

>`neticon.exe github.com`

60秒ごとに github.com を ping で生死確認。通知領域のアイコンには default のモノを使用。

>`neticon.exe twitter.com:443@90 twitter.ico`

90秒ごとに twitter.com の 443 番ポートにアクセスして生死確認。通知領域のアイコンには twitter.ico を使用。

## ビルド方法

### 前準備

#### [Visual Studio](https://www.visualstudio.com/)

Visual Studio のインストールは C++ コンパイラと Windows SDK が含まれるようにしてください。
Visual Studio 2017 より新しい Visual Studio や通常と異なるパスにインストールした場合などは `.\source\solomon\conf\config.%COMPUTERNAME%.cmd` を作成し

> `@SET VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat`

といった感じで vcvarsall.bat のパスを指定してください。


#### [solomon](https://github.com/wraith13/solomon)

solomon についてはこのプロジェクトのローカルコピーのパスが `C:\github\wraith13\neticon` である場合に  `C:\github\wraith13\solomon` のように隣にローカルコピーを用意する分には設定の必要はありませんがそれ以外のパスに用意した場合は `.\source\solomon\conf\config.%COMPUTERNAME%.cmd` を作成し

> `@SET SOLOMON_MAIN_CMD=%~dp0..\..\..\..\solomon\cmd\main.cmd`

といった感じで solomon の main.cmd のパスを指定してください。


### ビルドの実行

コマンド プロンプトから `.\source\solomon\build.cmd` を実行します。正常にビルドが完了すれば コマンド プロンプト の文字が緑色になり `.\snapshot\result\` にビルドされたバイナリがビルドのタイプ別に出力されます。

 `.\source\solomon\auto.build.cmd` を実行しておくと `.\source\` ディレクトリ下の変更を検知しファイルが更新される度に自動的にビルドが実行されます。

### リリース用パッケージの作成

事前にビルドを行った上で、コマンド プロンプトから `.\make.release.package.cmd` を実行すると `.\release\` ディレクトリにリリース用パッケージが作成されます。

## ファイル/ディレクトリ構成

### .\readme.md

このファイルです。

### .\LICENSE_1_0.txt

このソフトウェアで採用しているライセンス

### .\make.release.package.cmd

リリース用パッケージ作成バッチです。
このバッチが行うのはリリース用パッケージの作成のみであり、事前に別途ビルドが実行されている必要があります。

### .\release\

リリース用パッケージ作成バッチによって作成されるリリース用パッケージが格納されるディレクトリです。

### .\snapshot\

solomon によって作成されるディレクトリです。

### .\snapshot\master\

solomon がビルド時に .\source\ ディレクトリをミラーしたディレクトリです。
.\testsnap\ ディレクトリへは .\source\ から直接ミラーされるのではなく、こちらのディレクトリから間接的にミラーされます。
こうすることでビルド中にソースコードを変更されてもソースコードとそのビルド結果の組み合わせがブレることがないようにしています。

### .\snapshot\result\

solomon によって作成されたビルドされた結果のファイルが格納されるディレクトリです。

### .\snapshot\misssed.compile\

solomon でのビルドに失敗した時のソースディレクトリがこちらに保存されます。

> 全保存されるので必要に応じて古いヤツは削除してください。

### .\snapshot\passed.compile\

solomon でのビルドに成功した時のソースディレクトリがこちらに保存されます。

> 全保存されるので必要に応じて古いヤツは削除してください。

### .\snapshot\solomon.data\

solomon が前回の実行結果を保存しておく為のディレクトリです。


### .\source\

ソースディレクトリです。
基本的にビルドに必要な全てのファイルはこのディレクトリに含まれ、また同時にビルドに不要なファイルは含みません。

### .\source\resource\

リソース関連のディレクトリです。

### .\source\solomon\

solomon 関連のディレクトリです。

### .\source\solomon\build.cmd

ビルドを実行するバッチファイルです。このコマンドの実行には solomon が必要になります。

### .\source\VERSION.cmd

次回ビルドに version.json に展開されるバージョン番号が格納されるバッチファイルです。ビルドの度に自動的にビルド番号がインクリメントされます。

### .\testsnap\

solomon がビルドを行う時に実際に対象のビルドを実行するディレクトリです。

## ライセンス

Boost Software License - Version 1.0 を採用しています。
詳細は [.\LICENSE_1_0.txt](./LICENSE_1_0.txt) を参照してください。

日本語参考訳: http://hamigaki.sourceforge.jp/doc/html/license.html

## バージョン採番ルール

### バージョン表記のフォーマット

`A.BB.CCC`

### メジャーバージョン番号(`A`)

明らかな非互換の変更が行われた際にインクリメント。
桁数は不定。

### マイナーバージョン番号(`BB`)

機能追加や上位互換と判断できる仕様変更が行われた際にインクリメント。
桁数は2桁固定。

### ビルド番号(`CCC`)

バグフィックスや仕様変更というほどでもない微細な修正が行われた際にインクリ
メント。
桁数は3桁固定。

### 細則

* 各番号は0始まりとする。
* 固定桁に足りない場合は先頭を0埋めする。
* 番号が固定桁で足りなくなった場合は、上位の番号をインクリメントする。
* 上位の番号がインクリメントされた場合、下位の番号は0にリセットする。
