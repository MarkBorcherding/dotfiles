#!/usr/bin/ruby
require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'

begin
  require 'interactive_editor'
rescue LoadError
  puts 'Install interactive_editor with "gem install interactive_editor"'
end

begin
  require 'awesome_print'
rescue LoadError
  puts 'Install Awesome Print with "gem install awesome_print"'
end

begin
  require 'wirb'
rescue LoadError
  puts 'Install Wirb with "gem install wirb"'
end

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:AUTO_INDENT] = true
