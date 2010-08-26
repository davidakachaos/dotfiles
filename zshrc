# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rake rails git textmate ruby osx)

source $ZSH/oh-my-zsh.sh
# load capistrano completion
source ~/.zsh/cap_completion

# Customize to your needs...
export PATH=/var/lib/gems/1.8/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/mysql/bin:~/.rvm/bin
export AUTOFEATURE=true

#Heroku aliases
alias heroku:credentials="ruby ~/heroku_credentials.rb"
alias heroku:default="ruby ~/heroku_switch_default.rb"
alias heroku:admin="ruby ~/heroku_switch_development.rb"

source ~/.rvm/scripts/rvm

# setup stub for if you use RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi