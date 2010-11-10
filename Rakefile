require 'fileutils'

INCLUDES = ['.zsh', '.zshrc', '.vimrc', '.vim', '.tmux.conf', '.gemrc', '.irbrc']

desc "Update configuration files from home directory"
task :update do
  INCLUDES.each do |filename|
    file = File.expand_path(File.join(ENV['HOME'], filename))

    unless File.exists?(file)
      puts "No such file #{file} .."
      next
    end

    nicefile = "/" + filename.sub(/^./, '')

    if File.directory?(file)
      FileUtils.cp_r(file, File.dirname(__FILE__) + nicefile)
      puts "Copying directory #{file} .."
    else
      FileUtils.cp(file, File.dirname(__FILE__) + nicefile)
      puts "Copying file #{file} .."
    end
  end
end