###		Function: caesar_cipher 
  
# Takes two arguments: an input string and a shift factor
# Returns the modified string; the input string is unchanged--read-only
# Uses the 'String#tr' method
# The 'String#tr' method will do a straighforward wrap for integer and
# alpha characters

def caesar_cipher(clear_text, shift_factor)
  ciphered = clear_text.dup
  shift_factor.times { ciphered.tr!('0-9a-zA-Z','1-90b-zbB-ZA') }
  ciphered
end
