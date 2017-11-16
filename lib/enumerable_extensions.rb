module ::Enumerable
  def select_with_index
    index = -1
    select { |x| yield(x, index += 1) }
  end
  def odds
    select_with_index {|x,i| i.odd?}
  end
  def evens
    select_with_index {|x,i| i.even?}
  end
end
