#####	Function: substrings

# Takes two arguments: an input string of words, and an array of 
# substrings as a dictionary
# Returns a hash with each substring (case insensitive) found in the 
# input string of words as an individual element key, with the count 
# of the occurences of the relevant substring as the value
# The String#downcase method converts all uppercase letters to 
# lowercase
# The String#gsub method matches and substitutes a character pattern;
# the pattern is usually a Regular Expression
# The Enumerator#each_with_object method iterates over the given 
# block for each element with the supplied object, and then returns
# the object 
# The 'Array#map method maps the input string to the dictionary  
# The output array of the nested 'each_with_object' and 'map' 
# iterations is chained to the final 'each_with_object" to build the
# output hash

def substrings strings, dictionary
  strings = strings.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ')
  
  strings.each_with_object([]) do |word, arr|
    dictionary.map { |sub| arr.push(sub) if word.include?(sub) }
  end
  .each_with_object(Hash.new(0)) { |match, count| count[match] += 1 }

end
