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
git config --global credential.helper store

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
  git clone https://github.com.cnpmjs.org/bihe0832/Settings-Tools.git
fi
cp -fr ~/zixie/github/Settings-Tools/config/.oh-my-zsh/ ~/
cp -fr ~/zixie/github/Settings-Tools/config/linux/.zshrc ~/
chsh -s /bin/zsh

/bin/bash ~/zixie/github/Settings-Tools/webInit/install_env.sh
/bin/bash ~/zixie/github/Settings-Tools/webInit/install_node.sh
/bin/bash ~/zixie/github/Settings-Tools/webInit/install_jekyll.sh