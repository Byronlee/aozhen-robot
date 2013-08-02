require "#{File.dirname(__FILE__)}/../../lib/aozhen-robot/turn"

describe Turn do
 
   it "N should be changed to E when action is L" do
     turn = Turn.new('N','L')
     turn.excute.should == 'E'
   end
 
   it "E should be changed to S when action is L" do
     turn = Turn.new('E','L')
     turn.excute.should == 'S'
   end

   it "N should be changed to E when action is R" do
     turn = Turn.new('N','R')
     turn.excute.should == 'E'
   end

   it "E should be changed to S when action is R" do
     turn = Turn.new('E','R')
     turn.excute.should == 'S'
   end
end

