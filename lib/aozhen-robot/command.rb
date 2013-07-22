class Command
  def initialize cmd
    @cmds = ['L','M','R']
    if @cmds.include? cmd
      @cmd = cmd
    else
      raise 'invaild command'
    end
  end

  #TODO refactor
  def cmd_L?
    @cmd == 'L'
  end

  def cmd_M?
    @cmd == 'M'
  end

  def cmd_R?
    @cmd == 'R'
  end
end
