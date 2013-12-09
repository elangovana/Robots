require 'minitest/autorun'

require_relative  '../../../ae/robots/library/core'

class MoveCommandTest < MiniTest::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @robot = MiniTest::Mock.new
    @commandFactory = MoveCommand.new(@robot)

  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  def test_create_command
   command = @commandFactory.parse_command('MOVE')
   assert_instance_of(MoveCommand, command)
  end

  def test_name
    assert_equal('MOVE', @commandFactory.command_name)
  end

  def test_execute
    @robot.expect :move, nil
    command = @commandFactory.parse_command('MOVE')
    command.execute
    @robot.verify
  end



end