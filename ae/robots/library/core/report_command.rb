require_relative 'robot_command'
class ReportCommand < RobotCommand

  def initialize(robot = nil)
    @robot = robot
  end

  def robot=(robot)
    @robot=robot
  end

  def execute
    @robot.report
  end

  def command_name
    'REPORT'
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