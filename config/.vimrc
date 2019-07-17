" ============
" Environment
" ============
" 保留历史记录
set history=500

" 行控制
set linebreak
set nocompatible
set textwidth=120
set wrap

" 标签页
set tabpagemax=9
set showtabline=2

" 控制台响铃
set noerrorbells
set novisualbell
set t_vb= "close visual bell

" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" 命令行于状态行
set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P]
set ls=2 " 始终显示状态行
set wildmenu "命令行补全以增强模式运行

" Search Option
set hlsearch  " Highlight search things
set magic     " Set magic on, for regular expressions
set showmatch " Show matching bracets when text indicator is over them
set mat=2     " How many tenths of a second to blink
set noincsearch
set ignorecase "检索时忽略大小写

" 制表符
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" 状态栏显示目前所执行的指令
set showcmd 

" 缩进
set autoindent
set smartindent

" 自动重新读入
set autoread

" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start

" 设定在任何模式下鼠标都可用
set mouse=a

" 自动改变当前目录
if has('netbeans_intg')
    set autochdir
endif

" 备份和缓存
"set nobackup
"set noswapfile

" 自动完成
set complete=.,w,b,k,t,i
set completeopt=longest,menu


" 代码自动补全



" 代码折叠
set foldmethod=marker

" =====================
" 多语言环境
"    默认为 UTF-8 编码
" =====================
if has("multi_byte")
    set encoding=utf-8
    " English messages only
    "language messages zh_CN.utf-8

    set fencs=utf-8,gbk,chinese,latin1
    set formatoptions+=mM
    set nobomb " 不使用 Unicode 签名

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" =============
" Color Scheme
" =============
if has('syntax')
    if has('gui_running')
        colorscheme zenburn

        " 默认编辑器配色
        au BufNewFile,BufRead,BufEnter,WinEnter * colo zenburn

        " 各不同类型的文件配色不同
        au BufNewFile,BufRead,BufEnter,WinEnter *.wiki colo lucius
    else 
        colorscheme slate
    endif

    " 保证语法高亮
    syntax on
endif

nnoremap <Leader>less :w <BAR> !lessc % > %:t:r.css<CR><space>
" vim: set et sw=4 ts=4 sts=4 fdm=marker ft=vim ff=unix fenc=utf8:

