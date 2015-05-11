#! /usr/bin/env jruby

# Write a function that given a list of non negative integers,
# arranges them such that they form the largest possible number.
# For example, given [50, 2, 1, 9], the largest formed number is
# 95021.  And given [420, 42, 423], the largest formed number is
# 42423420.

def embiggen(*numbers)
  numbers.map! &:to_i
  embiggened = ''
  largest = Hash.new
  for n in numbers
    denominated_numbers = [ n ]
    denomination = n
    magnitude = denomination.to_s.length
    while denomination > 10
      denomination = denomination / 10
    end
    largest[denomination] ||= Hash.new
    denominated_numbers.concat largest[denomination][magnitude] if largest[denomination].include? magnitude
    largest[denomination][magnitude] = denominated_numbers.sort.reverse
  end
  for denomination in largest.keys.sort.reverse
    for magnitude in largest[denomination].keys.sort
      for n in largest[denomination][magnitude]
        embiggened += n.to_s
      end
    end
  end
  embiggened
end

def main
  puts embiggen *ARGV
end

main if __FILE__ == $0
