
# Robot Face manages the Robot Face Name and corresponding angle and angle related calcs.
class RobotFace


  # @param [Array] faces_angle_arry - A 2 dimensional array of face and angles. E.g [['NORTH', 90], ['SOUTH', 270]]
  def initialize(faces_angle_arry = all_faces)
    @face_angle_map = faces_angle_arry
  end


  # @param [Numeric] angle
  # @return [String] - Returns the name of the face given the angle
  def get_face(angle)
    face_angle_item =@face_angle_map.rassoc(angle)
    if (face_angle_item)
      return face_angle_item[0]
    end
    return nil
  end


  # @param [String] face_name
  # @return [Numeric] Returns the angle corresponding to the face.
  def get_angle(face_name)
    if !is_valid_face?(face_name)
      return nil
    end
    @face_angle_map.assoc(face_name)[1]
  end

  # @param [String] face_name
  # @return [bool]  Returns true of the face of the name is valid.
  def is_valid_face?(face_name)
    face_angle_item =@face_angle_map.assoc(face_name)
    face_angle_item != nil
  end


  # @param [String] face_name
  # @param [Numeric] angle_in_degrees
  # @return [Numeric] returns the new angle after adding the input angle to the angle corresponding to face name
  def add_angle(face_name, angle_in_degrees)
    normalised_angle = (angle_in_degrees % 360)
    if (normalised_angle < 0) then
      normalised_angle = 360 + normalised_angle
    end
    ((get_angle(face_name) + normalised_angle) % 360)
  end

  # @param [Numeric] angle_in_degrees
  # @param [Numeric] hyp_length length of the vector or hypotenuse
  # @return [Float] Returns the x coordinate for the length given angle
  def get_xcoord(angle_in_degrees, hyp_length=1)
    hyp_length * Math.cos(convert_radians(angle_in_degrees))
  end

  # @param [Numeric] angle_in_degrees
  # @param [Numeric] hyp_length length of the vector or hypotenuse
  # @return [Float] Returns the y coordinate for the length given angle
  def get_ycoord(angle_in_degrees, hyp_length=1)
    hyp_length * Math.sin(convert_radians(angle_in_degrees))
  end

  private

  def all_faces
    [['NORTH', 90], ['SOUTH', 270], ['EAST', 0], ['WEST', 180]]
  end

  def convert_radians(angle_in_degrees)
    angle_in_degrees * Math::PI / 180
  end

end