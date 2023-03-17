# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST=10000
# 以附加的方式写入历史纪录 
setopt INC_APPEND_HISTORY 
# 如果连续输入的命令相同 ， 历史纪录中只保留一个 
setopt HIST_IGNORE_DUPS 
# 为历史纪录中的命令添加时间戳 
setopt EXTENDED_HISTORY

# 启用 cd 命令的历史纪录 ，cd -[TAB] 进入历史路径 
setopt AUTO_PUSHD 
# 相同的历史路径只保留一个 
setopt PUSHD_IGNORE_DUPS

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(cp adb brew github svn ant autojump gitignore gradle command-not-found sublime)



# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
UNAME_MACHINE="$(uname -m)"
if [[ "$UNAME_MACHINE" == "arm64" ]]; then
  	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
	source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
	source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

bindkey ',' autosuggest-accept


# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ulimit -S -n 1024
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#shell
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='zip -r'
alias -s unzip='unzip'
alias -s bz2='tar -xjvf'
alias cls='clear'
alias ll='ls -l'
alias la='ls -a'
alias vi='vim'

alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias ping="ping -c 10 -i 0.5" #ping 十次，每次间隔0.5秒
alias datedetail="date +%s && date +'%Y-%m-%d %H:%M:%S %W'"
alias temp='cd ~/temp/1 && pwd'
alias iconvgbk2utf8='iconv -f gbk -t utf8'
alias iconvutf82gbk='iconv -f utf8 -t gbk'

fun wgettemp() {
	temp && wget -P $1
}

fun bootsnoteimage() {
	open ~/zixie/temp/bootsnote/$1/attachments/$2
}

fun upper() {
	echo $1 | tr a-z A-Z
}


fun lower() {
	echo $1 | tr A-Z a-z
}

#mac
alias his='history | grep '

fun zixieproxyon() {
	export http_proxy='http://127.0.0.1:12639';
	export https_proxy='http://127.0.0.1:12639'
	export no_proxy="*.oa.com|*.tencent.com|127.0.0.1|localhost"

}

fun zixieproxyoff() {
	export http_proxy='';
	export https_proxy=''
}

alias zixiemavenhost="/bin/bash ~/zixie/github/Settings-Tools/as/setMavenHost.sh"
alias zixieWifion='networksetup -setairportpower en0 on'
alias zixieWifioff='networksetup -setairportpower en0 off'
alias zixiememsizelist="/bin/bash ~/zixie/github/Settings-Tools/tools/clear_myMac.sh"
alias zixienewtextfile="temp && date +'%Y%m%d_%H%M%S_temp.txt' | xargs -I {} touch ./{}"
alias zixiedelsdstore="find ./ -name ".DS_Store" -delete "

alias zixiekillsublime="ps -aux | grep -i 'sublime' | awk '{print $5}' | cut -d\"/\" -f3 | cut -d \".\" -f1 | xargs -I {} pkill {}"
alias zixiekillpreview="pkill Preview"
alias zixiepkillapppre='zixiepkillapppre(){ ps -aux | grep -i $1}; zixiepkillapppre'
alias zixiepkillappsubcommand='awk "{print $5}" | cut -d"/" -f3 | cut -d "." -f1 | xargs -I {} pkill {}'
alias zixiepkillapp='zixiepkillapp(){ ps -aux | grep -i $1 | zixiepkillappsubcommand};zixiepkillapp'


#mac shuang
alias shuangnewtextfile="zixienewtextfile && date +'%Y%m%d_%H%M%S_temp.txt' | xargs -I {} echo new file: `temp`/{}"
alias shuangscreenshots='zixieandroidadbscreenshots'
alias shuangapktoold='zixieandroidapktoold'

#zsh
alias zshback='cp ~/.zshrc ~/zixie/github/Settings-Tools/config/mac' 
alias zshrestore='cp ~/zixie/github/Settings-Tools/config/mac/.zshrc ~/ && source ~/.zshrc'
alias zsheditmac='open ~/zixie/github/Settings-Tools/config/mac/.zshrc'

