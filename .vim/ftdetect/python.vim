autocmd BufRead,BufNewFile *.py setfiletype python
autocmd BufNewFile *.py 0r $HOME/.vim/template/temp.py
