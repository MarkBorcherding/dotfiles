require 'rubygems'
require 'win32console'

class ConsoleColor
	def self.colorize(text, color_code, effect)
  		"\e[#{effect};#{color_code}m#{text}\e[0m"
	end
	
	@@normal = 0;
	@@bright = 1;
	
	def self.red(text); colorize(text, 31, @@normal); end
	def self.light_red(text); colorize(text, 31, @@bright); end
	def self.green(text); colorize(text, 32, @@normal); end
end



puts 'light red [ ' + ConsoleColor.light_red('light') + ' ]'
puts 'dark red  [ ' + ConsoleColor.red('dark') +  '  ]'