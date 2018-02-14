#####	Function: bubble_sort

# Takes one argument: an input array of integers
# Returns the sorted array itself
# Based on the bubble sort algorithm discussed on the Wikipedia
# page here --> https://en.wikipedia.org/wiki/Bubble_sort
#
# Use the splat (*) operator to create an array from a range
# Use the begin / end until loop

def bubble_sort arr
  
  return "Error: #{__method__} requires an array of strings" unless arr.is_a? Array
  return arr if arr.length <= 1
  
  len = arr.length
  begin 
    swap_idx = 0
    [*1...len].each do |idx|
      if arr[idx-1] > arr[idx]
        arr[idx], arr[idx-1] = arr[idx-1], arr[idx]
        swap_idx = idx
      end
    end
    len = swap_idx
  end until len == 0  
  arr
end

bubble_sort(Array.new(10)    { rand(1..51)     })
bubble_sort(Array.new(10000) { rand(1..100000) }); nil


#####	Function: bubble_sort_by

# Takes one argument: an input array of strings to be sorted
# and expects a block
# The block takes two arguments, the two current array elements 
# being compared, and returns negative if the length of the left 
# element is smaller than the length of the right element, 0 if 
# the elements' lengths are equal, and positive if the length of
# the left element is greater
# Returns the sorted array itself
# Inform the user if no block is given, or block is nil or empty

def bubble_sort_by arr
  
  return "Error: #{__method__} requires a block" unless block_given?
  b = yield("a", "b") if block_given?
  return "Error: Block cannot be nil or empty" if b.nil? or b == "" 
  
  return "Error: #{__method__} requires an array of strings" unless arr.is_a? Array
  return arr if arr.length <= 1
  
  len = arr.length
  begin 
    swap_idx = 0
    [*1...len].each do |idx|
      if yield(arr[idx-1], arr[idx]) > 0
        arr[idx], arr[idx-1] = arr[idx-1], arr[idx]
        swap_idx = idx
      end
    end
    len = swap_idx
  end until len == 0
  arr  
end

bubble_sort_by(%W(hi hello hey)) { |left, right| left.length - right.length }
bubble_sort_by(["I"]) { |left, right| left.length - right.length }
bubble_sort_by([]) { |left, right| left.length - right.length }

bubble_sort_by([])
bubble_sort_by([]) {}
bubble_sort_by([]) { "" }
bubble_sort_by("one two") { |left, right| left.length - right.length }

# generate random strings
def rnd_str num, max_len
  num.times.each_with_object([]) do |e, a|
    a << (0..(rand(1..max_len))).map { (65 + rand(26)).chr }.join
  end
end

bubble_sort_by(rnd_str(3500, 20)) do |left, right|
  left.length - right.length
end; nil
