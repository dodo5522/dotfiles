#!/bin/bash
if ! [ -d ./bundle/neobundle.vim ]; then
    mkdir -p ./bundle
    cd ./bundle
	if ! [ -d ./vundle ]; then
        git clone http://github.com/Shougo/neobundle.vim
    fi
fi
