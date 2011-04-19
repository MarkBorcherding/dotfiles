# Tab completion
require 'irb/completion'

# Make gems available
require 'rubygems'

#Require awesome print
require 'ap'

# hirb gem: Draw ASCII tables when outputting certain objects
begin
  require 'hirb'
  require 'hirb/import_object'
  Hirb.enable
  extend Hirb::Console
rescue LoadError  
end

