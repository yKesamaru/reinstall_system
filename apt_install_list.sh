#!/usr/bin/env bash

apt update && apt upgrade -y


# # ----------------------------------------------
# # 最小構成
# # ----------------------------------------------
apt install -y coreutils
apt install -y vlc
apt install -y mcomix
apt install -y sox
apt install -y fcitx
apt install -y fcitx-config-gtk
apt install -y fcitx-mozc
apt install -y fcitx-table-emoji
apt install -y fcitx-tools


# # -----------------------------------
# # FACE01用
# # -----------------------------------
apt update && apt upgrade -y
apt install -y build-essential
apt install -y cmake
apt install -y curl
apt install -y ffmpeg
apt install -y git
apt install -y libavcodec-dev
apt install -y libavformat-dev
apt install -y libboost-all-dev
apt install -y libbz2-dev

apt install -y libffi-dev
apt install -y liblzma-dev
apt install -y libncurses5-dev
apt install -y libreadline-dev
apt install -y libsqlite3-dev
apt install -y libssl-dev
apt install -y libswscale-dev
apt install -y libxml2-dev
apt install -y libxmlsec1-dev

apt install -y pybind11-dev
apt install -y python3-dev
apt install -y python3-tk
apt install -y python3-venv

apt install -y synaptic
apt install -y tk-dev
apt install -y wget
apt install -y webp


# # ----------------------------------------------
# # Nvidia ドライバーとCUDAライブラリのインストール
# # ----------------------------------------------
cd /home/user || exit
apt install -y cuda-drivers
# 22.04の場合（ネットワークインストール）
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
apt update
apt -y install cuda-toolkit-12-3

# その他ライブラリのインストール
apt install -y libcudnn8
apt install -y libcudnn8-dev
apt install -y libcublas
apt install -y libcublas-dev


# # -----------------------------------
# # VSCode
# # -----------------------------------
if [[ ! -e /home/user/microsoft.gpg ]]; then
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
fi
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
bash -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt update
apt install -y code


# # ----------------------------------------------
# # ポストインストール
# # ----------------------------------------------
apt install -y baobab
apt install -y catfish
apt install -y cheese
apt install -y dconf-editor
apt install -y fdupes
apt install -y ffmpegthumbnailer
apt install -y font-manager
apt install -y gimp
apt install -y gnome-system-tools
apt install -y gnome-tweaks
apt install -y gnupg-agent
apt install -y gparted
apt install -y grsync
apt install -y gufw
apt install -y gthumb
apt install -y handbrake
apt install -y inkscape
apt install -y inxi
apt install -y libreoffice-calc
apt install -y manpages-ja
apt install -y meld
apt install -y mplayer
apt install -y ncdu
# pcmanfm-qt ファイルマネージャ
apt install -y pcmanfm-qt
apt install -y qt5ct
apt install -y gnome-session
# thunar ファイルマネージャ
apt install -y thunar
# p7zip アーカイバ
apt install -y p7zip

apt install -y pm-utils
apt install -y printer-driver-gutenprint
apt install -y pwgen
apt install -y rdfind
apt install -y simple-scan
apt install -y simplescreenrecorder
apt install -y thunderbird-gnome-support
apt install -y translate-shell
apt install -y transmission-gtk
apt install -y tree
apt install -y tumbler-plugins-extra
apt install -y usb-creator-gtk
apt install -y xsane
apt install -y xsel