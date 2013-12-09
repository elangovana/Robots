require 'minitest/autorun'

require_relative  '../../../ae/robots/library/core'

class PlaceCommandTest < MiniTest::Unit::TestCase



  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @robot = MiniTest::Mock.new
    @commandFactory = PlaceCommand.new(@robot)
    @command_name = 'PLACE'
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  def test_create_command
   command = @commandFactory.parse_command('PLACE 1,2,NORTH')
   assert_instance_of(PlaceCommand, command)
  end

  def test_create_invalid_command
    command = @commandFactory.parse_command('PLACE 1,ABC,NORTH')
    assert_equal(nil, command)
  end

  def test_name
    assert_equal(@command_name, @commandFactory.command_name)
  end

  def test_execute
    @robot.expect :place, nil, [1,2, 'NORTH']
    command = @commandFactory.parse_command('PLACE 1,2,NORTH')
    command.execute
    @robot.verify
  end



end