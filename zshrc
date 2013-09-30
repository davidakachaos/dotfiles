# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="muse"
# export ZSH_THEME="af-magic"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rake rails3 git textmate ruby osx lol autojump cap git-flow rvm brew gem terminitor)

# [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export EDITOR=vim
export GIT_EDITOR=vim

source $ZSH/oh-my-zsh.sh
# load capistrano completion
source ~/.zsh/cap_completion

# Customize to your needs...
export PATH=/var/lib/gems/1.8/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/mysql/bin:~/.rvm/bin
export PATH="$PATH:/Users/davidwesterink/Broncode/git-achievements"
export PATH="$PATH:/usr/local/Cellar/todo-txt/2.9/bin"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export AUTOFEATURE=true

#Heroku aliases
alias heroku:credentials="ruby ~/heroku_credentials.rb"
alias heroku:default="ruby ~/heroku_switch_default.rb"
alias heroku:admin="ruby ~/heroku_switch_development.rb"
alias heroku:publishinn="ruby ~/heroku_switch_publish-inn.rb"

source ~/.aliases

# source ~/.git-flow-completion.zsh

#Auto bundle exec
alias b="bundle exec"

# setup stub for if you use RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

#Git-up config see; http://github.com/aanand/git-up
GIT_UP_BUNDLER_CHECK='true'

# export DYLD_LIBRARY_PATH="/opt/oracle/instantclient_10_2:/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export SQLPATH="/opt/oracle/instantclient_10_2"
export TNS_ADMIN="~/.oracle"
export NLS_LANG="AMERICAN_AMERICA.UTF8"
#export PATH=$PATH:$DYLD_LIBRARY_PATH

# login show...
echo
date
uptime
echo
fortune -a -s

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"
