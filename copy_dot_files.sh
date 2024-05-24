#!/usr/bin/env bash

# Home Directory
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/bin/ /home/terms/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/テンプレート/ /home/terms/

# Home Directory Dot Files & Dot Directory
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.bash_history /home/terms/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.cspell/custom-dictionary-user.txt /home/terms/ # cSpell.customDictionaries
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.gitconfig /home/terms/                        # Git init file.
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.grsync/ /home/terms/                          # grsyncの過去ログフォルダ
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.icons/ /home/terms/                           # Gnomeの場合`/home/terms/.icons`, xfce4の場合'/home/terms/.local/share/icons'
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.mozc /home/terms/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.ssh/ /home/terms/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.themes/ /home/terms/

# Specific Directory
mkdir -p /home/terms/.local/state
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/state /home/terms/.local/ # vscodeのmarkdown preview用のcssファイル

# `.local/share/` Directory
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/backgrounds/ /home/terms/.local/share/ # WALLPAPERS
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/fonts/ /home/terms/.local/share/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/icons/ /home/terms/.local/share/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/keyrings/ /home/terms/.local/share/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/nautilus/ /home/terms/.local/share/ # for nautilus script folder.
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/themes/ /home/terms/.local/share/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/applications/ /home/terms/.local/share/

# `.config` Directory
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/nautilus/ /home/terms/.config/     # search-metadata, accels, etc.
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/systemd/ /home/terms/.config/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/autostart/ /home/terms/.config/autostart/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/voicevox/ /home/terms/.config/voicevox/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/PCSX2/ /home/terms/.config/PCSX2/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/rpcs3/ /home/terms/.config/rpcs3/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/qt5ct/ /home/terms/.config/qt5ct/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/pcmanfm-qt/ /home/terms/.config/pcmanfm-qt/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/Thunar/ /home/terms/.config/Thunar/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/xfce4/ /home/terms/.config/xfce4/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/nautilus/ /home/terms/.config/nautilus/

# applications folder
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/applications/pm-suspend.desktop /home/terms/.local/share/applications/;
