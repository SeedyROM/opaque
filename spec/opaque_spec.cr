require "./spec_helper"

describe Opaque::CommandType do
  describe "#parse?" do
    it "Can serialize a command object" do
      command = CommandType.new(CommandType::SET, 2u8)
      command_string = command.serialize("key", "value")

      command_string.should eq "SET key value"
    end
    it "Will fail for invalid invalid command invocation" do
      begin
        command = CommandType.new(CommandType::SET, 2u8)
        command.serialize("key")
        raise "Did not throw invalid serialization error"
      rescue exception
      end
    end
  end
end
