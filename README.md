# システム再インストールを楽にする手順: 専用BashScriptのすすめ

![](https://raw.githubusercontent.com/yKesamaru/reinstall_system/main/assets/eye_catch.png)
## はじめに
Ubuntuは2年おきにLTS(Long Term Support)版がリリースされます。
わたしは最新版のLTS版がリリースされてから十分な期間を経て、LTS版を導入しています。たとえば、現在Ubuntu 22.04が最新版であり、まもなく24.04がリリースされるタイミングです。ですので今回のシステム入れ替えは20.04から22.04へのアップグレードとなります。

さて、ネット上には「〇〇をインストールしたらやること10か条」というような記事が多くあります。
それらはだいたい同じことが書いてある傾向があり、それをすべて手作業でおこなっています。

一方でAnsibleのような「大規模なインフラストラクチャの管理」に使われるツールがありますが、1台のPCのためにそれを使うのはオーバーキルです。

そこで簡単なBashScriptを書いて、それを実行するだけでシステムを再インストールできるようにしています。
随分昔からこの方法を使っていますが、大きな障害もなく使えています。

## スクリプト構成
スクリプトは以下の3つに分かれています。
- `ins.sh`: インストール時に必須のパッケージをダウンロードしたり、他のスクリプトを実行します。
- `apt_install_list.sh`: aptでインストールするパッケージのリストです。
- `copy_dot_files.sh`: ホームディレクトリにコピーするドットファイルのリストです。

::note::
これらスクリプトの中にはシステム固有の情報がハードコーティングされているため、ここでは公開できる部分に絞って掲載します。

### `ins.sh`
コメントに説明が書いてありますので、それぞれ参照いただくとして、説明が必要な部分を解説します。

https://github.com/yKesamaru/reinstall_system/blob/dcbf24f9259d4ea040d3f8dd2c4bdf8cda1868b9/ins.sh#L1-L169

#### 作業環境の設定

https://github.com/yKesamaru/reinstall_system/blob/542f9cec84464e12375562cefb56ad9cbf50e364/ins.sh#L29-L68

この部分ではユーザー体験に直接関わる設定をおこなっています。
`gsettings`コマンドを使用することにより、使い慣れたUIやキーバインド、各種設定を再現します。

これらをご自身の環境で再現する場合、`dconf watch /`コマンドを使い、設定を変更したときに出力されるコマンドを参考にすると良いでしょう。

![](https://raw.githubusercontent.com/yKesamaru/reinstall_system/main/assets/output.gif)

### `apt_install_list.sh`

https://github.com/yKesamaru/reinstall_system/blob/542f9cec84464e12375562cefb56ad9cbf50e364/apt_install_list.sh#L1-L124

こちらも説明が必要な部分のみ解説します。

#### NvidiaドライバーとCUDAライブラリのインストール

https://github.com/yKesamaru/reinstall_system/blob/542f9cec84464e12375562cefb56ad9cbf50e364/apt_install_list.sh#L55-L70

*この部分のみ、Ubuntuのバージョンによってインストールするパッケージが異なります。*
```bash
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
```
このURLは以下のページから取得してください。
[CUDA Toolkit 12.3 Update 1 Downloads](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_network)

![](https://raw.githubusercontent.com/yKesamaru/reinstall_system/main/assets/2023-12-14-13-06-04.png)

### VS Code

https://github.com/yKesamaru/reinstall_system/blob/542f9cec84464e12375562cefb56ad9cbf50e364/apt_install_list.sh#L73-L82

ここではマイクロソフトのリポジトリから取得していますが、snapでもインストールできます。その場合は以下のようになります。ただし以前snapバージョンでは日本語の取り回しに難があったため、わたしはdebパッケージを使用しています。

```bash
sudo snap install code
```

Flatpakでインストールするには以下の手順に沿います。

```bash
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.visualstudio.code
```

### `copy_dot_files.sh`

https://github.com/yKesamaru/reinstall_system/blob/81c66c1fa2f0413a51aab37eac602222f44f66aa/copy_dot_files.sh#L1-L35

これも説明不要かと思いますが、一部解説します。

https://github.com/yKesamaru/reinstall_system/blob/81c66c1fa2f0413a51aab37eac602222f44f66aa/copy_dot_files.sh#L23

大きな容量をとるフォント群は、ネットワークインストールするよりもローカルコピーした方が早いです。
`/home/user/.fonts`と`/home/user/.local/share/fonts`のどちらでも良いですが、より新しい規格は後者です。わたしは後者に統一しています。

https://github.com/yKesamaru/reinstall_system/blob/81c66c1fa2f0413a51aab37eac602222f44f66aa/copy_dot_files.sh#L31

ユーザーが管理する`systemd`ファイル群は`/home/user/.config/systemd/user`ディレクトリ以下で管理しています。
これもコピーするだけで復活します。

![](https://raw.githubusercontent.com/yKesamaru/reinstall_system/main/assets/2023-12-14-13-37-34.png)

## おわりに
以上で大方の説明は終わりです。
これで「〇〇をインストールしたらやること10か条」のような記事を見ながら手作業で設定する必要がなくなります。システム入れ替えは忘れた頃に必ずやってきますので、そのときにお役立てください。

以上です。ありがとうございました。