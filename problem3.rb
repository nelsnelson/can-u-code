#! /usr/bin/env jruby

# Write a function that computes the list of the first 100 
# Fibonacci numbers. By definition, the first two numbers 
# in the Fibonacci sequence are 0 and 1, and each subsequent 
# number is the sum of the previous two. As an example, here 
# are the first 10 Fibonnaci numbers:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, and 34.

def fibonacci(n)
  case n
  when 0 then []
  when 1 then [ 0 ]
  when 2 then [ 0, 1 ]
  else
    numbers = fibonacci(n - 1)
    numbers.concat [ numbers[-2] + numbers[-1] ]
  end
end

def main
  if n = ARGV.shift
    numbers = fibonacci n.to_i
    puts numbers.join ', '
  end
end

main if __FILE__ == $0
