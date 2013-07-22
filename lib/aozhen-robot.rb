
require 'net/http/server'
require 'pp'
require 'crack/xml'

# robot move rule
#
# command节点可能传送的字母为： 'L ', 'R '和 'M '。 
#   'L ',和 'R '分别表示使机器人向左、向右旋转90度，但不离开他所在地点。
#   'M ' 表示向前开进一个方格的距离，且保持方向不变
#
module Aozhen
  module Robot

    Net::HTTP::Server.run(:port => 3001) do |request,stream|
      pp request

      [200, {'Content-Type' => 'text/html'}, ['<data a="1" b="five" />']]
    end
  end
end

Crack::XML.parse("<tag>This is the contents</tag>")
# => {'tag' => 'This is the contents'}

class Move
  
  def initialize x, y, command
    @x = x || 0
    @y = y || 0
    @command -= command
    @dir =  nil
  end

  def excute
    if command_L?
      @y += 1
    elsif M?
    
  end

  def command_L?
    @command == 'L'
  end

  def command_M?
    @command == 'M'
  end

  def command_R?
    @command == 'R'
  end

end

# 
# change dir of the bobot
# 地理方向（E东，W西，S南，N北）
# 
class Turn

   # action left 'L' or right 'R'
   def initialize dir, action
     @dir    = dir
     @action = action
   end

   def excute
     
   end
   
   def L?
     @action == 'L'
   end

   def R?
     @action == 'R'
   end
end
