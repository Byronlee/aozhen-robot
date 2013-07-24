# -*- coding: utf-8 -*-

require 'net/http/server'
require 'pp'
require 'crack/xml'
require 'xmlsimple'
require 'builder'
require 'aozhen-robot/turn'
require 'aozhen-robot/robot'
require 'aozhen-robot/command'

# robot move rule
#
# command节点可能传送的字母为： 'L ', 'R '和 'M '。 
#   'L ',和 'R '分别表示使机器人向左、向右旋转90度，但不离开他所在地点。
#   'M ' 表示向前开进一个方格的距离，且保持方向不变
#
module Aozhen
  module Robot
    Net::HTTP::Server.run(:port => 3001) do |request,stream|
#      p request
#      command =  parse_request request.body 
      
#     p Robot.new(0,0,'E').move(Command.new("L"))
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



