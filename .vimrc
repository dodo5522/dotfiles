"================================================
" basic settings
"================================================
let g:rehash256=1
"set background=dark

set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set pastetoggle=<F12>           "set pasteはどんなキーマップもプラグインも動作できなくなるので、これで代用する
set noic						"大文字小文字を区別する
"set foldmethod=marker			" マーカーに囲まれた部分を折り畳む
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp
set fileformats=unix,dos,mac
set ambiwidth=double
set autoindent					"新しい行のインデントを現在行と同じにする
set backupdir=$HOME/.vimbackup	"バックアップファイルのディレクトリを指定する
set clipboard=unnamed			"クリップボードをWindowsと連携する
set nocompatible				"vi互換をオフする
set directory=$HOME/.vimbackup	"スワップファイル用のディレクトリを指定する
set hidden						"変更中のファイルでも、保存しないで他のファイルを表示する
set incsearch					"インクリメンタルサーチを行う
set number						"行番号を表示する
set showmatch					"閉括弧が入力された時、対応する括弧を強調する
set expandtab					"タブの代わりに空白文字を指定する
set smarttab					"新しい行を作った時に高度な自動インデントを行う
set tabstop=4
set shiftwidth=4
set showmode					"現在のステータスをステータス行に表示
set ignorecase					"文字列検索時に大文字小文字の区別をしない
set smartcase					"大文字で検索されたら対象を大文字限定にする
set ruler						"今何行目? 何文字目? をステータスバーに表示してくれる
"set whichwrap=b,s,[,],<,>,~	"行の先頭から前の行の末尾に、行の末尾から次の行の先頭に行く
"set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f " grep検索を設定する
"set grepprg=grep\ -nh
set wildmenu                   " コマンドラインモードの補完を便利にする
set wildmode=longest:full,full
set hlsearch
set backspace=indent,eol,start
set tags+=.svn/tags
set tags+=.git/tags
set nocursorline               " これはとても重いのでNO
set nocursorcolumn             " これはとても重いのでNO
set norelativenumber           " これはとても重いのでNO
set mouse=

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

"================================================
" syntastic
"================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"================================================
" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする
"================================================
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"================================================
" マウスでカーソル移動とスクロール
"================================================
"if has('mouse')
"    set mouse=a
"    if has('mouse_sgr')
"        set ttymouse=sgr
"    elseif v:version > 703 || v:version is 703 && has('patch632')
"        set ttymouse=sgr
"    else
"        set ttymouse=xterm2
"    endif
"endif

"================================================
" tab control setting
"================================================
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

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tn 前のタブ
map <silent> [Tag]p :tabprevious<CR>

"================================================
" configure neobundle
"================================================
let g:neobundle_default_git_protocol='https'

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/unite-ssh'
"NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'

" Color scheme
"NeoBundle 'tomasr/molokai'

" My Bundles here:
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
"NeoBundle 'tpope/vim-rails.git'
"NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'thinca/vim-quickrun'
" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
"NeoBundle 'rails.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'open-browser.vim'
"NeoBundle 'kana/vim-submode'

" For evaluation of C/C++ code
NeoBundle 'vim-scripts/trinity.vim'
NeoBundle 'vim-scripts/SrcExpl'
NeoBundle 'scrooloose/nerdtree'
NeoBundle '5t111111/alt-gtags.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'soramugi/auto-ctags.vim'

" code syntax checker
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'Chiel92/vim-autoformat'
"NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'aklt/plantuml-syntax'
"NeoBundle 'davidhalter/jedi-vim'
NeoBundle "sudar/vim-arduino-syntax"

" For html/css/js/typescript
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Quramy/tsuquyomi'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'ternjs/tern_for_vim', {
  \ 'build': {
  \   'others': 'npm install'
  \}}

" Benchmark vimrc
"NeoBundle 'git://github.com/mattn/benchvimrc-vim.git'

call neobundle#end()

filetype on
filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

"----------------------------------------------------------
" 起動時に行ハイライトを有効にしたい
"----------------------------------------------------------
let g:gitgutter_highlight_lines = 1

