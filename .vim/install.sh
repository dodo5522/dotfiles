#!/bin/sh
if [ -d ./bundle ]; then
    cd ./bundle
	if ! [ -d ./vundle ]; then
        git clone https://github.com/gmarik/vundle.git ./vundle
    fi
fi

