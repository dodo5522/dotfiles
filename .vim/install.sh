#!/bin/sh
if ! [ -d ./bundle ]; then
    mkdir -p ./bundle
    cd ./bundle
	if ! [ -d ./vundle ]; then
        git clone git://github.com/Shougo/neobundle.vim
    fi
fi

