# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<-SCRIPT
  NIM_VERSION="0.20.2"
  sudo apt update
  sudo apt install -y git
  if test -f "/vagrant/.nim-lock"
  then
    echo "remove .nim-lock to force reinstall nim"
  else
    cd $HOME
    wget "https://nim-lang.org/download/nim-${NIM_VERSION}-linux_x32.tar.xz"
    tar -xf "nim-${NIM_VERSION}-linux_x32.tar.xz"
    cd "nim-$NIM_VERSION"
    bash install.sh /usr/bin
    sudo cp ./bin/nimble /usr/bin
    sudo cp ./lib/nimbase.h /usr/include/ 
    cd /vagrant/
    nimble install sdl1 -y
    nimble install imageman -y
    nim -v
    touch .nim-lock
  fi
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-14.04-i386"
  config.vm.provision "shell", inline: $script
end
