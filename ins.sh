#!/usr/bin/env bash

sudo su &

# ----------------------------------------------
# 最初にインストールしたばかりのシステムをアップデートする必要がある
# ----------------------------------------------
apt update && apt upgrade -y


# ----------------------------------------------
# 必要なライブラリをインストールする
# ----------------------------------------------
apt install -y apt-transport-https
apt install -y ca-certificates
apt install -y curl
apt install -y ufw
apt install -y zenity
apt install -y fcitx
apt install -y tee


# ----------------------------------------------
# ufw 有効化
# ----------------------------------------------
ufw enable


# ----------------------------------------------
# 作業環境の設定
# ----------------------------------------------
# 監視: dconf watch /
# 出力: dconf dump /
# 出力: gsettings list-recursively
# デスクトップウィンドウマネージャの設定を変更
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
# タッチパッドの設定を変更
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing false
# インターフェースの設定を変更
gsettings set org.gnome.desktop.interface clock-show-weekday true
# Nautilusのアイコンビューのキャプションを設定
gsettings set org.gnome.nautilus.icon-view captions "['size', 'date_accessed', 'none']"
# Nautilusのデフォルトの並び順を設定
gsettings set org.gnome.nautilus.preferences default-sort-order 'mtime'
# GTKテーマを設定
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
# Dash to Dockのアイコン最大サイズを設定
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
# Dash to Dockのマウント表示設定を変更
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
# Dash to Dockのごみ箱表示設定を変更
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
# デスクトップのアイドル遅延時間を設定（0は無効）
gsettings set org.gnome.desktop.session idle-delay uint32 0
# スクリーンセーバーのロックを無効にする
gsettings set org.gnome.desktop.screensaver lock-enabled false
# 通知設定を変更
gsettings set org.gnome.desktop.notifications.application.gnome-printers-panel application-id 'gnome-printers-panel.desktop'
# 通知アプリケーションの子リストを設定
gsettings set org.gnome.desktop.notifications application-children "['gnome-network-panel', 'apport-gtk', 'org-gnome-nautilus', 'snap-store-ubuntu-software', 'gnome-printers-panel']"
# デスクトップのお気に入りやランチャーに表示されるアプリケーションのリストを設定
gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'google-chrome.desktop', 'thunderbird.desktop', 'org.gnome.Nautilus.desktop', 'snap-store_ubuntu-software.desktop', 'yelp.desktop', 'PCSX2.desktop', '8TB_mount.desktop', 'rpcs3-emu_rpcs3.desktop', 'nmcli_n_on.desktop', 'nmcli_n_off.desktop', 'gnome-system-monitor.desktop']"
# ボリュームダウンのショートカットキーを設定
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['<Alt>9']"
# ボリュームアップのショートカットキーを設定
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['<Alt>0']"
# フルスクリーン切り替えのキーバインディングを設定
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['F11']"


# ----------------------------------------------
# DNS変更
# ----------------------------------------------
nmcli c m 有線接続\ 1 ipv4.dns x.x.x.x  # DNSサーバーのアドレスは任意に変更して下さい
systemctl restart NetworkManager


# ----------------------------------------------
# バックアップハードディスクのマウント
# ----------------------------------------------
mkdir /media/user/xxxx  # マウントポイントxxxxは任意に変更して下さい
mount /dev/disk/by-label/xxxx  /media/user/xxxx


# -----------------------------------
# 必要なファイルをコピー
# -----------------------------------
cd /media/user/BACKUP_HDD/homeフォルダバックアップ/XXXXX  # XXXXXは任意に変更して下さい
cp -afv ./apt_install_list.sh /home/user/
cp -afv ./copy_dot_files.sh /home/user/
cp -afv ./notice.wav /home/user/


# -----------------------------------
# apt_install_list.sh実行
# -----------------------------------
# repository追加
add-apt-repository universe
add-apt-repository multiverse
add-apt-repository restricted
# http://jp.archive.ubuntu.com/ubuntu/リポジトリにpartnerはない
add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"  # partner

apt update && apt upgrade -y

# apt_install_list.sh実行
chmod +x apt_install_list.sh
bash -c /home/user/apt_install_list.sh | tee apt_install.log


# -----------------------------------
# CUDA & Others
# -----------------------------------
# ./apt_install_list.shに記載


# -----------------------------------
# make do copy_dot_files.sh
# -----------------------------------
chmod +x /home/user/copy_dot_files.sh
bash -c /home/user/copy_dot_files.sh
chown -R user:user /home/user/*


# ----------------------------------------------
# remove files
# ----------------------------------------------
rm apt_install_list.sh
rm copy_dot_files.sh


# -----------------------------------
# ufw for kdeconnect
# -----------------------------------
ufw allow in on enp6s0 log proto tcp from PRIVATE_ADDRESS to PRIVATE_ADDRESS port 1714:1716
ufw allow in on enp6s0 log proto udp from PRIVATE_ADDRESS to PRIVATE_ADDRESS port 1714:1716


# -----------------------------------
# ufw for GitHub
# -----------------------------------
ufw allow from ADDRESS to any port PORT_NUMBER


# -----------------------------------
# bashrc file, Add postscript
# -----------------------------------
cat postscript_bashrc.txt >> /home/user/.bashrc



# ----------------------------------------------
# User add
# ----------------------------------------------
# 現行ユーザをdockerグループに所属させる
gpasswd -a user docker

# 一部コマンドをパスワード無しで実行する
touch /etc/sudoers.d/user
chmod 0440 /etc/sudoers.d/user
cat <<EOF >> /etc/sudoers.d/user
user ALL=(ALL) NOPASSWD:APPLICATION_PATH
EOF


# ----------------------------------------------
# end of installation
# ----------------------------------------------
apt autoremove -y