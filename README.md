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

   each key represents an array of the relevant indices  
   each value represents the relevant result
- [Array#each_index documentation](https://ruby-doc.org/core-2.4.0/Array.html#method-i-each_index "Ruby Doc Page")
- [Array#map.with_index documentation](https://ruby-doc.org/core-2.4.0/Array.html#method-i-map "Ruby Doc Page")

----

### Project 3 -- Substrings
Substrings - Ruby Programming, ODIN Project

#### Function: [substrings](https://github.com/turbopro/ProjectBuildingBlocks/blob/master/substrings.rb "substrings.rb file") 

- Takes two arguments: an input string of words, and an array of substrings as a dictionary
- Returns a hash with each substring (case insensitive) found in the input string of words as an individual element key, with the count of the occurences of the relevant substring as the value
- The String#downcase method converts all uppercase letters to lowercase
- The String#gsub method matches and substitutes a character pattern; the pattern is usually a Regular Expression
- The Enumerator#each_with_object method iterates over the given block for each element with the supplied object, and then returns the object 
- The 'Array#map method maps the input string to the dictionary  
- The output array of the nested 'each_with_object' and 'map' iterations is chained to the final 'each_with_object" to build the output hash

- [String#downcase documentation](https://ruby-doc.org/core-2.4.0/String.html#method-i-downcase "Ruby Doc Page")
- [String#gsub documentation](https://ruby-doc.org/core-2.4.0/String.html#method-i-gsub "Ruby Doc Page")
- [Enumerator#each_with_object documentation](https://ruby-doc.org/core-2.4.0/Enumerator.html#method-i-each_with_object "Ruby Doc Page")
- [Array#map documentation](https://ruby-doc.org/core-2.4.0/Array.html#method-i-map "Ruby Doc Page")

----

## PROJECT: ADVANCED BUILDING BLOCKS

### Project 1 -- Bubble Sort
Bubble Sort - Ruby Programming, ODIN Project

#### Function: [bubble_sort](https://github.com/turbopro/ProjectBuildingBlocks/blob/master/bubble_sort.rb "bubble_sort.rb file") 

- Takes one argument: an input array of integers
- Returns the sorted array itself
- Uses the splat (*) operator to create an array from a range
- Uses the begin / end until loop
- Based on the [Wikipedia Bubble Sort](https://en.wikipedia.org/wiki/Bubble_sort "Bubble Sort")


#### Function: [bubble_sort_by](https://github.com/turbopro/ProjectBuildingBlocks/blob/master/bubble_sort.rb "bubble_sort.rb file") 

- Takes one argument: an input array of strings to be sorted and expects a block
- The block takes two arguments, the two current array elements being compared, and returns negative if the length of the left element is smaller than the length of the right element, 0 if the elements' lengths are equal, and positive if the length of the left element is greater
- Returns the sorted array itself
- Inform the user if no block is given, or block is nil or empty

----

### Project 2 -- Enumerable Methods
Enumerable Methods - Ruby Programming, ODIN Project

#### Module: [enumerable_my_methods](https://github.com/turbopro/ProjectBuildingBlocks/blob/master/enumerable_my_methods.rb "enumerable_my_methods.rb file") 

- Build my version of several Enumerable methods

----
