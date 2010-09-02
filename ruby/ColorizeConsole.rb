require 'rubygems'
#require 'win32console'

class ConsoleColor
	
	COLORS = { :red => 31, 
				 :green => 21
				}
				
	EFFECTS = { :normal => 0,
				  :bright => 1
				}		
	
	def self.colorize(text, color_code, effect)
  		"\e[#{EFFECTS[effect]};#{COLORS[color_code]}m#{text}\e[0m"
	end

	
	#eventually replace this with method missing 
	def self.red(text); colorize(text, :red , :normal); end
	def self.light_red(text); colorize(text, :red , :bright ); end
	def self.green(text); colorize(text, :green , :normal); end
	
	
end



puts 'light red [ ' + ConsoleColor.light_red('light') + ' ]'
puts 'dark red  [ ' + ConsoleColor.red('dark') +  '  ]'