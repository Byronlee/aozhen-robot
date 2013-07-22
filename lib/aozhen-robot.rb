
require 'net/http/server'
require 'pp'
require 'crack/xml'
require 'aozhen-robot/turn'
require 'aozhen-robot/move'

# robot move rule
#
# command节点可能传送的字母为： 'L ', 'R '和 'M '。 
#   'L ',和 'R '分别表示使机器人向左、向右旋转90度，但不离开他所在地点。
#   'M ' 表示向前开进一个方格的距离，且保持方向不变
#
module Aozhen
  module Robot

 #   Net::HTTP::Server.run(:port => 3001) do |request,stream|
 #     pp request

 #     [200, {'Content-Type' => 'text/html'}, ['<data a="1" b="five" />']]
 #   end
 end
end

Crack::XML.parse("<tag>This is the contents</tag>")
# => {'tag' => 'This is the contents'}


