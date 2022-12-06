#!/usr/bin/env ruby

input = File.read(ARGV[0])

def index_of_code(input, length)
  input.chars.map.with_index { |code, index| input[index..index + length - 1].chars.uniq.length == length }
end

puts "Part One : #{index_of_code(input, 4).find_index(true) + 4}"
puts "Part Two : #{index_of_code(input, 14).find_index(true) + 14}"