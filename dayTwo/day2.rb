#!/usr/bin/env ruby

input = File.read(ARGV[0])

def get_hand_shape_score(hand_shape)
  hand_shape.codepoints[0].to_i - "W".codepoints[0].to_i
end

def get_first_party_round_score(round)
  round_result = round.split(" ")[1].codepoints[0].to_i - round.split(" ")[0].codepoints[0].to_i
  return 3 if round_result == 23
  return 6 if round_result == 21 || round_result == 24
  return 0
end

def get_first_party_result(input)
  score = 0
  input.split("\n").each do |round|
    score += get_hand_shape_score(round.split(" ")[1])
    score += get_first_party_round_score(round)
  end
  score
end

def get_choose_hand_shape_score(round)
  "XYZ".split("").each do |hand_shape|
    score = get_first_party_round_score(round.split(" ")[0] + " " + hand_shape)
    return get_hand_shape_score(hand_shape) if score == get_second_party_round_score(round)
  end
  round.split(" ")[0].codepoints[0].to_i
end

def get_second_party_round_score(round)
  (get_hand_shape_score(round.split(" ")[1]) - 1) * 3
end

def get_second_party_result(input)
  score = 0
  input.split("\n").each do |round|
    score += get_choose_hand_shape_score(round)
    score += get_second_party_round_score(round)
  end
  score
end

puts "Part One : #{get_first_party_result(input)}"
puts "Part Two : #{get_second_party_result(input)}"