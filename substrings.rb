#####	Function: substrings

# Takes two arguments: an input string of words, and an array of 
# substrings as a dictionary
# Returns a hash, where each substring (case insensitive) found in 
# the input string of words serves as an individual element key, with 
# the count of the occurences of the relevant substring serving as 
# the associated value
# The String#downcase method converts all uppercase letters to 
# lowercase
# The String#gsub method matches and substitutes a character pattern;
# the pattern is usually a Regular Expression
# The Enumerator#each_with_object method iterates over the given 
# block for each element with the supplied object, and returns the
# object at the end of the iteration 
# The 'Array#map method executes the given block once for each element
# of the array, and creates a new array of the values returned by the
# block
#
# 1. Convert the input 'strings', a String, to an Array of all lower
#    case words
# 2. Iterate over the words in 'strings', along with an initially 
#    empty Array Object
# 3. Iterate over the input dictionary to match each word, and save
#    the matched word(s) to the Array Object
# 4. This Array Object with the matched words is chained to the final
#    'each_with_object" to build the output Hash

def substrings strings, dictionary
  strings = strings.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ')
  
  strings.each_with_object([]) do |word, arr_obj|
    dictionary.map { |substr| arr_obj.push(sub) if word.include?(substr) }
  end
  .each_with_object(Hash.new(0)) { |match, count| count[match] += 1 }

end
