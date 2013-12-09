require_relative 'robot_command'

# Creates a Robot Command
class CommandFactory


# Name of the command
  attr_accessor :command_name


  # @param [String] command_str
  # @return [RobotCommand]
  #  Parses the command string and constructs a command Object
  def parse_command(command_str)
    @command_str = command_str
  end
end