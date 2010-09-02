require 'rubygems'
#require 'win32console'

class ConsoleColor
	
	COLORS = {  :red => 31, 
				      :green => 32
				    }
				
	EFFECTS = { :normal => 0,
				      :bright => 1
			      }		
	
	def self.colorize(text, color_code, effect)
  		"\e[#{EFFECTS[effect]};#{COLORS[color_code]}m#{text}\e[0m"
	end

	
	def self.red(text); colorize(text, :red , :normal); end
	def self.light_red(text); colorize(text, :red , :bright ); end
	def self.green(text); colorize(text, :green , :normal); end
	def self.light_green(text); colorize(text, :green , :bright); end
	
	
end

puts 'light red [ ' + ConsoleColor.light_red('light') + ' ]'
puts 'dark red  [ ' + ConsoleColor.red('dark') +  '  ]'
puts 'dark green  [ ' + ConsoleColor.green('dark') +  '  ]'
puts 'light green  [ ' + ConsoleColor.light_green('light') +  '  ]'