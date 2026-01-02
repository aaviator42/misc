export PATH="$HOME/.local/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
export SENTRY_DISABLE_AUTO_UPLOAD=true
alias te='open -a TextEdit'
alias vsc='open -a "Visual Studio Code"'

# MentraOS aliases
mentra-get-dev() {
    if [ -d "MentraOS" ]; then
        echo "MentraOS already exists. This will discard any local changes."
        read "reply?Proceed? [y/N] "
        if [[ "$reply" =~ ^[Yy]$ ]]; then
            cd MentraOS && git fetch --depth 1 origin dev && git reset --hard origin/dev && cd ..
        else
            echo "Aborted."
        fi
    else
        git clone --depth 1 --branch dev --single-branch https://github.com/Mentra-Community/MentraOS.git
    fi
}

mentra-get-main() {
    if [ -d "MentraOS" ]; then
        echo "MentraOS already exists. This will discard any local changes."
        read "reply?Proceed? [y/N] "
        if [[ "$reply" =~ ^[Yy]$ ]]; then
            cd MentraOS && git fetch --depth 1 origin main && git reset --hard origin/main && cd ..
        else
            echo "Aborted."
        fi
    else
        git clone --depth 1 --branch main --single-branch https://github.com/Mentra-Community/MentraOS.git
    fi
}

mentra-get() {
    if [ -z "$1" ]; then
        echo "Usage: mentra-get <branch>"
        return 1
    fi
    if [ -d "MentraOS" ]; then
        echo "MentraOS already exists. This will discard any local changes."
        read "reply?Proceed? [y/N] "
        if [[ "$reply" =~ ^[Yy]$ ]]; then
            cd MentraOS && git fetch --depth 1 origin "$1" && git reset --hard origin/"$1" && cd ..
        else
            echo "Aborted."
        fi
    else
        git clone --depth 1 --branch "$1" --single-branch https://github.com/Mentra-Community/MentraOS.git
    fi
}

# StreamPackLite alias
spl-get() {
    if [ -d "StreamPackLite" ]; then
        echo "StreamPackLite already exists. This will discard any local changes."
        read "reply?Proceed? [y/N] "
        if [[ "$reply" =~ ^[Yy]$ ]]; then
            cd StreamPackLite && git fetch --depth 1 origin working && git reset --hard origin/working && cd ..
        else
            echo "Aborted."
        fi
    else
        git clone --depth 1 --branch working --single-branch git@github.com:Mentra-Community/StreamPackLite.git
    fi
}
