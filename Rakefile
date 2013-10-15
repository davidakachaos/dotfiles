require 'rake'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README LICENSE id_rsa.pub].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end

  # Handle ssh pubkey on its own
  # puts "Linking public ssh key"
  # system %Q{mkdir "$HOME/.ssh"}
  # system %Q{rm "$HOME/.ssh/id_rsa.pub"}
  # system %Q{ln -s "$PWD/id_rsa.pub" "$HOME/.ssh/id_rsa.pub"}

  puts 'Linking rmbackup script'
  system %Q{ln -s "$PWD/utils/rmbackup" "$HOME/rmbackup"}
  system %Q{chmod +x "$HOME/rmbackup"}

  puts "chmodding remote_ssh_config"
  system %Q{ln -s "$PWD/utils/remote_ssh_config" "$HOME/remote_ssh_config"}
  system %Q{chmod +x "$HOME/remote_ssh_config"}

  puts 'installing rvm'
  system 'curl -L https://get.rvm.io | bash -s stable --rails --ruby=2.0.0 -- --ignore-dotfiles'

  puts 'installing homebrew'
  system 'ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"'

  puts 'installing zsh'
  system 'brew install zsh'

  puts 'installing more things'
  system 'brew install mysql hub imagemagick fortune postgresql'
  system 'brew tap phinze/homebrew-cask'
  system 'brew install brew-cask'
  puts 'Installing programs, may take a while, get a coffee!'
  system 'brew cask install heroku-toolbelt skype evernote open-office lastpass-universal rubymine adium firefox google-chrome cyberduck cord gitx-l dropbox f.lux hazel filezilla cyberduck google-drive'
  puts 'Look in dropbox for licences and such'

  puts 'Setting up default paths'
  system 'mkdir ~/bin'
  system 'mkdir ~/Broncode'
  system 'mkdir ~/Broncode/personal'
  system 'mkdir ~/Broncode/personal/opensource'
  puts 'cloning own repos needed'
  system 'cd ~/Broncode/personal && git clone git@github.com:davidakachaos/git-achievements.git'
  system 'cd ~/Broncode/personal/git-achievements && ln -s $PWD/git-achievements ~/bin/git-achievements'
  system 'cd ~/Broncode/personal/opensource && git clone git@github.com:davidakachaos/workless.git'

  puts 'All done! Now please open a new Terminal tab/window!'
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
