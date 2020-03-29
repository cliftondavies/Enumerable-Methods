module Pattern
  def my_all_pattern?(pattern)
    result = true

    if pattern.is_a?(Class)
      to_a.my_each { |item| result = false unless item.is_a?(pattern) }
    elsif pattern.is_a?(Regexp)
      to_a.my_each { |item| result = false unless item.match(pattern) }
    else
      to_a.my_each { |item| result = false unless item == pattern }
    end
    result
  end

  def my_any_pattern?(pattern)
    result = false

    if pattern.is_a?(Class)
      to_a.my_each { |item| result = true if item.is_a?(pattern) }
    elsif pattern.is_a?(Regexp)
      to_a.my_each { |item| result = true if item.match(pattern) }
    else
      to_a.my_each { |item| result = true if item == pattern }
    end
    result
  end
end
