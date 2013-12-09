require_relative 'robot_face'

# Executes the robot command instructions
class Robot


  # @param [Integer] max_x - Max x coordinate
  # @param [Integer] max_y - Max y coordinate
  # @param [Integer] min_x - Min x coordinate
  # @param [Integer] min_y - Min Y coordinate
  # @param [RobotFace] robot_face - Robot face object
  def initialize(max_x, max_y, min_x=0, min_y=0, robot_face=RobotFace.new)
    @max_x=max_x
    @max_y=max_y
    @min_x = min_x
    @min_y = min_y
    @is_robot_placed = false
    @robot_face = robot_face
  end


  # @return [Integer] returns the current x coordinate. Nil if the robot has not received valid a Place instruction
  def get_x
    @x
  end


  # @return [Integer] returns the current y coordinate. Nil if the robot has not received valid a Place instruction
  def get_y
    @y
  end

  # @return [String] returns the current face. Nil if the robot has not received valid a Place instruction
  def get_face_name
    @face_name
  end


  # Returns true if the robot has processed a place instruction
  def is_robot_placed?
    @is_robot_placed
  end

  # # Executes the move command only if the robot has already  processed a place command.
  def move
    if @is_robot_placed then
      angle = @robot_face.get_angle(@face_name)
      x = @robot_face.get_xcoord(angle).to_i + @x
      y = @robot_face.get_ycoord(angle).to_i + @y
      if are_valid_coordinates?(x, y) then
        @x=x
        @y=y
      end
    end
  end

  # Execute a place command. The new coordinates must be within the bounds of the robot extents, else the instruction is not processed.
  # @param [Integer] new_x - new x coordinate
  # @param [Integer] new_y - new y coordinate
  # @param [String] new_face_name - The face , EAST, WEST , etc
  def place(new_x, new_y, new_face_name)
    if are_valid_coordinates?(new_x, new_y, new_face_name) then
      @x=new_x
      @y=new_y
      @face_name=new_face_name
      @is_robot_placed = true
    end
  end

  # Prints the current position
  def report
    if (@is_robot_placed)
      puts "#{@x} , #{@y} , #{@face_name}"
    end
  end

  # Executes the left command only if the robot has already  processed a place command.
  def left
    if @is_robot_placed then
      @face_name = @robot_face.get_face(@robot_face.add_angle(@face_name, 90))
    end
  end

  # Executes the right command only if the robot has already  processed a place command.
  def right
    if @is_robot_placed then
      @face_name = @robot_face.get_face(@robot_face.add_angle(@face_name, -90))
    end
  end

  private

  def are_valid_coordinates?(x, y, face_name = nil)
    return false if (! x.is_a?(Integer) or !y.is_a?(Integer))
    return false if x < @min_x || x>@max_x
    return false if y < @min_y || y>@max_y
    return false if face_name and !@robot_face.is_valid_face?(face_name)

    true
  end


end