require_relative 'pattern'
module Enumerable
  include Pattern

  def my_each
    return to_enum(:my_each) unless block_given?

    to_a.length.times { |index| yield(to_a[index]) }

    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    0.upto(to_a.length - 1) { |index| yield(to_a[index], index) }

    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    result = []

    to_a.my_each { |item| result << item if yield(item) }

    result
  end

  def my_all?(pattern = nil)
    result = true

    if pattern
      result = Pattern.my_all_pattern?(self, pattern)
    elsif block_given?
      to_a.my_each { |item| result = false unless yield(item) }
    else
      to_a.my_each { |item| result = false unless item }
    end
    result
  end

  def my_any?(pattern = nil)
    result = false

    if pattern
      result = Pattern.my_any_pattern?(self, pattern)
    elsif block_given?
      to_a.my_each { |item| result = true if yield(item) }
    else
      to_a.my_each { |item| result = true if item }
    end
    result
  end

  def my_none?(pattern = nil)
    result = true

    if pattern
      result = !my_any?(pattern)
    elsif block_given?
      to_a.my_each { |item| result = false if yield(item) }
    else
      result = !my_any?
    end
    result
  end

  def my_count(value = nil)
    counter = 0

    to_a.my_each do |item|
      if block_given?
        counter += 1 if yield(item)
      elsif item == value
        counter += 1
      else
        counter = to_a.length unless value
      end
    end
    counter
  end

  def my_map(proc = nil)
    return to_enum(:my_map) unless block_given?

    result = []

    to_a.my_each do |item|
      result << if proc
                  proc.call(item)
                else
                  yield(item)
                end
    end
    result
  end

  def my_inject(*param)
    arr = to_a

    if block_given?
      if param.size == 1
        result = param[0]

        arr.my_each { |item| result = yield(result, item) }
      else
        result = arr[0]
        arr.shift

        arr.my_each_with_index { |item, _index| result = yield(result, item) }
      end
    elsif param.size == 2
      result = param[0]

      arr.my_each { |item| result = result.method(param[1]).call(item) }
    else
      result = arr[0]
      arr.shift

      arr.my_each { |item| result = result.method(param[0]).call(item) }
    end
    result
  end
end

def multiply_els(array)
  array.my_inject(:*)
end
