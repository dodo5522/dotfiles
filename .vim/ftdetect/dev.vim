" see the $VIMRUNTIME/filetype.vim
autocmd BufRead,BufNewFile *.er     setfiletype dot
autocmd BufRead,BufNewFile *.ejs    setfiletype html
autocmd BufRead,BufNewFile *.aidl   setfiletype java
autocmd BufRead,BufNewFile *.pug    setfiletype pug
autocmd BufRead,BufNewFile *.jade   setfiletype pug
autocmd BufRead,BufNewFile *.ts     setfiletype typescript
autocmd BufRead,BufNewFile *.tsx    setfiletype typescript

autocmd BufNewFile *.er   0r $HOME/.vim/template/temp.er
autocmd BufNewFile *.html 0r $HOME/.vim/template/temp.html
autocmd BufNewFile *.md   0r $HOME/.vim/template/temp.md
autocmd BufNewFile *.py   0r $HOME/.vim/template/temp.py
autocmd BufNewFile *.uml  0r $HOME/.vim/template/temp.uml
