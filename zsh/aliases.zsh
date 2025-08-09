# Git aliases
alias g='git'
alias ga='git add'
alias ghb='git browse' # hub
alias ghpr='git pull-request' # hub
alias gp='git push'
alias gpoh='git push origin HEAD'
alias gpuo='git push -u origin HEAD'
alias gpod='git push origin --delete'
alias gpf='git push -f'
alias gpush='echo "Use gp" && git push'
alias gpu='git pull'
alias gpr='git pull --rebase'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcl='git clone'
alias gad='git add --all .'
alias gcm='git commit -m'
alias gcma='git commit --amend'
alias gcom='git commit'
alias gf='git fetch'
alias gs='git status'
alias gst='git stash'
alias gsl='git stash list'
alias gsh='git show'
alias gsp='git stash pop'
alias gta='git tag -a'
alias gl='git log'
alias glg='git log --oneline --decorate --all --graph'
alias gd='git diff --color-words'
alias gdh='git diff HEAD'
alias gdhh='git diff HEAD^'
alias gds='git diff --staged --color-words'
alias gb='git branch'
alias gbl='git blame'
alias gpod='git push origin --delete'
alias gr='git rebase'
alias grc="git rebase --continue"
alias grm='git remote'
alias grh='git reset HEAD'
alias grhh='git reset HEAD^'
alias gm='git merge'
alias gmm='git merge master'
alias gi='git init'
alias gsm='git submodule'
alias gsur='git submodule update --recursive'
alias gcp='git cherry-pick'

# Node aliases
alias nd='node'
alias ni='npm install'
alias nig='npm install --global'
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias nu='npm uninstall'
alias nug='npm uninstall --global'
alias nus='npm uninstall --save'
alias nusd='npm uninstall --save-dev'
alias ns='npm start'
alias nt='npm test'
alias nr='npm run'
alias nrd='npm run dev'

# Docker
alias d='docker'
alias di='docker images'
alias dps='docker ps'
alias db='docker build'
alias dr='docker run'
alias dm='docker-machine'
alias dcm='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'

# Other aliases
alias v='nvim'
alias vm='nvim .'
alias za='nvim $ZSH/custom/aliases.zsh'
alias zaa='source ~/.zshrc'
alias grp='grep'
alias ..='cd ..'
alias ...='cd ...'

# Vagrant
alias va='vagrant'
alias vs='vagrant ssh'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vra='vagrant rsync-auto'

# tmux
alias tm="tmux"
alias tmls="tmux ls"
alias tmat="tmux attach -t"

# ubuntu
alias agu="sudo apt-get update -y"
alias agi="sudo apt-get install -y"
alias agr="sudo apt-get remove -y"

# screen
alias sd="~/.dotfiles/xrandr/dual.sh"
alias sn="~/.dotfiles/xrandr/normal.sh"
