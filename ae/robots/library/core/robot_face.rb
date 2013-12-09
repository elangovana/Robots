class RobotFace

  def initialize(faces_angle_arry = all_faces)
    @face_angle_map = faces_angle_arry
  end


  def get_face(angle)
    face_angle_item =@face_angle_map.rassoc(angle)
    if (face_angle_item)
      return face_angle_item[0]
    end
    return nil
  end

  def get_angle(face_name)
    if !is_valid_face?(face_name)
      return nil
    end
    @face_angle_map.assoc(face_name)[1]
  end

  def is_valid_face?(face_name)
    face_angle_item =@face_angle_map.assoc(face_name)
    face_angle_item != nil
  end

  def add_angle(face_name, angle_in_degrees)
    normalised_angle = (angle_in_degrees % 360)
    if (normalised_angle < 0) then
      normalised_angle = 360 + normalised_angle
    end
    ((get_angle(face_name) + normalised_angle) % 360)
  end

  def get_xcoord(angle_in_degrees, hyp_length=1)
    hyp_length * Math.cos(convert_radians(angle_in_degrees))
  end

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