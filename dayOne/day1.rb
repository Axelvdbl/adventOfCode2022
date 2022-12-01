#!/usr/bin/env ruby

input = File.read(ARGV[0])

def max_calories(input)
  input.split("\n\n").map { |calorie| calorie.split("\n").map(&:to_i).sum }
end

puts "Part One : #{max_calories(input).max}"
puts "Part Two : #{max_calories(input).max(3).sum}"