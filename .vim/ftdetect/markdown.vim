autocmd BufRead,BufNewFile *.md setfiletype markdown
autocmd BufNewFile *.md 0r $HOME/.vim/template/temp.md
