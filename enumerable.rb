module Enumerable
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

  def my_select(array)
    result = []

    my_each(array) { |item| result << item if yield(item) }

    result
  end

  def my_all?(array)
    result = true

    my_each(array) { |item| result = false unless yield(item) }

    result
  end

  def my_any?(array)
    result = false

    my_each(array) { |item| result = true if yield(item) }

    result
  end

  def my_none?(array)
    result = true

    my_each(array) { |item| result = false if yield(item) }

    result
  end

  def my_count(array, value = nil)
    counter = 0

    my_each(array) do |item|
      if block_given?
        counter += 1 if yield(item)
      elsif item == value
        counter += 1
      else
        counter = array.length unless value
      end
    end
    counter
  end

  def my_map(array)
    result = []

    my_each(array) { |item| result << yield(item) }

    result
  end

  def my_inject(array, value = nil)
    if value
      result = value

      my_each(array) { |item| result = yield(result, item) }
    else
      result = array[0]
      array.shift

      my_each_with_index(array) { |item, _index| result = yield(result, item) }
    end
    result
  end

  def multiply_els(array)
    my_inject(array) { |result, item| result * item }
  end

  def my_map_with_proc(array, proc = nil)
    result = []

    my_each(array) do |item|
      result << if proc
                  proc.call(item)
                else
                  yield(item)
                end
    end
    result
  end
end
