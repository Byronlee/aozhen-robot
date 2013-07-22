class Robot
  
  def initialize x, y, dir
    @x = x || 0
    @y = y || 0
    @dir = dir 
  end

  def move cmd
    location = []

    if cmd.cmd_M?
      @y += 1
      location =  [@x, @y, @dir]
    elsif cmd.cmd_L?
      location =  [@x, @y, turn('L')]
    else cmd.cmd_R?
      location =  [@x, @y, turn('R')]
    end

    location
  end

  def turn command
    turn = Turn.new(@dir, command)
    after_dir = turn.excute
  end
end

