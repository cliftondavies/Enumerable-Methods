module Pattern
  def self.my_all_pattern?(enum, pattern)
    result = true

    if pattern.is_a?(Class)
      enum.to_a.my_each { |item| result = false unless item.is_a?(pattern) }
    elsif pattern.is_a?(Regexp)
      enum.to_a.my_each { |item| result = false unless item.match(pattern) }
    else
      enum.to_a.my_each { |item| result = false unless item == pattern }
    end
    result
  end

  def self.my_any_pattern?(enum, pattern)
    result = false

    if pattern.is_a?(Class)
      enum.to_a.my_each { |item| result = true if item.is_a?(pattern) }
    elsif pattern.is_a?(Regexp)
      enum.to_a.my_each { |item| result = true if item.match(pattern) }
    else
      enum.to_a.my_each { |item| result = true if item == pattern }
    end
    result
  end
end
