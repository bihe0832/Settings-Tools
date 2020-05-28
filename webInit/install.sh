#!/bin/bash
# author code@bihe0832.com

function checkResult() {  
   result=$?
   echo "result : $result"
   if [ $result -eq 0 ];then
      echo "checkResult: execCommand succ"
   else
    echo "checkResult: execCommand failed"
    exit $result
   fi
}  
#zsh git
sudo yum update
sudo yum -y install zsh
sudo yum -y install git

cd ~/
mkdir temp 
if [ ! -d "~/zixie" ]; then
  mkdir ~/zixie
fi
if [ ! -d "~/zixie/github" ]; then
  mkdir ~/zixie/github/
fi

cd ~/zixie/github/
checkResult
if [ ! -d "./Settings-Tools" ]; then
  git clone https://github.com/bihe0832/Settings-Tools.git
fi
cp -fr ~/zixie/github/Settings-Tools/config/.oh-my-zsh/ ~/
cp -fr ~/zixie/github/Settings-Tools/config/linux/.zshrc ~/
chsh -s /bin/zsh

sudo yum -y install tree
sudo yum -y install rz
sudo yum -y install lrzsz

sudo yum update
sudo yum -y install nginx
sudo yum -y install php
sudo yum -y install mysql
sudo yum -y install php-fpm
sudo yum -y install mysql-server