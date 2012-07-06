ARGV.concat ['--readline']

require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems' if RUBY_VERSION < "1.9.1"
require 'fileutils'

begin
  require 'hirb'
  Hirb.enable
rescue LoadError
end

begin
  require 'fancy_irb'
  FancyIrb.start
rescue LoadError
end

include FileUtils

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

def y(obj)
  puts obj.to_yaml
end

if defined?(Rails)
  ActiveRecord::Base.logger.level = 1
end