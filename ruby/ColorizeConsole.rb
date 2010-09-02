require 'rubygems'
#require 'win32console'

class CoolColorConsole
	
  COLORS = {  
    :red => 31, 
    :green => 32,
    :black  => 30,
    :yellow => 33, 
    :blue => 34, 
    :magenta => 35, 
    :cyan => 36, 
    :white => 37
  }
  
  EFFECTS = { 
    :normal => 0,
    :light => 1
  }		
	
  def self.color(text, color = :white)
    "\e[0;#{COLORS[color]}m#{text}\e[0m"
  end

  def self.bright(text)
    "\e[1;#{text}\e[0m"
  end
  
end

class String
  def color(color = :white)
    CoolColorConsole.color(self,color)
  end

  def bright
    CoolColorConsole.bright(self)
  end
end


puts "some green".color(:green).bright + " blue".color(:blue)
puts "some red".color(:red).bright
puts "bright".bright
