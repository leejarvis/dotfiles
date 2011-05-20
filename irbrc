ARGV.concat ['--readline']

begin
  require 'ap'
rescue LoadError
end

require 'pp'
require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems' if RUBY_VERSION < "1.9.1"
require 'fileutils'

include FileUtils

IRB.conf[:PROMPT_MODE] = :SIMPLE

def _hist
  history = Readline::HISTORY.entries
  index = history.rindex("exit") || history.rindex("quit") || -1
  puts history[(index+1)..-2].join("\n")
end

if File.exist? "lib"
  $:.unshift "./lib"

  begin
    require File.basename(Dir.pwd)
  rescue LoadError
  end
end
