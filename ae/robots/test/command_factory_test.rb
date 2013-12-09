require 'minitest/autorun'

require_relative  '../../../ae/robots/library/core'

class CommandFactoryTest < MiniTest::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @robot = MiniTest::Mock.new
    @command_factory = CommandFactoryCreator.new(@robot)

  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  def test_create_move_command_factory

    command = @command_factory.get_command_factory('MOVE')
    assert_instance_of(MoveCommand, command)

  end

  def test_create_default_command_factory

    command = @command_factory.get_command_factory('blah')
    assert_instance_of(InvalidCommand, command)
  end


  def test_create_place_command_factory
    command = @command_factory.get_command_factory('PLACE 1 2 NORTH')
    assert_instance_of(PlaceCommand, command)
  end

  def test_create_place_with_param_command_factory
    command = @command_factory.get_command_factory('PLACE')
    assert_instance_of(PlaceCommand, command)
  end

end