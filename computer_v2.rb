#!/usr/bin/env ruby
require 'pry'

Signal.trap('INT') do 
  puts ''
  puts 'Signal INT recieved, exiting'
  exit
end

memory = Hash.new
puts "Welcome to Computer_V2, a program written to perfrom scientific calculation methodologies on a command by command basis from user input."
puts "For a list of available commands, type 'help'"

loop do
  input = gets.chomp
  case input
  when 'help'
    puts "#{"'ls' or 'mem' or 'm'".ljust(30)} - will print out any variables or functions defined during the session and their current value."
    puts "#{"'exit'".ljust(30)} - will quit the program"
  when 'exit'
    exit
  when 'ls', 'mem', 'm' 
    memory.each {|symbol, content| puts "#{symbol} = #{content}"}
  when /^([.^\w]*) *= *([.^\w]*)$/
    if memory.has_key?($2)
      memory[$1] = memory[$2] 
    else
      memory[$1] = $2
    end
  else
    puts 'Error: Unrecognized Syntax'
  end
end