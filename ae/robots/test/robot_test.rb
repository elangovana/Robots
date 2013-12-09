require 'minitest/autorun'

require_relative  '../../../ae/robots/library/core'

class RobotTest < MiniTest::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @robot_face = RobotFace.new
    @robot = Robot.new(5,5,0,0,@robot_face )

  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_place_face
    @robot.place(3,4,'NORTH')
    assert_equal('NORTH', @robot.get_face_name)
  end

  def test_place_x
    @robot.place(3,4,'NORTH')
    assert_equal(3, @robot.get_x)
  end

  def test_place_y
    @robot.place(3,4,'NORTH')
    assert_equal(4, @robot.get_y)
  end


  def test_left_face
    @robot.place(3,4,'NORTH')
    @robot.left
    assert_equal('WEST', @robot.get_face_name)
  end

  def test_left_x
    @robot.place(3,4,'NORTH')
    @robot.left
    assert_equal(3, @robot.get_x)
  end

  def test_left_y
    @robot.place(3,4,'NORTH')
    @robot.left
    assert_equal(4, @robot.get_y)
  end

  def test_right_face
    @robot.place(3,4,'NORTH')
    @robot.right
    assert_equal('EAST', @robot.get_face_name)
  end

  def test_right_x
    @robot.place(3,4,'NORTH')
    @robot.right
    assert_equal(3, @robot.get_x)
  end

  def test_right_y
    @robot.place(3,4,'NORTH')
    @robot.right
    assert_equal(4, @robot.get_y)
  end

  def test_left_start
    @robot.left
    assert_equal(nil, @robot.get_face_name)
  end

  def test_right_start
    @robot.right
    assert_equal(nil, @robot.get_face_name)
  end

  def test_move_face
    @robot.place(1,2,'NORTH')
    @robot.move
    assert_equal('NORTH', @robot.get_face_name)
  end

  def test_move_north_x
    @robot.place(1,2,'NORTH')
    @robot.move
    assert_equal(3, @robot.get_y)
  end

  def test_move_north_y
    @robot.place(1,2,'NORTH')
    @robot.move
    assert_equal(1, @robot.get_x)
  end

  def test_move_south_y
    @robot.place(1,2,'SOUTH')
    @robot.move
    assert_equal(1, @robot.get_y)
  end

  def test_move_south_x
    @robot.place(1,2,'NORTH')
    @robot.move
    assert_equal(1, @robot.get_x)
  end

  def test_move_east_y
    @robot.place(1,2,'EAST')
    @robot.move
    assert_equal(2, @robot.get_y)
  end

  def test_move_east_x
    @robot.place(1,2,'EAST')
    @robot.move
    assert_equal(2, @robot.get_x)
  end

  def test_move_boundary_x
    @robot.place(5,5,'EAST')
    @robot.move
    assert_equal(5, @robot.get_x)
  end

  def test_move_boundary_y
    @robot.place(5,5,'NORTH')
    @robot.move
    assert_equal(5, @robot.get_x)
  end

  def test_place_boundary_x
    @robot.place(5,5,'NORTH')
    @robot.place(10,5,'NORTH')
    assert_equal(5, @robot.get_x)
  end

  def test_place_boundary_y
    @robot.place(5,5,'NORTH')
    @robot.place(5,10,'NORTH')
    assert_equal(5, @robot.get_y)
  end
  def test_moves_case1
    @robot.place(1,2,'EAST')
    @robot.move
    @robot.move
    @robot.left
    @robot.move
    assert_equal(3, @robot.get_x)
    assert_equal(3, @robot.get_y)
    assert_equal('NORTH', @robot.get_face_name)
  end
end