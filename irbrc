# .irbrc

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
