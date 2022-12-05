#!/usr/bin/env ruby

input = File.read(ARGV[0])

ITEMS = ("a".."z").to_a + ("A".."Z").to_a

def find_common_item(input)
  input.split("\n").map { 
    |item| (
      item.chars.each_slice(item.length / 2).map(&:join)[0].split("") & 
      item.chars.each_slice(item.length / 2).map(&:join)[1].split("")
    ).first
  }.map { |item |ITEMS.index(item) + 1 }.sum
end

def find_common_item_part2(input)
  input.split("\n").each_slice(3).map { 
    |item| (
      item[0].split("") & 
      item[1].split("") &
      item[2].split("")
    ).first
  }.map { |item |ITEMS.index(item) + 1 }.sum
end

puts "Part One : #{find_common_item(input)}"
puts "Part Two : #{find_common_item_part2(input)}"