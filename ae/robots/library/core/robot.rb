require_relative 'robot_face'


class Robot


  def initialize(max_x, max_y, min_x=0, min_y=0, robot_face=RobotFace.new)
    @max_x=max_x
    @max_y=max_y
    @min_x = min_x
    @min_y = min_y
    @is_initialised = false
    @robot_face = robot_face
  end

  def get_x
    @x
  end

  def get_y
    @y
  end

  def get_face_name
    @face_name
  end

  def move
    if @is_initialised then
      angle = @robot_face.get_angle(@face_name)
      x = @robot_face.get_xcoord(angle).to_i + @x
      y = @robot_face.get_ycoord(angle).to_i + @y
      if are_valid_coordinates?(x, y) then
        @x=x
        @y=y
      end

    end
  end

  def place(new_x, new_y, new_face_name)
    if are_valid_coordinates?(new_x, new_y, new_face_name) then
      @x=new_x
      @y=new_y
      @face_name=new_face_name
      @is_initialised = true
    end
  end

  def report
    if (@is_initialised)
      puts "#{@x} , #{@y} , #{@face_name}"
    end
  end

  def left
    if @is_initialised then
      @face_name = @robot_face.get_face(@robot_face.add_angle(@face_name, 90))
    end
  end

  def right
    if @is_initialised then
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