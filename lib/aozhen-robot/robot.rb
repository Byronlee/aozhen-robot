# -*- coding: utf-8 -*-
class Robot
  
  def initialize x, y, dir
    @point = Point.new(x, y)
    @dir   = dir 
    @step  = 1
  end

  def move cmd
    location = []
    if cmd.cmd_M?
      # TODO fixme!
      @point.y += @step
      # the dir of robot is not changed
      location =  [@point.x, @point.y, @dir]
    elsif cmd.cmd_L?
      location =  [@point.x, @point.y, turn(cmd.to_s)]
    else cmd.cmd_R?
      location =  [@point.x, @point.y, turn(cmd.to_s)]
    end

    location
  end

  def turn command
    turn = Turn.new(@dir, command)
    turn.excute
  end
end


#**************************byronlee********使用命令模式重构


class Rotot

  def position
    @position = position
    [@position.x @position.y,@position.drec]
end

class Position
  attr_accessor :x,:y,:drec

  def   initialize
    @position = "xxxxx.xml"
    @x = @position.x
    @y = @position.y
    @drec = Derection.new @position.drec
    @move = Move.new
  end

end

class Move
  def initialize position
    @Position = Position
  end

  def L size
  end

  def M size
  end

  def R size
  end

end

class Derection
  def initialize defalut
   @defalut = defalut
   @ds = ['w','s','e','f']
  end

  def pre
    @ds[@defalut].pre
  end

  def next
    @ds[@defalut].next
  end
end


class Lcommand
  def initialize size,rebot
    @size = size
    @rebot = rebot
  end

  def execute
    # @size/基数　.downto 0{@rebot.position.drec.pre} 如果转几次的话
    @rebot.position.drec.pre
  end

  # todo 
  def unexecute
  end
end

class Rcommand
  def initialize size,rebot
    @size = size
    @rebot = rebot
  end

  def execute rebot
    # @size/基数　.downto 0@rebot.position.next} 如果转几次的话
    @rebot.position.drec.next
  end

  # todo 
  def unexecute
  end
end

class Mcommand
  def initialize size
    @size = size
  end

  def execute rebot
    # @size/基数　.downto 0@rebot.position.move} 如果转几次的话
    rebot.position.move.send(rebot.position.derc.to_sym,size)
  end

  # todo 
  def unexecute
  end
end

# 组合命令
class CompositeComand

  def initialize rebot
    @commands = []
    @rebot = rebot
  end

  def << command
    @commands << command
  end

  def delete command
    @command.delete command
  end


  def execute
    @commands.each do | command |
      command.execute @rebot
    end
  end
  
  # todo 
  def unexecute
  end
end
