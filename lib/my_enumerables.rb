module Enumerable
  # Your code goes here
  def my_each_with_index
    indxs = length - 1

    for idx in (0..indxs) do
      yield(self[idx], idx)
    end
    self
  end

  def my_select
    selection = []
    my_each { |el| selection.push(el) if yield el }
    selection
  end

  def my_all?
    bools = []
    my_each { |el| bools.push(yield(el)) }
    return false if bools.include?(false)

    true
  end

  def my_any?
    my_each { |el| return true if yield el }
    false
  end

  def my_none?(&block)
    !my_any?(&block)
  end

  def my_count
    counter = 0
    if block_given?
      my_each { |el| counter += 1 if yield el }
      counter
    else
      length
    end
  end

  def my_map
    arr = []
    my_each { |el| arr.push(yield(el)) }
    arr
  end

  def my_inject(init = 0, *)
    my_each { |el| init = yield(init, el) }
    init
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for el in self do
      yield el
    end
    self
  end
end
