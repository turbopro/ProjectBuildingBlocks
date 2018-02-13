#####	Function: bubble_sort

# Takes one argument: an input array of integers
# Returns the sorted array itself
# Based on the bubble sort algorithm discussed on the Wikipedia
# page here --> https://en.wikipedia.org/wiki/Bubble_sort
#
# Use the splat (*) operator to create an array from a range
# Use the begin / end until loop

def bubble_sort arr
  
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

# bubble_sort(Array.new(10)    { rand(1..51)     })
# bubble_sort(Array.new(10000) { rand(1..100000) })

