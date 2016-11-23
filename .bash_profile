PS1="\[\e[36m\]\h\[\e[37m\]:\[\e[33m\]\W\[\e[37m\] $ "

### Added by the Heroku Toolbelt
export PATH="/usr/local/linaro/arm-linux-gnueabihf-raspbian/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export LESS='-g -i -M -R -S -W -z-4 -x4'

### Added by anyenv
if [ -d $HOME/.anyenv ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    for D in $(ls $HOME/.anyenv/envs)
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

if [ "$(uname)" = 'Darwin' ]; then
    alias markright="open -a /opt/homebrew-cask/Caskroom/markright/0.1.10/MarkRight.app"
fi
