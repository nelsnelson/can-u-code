#! /usr/bin/env jruby

# Write a function that given a list of non negative integers,
# arranges them such that they form the largest possible number.
# For example, given [50, 2, 1, 9], the largest formed number is
# 95021.

def embiggen(*numbers)
  numbers.map! &:to_i
  embiggened = ''
  largest = Hash.new
  for n in numbers
    numbers = [ n ]
    denomination = n
    while denomination > 10
      denomination = denomination / 10
    end
    numbers.concat largest[denomination] if largest.include? denomination
    largest[denomination] = numbers.sort.reverse
  end
  for denomination in largest.keys.sort.reverse
    for n in largest[denomination]
      embiggened += n.to_s
    end
  end
  embiggened
end

def main
  puts embiggen *ARGV
end

main if __FILE__ == $0
