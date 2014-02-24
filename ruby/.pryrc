if defined?(PryDebugger)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

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
