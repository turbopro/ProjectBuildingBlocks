## PROJECT BUILDING BLOCKS

### Project 1 -- Caesar Cipher
Caesar Cipher Repo - Ruby Programming, ODIN Project

#### Function: [caesar_cipher](https://github.com/turbopro/CaesarCipher/blob/master/caesar_cipher.rb "caesar_cipher.rb file") 

- Takes two arguments: an input string and a shift factor integer
- Returns the modified string; the input string is unchanged--read-only
- Uses the 'String#tr' method
- The 'String#tr' method will do a straighforward wrap for integer and alpha characters
- [String#tr documentation](https://ruby-doc.org/core-2.4.0/String.html#method-i-tr "Ruby Doc Page")

----

### Project 2 -- Stock Picker
Stock Picker - Ruby Programming, ODIN Project

#### Function: [stock_picker](https://github.com/turbopro/ProjectBuildingBlocks/blob/master/stock_picker.rb "stock_picker.rb file") 

- Takes one argument: an input array of stock prices as integers
- Returns an array with the indices of the input array related to the buy and sell prices that produce the maximum gain
- The 'Array#each_index' and 'Array#map.with_index' methods make use of the input array's indices for the required arithmetic
- The result of each calculation is collected in a temporary hash:

...each key represents an array of the relevant indices  
...each value represents the relevant result
- [Array#each_index documentation](https://ruby-doc.org/core-2.4.0/Array.html#method-i-each_index "Ruby Doc Page")
- [Array#map.with_index documentation](https://ruby-doc.org/core-2.4.0/Array.html#method-i-map "Ruby Doc Page")


