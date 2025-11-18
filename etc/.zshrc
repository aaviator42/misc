# MentraOS Git helpers
alias mentra-get-dev='git clone --branch dev --single-branch https://github.com/Mentra-Community/MentraOS.git'
alias mentra-get-main='git clone --branch main --single-branch https://github.com/Mentra-Community/MentraOS.git'

mentra-get() {
    if [ -z "$1" ]; then
        echo "Usage: mentra-get <branch>"
        return 1
    fi
    git clone --branch "$1" --single-branch https://github.com/Mentra-Community/MentraOS.git
}
