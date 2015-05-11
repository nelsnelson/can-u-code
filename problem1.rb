#! /usr/bin/env jruby

# Write three functions that compute the sum of the
# numbers in a given list using a for-loop, a while-loop,
# and recursion.

def for_loop_sum(list)
  sum = 0
  for element in list
    sum += element
  end
  sum
end

def while_loop_sum(list)
  sum = 0
  while (element = list.pop)
    sum += element
  end
  sum
end

def recursion_sum(list)
  return 0 if list.length == 0
  return list[0] if list.length == 1
  list[0] + recursion_sum(list[1..-1])
end

def main
  list = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
  result = for_loop_sum list.dup
  puts "Sum using for-loop: #{result}"
  result = while_loop_sum list.dup
  puts "Sum using while-loop: #{result}"
  result = recursion_sum list.dup
  puts "Sum using recursion: #{result}"
end

main if __FILE__ == $0
