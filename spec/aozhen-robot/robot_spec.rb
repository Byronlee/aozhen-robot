require "#{File.dirname(__FILE__)}/../../lib/aozhen-robot/robot"
require "#{File.dirname(__FILE__)}/../../lib/aozhen-robot/point"
require "#{File.dirname(__FILE__)}/../../lib/aozhen-robot/command"
require "#{File.dirname(__FILE__)}/../../lib/aozhen-robot/turn"

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

  it "the step of moving should be 1" do
    @robot.instance_variable_get(:@step).should == 1
  end
end

