require_relative 'robot_command'

# Represents the Robot Command  for Right Instruction
class RightCommand < RobotCommand

  def initialize(robot = nil)
    @robot = robot
  end

  def robot=(robot)
    @robot=robot
  end


  def robot=(robot)
    @robot=robot
  end

  def execute
    @robot.right
  end

  def command_name
    'RIGHT'
  end


  def parse_command(command_str)
    command_items = command_str.split(' ')
    command = if command_items.size == 1 && command_items[0]==self.command_name then
                self
              else
                nil
              end

  end

end