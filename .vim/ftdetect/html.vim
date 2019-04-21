autocmd BufRead,BufNewFile *.ejs setfiletype html
autocmd BufNewFile *.html 0r $HOME/.vim/template/temp.html
