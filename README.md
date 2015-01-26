# vm_template

Virtuoso on Ubuntu 14.04．

このリポジトリをgit cloneし，仮想マシン名とIPアドレスを設定した後にvagrant upすると，
Ubuntu 14.04の仮想マシンの作成とVirtuosoのインストールが行われる．

仮想マシン名とIPアドレスの設定は，Vagrantfileを各種テキストエディタで編集するか，
sedコマンドで書き換える．
下記サンプルはMacのsedを使った場合のものであり，UbuntuやDebian，CentOSなどで
実行する場合はsedのオプションを適宜修正すること．

``
git clone https://github.com/tsunagun/vm_virtuoso.git
cd vm_virtuoso
git submodule update --init
sed -i "" -e "s/^vm_name.*/vm_name = 'virtuoso'/" Vagrantfile
sed -i "" -e "s/^ip_address.*/ip_address = '192.168.33.102'/" Vagrantfile
vagrant up
vagrant ssh
``
