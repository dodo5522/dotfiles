PS1="\[\e[36m\]\h\[\e[37m\]:\[\e[33m\]\W\[\e[37m\] $ "

### Added by the Heroku Toolbelt
export PATH="/usr/local/linaro/arm-linux-gnueabihf-raspbian/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/opt/android-studio-ide-171.4443003-3.0.1:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.platformio/penv/bin:$PATH"
export PATH="/usr/local/OpenJTalk/bin:$PATH"
export LESS='-g -i -M -R -S -W -z-4 -x4'

### Added by anyenv
if [ -d "$HOME/.anyenv" ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    for D in $(ls "$HOME/.anyenv/envs")
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

### Added for nvm
#export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ "$(uname)" = 'Darwin' ]; then
#    export PATH="/opt/gcc-arm-none-eabi-4_9-2015q3/bin:$PATH"
    export PATH="/opt/gcc-arm-none-eabi-5_4-2016q3/bin:$PATH"
    alias markright="open -a /opt/homebrew-cask/Caskroom/markright/0.1.10/MarkRight.app"

    export ARDUINO_DIR=/Applications/Arduino.app/Contents/Java
    export ARDMK_DIR=${HOME}/Development/Arduino-Makefile
    export AVR_TOOLS_DIR=/Applications/Arduino.app/Contents/Java/hardware/tools/avr
    export PATH="${AVR_TOOLS_DIR}/bin:$PATH"
    alias lsusb="system_profiler SPUSBDataType"
elif [ "$(uname)" = 'Linux' ]; then
    export PATH="/opt/arduino-1.8.5:$PATH"
    _byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
fi

### Added for GCS
[ -f "${HOME}/google-cloud-sdk/path.bash.inc" ] && \. "${HOME}/google-cloud-sdk/path.bash.inc"
[ -f "${HOME}/google-cloud-sdk/completion.bash.inc" ] && \. "${HOME}/google-cloud-sdk/completion.bash.inc"

### For rust env
source "$HOME/.cargo/env"
