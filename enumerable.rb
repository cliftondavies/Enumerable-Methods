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

    my_each(array) { |item| result << item if yield(item) == true }
    result
  end

  def my_all?(array)
    result = true

    my_each(array) { |item| result == false if yield(item) == false }

    result
  end

  def my_any?
  end

  def my_none?
  end

  def my_count
  end

  def my_map
  end

  def my_inject
  end
end
