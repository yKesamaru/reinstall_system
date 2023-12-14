# システム再インストールを楽にする手順: 専用BashScriptのすすめ

![](assets/eye_catch.png)
## はじめに
Ubuntuは2年おきにLTS(Long Term Support)版がリリースされます。
わたしは最新版のLTS版がリリースされてから十分な期間を経て、その前のバージョンのLTS版をシステムとして導入しています。たとえば、現在Ubuntu 22.04が最新版であり、まもなく24.04がリリースされるタイミングです。ですので今回のシステム入れ替えは20.04から22.04へのアップグレードとなります。

さて、ネット上には「〇〇をインストールしたらやること10か条」というような記事が多くあります。
それらはだいたい同じことが書いてある傾向があり、それをすべて手作業でおこなっています。

一方でAnsibleのような「大規模なインフラストラクチャの管理」に使われるツールがありますが、1台のPCのためにそれを使うのはオーバーキルです。

そこで簡単なBashScriptを書いて、それを実行するだけでシステムを再インストールできるようにしています。
随分前からこの方法を使っていますが、大きな障害もなく使えています。

## スクリプト構成
スクリプトは以下の3つに分かれています。
- ins.sh: インストール時に必須のパッケージをダウンロードしたり、他のスクリプトを実行したりします。
- apt_install_list.sh: aptでインストールするパッケージのリストです。
- copy_dot_files.sh: ホームディレクトリにコピーするドットファイルのリストです。

:: note ::
これらスクリプトの中にはシステム固有の情報がハードコーティングされているため、ここでは公開できる部分に絞って掲載します。

### ins.sh
コメントに説明が書いてありますので、それぞれ参照いただくとして、説明が必要な部分を解説します。
#### 作業環境の設定
この部分ではユーザー体験に直接関わる設定をおこなっています。
`gsettings`コマンドを使用することにより、使い慣れたUIやキーバインド、各種設定を再現します。

これらをご自身の環境で再現する場合、`dconf watch /`コマンドを使い、設定を変更したときに出力されるコマンドを参考にすると良いでしょう。

```bash
$ dconf --help
error: unknown command --help

Usage:
  dconf COMMAND [ARGS...]

Commands:
  help              Show this information
  read              Read the value of a key
  list              List the contents of a dir
  write             Change the value of a key
  reset             Reset the value of a key or dir
  compile           Compile a binary database from keyfiles
  update            Update the system databases
  watch             Watch a path for changes
  dump              Dump an entire subpath to stdout
  load              Populate a subpath from stdin

Use 'dconf help COMMAND' to get detailed help.

$ dconf help watch
Usage:
  dconf watch PATH 

Watch a path for key changes

Arguments:
  PATH        Either a KEY or DIR
  KEY         A key path (starting, but not ending with '/')
  DIR         A directory path (starting and ending with '/')
```
![](assets/output.gif)

