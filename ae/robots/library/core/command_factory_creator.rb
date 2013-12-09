require_relative 'left_command'
require_relative 'right_command'
require_relative 'move_command'
require_relative 'place_command'
require_relative 'report_command'
require_relative 'robot_command'
require_relative 'invalid_command'

class CommandFactoryCreator

  def initialize(robot, command_factories = get_default_command_factories(robot))
    @commandFactories = command_factories
  end

  def get_command_factory(command_str)
    command_name = command_str.split(' ')[0]
    commandFactory = get_commandFactory_matching_name(command_name)
    commandFactory ||= InvalidCommand.new
    return commandFactory
  end

  private

  def get_commandFactory_matching_name(command_name)
    commandFactory = nil
    @commandFactories.each do |d_commandFactory|
      break commandFactory = d_commandFactory if d_commandFactory.command_name == command_name
    end
    commandFactory
  end

  def get_default_command_factories(robot)
    [RightCommand.new(robot), LeftCommand.new(robot), PlaceCommand.new(robot), MoveCommand.new(robot), ReportCommand.new(robot)]
  end

end