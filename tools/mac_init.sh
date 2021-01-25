
#!/bin/zsh
# author zixie code@bihe0832.com

# 文件隐藏显示
defaults write com.apple.finder AppleShowAllFiles -bool true

# 工作环境
cd /Volumes/Document
mkdir Documents
cd Documents
ln -s /Volumes/Document/Documents ~/Documents
ln -s ~/Documents ~/zixie
ln -s /Users/zixie/lib ~/zixie/lib
cd /Volumes/Document/Documents
mkdir temp
ln -s /Volumes/Document/Documents/temp ~/temp
cd ~/temp 
mkdir 1
mkdir web

# 基础库安装
brew reinstall autoconf gifsicle readline xz dos2unix thefuck tree wget sqlite zsh-syntax-highlighting autojump bat git-open zsh-autosuggestions

# python
brew reinstall python@2 python3

# jekyll
sudo gem uninstall --all
brew install ruby@2.6
gem install ffi -- --disable-system-libffi 
gem install jekyll
gem install github-pages

# 云端笔记
cd ~/temp
mkdir bootsnote
# open /Applications/WeiyunResona.app

# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
nvm install v10.23.0
nvm use v10.23.0

npm config delete proxy
npm config set registry https://registry.npm.taobao.org -g
npm config get registry
npm config get proxy
npm install -g nrm
nrm test
nrm use taobao
npm install gitbook-cli -g

# 环境配置
mkdir github
cd github
git clone https://github.com/bihe0832/bihe0832.github.io.git blog
git clone https://github.com/bihe0832/Settings-Tools.git
git clone https://github.com/bihe0832/gitbook.git
cd  ~/zixie/github/gitbook
gitbook install
cp -fr ~/zixie/github/Settings-Tools/config/.oh-my-zsh ~/.oh-my-zsh
cp -fr ~/zixie/github/Settings-Tools/config/mac/.zshrc ~/.zshrc
source ~/.zshrc

# apache
sudo chmod -R 755 /Volumes/Document/Documents/web/
sudo cp -fr ~/zixie/github/Settings-Tools/config/httpd-vhosts.conf /etc/apache2/extra/httpd-vhosts.conf