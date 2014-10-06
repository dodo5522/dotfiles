#!/bin/bash
if ! [ -d ./bundle/neobundle.vim ]; then
    mkdir -p ./bundle
    cd ./bundle
	if ! [ -d ./vundle ]; then
        git clone http://github.com/Shougo/neobundle.vim
    fi
fi

if ! [ -d ./plantuml-syntax ]; then
	git clone https://github.com/aklt/plantuml-syntax.git ./plantuml-syntax
	ln -fs ../plantuml-syntax/ftdetect/plantuml.vim ./ftdetect
	ln -fs ../plantuml-syntax/ftplugin/plantuml.vim ./ftplugin
	ln -fs ${PWD}/plantuml-syntax/syntax/plantuml.vim /usr/share/vim/vim74/syntax
fi