"----------------------------------------------------------
" molokaiの設定
"----------------------------------------------------------
colorscheme molokai
let g:molokai_original=1
set t_Co=256    " iTerm2など既に256色環境なら無くても良い
syntax enable   " 構文に色を付ける

"================================================
" NERDTree
"================================================
let g:NERDTreeDirArrows=0
command Tr NERDTree

"================================================
" ctags
"================================================
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
let g:auto_ctags_filetype_mode = 1
nnoremap <C-k> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-h> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

"================================================
" syntastic
"================================================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python2_python_exe = 'python'
let g:syntastic_python3_python_exe = 'python3'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501,W601,D203'

function! Parse_Python_Shebang()                    
    let line = getline(1)
    if line =~# '\m^#!\s*[^ \t]*\<python2\=\>'
        let g:syntastic_python_python_exec = g:syntastic_python2_python_exe
    elseif line =~# '\m^#!\s*[^ \t]*\<env\>\s*\<python2>'
        let g:syntastic_python_python_exec = g:syntastic_python2_python_exe
    elseif line =~# '\m^#!\s*[^ \t]*\<python3\>'
        let g:syntastic_python_python_exec = g:syntastic_python3_python_exe
    elseif line =~# '\m^#!\s*[^ \t]*\<env\>\s*\<python3\>'
        let g:syntastic_python_python_exec = g:syntastic_python3_python_exe
    else
        let g:syntastic_python_python_exec = g:syntastic_python3_python_exe
    endif
endfunction                                         

command! SyntasticPython2 let g:syntastic_python_python_exec = g:syntastic_python2_python_exe
command! SyntasticPython3 let g:syntastic_python_python_exec = g:syntastic_python3_python_exe
autocmd BufWinEnter *.py call Parse_Python_Shebang()
" java related
let g:syntastic_c_cflags = '-I/usr/lib/jvm/java-7-openjdk-amd64/include'
let g:syntastic_cpp_cflags = '-I/usr/lib/jvm/java-7-openjdk-amd64/include'

"================================================
" plantuml-syntax
"================================================
if executable('plantuml')
    let g:plantuml_executable_script='plantuml'
endif

"================================================
" add aliases
"================================================
nnoremap [unite] <Nop>
nmap , [unite]
" filer
nnoremap <silent> [unite]f  :<C-u>Unite<space>file<cr>
nnoremap <silent> [unite]b  :<C-u>Unite<space>buffer<cr>
nnoremap <silent> [unite]fb :<C-u>Unite<space>file buffer<cr>
" grep検索
nnoremap <silent> [unite]g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> [unite]cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> [unite]r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('hw')
    let g:unite_source_grep_command = 'hw'
    let g:unite_source_grep_default_opts = '--no-group --no-color'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('grep')
    let g:unite_source_grep_command = 'grep'
    let g:unite_source_grep_default_opts = '-nH'
    let g:unite_source_grep_recursive_opt = '-r'
endif

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
let g:quickrun_config['pytest3'] = {
    \ 'command': 'py.test-3',
    \ 'cmdopt': '-s -v',
    \ 'hook/shebang/enable': 0,
    \ }

"================================================
" configure vim-indent-guides
"================================================
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

"================================================
" configure neocomplete
"================================================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
   \ 'default' : ''
   \ }
" 補完候補の一番先頭を無選択状態にする
let g:neocomplete#enable_auto_select = 0
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
   return neocomplete#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

"================================================
" lightline
"================================================
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ }

"================================================
" insert the template of new created file
"================================================
autocmd BufNewFile *.py 0r $HOME/.vim/template/temp.py
autocmd BufNewFile *.md 0r $HOME/.vim/template/temp.md
autocmd BufNewFile *.uml 0r $HOME/.vim/template/temp.uml
autocmd BufNewFile *.html 0r $HOME/.vim/template/temp.html
autocmd BufNewFile *.css 0r $HOME/.vim/template/temp.css
autocmd BufNewFile *.er 0r $HOME/.vim/template/temp.er
