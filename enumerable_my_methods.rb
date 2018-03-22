#####	Module: enumerable_my_methods

# Since Ruby has several collection classes, such as:
# Array, Hash, Set, Rinda, Struct, OpenStruct, etc., we will
# limit our my_* methods to the Array, Hash, and Range classes
# only
# There are two 'helper methods': check_arguments and arith_op 
# 
# The file 'enumerable_my_methods_test.rb' provides a list of tests
#
# Note: The "my_inject" method, which simulates the core 
# "inject" method, has to take into account the two optional 
# arguments, and the optional block.  This tends to leave the
# method definition somewhat lengthy and intricate, and thus 
# it hardly follows Ruby's best practices
#
# Suggested reading for this project: the RubyDoc APIs
# Module Enumerable - https://ruby-doc.org/core-2.4.1/Enumerable.html#method-i-all-3F
# Class Array - https://ruby-doc.org/core-2.4.1/Array.html#method-i-any-3F
# Class Hash - https://ruby-doc.org/core-2.4.1/Hash.html
# Class Range - https://ruby-doc.org/core-2.4.1/Range.html
# Class Enumerator - https://ruby-doc.org/core-2.4.1/Enumerator.html#method-c-new
# Class Proc - https://ruby-doc.org/core-2.4.1/Proc.html

module Enumerable
  def my_each
    return enum_for(__method__) { size } unless block_given?
    to_a.length.times { |e| yield(to_a[e]) }
    self
  end

  def my_each_with_index
    return enum_for(__method__) { size } unless block_given?
    to_a.length.times { |e| yield(to_a[e], e) }
    self
  end

  def my_select
    return enum_for(__method__) { size } unless block_given?
    case self.class.to_s
    when 'Array', 'Range', 'Enumerator'
      arr = []
      my_each { |e| arr << e if yield(e) }
      arr
    when 'Hash'
      hash = Hash.new(0)
      my_each { |k, v| hash[k] = v if yield(k, v) }
      hash
    else raise NoMethodError.new("No method for coll - If supported, try coll.to_a.#{__method__}")
    end
  end

  def my_all?
    unless block_given?
      my_each { |e| return false if e == false || e.nil? }
      return true
    end
    my_each { |e| return false unless yield(e) }
    true
  end

  def my_any?
    unless block_given?
      my_each { |e| return true unless e == false || e.nil? }
      return false
    end
    my_each { |e| return true if yield(e) }
    false
  end

  def my_none?
    unless block_given?
      my_each { |e| return false unless e == false || e.nil? }
      return true
    end
    my_each { |e| return false if yield(e) }
    true
  end

  def my_count(ele = nil)
    unless block_given?
      return my_select { |e| e == ele }.length if ele
      return size
    end
    arr = []
    my_each { |e| arr << e if yield(e) }
    arr.length
  end

  def my_map
    return enum_for(__method__) { size } unless block_given?
    arr = []
    my_each { |e| arr << yield(e) }
    arr
  end

  def my_inject(*args)
    case Enumerable.check_arguments(__method__.to_s, args, max_args=2)
    when 'initial and sym'
      arr = [args[0]]
      my_each_with_index { |e, i| arr << arith_op(arr[i], e, args[1]) }
      arr.last
    when 'initial'
      unless block_given?
        raise LocalJumpError.new("Block missing - Block required for arg: 'initial'")
      end
      memo = args[0]
      my_map { |e| memo = yield(memo, e) }.last
    when 'sym'
      unless block_given?
        arr = [first]
        my_each_with_index do |_, i|
          arr << arith_op(arr[i], to_a[i+1], args[0]) if to_a[i+1]	## self.to_a for Range class
        end
        return arr.last
      end
      raise ArgumentError.new("Block given - No block required for arg: 'sym'")
    when 'zero args'
      unless block_given?
        raise LocalJumpError.new('Block missing - Block required for zero-arg method call')
      end
      if my_all? { |e| e.is_a? Integer }
        memo = [first]
        my_each_with_index do |_, i|
          memo << yield(memo[i], to_a[i+1]) if to_a[i+1]		## self.to_a for Range class
        end
        memo.last
      elsif my_all? { |e| e.is_a? String }
        memo = [first]
        my_map { |e| memo = yield(memo, e) }.last
      else
        raise TypeError.new('Collection must include all strings or all integers')
      end
    else
      0
    end
  end

  ### HELPER METHODS:
  
  ## Check Arguments
  def self.check_arguments(method, arg, max_args)
    case method
    when 'my_inject'
      case arg.length
      when 0 then 'zero args'
      when 1
        return 'initial' if arg[0].is_a? Integer
        return 'sym' if Enumerable::INJECT_OPERATORS.include? arg[0]
        raise ArgumentError.new('Argument must be an integer or operator symbol/string')
      when 2
        return 'initial and sym' if arg[0].is_a?(Integer) && 
          Enumerable::INJECT_OPERATORS.include?(arg[1])
        raise ArgumentError.new('1st arg must be an integer; 2nd arg must be an operator symbol/string')
      else
        raise ArgumentError.new("Wrong number of arguments: given #{arg.size}, expected 0..#{max_args}")
      end
    end
    # when my_...
    # ...
  end

  ## Arithmetic Operators
  def arith_op(operand0, operand1, operator)
    operand0.send(operator, operand1)
  end

  ## CONSTANTS
  INJECT_OPERATORS = %i{ + - * / % ** & | ^ << >> == === != =~ !~ <=> } + 
                     %w{ + - * / % ** & | ^ << >> == === != =~ !~ <=> }
end
