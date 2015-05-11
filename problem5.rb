#! /usr/bin/env jruby

# Write a program that outputs all possibilities to 
# put + or - or nothing between the numbers 1, 2, ..., 9 
# (in this order) such that the result is always 100. 
# For example: 1 + 2 + 34 – 5 + 67 – 8 + 9 = 100.

def find_sums_to_a_hundred(*numbers)
  sums = []
  iterations = 3 ** (numbers.length-1)
  for i in (0..iterations)
    possibility = "%05d" % (i.to_s 3)
    possibility = possibility.split ''
    expression = ''
    numbers[0..-2].each_with_index do |number, j|
      expression += number.to_s
      case possibility[j].to_i
      when 0 then expression += '+'
      when 1 then expression += '-'
      end
    end
    expression += numbers.last.to_s
    sum = eval expression
    sums << "#{expression} == #{sum}" if sum == 100
  end
  sums
end

def main
  numbers = (1..9).to_a
  results = find_sums_to_a_hundred *numbers
  results.each { |s| puts s }
end

main if __FILE__ == $0
