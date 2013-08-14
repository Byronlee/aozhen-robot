# -*- coding: utf-8 -*-

require 'net/http/server'  # 解析http请求
require 'pp'
require 'crack/xml'
require 'xmlsimple' # 解析xm;
require 'builder' # 产生xml
require 'aozhen-robot/turn'
require 'aozhen-robot/robot'
require 'aozhen-robot/command'

# robot move rule
#
# command节点可能传送的字母为： 'L ', 'R '和 'M '。 
#   'L ',和 'R '分别表示使机器人向左、向右旋转90度，但不离开他所在地点。
#   'M ' 表示向前开进一个方格的距离，且保持方向不变


module Aozhen
  module Robot
    Net::HTTP::Server.run(:port => 3001) do |request,stream|

    #  s =  Robot.new(0,0,'E').move(Command.new("L"))
    #  [200, {'Content-Type' => 'text/html'}, ["asdfasfdas"]]

      
      # 最后重构 使用命令模式！！！！！
      command =  "#{parse_request(request.body)}command"
      command_class  = self.class.const_get command
      rebot = Rebote.new 
      commands = CompositeComand.new rebot
      commands << command_class.new
      commands.execute
      rebot.position

#      create_response_xml(Robot.move "L")      

    end

    def create_response_xml robot_moved_result
      xml = Builder::XmlMarkup.new( :indent => 2 )
       xml.instruct! :xml, :encoding => "UTF-8"    
       xml.robot_position do |d|
         d.x      robot_moved_result[0]
         d.y      robot_moved_result[1]
         d.d      robot_moved_result[2]
       end
     end
    
    def parse_request body
      Crack::XML.parse body
      # => {'tag' => 'This is the contents'}
    end
 end
end


