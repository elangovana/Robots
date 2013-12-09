require 'minitest/autorun'

require_relative  '../../../ae/robots/library/core'

class RightCommandTest < MiniTest::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @robot = MiniTest::Mock.new
    @commandFactory = RightCommand.new(@robot)

  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  def test_create_command
   command = @commandFactory.parse_command('RIGHT')
   assert_instance_of(RightCommand, command)
  end

  def test_name
    assert_equal('RIGHT', @commandFactory.command_name)
  end

  def test_execute
    @robot.expect :right, nil
    command = @commandFactory.parse_command('RIGHT')
    command.execute
    @robot.verify
  end



end