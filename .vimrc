"--------------------
" 基本的な設定
"--------------------
syntax on						" syntax word color
set mouse=						" mouseの連動機能を無効にする
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
set noic						"文字列検索時に大文字小文字の区別をする
set ruler						"今何行目? 何文字目? をステータスバーに表示してくれる
"set whichwrap=b,s,[,],<,>,~	"行の先頭から前の行の末尾に、行の末尾から次の行の先頭に行く

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" コマンドラインモードの補完を便利にする
set wildmenu
set wildmode=longest:full,full

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>		

"--------------------
" tab control setting
"--------------------



" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
  endfunction

" Set tabline.
function! s:my_tabline()  "{{{
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
endfunction "}}}
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

"--------------------
" Configure bundles
"--------------------
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite-ssh'
Bundle 'Shougo/unite-outline'
Bundle 'nathanaelkane/vim-indent-guides'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"--------------------
" Configure vim-indent-guides
"--------------------
"" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
"let g:indent_guides_enable_on_vim_startup=1
"" ガイドをスタートするインデントの量
"let g:indent_guides_start_level=2
"" 自動カラーを無効にする
"let g:indent_guides_auto_colors=0
"" 奇数インデントのカラー
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
"" 偶数インデントのカラー
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
"" ハイライト色の変化の幅
"let g:indent_guides_color_change_percent = 30
"" ガイドの幅
"let g:indent_guides_guide_size = 1

