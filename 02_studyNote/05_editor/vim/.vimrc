" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set nocp
set number

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"  set mouse=a
" endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set tabstop=4 " 设置制表符(tab键)的宽度
set softtabstop=4 " 设置软制表符的宽度
set shiftwidth=4 " (自动) 缩进使用的4个空格
set cindent " 使用 C/C++ 语言的自动缩进方式

""""""""""""""""""""""""""""""
" ctags setting
""""""""""""""""""""""""""""""
" nnoremap <silent> <F5> :!ctags -R ./*<CR><CR> :TlistUpdate<CR>
" set tags+=./tags "add current directory's generated tags file
" set tags=tags
" nnoremap <C-]> <F12>

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags' "设定linux系统中ctags程序的位置
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
" 通过F8切换taglist的开启和关闭
nnoremap <silent> <F8> :TlistToggle<CR>

""""""""""""""""""""""""""""""
" OmniCppComplete
""""""""""""""""""""""""""""""
set tags+=~/.vim/systags
" 去掉自动补全的预览窗口
set completeopt=longest,menu

" 改变自动补全窗口的配色
" GUI
highlight Pmenu    guibg=darkgrey  guifg=black 
highlight PmenuSel guibg=lightgrey guifg=black
" 终端
highlight Pmenu    ctermfg=darkgrey  ctermbg=black
highlight PmenuSel ctermfg=lightgrey ctermbg=green

" 设置ctrl-<C-R>为生成c++tags的快捷键
map <F3> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" 自定义自己的补全方式
inoremap <C-]> <C-X><C-]>
inoremap <C-F> <C-X><C-F>
inoremap <C-D> <C-X><C-D>
inoremap <C-L> <C-X><C-L>
inoremap <C-O> <C-X><C-O>

" 显示中文
set fencs=utf-8,GB18030,ucs-bom,default,latin1
set nobackup " 不备份
set ignorecase "  忽略大小写的查找

" Set mapleader
let mapleader = ","
" Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>

""""""""""""""""""""""""""""""
" SuperTab插件
""""""""""""""""""""""""""""""
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 15
let g:netrw_liststyle= 3 "设置netrw列表风格为树状
let g:netrw_alto = 1 " 在netrw窗口下方打开所选文件
" let g:netrw_special_syntax = 1 " 特定文件会以特殊语法出现在浏览器中
let g:netrw_altv = 1 " 在netrw窗口右侧打开所选文件
let g:netrw_list_hide= '^\..*,\.o$,\.out$' " 隐藏.开头的文件以及.o和.out结尾的可执行文件
let g:netrw_browse_split = 3 " ,ex快捷键打开时，选择文件，按回车键在新标签页打开
" nmap <silent> <leader>ex :Sexplore!<cr>
nmap <silent> <leader>ex :Vexplore!<cr>

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0 " Do not show default help
let g:bufExplorerShowRelativePath=1 " Show relative paths
let g:bufExplorerSplitRight=0 " Split left
let g:bufExplorerSplitVertical=1 " Split vertically
let g:bufExplorerSplitVertSize = 30 " New split window is 30 columns wide
let g:bufExplorerUseCurrentWindow=1 " Open in new window

""""""""""""""""""""""""""""""
" winManager setting
"""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "TagList,FileExplorer|BufExplorer"
let g:winManagerWidth = 30
let g:bufExplorerMaxHeight = 10 " 缓冲区最大行数
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>

""""""""""""""""""""""""""""""
" LookupFile setting
""""""""""""""""""""""""""""""
" if filereadable("./filenametags") "设置tag文件的名字
let g:LookupFile_TagExpr = string('./filenametags')
" endif
let g:LookupFile_MinPatLength = 2 "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0 "每次查找都清空输入栏
let g:LookupFile_AlwaysAcceptFirst = 1 "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0 "禁止为不存在的文件创建缓冲区
" let g:LookupFile_SearchForBufsInTabs = 1
"不显示可执行文件
let g:LookupFile_FileFilter ='\.class$\|\.o$\|\.obj$\|\.exe$\|\.jar$\|\.zip$\|\.war$\|\.ear$'
"映射LookupFile为,lk
nmap <silent> <leader>lk <Plug>LookupFile<cr> 
" 映射LUBufs为,lb
nmap <silent> <leader>lb :LUBufs<cr> 
" 映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickFix setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按下F6，执行make clean
map <F6> :make clean<CR><CR><CR>
" 按下F7，执行make编译程序，并打开quickfix窗口，显示编译信息
autocmd FileType c,cpp map <F7> :make<CR><CR><CR> :cw10<CR><CR>
" 使用",cn"跳到下一个错误
nmap <leader>cn :cn<cr>
" 使用",cp"跳到上一个错误
nmap <leader>cp :cp<cr>
" 快速查找光标下的单词
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--fold setting--
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set foldmethod=syntax " 用语法高亮来定义折叠
" set foldlevel=100 " 启动vim时不要自动折叠代码
" set foldmethod=indent
" set foldcolumn=5 " 设置折叠栏宽

""""""""""""""""""""""""""""""
" vimgdb setting
""""""""""""""""""""""""""""""
run macros/gdb_mappings.vim
