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

  puts "Linking rmbackup script"
  system %Q{ln -s "$PWD/utils/rmbackup" "$HOME/rmbackup"}
  system %Q{chmod +x "$HOME/rmbackup"}

  puts "chmodding remote_ssh_config"
  system %Q{ln -s "$PWD/utils/remote_ssh_config" "$HOME/remote_ssh_config"}
  system %Q{chmod +x "$HOME/remote_ssh_config"}
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
