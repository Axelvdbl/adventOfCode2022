#!/usr/bin/env ruby

input = File.read(ARGV[0])

def set_range(pair)
  Array(pair.split("-")[0].to_i..pair.split("-")[1].to_i)
end

def fully_contained_range(input)
  input.split("\n").map { |pair| 
    first_range = set_range(pair.split(",")[0])
    second_range = set_range(pair.split(",")[1])
    [].concat(first_range, second_range).uniq.size == second_range.size || [].concat(first_range, second_range).uniq.size == first_range.size
  }.count(true)
end

def partial_contained_range(input)
  input.split("\n").map { |pair| 
    first_range = set_range(pair.split(",")[0])
    second_range = set_range(pair.split(",")[1])
    [].concat(first_range, second_range).uniq.size != first_range.size + second_range.size
  }.count(true)
end

puts "Part One : #{fully_contained_range(input)}"
puts "Part Two : #{partial_contained_range(input)}"