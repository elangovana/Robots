require 'rubygems'
require 'bundler/setup'

require 'optparse'
require_relative '../../ae/robots/library/core'


options = {}

opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: init.rb file"

  opt.on("-h","--help","help") do
    puts opt_parser
  end
end

opt_parser.parse!

filename = ARGV[0]
if (filename==nil)
  puts opt_parser
  exit(1)
end

file = File.new(filename, "r")
command_factory = CommandFactoryCreator.new(Robot.new(5,5))

while (line = file.gets)
  command = command_factory.get_command_factory(line).parse_command(line)

  if (command)
    command.execute
  end
end
file.close
