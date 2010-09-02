require 'rubygems'
#require 'win32console'

class ConsoleColor
	
	COLORS = {  :red => 31, 
				      :green => 32
				    }
				
	EFFECTS = { :normal => 0,
				      :light => 1
			      }		
	
	def self.colorize(text, options = {})
	    color = options[:color] || :green
	    effect = options[:effect] || :normal
  		"\e[#{EFFECTS[effect]};#{COLORS[color]}m#{text}\e[0m"
	end
	
	def self.puts(text, options = {})
	  super colorize text,options
  end
	
end

puts 'light red [ ' + ConsoleColor.colorize('light', :color => :red, :effect => :light) + ' ]'
puts 'dark red  [ ' + ConsoleColor.colorize('dark', :color => :red) +  '  ]'
puts 'dark green  [ ' + ConsoleColor.colorize('dark') +  '  ]'
puts 'light green  [ ' + ConsoleColor.colorize('light', :effect => :light) +  '  ]'

ConsoleColor.puts "Green"