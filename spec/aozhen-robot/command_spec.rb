require "#{File.dirname(__FILE__)}/../../lib/aozhen-robot/command"

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

