module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    indxs = length - 1

    for idx in (0..indxs) do
      block.call(self[idx], idx)
    end
    self
  end

  def my_select(&block)
    selection = []
    for el in self do
      bool = block.call el
      selection.push(el) if bool
    end
    selection
  end

  def my_all?(&block)
    bools = []
    for el in self do
      bools.push(block.call(el))
    end
    return false if bools.include?(false)

    true
  end

  def my_any?(&block)
    for el in self do
      return true if block.call el
    end
    false
  end

  def my_none?(&block)
    !my_any?(&block)
  end

  def my_count(&block)
    counter = 0
    if block_given?
      for el in self do
        counter += 1 if block.call el
      end
      counter
    else
      length
    end
  end

  def my_map(&block)
    arr = []
    for el in self do
      arr.push(block.call(el))
    end
    arr
  end

  def my_inject(init = 0, &block)
    for el in self do
      init = block.call init, el
    end
    init
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    for el in self do
      block.call el
    end
    self
  end
end
