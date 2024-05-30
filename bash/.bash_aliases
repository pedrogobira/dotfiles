# easy root access
alias root="su - root"

# update
alias update="sudo apt update -y && sudo apt upgrade -y && flatpak update -y && sudo snap refresh"

# nvim
alias v="nvim"

# git
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gps="git push"
alias gpl="git pull"
alias gl="git log"
alias glo="git log --oneline"
alias gfa="git fetch --all"
alias gr="git restore"
alias gb="git branch"

# python environment
alias cvenv="python -m venv venv"
alias venv=". venv/bin/activate"

# projects
alias cds="cd ~/.local/src/"
alias cdco="cd ~/TExSandbox/ics-edi-coleta-python/ && venv"
alias cdre="cd ~/TExSandbox/ics-edi-retorno-python/ && venv"
alias cded="cd ~/.local/src/edugestio/ && venv"
alias cdv="cd ~/.config/nvim/"
alias cdics="cd ~/TExSandbox/monolitico/ics/"
alias cdt="cd ~/TExSandbox/tarefas/"
alias cdl="cd ~/TExSandbox/scripts/controle && venv"

source .bash_secrets
