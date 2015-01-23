#!/usr/bin/env bash

sudo aptitude update
sudo aptitude safe-upgrade -y

sudo ufw default DENY
sudo ufw limit ssh
sudo ufw allow 8890
yes | sudo ufw enable

sudo sed -i -e "s/^PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config
sudo service ssh restart

sudo aptitude install -y build-essential autoconf automake libssl-dev libtool flex bison gperf gawk git-core vim
cp -r /vagrant/virtuoso-opensource ~/
cd ~/virtuoso-opensource
git pull
git checkout stable/7
./autogen.sh
./configure --with-layout=debian --program-transform-name="s/isql/isql-v/" CFLAGS="-O2 -m64"
make
sudo make install
sudo chown -R vagrant /var/lib/virtuoso/db

cat <<EOS

設定ファイルの場所
  /var/lib/virtuoso/db/virtuoso.ini

起動コマンド
  virtuoso-t -c /var/lib/virtuoso/db/virtuoso.ini

EOS
