# -*- coding: utf-8 -*-
modue Command
 def eccute 
 end
end

class turnleftcommand
  def excute
    @rebot.turn_left
  end
end

class rightcommand
  def right
    @rebot.turn_right
  end
end



class Command
  def initialize xml_command
    @cmds = ['L','M','R']   # todo 写入配置
    @reciver = Rebot.initialize 
    @instruction = prase_xml_command xml_command
     #　todo 这个异常的处理应该提出去
    raise 'invaild command'    if !@cmds.include? @instruction
  end


  def excute
    @reciver.send(@instruction.to_sym,size=nil)
  end

  def undo 
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

  def to_s
    @cmd.to_s
  end
end
