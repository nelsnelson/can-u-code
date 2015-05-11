#! /usr/bin/env jruby

# Write a function that combines two lists by alternatingly 
# taking elements. For example: given the two lists [a, b, c] 
# and [1, 2, 3], the function should return [a, 1, b, 2, c, 3].

def combine(list1, list2)
  combined = []
  list1_length = list1.length
  list2_length = list2.length
  until list1.empty? and list2.empty?
    list1_element = list1.shift
    combined << list1_element if list1_element
    list2_element = list2.shift
    combined << list2_element if list2_element
  end
  combined
end

def main
  list1 = [ :a, :b, :c ]
  list2 = [ 1, 2, 3 ]
  result = combine list1, list2
  puts result.inspect
end

main if __FILE__ == $0
