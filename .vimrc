"================================================
" basic settings
"================================================
"{{{
set t_Co=256
colorscheme molokai
syntax on						" syntax word color
let g:molokai_original=1
let g:rehash256=1
"set background=dark

set noic						"大文字小文字を区別する
"set foldmethod=marker           " マーカーに囲まれた部分を折り畳む
set mouse=a						" mouseの連動機能を有効にする
set encoding=utf-8				" encoding
set autoindent					"新しい行のインデントを現在行と同じにする
set backupdir=$HOME/.vimbackup	"バックアップファイルのディレクトリを指定する
set clipboard=unnamed			"クリップボードをWindowsと連携する
set nocompatible				"vi互換をオフする
set directory=$HOME/.vimbackup	"スワップファイル用のディレクトリを指定する
"set expandtab					"タブの代わりに空白文字を指定する
set hidden						"変更中のファイルでも、保存しないで他のファイルを表示する
set incsearch					"インクリメンタルサーチを行う
set number						"行番号を表示する
set showmatch					"閉括弧が入力された時、対応する括弧を強調する
set smarttab					"新しい行を作った時に高度な自動インデントを行う
set tabstop=4
set shiftwidth=4
set showmode					"現在のステータスをステータス行に表示
set ignorecase					"文字列検索時に大文字小文字の区別をしない
set smartcase					"大文字で検索されたら対象を大文字限定にする
set ruler						"今何行目? 何文字目? をステータスバーに表示してくれる
"set whichwrap=b,s,[,],<,>,~	"行の先頭から前の行の末尾に、行の末尾から次の行の先頭に行く
set laststatus=3
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f " grep検索を設定する
set grepprg=grep\ -nh
set wildmenu                   " コマンドラインモードの補完を便利にする
set wildmode=longest:full,full
set hlsearch

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>
"}}}

"================================================
" tab control setting
"================================================
"{{{
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
  endfunction

" Set tabline.
function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tn 前のタブ
"}}}

"================================================
" configure neobundle
"================================================
"{{{
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'

" My Bundles here:
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'Lokaltog/vim-easymotion', '09c0cea8'   " This plugin is locked at revision 09c0cea8 
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'thinca/vim-quickrun'
" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'rails.vim'
" Non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
" gist repos
"NeoBundle 'gist:Shougo/656148', {
"      \ 'name': 'everything.vim',
"      \ 'script_type': 'plugin'}
" Non git repos
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
NeoBundle 'rking/ag.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'open-browser.vim'
NeoBundle 'kana/vim-submode'

filetype on
filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck
"}}}

"================================================
" configure submode
"================================================
"nnoremap s <Nop>
"nnoremap sj <C-w>j
"nnoremap sk <C-w>k
"nnoremap sl <C-w>l
"nnoremap sh <C-w>h
"nnoremap sJ <C-w>J
"nnoremap sK <C-w>K
"nnoremap sL <C-w>L
"nnoremap sH <C-w>H
"nnoremap ss :<C-u>sp<CR>
"nnoremap sv :<C-u>vs<CR>
"nnoremap sq :<C-u>q<CR>
"
"call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
"call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
"call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
"call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
"call submode#map('bufmove', 'n', '', '>', '<C-w>>')
"call submode#map('bufmove', 'n', '', '<', '<C-w><')
"call submode#map('bufmove', 'n', '', '+', '<C-w>+')
"call submode#map('bufmove', 'n', '', '-', '<C-w>-')

"================================================
" configure vim-powerline
"================================================
let g:Powerline_symbols = 'fancy'

"================================================
" configure vim-quickrun
"================================================
let g:quickrun_config = {}
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config['markdown'] = {
	\ 'type': 'markdown/pandoc',
	\ 'outputter': 'browser',
	\ 'cmdopt': '-s'
	\ }

"================================================
" configure vim-indent-guides
"================================================
"{{{
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=1
" 自動カラー(0:disable, 1:enable)
let g:indent_guides_auto_colors=1
" 奇数インデントのカラー
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1
"}}}

"================================================
" configure neocomplcache
"================================================
"{{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
   \ 'default' : ''
   \ }
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
   return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"}}}

