require 'minitest/autorun'

require_relative  '../../../ae/robots/library/core'

class RobotFaceTest < MiniTest::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @robot_face = RobotFace.new


  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_x_coord
   assert_equal(0, @robot_face.get_xcoord(90).to_i)
  end

  def test_y_coord
    assert_equal(1, @robot_face.get_ycoord(90).to_i)
  end





end