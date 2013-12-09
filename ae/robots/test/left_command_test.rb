require 'minitest/autorun'

require_relative  '../../../ae/robots/library/core'

class LeftCommandTest < MiniTest::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @robot = MiniTest::Mock.new
    @commandFactory = LeftCommand.new(@robot)

  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  def test_create_command
   command = @commandFactory.parse_command('LEFT')
   assert_instance_of(LeftCommand, command)
  end

  def test_name
    assert_equal('LEFT', @commandFactory.command_name)
  end

  def test_execute
    @robot.expect :left,nil
    command = @commandFactory.parse_command('LEFT')
    command.execute
    @robot.verify
  end



end