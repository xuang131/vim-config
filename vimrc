set guifont=Monaco:h12
" syntax highlighting
set background=dark
"   " you can use `dark` or `light` as your background
color mango
"
"colorscheme mustang 
 " set guifontwide=WenQuanYi\ Zen\ Hei:h12:cGBK
 " 设定文件浏览器目录为当前目录
 set bsdir=buffer
 " 设置编码
 set enc=utf-8

 "能使用鼠标
 set mouse=a
 "自动缩进
 set ai
 set expandtab               "以下三个配置配合使用，设置tab和缩进空格数
 set cursorline              "为光标所在行加下划线
 set smarttab                "使得退格键也能有4tab的效果
 set smartindent             "智能缩进

 set autowrite  " Automatically write a file when leaving a modified buffer 
 set ignorecase              "检索时忽略大小写
 " 设置文件编码
 set fenc=utf-8
 " 设置文件编码检测类型及支持格式
 set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
 " 设置开启语法高亮
 syntax on
 "显示行号
 set number
 " 查找结果高亮度显示
 set hlsearch
 " tab宽度
 set tabstop=4
 set cindent shiftwidth=4
 set autoindent shiftwidth=4
 filetype plugin indent on
" 把 F7 映射到 启动MRU插件
 map <F7> :MRU<CR>
" 把 F8 映射到 启动NERDTree插件
 map <F8> :NERDTree<CR>
" 把 F9 映射到 启动CommandT插件
 map <F9> :CommandT<CR>
" 把 CTRL-S 映射为 保存,因为这个操作做得太习惯了
 nnoremap <C-S> <C-C>:w<CR>
 inoremap <C-S> <C-C>:w<CR>
" 把ctrl+x ctrl+o 字典补全简化为ctrl+x
 inoremap<C-k> <C-X><C-K>

"javascript代码补全，使用ctrl+x o"
autocmd FileType javascrīpt set omnifunc=javascrīptcomplete#CompleteJS

" 打开javascript折叠
 let b:javascript_fold=1
" " 打开javascript对dom、html和css的支持
 let javascript_enable_domhtmlcss=1

"node.js 字典"
au FileType nodejs set dictionary+=$HOME/.vim/dict/node.dict
"javascript 字典"
au FileType javascript set dictionary+=$HOME/.vim/dict/javascript.dict

nnoremap <silent> <leader>ff :call g:Jsbeautify()<cr>
let mapleader=","


filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "pangloss/vim-javascript"
Bundle "taglist.vim"
Bundle "jsbeautify"
Bundle "scrooloose/nerdtree"
Bundle 'tpope/vim-surround'
Bundle 'taglist.vim'
"Bundle 'hallettj/jslint.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'wincent/Command-T'
Bundle 'Lokaltog/vim-powerline'
Bundle 'drmingdrmer/xptemplate'
Bundle 'danro/rename.vim'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdcommenter'
"snipmate dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"
"ack better performance than grep
Bundle "mileszs/ack.vim"
"html/xml edit
Bundle "sukima/xmledit"
Bundle "vim-scripts/xml.vim"
"MRU provides an easy access to a list of recently opend/edited files{
Bundle "vim-scripts/mru.vim"
"html plugins
Bundle "mattn/zencoding-vim"
"git plugins
Bundle "motemen/git-vim"

"ruby debugger
Bundle "astashov/vim-ruby-debugger"

"ctags, how to use: ctags -e --language-force=ruby  --exclude=.git --exclude='*.log' -R * `bundle show --paths`
Bundle "vim-scripts/ctags.vim"

noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"supertabg:SuperTabRetainCompletionType的值缺省为1，意为记住你上次的补全方式，直到使用其它的补全命令改变它；如果把它设成2，意味着记住上次的补全方式，直到按ESC退出插入模式为止；如果设为0，意味着不记录上次的补全方式。
"g:SuperTabDefaultCompletionType的值设置缺省的补全方式，缺省为CTRL-P。
""
let g:SuperTabRetainCompletionType = 2

"git configuration
map <leader>gs :GitStatus<cr>
map <leader>gc :GitCommit<cr>
map <leader>ga :GitAdd<cr>
map <leader>gp :GitPush<cr>
map <leader>gl :GitPull<cr>
filetype plugin indent on

"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'
let Powerline_symbols='compatible'
"}

"taglist{
let Tlist_Auto_Open = 0
"}

"MRU{
let MRU_Max_Entries = 50
"}

"zencoding{
let g:user_zen_expandabbr_key = '<c-d>'   "设置为ctlr+回车 扩展 
"
"}

"move to last edited
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"coffeescript settings
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

"--------------------------------------------------------
"" highline current line & column
" DOES NOT WORK with colorscheme solarized and blackboard
" "--------------------------------------------------------
set cursorline
set cursorcolumn
highlight cursorline term=underline cterm=underline ctermbg=0 gui=NONE guibg=Grey40
if has("autocmd")
" current line
au WinLeave * set nocursorline
au WinEnter * set cursorline
" current column
au WinLeave * set nocursorcolumn
au WinEnter * set cursorcolumn
endif
