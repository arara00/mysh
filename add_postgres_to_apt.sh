#!/bin/bash
echo "https://wiki.postgresql.org/wiki/Apt"

echo "依存パッケージのインストール"
sudo apt update
sudo apt install curl ca-certificates gnupg

echo "公開鍵の追加"
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg >/dev/null

echo "aptリポジトリのソースにpostgresを追加"
sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt update

echo "postgresqlをaptリポジトリに追加しました。"
echo "Next: sudo apt install postgresql-(version)"
