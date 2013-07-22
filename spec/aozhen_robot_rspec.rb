require 'net/http/server' 
require 'webmock/rspec'
require "#{File.dirname(__FILE__)}/../lib/aozhen-robot/turn"
require "#{File.dirname(__FILE__)}/../lib/aozhen-robot/command"
require "#{File.dirname(__FILE__)}/../lib/aozhen-robot/robot"

describe "request xml format" do
   it "request xml should include command" do
   end
end

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


describe Command do
  it 'should raise if cmd does not exist' do
    expect { Command.new('Z')}.to raise_error
  end

  it 'L , R, M cmd is vaild' do
    ['L', 'R', 'M'].map do |cmd|
      Command.new(cmd).should be_instance_of Command
    end
  end
end
  
describe Robot do
  before :each do
    @robot = Robot.new(0,0,'E')
  end

  # left  = ['E','N','W','S']
  # right = ['E','S','W','N']

  it "send @robot 'M' commond and location should y + 1" do
    cmd = Command.new('M')
    @robot.move(cmd).should == [0,1,'E']
  end

  it "send @robot 'L' commond and dir should be S" do
    cmd = Command.new('L')
    @robot.move(cmd).should == [0,0,'S']
  end

  it "send @robot 'R' commond and dir should be S" do
    cmd = Command.new('R')
    @robot.move(cmd).should == [0,0,'S']
  end
end
