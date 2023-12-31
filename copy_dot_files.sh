#!/usr/bin/env bash

# Home Directory
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/bin/ /home/user/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/テンプレート/ /home/user/

# Home Directory Dot Files & Dot Directory
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.bash_history /home/user/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.cspell/custom-dictionary-user.txt /home/user/ # cSpell.customDictionaries
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.gitconfig /home/user/                        # Git init file.
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.grsync/ /home/user/                          # grsyncの過去ログフォルダ
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.icons/ /home/user/                           # Gnomeの場合`/home/user/.icons`, xfce4の場合'/home/user/.local/share/icons'
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.mozc /home/user/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.ssh/ /home/user/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.themes/ /home/user/

# Specific Directory
mkdir -p /home/user/.local/state
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/state /home/user/.local/ # vscodeのmarkdown preview用のcssファイル

# `.local/share/` Directory
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/backgrounds/ /home/user/.local/share/ # WALLPAPERS
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/fonts/ /home/user/.local/share/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/icons/ /home/user/.local/share/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/keyrings/ /home/user/.local/share/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/nautilus/ /home/user/.local/share/ # for nautilus script folder.
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/themes/ /home/user/.local/share/

# `.config` Directory
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/nautilus/ /home/user/.config/     # search-metadata, accels, etc.
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/systemd/ /home/user/.config/
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.config/autostart/Flameshot.desktop /home/user/.config/autostart/

# applications folder
cp -afv /media/user/BACKUP_HDD/homeフォルダバックアップ/.local/share/applications/pm-suspend.desktop /home/user/.local/share/applications/;
