
#!/bin/zsh
# author zixie code@bihe0832.com
#   source <(curl -fsSL https://raw.githubusercontent.com/bihe0832/Settings-Tools/master/tools/mac_init.sh)


# 文件隐藏显示
defaults write com.apple.finder AppleShowAllFiles -bool true
killAll Finder


# 工作环境
cd /Volumes/Document
cd /Volumes/Document/Documents
ln -s /Volumes/Document/Documents ~/Documents
ln -s /Volumes/Document/Documents ~/zixie
ln -s /Volumes/Document/Documents/Library /Users/zixie/lib
ln -s /Volumes/Document/Documents/Library ~/zixie/lib
cd /Volumes/Document/Documents
# mkdir web
# mkdir temp
# ln -s /Volumes/Document/Documents/temp ~/temp
# cd ~/temp 
# mkdir 1

# 环境配置
# cd  ~/zixie/
# mkdir github
# cd ~/zixie/github
# git clone git@github.com:bihe0832/bihe0832.github.io.git blog
# git clone git@github.com:bihe0832/Settings-Tools.git  --recursive
# git clone git@github.com:bihe0832/gitbook.git

cp -fr ~/zixie/github/Settings-Tools/config/.oh-my-zsh ~/.oh-my-zsh
cp -fr ~/zixie/github/Settings-Tools/config/mac/.zshrc ~/.zshrc

# 基础库安装
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install autoconf gifsicle readline xz dos2unix thefuck tree wget sqlite zsh-syntax-highlighting autojump bat git-open zsh-autosuggestions
brew install autoconf gifsicle readline xz dos2unix thefuck tree wget sqlite zsh-syntax-highlighting autojump bat git-open zsh-autosuggestions
brew install autoconf gifsicle readline xz dos2unix thefuck tree wget sqlite zsh-syntax-highlighting autojump bat git-open zsh-autosuggestions

# Maven
#https://blog.bihe0832.com/oss-sonatype.html
brew install github-keygen sh-keygen
sh-keygen -t rsa -C "code@bihe0832.com"
brew install gettext  ca-certificates  gmp  bdw-gc  m4  libtool  libunistring  pkg-config  readline  guile  libidn2  libtasn1  nettle  p11-kit  openssl  libevent  libnghttp2  unbound  gnutls  libgpg-error  libassuan  libgcrypt  libksba  libusb  npth pinentry
brew install gpg
# gpg --gen-key
# gpg --export-secret-keys  -o ~/.gnupg/secring.gpg
# gpg --list-key --keyid-format short

#git 
cp -fr ~/zixie/github/Settings-Tools/config/.gitdefaultconfig ~/.gitconfig

# python
brew reinstall python3

# ruby
sudo gem uninstall --all
brew reinstall ruby@2.6

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
cd  ~/zixie/github/gitbook
echo "favicon
donate" | xargs -I {} npm install gitbook-plugin-{}
npm install

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

brew update
brew cleanup
brew doctor

# 云端笔记
# cd ~/temp
# mkdir bootsnote
# open /Applications/WeiyunResona.app


# shot
cd ~/temp/1
mkdir shot
cp -fr ~/zixie/github/Settings-Tools/config/snipaste.ini ~/.snipaste/config.ini
