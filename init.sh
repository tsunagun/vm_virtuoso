#!/usr/bin/env bash

sudo aptitude update
sudo aptitude safe-upgrade -y

sudo ufw default DENY
sudo ufw limit ssh
sudo ufw enable

sudo sed -i -e "s/^PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config
sudo service ssh restart

sudo aptitude install -y build-essential autoconf libtool flex bison gperf gawk git-core vim
git clone https://github.com/openlink/virtuoso-opensource.git
cd virtuoso-opensource
export CFLAGS="-O2 -m64"  # 64bit版としてビルドするための設定
./autogen.sh
./configure --with-layout=debian
make
sudo make install
# sudo vim /var/lib/virtuoso/db/virtuoso.ini  #設定ファイルの編集
# サーバの起動は virtuoso-t -c /var/lib/virtuoso/db/virtuoso.ini
#!/usr/bin/env bash
