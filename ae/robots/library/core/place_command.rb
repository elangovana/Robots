require_relative 'robot_command'

# Represents the Robot Command  for Place Instruction
class PlaceCommand < RobotCommand

  attr_accessor :x, :y, :face_name

  def initialize(robot = nil)
    @robot = robot
  end

  def robot=(robot)
    @robot=robot
  end

  def execute
    @robot.place(self.x, self.y, self.face_name)
  end

  def command_name
    'PLACE'
  end


  def parse_command(command_str)
    command_items = command_str.split(' ')
    command = nil
    if command_items.size == 2 && command_items[0]==self.command_name then
      command_args = command_items[1].split(',')
      if command_args.size == 3 then
        begin
          self.x= Integer(command_args[0])
          self.y= Integer(command_args[1])
          self.face_name=command_args[2]
          command = self
        rescue ArgumentError
          #TODO log warning
        end
      end

    end
    command
  end

end