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

    destination = File.expand_path('../' + filename.sub(/^./, ''), __FILE__)

    if File.directory?(file)
      FileUtils.rm_rf(destination) if File.directory?(destination)
      FileUtils.cp_r(file, destination)
      puts "Copying directory #{file} .."
    else
      FileUtils.cp(file, destination)
      puts "Copying file #{file} .."
    end
  end
end

desc "Install configuration files into home directory"
task :install do
  Dir.foreach(File.dirname(__FILE__)) do |filename|
    next if filename[0].chr == '.'

    file = File.expand_path(filename)
    destination = File.join(ENV['HOME'], filename.insert(0, '.'))

    if File.exists?(destination)
      print "#{destination} exists.. replace? [Ny]"
      next unless STDIN.gets[0].chr.downcase == 'y'
    end
    FileUtils.cp_r(file, destination)
  end
end