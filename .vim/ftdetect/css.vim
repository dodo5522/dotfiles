autocmd BufRead,BufNewFile *.css setfiletype css
autocmd BufNewFile *.css 0r $HOME/.vim/template/temp.css
