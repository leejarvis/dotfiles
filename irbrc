ARGV.concat ['--readline']

begin
  require 'ap'
rescue LoadError
  puts "No awesome_print support (gem install awesome_print)"
end

require 'pp'
require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems' if RUBY_VERSION < "1.9.1"
require 'fileutils'

include FileUtils

IRB.conf[:PROMPT_MODE] = :SIMPLE

def irb_history
  history = Readline::HISTORY.entries
  index = history.rindex("exit") || history.rindex("quit") || -1
  content = history[(index+1)..-2].join("\n")
  puts history
end

if File.exist? "lib"
  $:.unshift "./lib"

  begin
    require File.basename(Dir.pwd)
  rescue LoadError
  end
end