alias zixiegohome='temp && /bin/bash ~/zixie/home.sh'
eval $(thefuck --alias)

#vi
alias zixieviback='cp ~/.vimrc ~/zixie/github/Settings-Tools/config'
alias zixievirestore='cp ~/zixie/github/Settings-Tools/config/.vimrc ~/'

#git
alias zixiegitdefault='cp -r ~/zixie/github/Settings-Tools/config/.gitdefaultconfig ~/.gitconfig && cp -r ~/zixie/github/Settings-Tools/config/.gitignore ~/.gitignore_global'
alias zixiegitcheck="/bin/bash ~/zixie/github/Settings-Tools/tools/check_github.sh"
alias zixiegitcheckandupdate="/bin/bash ~/zixie/github/Settings-Tools/tools/check_github.sh 1"

alias zixiegitignore="cp -r ~/zixie/github/Settings-Tools/config/.gitignore ./"
alias gitlogl="git log --graph --decorate --oneline --abbrev-commit --no-merges --date=short  --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset | %Cgreen%ad%Creset | %s %C(yellow)[%an]%Creset'"
alias gitlogc="git log --graph --decorate --abbrev-commit --no-merges --date=format:'%Y-%m-%d %H:%M:%S'  --stat  --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Cblue %s %Cgreen(%cd) %C(bold blue)<%an>%Creset'"
alias gitlogme="git log --graph --decorate --abbrev-commit --no-merges --date=short  --pretty=format:'%s' --after='1 week ago' --committer=bihe0832"


#blog
alias zixieblogstart='cd ~/zixie/github/blog/ && echo jekyll server &&  jekyll server'
alias zixieblogroot='cd ~/zixie/github/blog/_posts && pwd'

#ide
alias eclipse='open -n /Applications/eclipse/Eclipse.app/'

#jar
alias zixiejargetpackageinfo='java -jar ~/zixie/github/Android-GetAPKInfo/GetAPKInfo.jar'
alias zixiejargetchannel='java -jar ~/lib/apkChannel.jar'
alias zixiejargetimginfo='java -jar ~/lib/getImgInfo.jar'
alias zixiejarcheckandroidv2='java -jar ~/zixie/github/Android-GetAPKInfo/CheckAndroidSignature.jar'
alias zixiejartinyjpg='java -jar ~/lib/tinyjpg.jar'
alias zixiegifrezise='gifsicle --colors=64 --resize-fit-height=600 '
alias zixieshowphoto='java -jar ~/lib/managePhoto.jar --show '
alias zixiemanagephoto='java -jar ~/lib/managePhoto.jar --manage '
alias zixieshowvideo='~/zixie/lib/ffprobe -v quiet -show_format '


