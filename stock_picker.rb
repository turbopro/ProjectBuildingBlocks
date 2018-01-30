#####	Function: stock_picker

# Takes one argument: an input array of stock prices as integers
# Returns an array with the indices of the input array related to
# the buy and sell prices that produce the maximum gain
# The 'Array#each_index' and 'Array#map.with_index' methods make  
# use of the input array's indices for the required arithmetic 
# The result of each calculation is collected in a temporary hash: 
#   - each key represents an array of the relevant indices
#   - each value represents the relevant result

def stock_picker stock_prices
  coll = Hash.new  
  stock_prices.each_index do |i|
    stock_prices.map.with_index(i) do |e, j|
      coll[[i, j]] = stock_prices[j] - stock_prices[i] if stock_prices[j] 
    end
  end

  coll = coll.key(coll.values.max)
  puts "Buy on day:\t#{coll[0]} \nSell on day:\t#{coll[1]}"
  puts "Profit ($):\t#{stock_prices[coll[1]] - stock_prices[coll[0]]}"
end

# use cases
# stock_picker([17,3,6,9,15,8,6,1,10])
# stock_picker([1, 2, 4, 2, 15, 18, 2, 9, 3])
# stock_picker([20, 2, 4, 2, 15, 18, 2, 9, 3])
# stock_picker([7, 2, 4, 2, 15, 18, 2, 9, 1])
# stock_picker([7, 2, 4, 2, 15, 18, 2, 9, 30])
# stock_picker(Array.new(100) { rand(1..50) })  

# Note: not efficient for arrays of more than 1000 elements
