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