#android 
alias zixieandroidapktoold='java -jar -Duser.language=en -Duser.home=$ANDROID_HOME/build-tools/25.0.2 ~/lib/apktool.jar d -f '
alias zixieandroiddex2jar='date +'%Y%m%d_%H%M%S_dex2jar.jar' | xargs -I {} $DEX2JAR_HOME/d2j-dex2jar.sh -o ~/temp/1/{}'
alias zixieandroidjdgui='temp && java -jar ~/lib/jd-gui-1.4.0.jar'
fun zixiejavaClassVersion() {
	javap -verbose $1 | head
}
alias zixieandroidjar2dex='$ANDROID_HOME/build-tools/25.0.2/dx --dex --output=./zixiejar2dex.jar'
fun zixieandroidmakejar() {
	jar cvf $1 ./*
}
alias zixieandroidaaptd='$ANDROID_HOME/build-tools/26.0.1/aapt d badging'
alias zixieandroidremoteshare='java -jar ~/lib/asm.jar $ANDROID_HOME'
alias zixieandroidgradlelocalize='cp -r ~/settings/as/zixie-local.properties ./local.properties'
alias zixieandroidgradledebug='chmod +x ./gradlew && ./gradlew clean assembleDebug '
alias zixieandroidgradlecache='rm -fr ~/zixie/lib/gradle/caches && rm -fr ~/zixie/lib/gradle/daemon && rm -fr ~/zixie/lib/gradle/native'

#android adb 
alias adbSingle='alias adb="adb"'
alias adbMutil='alias adb="adb devices | tail -n +2 | cut -sf 1 | xargs -I {} -p adb -s {}"'
alias zixieadbscreenshots='adb shell screencap -p /sdcard/screen.png && adb pull /sdcard/screen.png /tmp/ && adb shell rm /sdcard/screen.png && cp -fr /tmp/screen.png ~/temp && open file:/tmp/screen.png'
alias zixieadbdumpui='adb shell uiautomator dump /sdcard/UIdump.xml && adb pull /sdcard/UIdump.xml ~/temp/1/ && adb shell rm /sdcard/UIdump.xml && open ~/temp/1/UIdump.xml'
alias zixieadbstop='adb shell am force-stop'
alias zixieadbactivity='adb shell dumpsys activity'
alias zixieadbgetproduct='adb shell getprop | egrep "version.release|version.sdk|ro.product.brand|ro.product.model|ro.product.manufacturer|ro.sf.lcd_density|ro.product.cpu|ro.product.locale|ril.product_code" && adb shell wm size'
alias zixieadbinputspace='adb shell input keyevent 62'
alias zixieadbinputdel='adb shell input keyevent 67'
alias zixieadbinputenter='adb shell input keyevent 66'
alias zixieadbinputleft='adb shell input keyevent 21'
alias zixieadbinputright='adb shell input keyevent 22'
alias zixieadbinputmenu='adb shell input keyevent 1'
alias zixieadbinputhome='adb shell input keyevent 2'
alias zixieadbinputback='adb shell input keyevent 3'
alias zixieadbinputtextsimple='adb shell input text'
alias zixieadbinputtext='adb shell am broadcast -a ZIXIE_ADB_INPUT_TEXT --es msg '
alias zixieadbinputbase64='zixieadbinputtextbase64(){ content=$( base64 <<< $1 ) && adb shell am broadcast -a ZIXIE_ADB_INPUT_BASE64 --es msg $content};zixieadbinputtextbase64'
alias zixieadbinputbase64step='echo "请输入你要通过 ADB 输入内容的原文" && read input && zixieadbinputbase64 $input'
alias zixieadbinputbase64commit='zixieadbinputbase64commit(){zixieadbinputbase64 $1 && zixieadbinputenter}; zixieadbinputbase64commit'
alias zixieadbinputbase64commitstep='zixieadbinputbase64commitstep(){zixieadbinputbase64step $1 && zixieadbinputenter}; zixieadbinputbase64commitstep'
fun zixieadbpushimage() {
	echo "zixieadbpushimage filePath:$1"
	filePath=$1 
	adb push $filePath /sdcard/DCIM/ 
	adb shell am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file:///sdcard/DCIM/$(basename $filePath)
}

fun zixieadbpushimagelist() {
	echo "zixieadbpushimagelist filePath:$1"
	filePath=$1 
	ls $filePath
	ls $filePath | xargs -I {} echo "$filePath"/{} | xargs -I {} zsh -ic 'zixieadbpushimage {}'
}

alias zixieadbgetimei='adb shell am start -a android.intent.action.DIAL -d "tel:" && adb shell input text " *#06#" && adb shell input text " *#06#"'
alias zixieadbdumpactivity='adb shell dumpsys activity > ~/temp/1/a.log && open ~/temp/1/a.log'

#android test
alias zixieclswechat='adb shell pm clear com.tencent.mm'
alias zixieinputwechatpwd='adb shell input text YOUXIyouxi'

#web
alias zixiewebroot='cd ~/zixie/web && pwd'
alias zixiezhuoyoutest='cd ~/zixie/web/zhuoyouzhushou/2 && pwd'
alias zixiezhuoyourelease='cd ~/zixie/web/zhuoyouzhushou/10 && pwd'
alias zixiemysqllcal='/Applications/MAMP/Library/bin/mysql -uroot -proot'

#svn
alias svnignore='svn propedit svn:ignore .'
alias svndel='svn --force del'

#shakeba
alias shakebaRoot='cd ~/zixie/github/shakeba_new && pwd'
alias pfkey='echo "url:http://tool.chinaz.com/tools/urlencode.aspx \necho -n \"openid_openkey_offerid_pf_KEY\” | md5 -r"'


#PATH

#通用

export PATH="/usr/bin:/opt/local/bin:/usr/local/sbin":${PATH}
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:"${PATH}
export PATH=$(brew --prefix curl)/bin:$PATH
if [[ "$UNAME_MACHINE" == "arm64" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	eval "$(/usr/local/Homebrew/bin/brew shellenv)"
fi

#android
ANDROID_HOME=~/lib/android-sdk
export ANDROID_HOME

ANDROID_SDK=~/lib/android-sdk
export ANDROID_SDK

ANDROID_TOOLS=$ANDROID_HOME/tools
export ANDROID_TOOLS

ANDROID_PLATFORM_TOOLS=$ANDROID_HOME/platform-tools
export ANDROID_PLATFORM_TOOLS

ANDROIDNDK_LINUX_R16B=~/lib/android-ndk-r16b
export ANDROIDNDK_LINUX_R16B

ANDROIDNDK_LINUX_R19C=~/lib/android-sdk/ndk/19.2.5345600
export ANDROIDNDK_LINUX_R19C

ANDROID_NDK_HOME=${ANDROIDNDK_LINUX_R19C}
export ANDROID_NDK_HOME

ANDROID_NDK_CMD=${ANDROID_NDK_HOME}/ndk-build
export ANDROID_NDK_CMD

DEX2JAR_HOME=~/lib/dex2jar-2.0
export DEX2JAR_HOME

export PATH=$ANDROID_HOME:$ANDROID_PLATFORM_TOOLS:$ANDROID_NDK_HOME:$ANDROID_NDK_CMD:$ANDROID_TOOLS:$DEX2JAR_HOME:${PATH}

#java
# JDK6=`/usr/libexec/java_home -v 1.6`
JDK7=`/usr/libexec/java_home -v 1.7`
JDK8=`/usr/libexec/java_home -v 1.8`
JDK_AS=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
export JAVA_HOME=$JDK_AS
export JAVA_OPTS="-server -Xms1g -Xmx4g -XX:MaxPermSize=1g"

#gradle
export GRADLE_HOME=~/lib/gradle/
export GRADLE_BASE=~/lib/gradle
export GRADLE_USER_HOME=~/lib/gradle/
export PATH=${GRADLE_HOME}/bin:$PATH

#node
export PATH='/usr/local/Cellar/node/10.11.0/bin':$PATH
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#gem
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/ruby@2.6/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/ruby@2.6/lib"
#export CPPFLAGS="-I/usr/local/opt/ruby@2.6/include"
#export PKG_CONFIG_PATH="/usr/local/opt/ruby@2.6/lib/pkgconfig"

export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

#python
export PATH="/Users/zixie/Library/Python/3.7/bin:"${PATH}

#其余常量
export SVN_EDITOR=vim
export EDITOR=vim
#RDM
export MajorVersion=1
export MinorVersion=0
export FixVersion=1
export BuildNo=0
export isBuildLib=false
export isCompletedBuild=false
export isDebug=true
export isReleaseTest=false
export isReleaseOfficial= false
export isOfficial=true
export isPreOfficial=false
export channel="000000 111111"
export channelType="debug official"
export appNo=ZINPUT
export listAll=true
