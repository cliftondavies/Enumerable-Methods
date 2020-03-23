module Enumerable
  def my_each(array)
    array.length.times { |index| yield(array[index]) }

    nil
  end

  def my_each_with_index(array)
    0.upto(array.length - 1) { |index| yield(array[index], index) }

    nil
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
        counter += 1 if yeild(item)
      elsif item == value
        counter += 1
      else
        counter = array.length unless value
      end
    end
    counter
  end

  def my_map
  end

  def my_inject
  end
end
