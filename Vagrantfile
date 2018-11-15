# Vagrantfile
# Based on http://terokarvinen.com/2018/automatically-provision-vagrant-virtualmacines-as-salt-slaves
# Edited by Jarno Wermundsen

$tscript = <<TSCRIPT
sudo apt-get update
sudo apt-get -y install salt-minion
echo -e "master: 172.28.172.49\nid: vag001"|sudo tee /etc/salt/minion 
sudo systemctl restart salt-minion

TSCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.provision "shell", inline: $tscript
end
