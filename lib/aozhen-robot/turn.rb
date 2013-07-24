# 
# change dir of the bobot
# 地理方向（E东，W西，S南，N北）
# 
class Turn

   # action left 'L' or right 'R'
   def initialize dir, action
     @dir    = dir
     @cmd = Command.new action
   end

   def excute
     # refactor
     if @cmd.cmd_L?
       index = left.index(@dir)
       @dir  = left[index - 1]
     elsif @cmd.cmd_R?
       index = right.index(@dir)
       @dir  = right[index + 1] || right.first
     end

     @dir
   end

   def left
     @left ||= ['E','N','W','S']
   end

   def right
     @right ||= ['E','S','W','N']
   end
end

