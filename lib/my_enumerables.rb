module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    indxs = length - 1

    for idx in (0..indxs) do
      block.call(self[idx], idx)
    end
    self
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
