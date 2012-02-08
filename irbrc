ARGV.concat ['--readline']

require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems' if RUBY_VERSION < "1.9.1"
require 'fileutils'

include FileUtils

IRB.conf[:PROMPT_MODE] = :SIMPLE

