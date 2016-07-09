PS1="\W $ "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

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
