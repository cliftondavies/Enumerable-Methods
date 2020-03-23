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

    array.length.times do |index|
      result = false unless yield(array[index])
    end
    result
  end

  def my_any?
    result = false

    array.length.times do |index|
      result = true if yield(array[index])
    end
    result
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
