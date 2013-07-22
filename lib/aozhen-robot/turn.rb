# 
# change dir of the bobot
# 地理方向（E东，W西，S南，N北）
# 
class Turn

   # action left 'L' or right 'R'
   def initialize dir, action
     @dir    = dir
     @action = action
   end

   def excute
     left  = ['E','N','W','S']
     right = ['E','S','W','N']

     # refactor
      if action_L?
        index = left.index(@dir)
        @dir  = left[index - 1]
      elsif action_R?
        index = right.index(@dir)
        @dir  = right[index + 1] || right.first
	
      end

     @dir
   end
   
   def action_L?
     @action == 'L'
   end

   def action_R?
     @action == 'R'
   end
end

