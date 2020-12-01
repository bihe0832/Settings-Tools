
#!/bin/zsh
# author zixie code@bihe0832.com

defaults write com.apple.finder AppleShowAllFiles -bool true

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
brew reinstall autoconf gifsicle readline xz dos2unix thefuck tree wget sqlite zsh-syntax-highlighting autojump bat git-open zsh-autosuggestions
mkdir github
cd github
git clone https://github.com/bihe0832/bihe0832.github.io.git blog
git clone https://github.com/bihe0832/Settings-Tools.git
cp -fr ~/zixie/github/Settings-Tools/config/.oh-my-zsh ~/.oh-my-zsh
cp -fr ~/zixie/github/Settings-Tools/config/mac/.zshrc ~/.zshrc
source ~/.zshrc

cd ~/temp
mkdir bootsnote
# open /Applications/WeiyunResona.app