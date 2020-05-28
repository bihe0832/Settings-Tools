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

# 卸载旧版本的nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
nvm --version
cd ~/.nvm 
git fetch -p
git checkout $(git describe --tags `git rev-list --tags --max-count=1`)
nvm --version
nvm use node
npm install pm2 -g


sudo yum update
sudo yum -y install nginx
sudo yum -y install php
sudo yum -y install mysql
sudo yum -y install php-fpm
sudo yum -y install mysql-server

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install ruby-2.4.1
rvm 2.4.1 --default
ruby -v
rvm install rubygems 2.6.12 --force
gem -v
gem sources -l
gem install jekyll bundler github-pages jekyll-paginate
jekyll -v

chmod 755 /usr/local/rvm/gems/ruby-2.4.1/bin/*


