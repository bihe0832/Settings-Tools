# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
HISTSIZE=3000
SAVEHIST=3000
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
plugins=(git svn adb ant brew github gitignore gradle )

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

#source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

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
alias dates="date +%s && date +'%Y-%m-%d %H:%M:%S %W'"
alias datesd="date +%s -d"
alias mywget="cd ~/zixie/temp && wget -P ~/zixie/temp"
alias iconvgbk2utf8='iconv -f gbk -t utf8'
alias iconvutf82gbk='iconv -f utf8 -t gbk'

fun upper() {
	echo $1 | tr a-z A-Z
}


fun lower() {
	echo $1 | tr A-Z a-z
}

alias his='history | grep '
alias temp='cd ~/zixie/temp && pwd'

#zsh
alias zshback='cp ~/.zshrc ~/zixie/github/Settings-Tools/config/linux' 
alias zshrestore='cp ~/zixie/github/Settings-Tools/config/linux/.zshrc ~/ && source ~/.zshrc'
alias zshedit='vi ~/zixie/github/Settings-Tools/config/.zshrc'

#vi
alias zixieviback='cp ~/.vimrc ~/zixie/github/Settings-Tools/config'
alias zixievirestore='cp ~/zixie/github/Settings-Tools/config/.vimrc ~/'

#blog
alias zixieblogstart='cd ~/zixie/web/blog/ &&  git pull && echo jekyll server &&  jekyll server'

#android
ANDROID_HOME=~/lib/android-sdk
export ANDROID_HOME

ANDROID_SDK=~/lib/android-sdk
export ANDROID_SDK

ANDROIDNDK_LINUX_R16B=~/lib/aandroid-ndk-r16b
export ANDROIDNDK_LINUX_R16B

ANDROID_TOOLS=$ANDROID_HOME/tools
export ANDROID_TOOLS

ANDROID_PLATFORM_TOOLS=$ANDROID_HOME/platform-tools
export ANDROID_PLATFORM_TOOLS

ANDROID_NDK_HOME=${ANDROIDNDK_LINUX_R16B}
export ANDROID_NDK_HOME

ANDROID_NDK_CMD=${ANDROID_NDK_HOME}/ndk-build
export ANDROID_NDK_CMD

DEX2JAR_HOME=~/lib/dex2jar-2.0
export DEX2JAR_HOME

export PATH=$ANDROID_HOME:$ANDROID_PLATFORM_TOOLS:$ANDROID_NDK_HOME:$ANDROID_NDK_CMD:$ANDROID_TOOLS:$DEX2JAR_HOME:${PATH}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
