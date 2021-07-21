
#!/bin/zsh
# author zixie code@bihe0832.com
#   source <(curl -fsSL https://raw.githubusercontent.com/bihe0832/Settings-Tools/master/tools/mac_init.sh)


# 文件隐藏显示
defaults write com.apple.finder AppleShowAllFiles -bool true

# 工作环境
rm -fr ~/Documents
cd /Volumes/Document
mkdir Documents
cd /Volumes/Document/Documents
ln -s /Volumes/Document/Documents ~/Documents
ln -s ~/Documents ~/zixie
ln -s /Volumes/Document/Documents/Library /Users/zixie/lib
ln -s /Users/zixie/lib ~/zixie/lib
cd /Volumes/Document/Documents
mkdir web
mkdir temp
ln -s /Volumes/Document/Documents/temp ~/temp
cd ~/temp 
mkdir 1

# 环境配置
cd  ~/zixie/
mkdir github
cd ~/zixie/github
git clone https://github.com/bihe0832/bihe0832.github.io.git blog
git clone https://github.com/bihe0832/Settings-Tools.git  --recursive
git clone https://github.com/bihe0832/gitbook.git
cd  ~/zixie/github/gitbook
echo "favicon
donate" | xargs -I {} npm install gitbook-plugin-{}
npm install

cp -fr ~/zixie/github/Settings-Tools/config/.oh-my-zsh ~/.oh-my-zsh
cp -fr ~/zixie/github/Settings-Tools/config/mac/.zshrc ~/.zshrc
source ~/.zshrc


# ruby
sudo gem uninstall --all
brew reinstall ruby@2.6
source ~/.zshrc

# 基础库安装
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew reinstall autoconf gifsicle readline xz dos2unix thefuck tree wget sqlite zsh-syntax-highlighting autojump bat git-open zsh-autosuggestions
brew update
# python
brew reinstall python@2 python3

# jekyll
gem install ffi -- --disable-system-libffi 
gem install jekyll
gem install github-pages

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

# apache
sudo chmod -R 755 /Volumes/Document/Documents/web/

sudo cp -fr ~/zixie/github/Settings-Tools/config/httpd-vhosts.conf /etc/apache2/extra/httpd-vhosts.conf
cp -fr /etc/apache2/httpd.conf /etc/apache2/httpd.conf.bak
src="#Include \\/private\\/etc\\/apache2\\/extra\\/httpd-vhosts.conf"
dst="Include \\/private\\/etc\\/apache2\\/extra\\/httpd-vhosts.conf"
cat /etc/apache2/httpd.conf | sed "s/$src/$dst/g" > ~/zixie/temp/httpd.conf
sudo mv -f ~/zixie/temp/httpd.conf /etc/apache2/httpd.conf

cp -fr /etc/hosts /etc/hosts.bak
if [ `cat /etc/hosts | grep "local.bihe0832.com" | wc -l` -gt 0 ]
then
    src="[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\ local.bihe0832.com"
    dst="127.0.0.1 local.bihe0832.com"
    cat /etc/hosts | sed "s/$src/$dst/g" > ~/zixie/temp/hosts
    cat ~/zixie/temp/hosts
    sudo mv -f ~/zixie/temp/hosts /etc/hosts
else
    cp -fr /etc/hosts ~/zixie/temp/hosts
    echo "127.0.0.1 local.bihe0832.com" >> ~/zixie/temp/hosts
    sudo mv -f ~/zixie/temp/hosts /etc/hosts
fi
cat /etc/hosts
sudo apachectl restart

brew cleanup
brew doctor

# 云端笔记
cd ~/temp
mkdir bootsnote
open /Applications/WeiyunResona.app
