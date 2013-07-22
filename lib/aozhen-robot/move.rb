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


