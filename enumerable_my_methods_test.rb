# File: enumerable_my_methods_test.rb

require_relative './enumerable_my_methods'
require 'test/unit'
require 'set'

class TestEnumerable < Test::Unit::TestCase

  def setup
    @a0 = %W(one two three four);			@a1 = [1, 2, 3, 4]
    @a10 = ["a", 1, :one, true, false];		@a11 = ["a", 1, :one, true, nil]
    @a12 = [false, nil, false];				@a13 = [nil, false, false]
    @a14 = [false];							@a15 = [nil]
    @h0 = { one: 1, two: 2, three: 3 };		@h1 = Hash.new(0)
    @h2 = { one: 10, two: 10, three: 10 };	@h3 = {one: "one", two: "two", three: "three" }
    @r0 = (1..5); 							@r1 = (15..50)
    @s0 = Set.new [1, 2, 3, 4];				@s1 = Set.new ["one", "two", "three", "four"]
    @my_a, @a = [], []
  end

  def teardown
    @my_a, @a = [], []
  end
  
  # :1:		ARRAY BASIC
  def test_array_basic
    assert_equal( @a1, @a1.my_each { |e| e * 2},
      'arr.my_each { ... } does not return self' )
    assert_instance_of( Enumerator, @a1.my_each,
      'arr.each does not return enum with no block given' )
    assert_instance_of( Enumerator, @a1.my_each_with_index,
      'arr.each_with_index does not return enum with no block given' )
    assert_instance_of( Enumerator, @a1.my_select, 
      'arr.select does not return enum with no block given' )
    assert_instance_of( Enumerator, @a1.my_map, 
      'arr.map does not return enum with no block given' )
  end
  
  # :2:		HASH BASIC
  def test_hash_basic
    assert_equal( @h0, @h0.my_each { |_, v| v * 2},
      'hash.my_each { ... } does not return self' )
    assert_instance_of( Enumerator, @h0.my_each, 
      'hash.each does not return enum with no block given' )
    assert_instance_of( Enumerator, @h0.my_each_with_index, 
      'hash.each_with_index does not return enum with no block given' )
    assert_instance_of( Enumerator, @h0.my_select, 
      'hash.select does not return enum with no block given' )
    assert_instance_of( Enumerator, @h0.my_map, 
      'hash.map does not return enum with no block given' )
  end
  
  # :3:		RANGE BASIC
  def test_range_basic
    assert_equal( @r0, @r0.my_each { |e| e * 2},
      'range.my_each { ... } does not return self' )
    assert_instance_of( Enumerator, @r0.my_each,
      'arr.each does not return enum with no block given' )
    assert_instance_of( Enumerator, @r0.my_each_with_index,
      'arr.each_with_index does not return enum with no block given' )
    assert_instance_of( Enumerator, @r0.my_select, 
      'arr.select does not return enum with no block given' )
    assert_instance_of( Enumerator, @r0.my_map, 
      'arr.map does not return enum with no block given' )
  end
  
  # :4:a	ARRAY PREDICATES
  def test_array_predicate_all
    assert_equal( @a0.all? { |e| e.length == 3 }, @a0.my_all? { |e| e.length == 3 },
      'arr.my_all? { ... } and arr.all? { ... } outputs are not equal' )
    assert_equal( @a0.all? { |e| e.is_a? String }, @a0.my_all? { |e| e.is_a? String },
      'arr.my_all? { ... } and arr.all? { ... } outputs are not equal' )
    assert_equal( @a1.all? { |e| e.even? }, @a1.my_all? { |e| e.even? },
      'arr.my_all? { ... } and arr.all? { ... } outputs are not equal' )
    assert_equal( @a1.all? { |e| e.integer? }, @a1.my_all? { |e| e.integer? },
      'arr.my_all? { ... } and arr.all? { ... } outputs are not equal' )
    assert_equal( @a1.all? , @a1.my_all? ,
      'arr.my_all? and arr.all? outputs are not equal' )
    assert_equal( @a10.all? , @a10.my_all? ,
      'arr.my_all? and arr.all? outputs are not equal' )
    assert_equal( @a11.all? , @a11.my_all? ,
      'arr.my_all? and arr.all? outputs are not equal' )
    assert_equal( @a12.all? , @a12.my_all? ,
      'arr.my_all? and arr.all? outputs are not equal' )
    assert_equal( @a13.all? , @a13.my_all? ,
      'arr.my_all? and arr.all? outputs are not equal' )
  end
  # :4:b
  def test_array_predicate_any
    assert_equal( @a0.any? { |e| e.length == 10 }, @a0.my_any? { |e| e.length == 10 },
      'arr.my_any? { ... } and arr.any? { ... } outputs are not equal' )
    assert_equal( @a0.any? { |e| e.length == 5  }, @a0.my_any? { |e| e.length == 5  },
      'arr.my_any? { ... } and arr.any? { ... } outputs are not equal' )
    assert_equal( @a1.any? { |e| e.even? }, @a1.my_any? { |e| e.even? },
      'arr.my_any? { ... } and arr.any? { ... } outputs are not equal' )
    assert_equal( @a1.any? { |e| e.is_a? String }, @a1.my_any? { |e| e.is_a? String },
      'arr.my_any? { ... } and arr.any? { ... } outputs are not equal' )
    assert_equal( @a0.any? , @a0.my_any? ,
      'arr.my_any? and arr.any? outputs are not equal' )
    assert_equal( @a10.any? , @a10.my_any? ,
      'arr.my_any? and arr.any? outputs are not equal' )
    assert_equal( @a11.any? , @a11.my_any? ,
      'arr.my_any? and arr.any? outputs are not equal' )
    assert_equal( @a12.any? , @a12.my_any? ,
      'arr.my_any? and arr.any? outputs are not equal' )
    assert_equal( @a13.any? , @a13.my_any? ,
      'arr.my_any? and arr.any? outputs are not equal' )
  end
  # :4:c
  def test_array_predicate_none
    assert_equal( @a0.none? { |e| e.length == 10 }, @a0.my_none? { |e| e.length == 10 },
      'arr.my_none? { ... } and arr.none? { ... } outputs are not equal' )
    assert_equal( @a0.none? { |e| e.length == 5  }, @a0.my_none? { |e| e.length == 5  },
      'arr.my_none? { ... } and arr.none? { ... } outputs are not equal' )
    assert_equal( @a1.none? { |e| e.even? }, @a1.my_none? { |e| e.even? },
      'arr.my_none? { ... } and arr.none? { ... } outputs are not equal' )
    assert_equal( @a1.none? { |e| e.is_a? String }, @a1.my_none? { |e| e.is_a? String },
      'arr.my_none? { ... } and arr.none? { ... } outputs are not equal' )
    assert_equal( @a0.none? , @a0.my_none? ,
      'arr.my_none? and arr.none? outputs are not equal' )
    assert_equal( @a10.none? , @a10.my_none? ,
      'arr.my_none? and arr.none? outputs are not equal' )
    assert_equal( @a11.none? , @a11.my_none? ,
      'arr.my_none? and arr.none? outputs are not equal' )
    assert_equal( @a12.none? , @a12.my_none? ,
      'arr.my_none? and arr.none? outputs are not equal' )
    assert_equal( @a13.none? , @a13.my_none? ,
      'arr.my_none? and arr.none? outputs are not equal' )
  end
  
  # :5:a	HASH PREDICATES
  def test_hash_predicate_all
    assert_equal( @h2.all? { |_, v| v == 2 }, @h2.my_all? { |_, v| v == 2},
      'hash.my_all? { ... } and hash.all? { ... } outputs are not equal' )
    assert_equal( @h2.all? { |_, v| v == 10 }, @h2.my_all? { |_, v| v == 10}, 
      'hash.my_all? { ... } and hash.all? { ... } outputs are not equal' )
    assert_equal( @h2.all? { |e| e. is_a? Array }, @h2.my_all? { |e| e.is_a? Array }, 
      'hash.my_all? { ... } and hash.all? { ... } outputs are not equal' )
    assert_equal( @h0.all? , @h0.my_all? , 
      'hash.my_all? and hash.all? outputs are not equal' )
  end
  
  # :5:b
  def test_hash_predicate_any
    assert_equal( @h2.any? { |_, v| v == 2 }, @h2.my_any? { |_, v| v == 2},
      'hash.my_any? { ... } and hash.any? { ... } outputs are not equal' )
    assert_equal( @h2.any? { |_, v| v == 10 }, @h2.my_any? { |_, v| v == 10}, 
      'hash.my_any? { ... } and hash.any? { ... } outputs are not equal' )
    assert_equal( @h2.any? { |e| e. is_a? Array }, @h2.my_any? { |e| e.is_a? Array }, 
      'hash.my_any? { ... } and hash.any? { ... } outputs are not equal' )
    assert_equal( @h0.any? , @h0.my_any? , 
      'hash.my_any? and hash.any? outputs are not equal' )
  end
  
  # :5:c
  def test_hash_predicate_none
    assert_equal( @h2.none? { |_, v| v == 2 }, @h2.my_none? { |_, v| v == 2},
      'hash.my_none? { ... } and hash.none? { ... } outputs are not equal' )
    assert_equal( @h2.none? { |_, v| v == 10 }, @h2.my_none? { |_, v| v == 10}, 
      'hash.my_none? { ... } and hash.none? { ... } outputs are not equal' )
    assert_equal( @h2.none? { |e| e. is_a? Array }, @h2.my_none? { |e| e.is_a? Array }, 
      'hash.my_none? { ... } and hash.none? { ... } outputs are not equal' )
    assert_equal( @h0.none? , @h0.my_none? , 
      'hash.my_none? and hash.none? outputs are not equal' )
  end
  
  # :6:a	RANGE PREDICATES
  def test_range_predicate_all
    assert_equal( @r0.all? { |e| e.even? }, @r0.my_all? { |e| e.even? },
      'range.my_all? { ... } and range.all? { ... } outputs are not equal' )
    assert_equal( @r1.all? { |e| e.integer? }, @r1.my_all? { |e| e.integer? }, 
      'range.my_all? { ... } and range.all? { ... } outputs are not equal' )
    assert_equal( @r0.all? , @r0.my_all? , 
      'range.my_all? and range.all? outputs are not equal' )
  end
  
  # :6:b
  def test_range_predicate_any
    assert_equal( @r0.any? { |e| e.even? }, @r0.my_any? { |e| e.even? },
      'range.my_any? { ... } and range.any? { ... } outputs are not equal' )
    assert_equal( @r1.any? { |e| e.integer? }, @r1.my_any? { |e| e.integer? }, 
      'range.my_any? { ... } and range.any? { ... } outputs are not equal' )
    assert_equal( @r0.any? , @r0.my_any? , 
      'range.my_any? and range.any? outputs are not equal' )
  end
    
  # :6:c
  def test_range_predicate_none
    assert_equal( @r1.none? { |e| e.even? }, @r1.my_none? { |e| e.even? },
      'range.my_none? { ... } and range.none? { ... } outputs are not equal' )
    assert_equal( @r1.none? { |e| e.integer? }, @r1.my_none? { |e| e.integer? }, 
      'range.my_none? { ... } and range.none? { ... } outputs are not equal' )
    assert_equal( @r0.none? , @r0.my_none? , 
      'range.my_none? and range.none? outputs are not equal' )
  end
  
  # :7:a	ARRAY COUNT & INJECT
  def test_array_count
    assert_equal( @a0.count { |e| e.is_a? String }, @a0.my_count { |e| e.is_a? String },
      'arr.my_count { ... } and arr.count? { ... } outputs are not equal' )
    assert_equal( @a1.count { |e| e.even? }, @a1.my_count { |e| e.even? },
      'arr.my_count { ... } and arr.count { ... } outputs are not equal' )
    assert_equal( @a0.count , @a0.my_count ,
      'arr.my_count and arr.count outputs are not equal' )
    assert_equal( @a1.count(1) , @a1.my_count(1) ,
      'arr.my_count(num) and arr.count(num) outputs are not equal' )
  end
  # :7:b
  def test_array_inject
    assert_equal( (@a1.inject(:+) ) , (@a1.my_inject (:+) ),
      'arr.my_inject(:op) and arr.inject(:op) outputs are not equal' )
    assert_equal( @a1.inject(5, :*) , @a1.my_inject(5, :*) ,
      'arr.my_inject(num, :op) and arr.inject(num, :op) outputs are not equal' )
    assert_equal( @a1.inject(1) { |m, e| m * e } , @a1.my_inject(1) { |m, e| m * e } ,
      'arr.my_inject(num) { ... } and arr.inject(num) { ... } outputs are not equal' )
    assert_equal( @a1.inject { |m, e| m * e } , @a1.my_inject { |m, e| m * e } ,
      'arr.my_inject { ... } and arr.inject { ... } outputs are not equal' )
  end
  
  # :8:a	HASH COUNT & INJECT
  def test_hash_count
    assert_equal( @h0.count { |e| e.is_a? Hash }, @h0.my_count { |e| e.is_a? Hash },
      'hash.my_count { ... } and hash.count { ... } outputs are not equal' )
    assert_equal( @h0.count { |e| e.is_a? Array }, @h0.my_count { |e| e.is_a? Array },
      'hash.my_count { ... } and hash.count { ... } outputs are not equal' )
    assert_equal( @h2.count { |_, v| v.integer? }, @h2.my_count { |_, v| v.integer? },
      'hash.my_count { ... } and hash.count { ... } outputs are not equal' )
    assert_equal( @h0.count(1) , @h0.my_count(1) ,
      'hash.my_count(num) and hash.count(num) outputs are not equal' )
    assert_equal( @h2.count, @h2.my_count,
      'hash.my_count and hash.count outputs are not equal' )
  end
  
  # :8:b
  def test_hash_inject
    assert_equal( @h2.inject(:+) , @h2.my_inject(:+) ,
      'hash.my_inject(:op) and hash.inject(:op) outputs are not equal' )
    assert_equal( @h0.inject(10) { |m, (_, v)| m * v }, 
      @h0.my_inject(10) { |m, (_, v)| m * v }, 
      'hash.my_inject(num) { ... } and hash.inject(num) { ... } outputs are not equal' )     
  end
  
  # :9:a	RANGE COUNT & INJECT
  def test_range_count
    assert_equal( @r1.count { |e| e.even? }, @r1.my_count { |e| e.even? },
      'range.my_count { ... } and range.count { ... } outputs are not equal' )
    assert_equal( @r0.count , @r0.my_count ,
      'range.my_count and range.count outputs are not equal' )
    assert_equal( @r1.count(1) , @r1.my_count(1) ,
      'range.my_count(num) and range.count(num) outputs are not equal' )
  end
  # :9:b
  def test_range_inject
    assert_equal( (@r1.inject(:+) ) , (@r1.my_inject(:+) ),
      'range.my_inject(:op) and range.inject(:op) outputs are not equal' )
    assert_equal( @r0.inject(5, :*) , @r0.my_inject(5, :*) ,
      'range.my_inject(num, :op) and range.inject(num, :op) outputs are not equal' )
    assert_equal( @r1.inject(1) { |m, e| m * e } , @r1.my_inject(1) { |m, e| m * e } ,
      'range.my_inject(num) { ... } and range.inject(num) { ... } outputs are not equal' )
  end
  
  # :10:	ERRORS
  def test_errors
    assert_raise("ArgumentError.new('Expected two arguments')") do
      @a1.my_inject(1, 2, 3)
    end
    assert_raise("ArgumentError.new('Expected correct arg types')") do
      @a1.my_inject(1, "2")
    end
    assert_raise("ArgumentError.new('Expected correct arg types')") do
      @a1.my_inject("1", :+)
    end
    assert_raise("ArgumentError.new('Expected correct arg type')") do
      @a1.my_inject("1")
    end
    assert_raise("ArgumentError.new('Expected correct arg type')") do
      @a1.my_inject(":+")
    end
    assert_raise("ArgumentError.new('Expected correct arg type')") do
      @a1.my_inject("1")
    end
    assert_raise("ArgumentError.new('No block was expected')") do
      @a1.my_inject("+") { |m, e| m * e }
    end
    assert_raise("LocalJumpError.new('Expected a block')") do
      @a1.my_inject(1)
    end
    assert_raise("LocalJumpError.new('Expected a block')") do
      @a1.my_inject
    end
    assert_raise("NoMethodError.new('Expected a method')") do
      @s0.my_inject(1, :+)
    end
    assert_raise("TypeError.new('Expected coll to have all strings or all integers')") do
      @a10.my_inject(1, :+)
    end
  end
end
