# frozen_string_literal: true

require_relative 'node'

# Binary search tree
arr = []
count = rand(5..10) + 1

until count.zero?
  arr << rand(0..1000) + 1
  count -= 1
end

p arr

class BinarySearchTree
  attr_accessor :root, :data

  def initialize(array)
    @data = array.sort.uniq
    @root = build_tree(data)
  end

  def build_tree(arr)
    return nil if arr.empty?

    arr_sort = arr.sort
    array = arr_sort.uniq

    if array.length > 2
      mid_point = array.length / 2
      root = TreeNode.new(array[mid_point])
      root.left = build_tree(array[0...mid_point])
      root.right = build_tree(array[mid_point + 1...array.length])
    elsif array.length == 2
      root = TreeNode.new(array[0])
      root.left = nil
      root.right = TreeNode.new(array[1])
    elsif array.length == 1
      root = TreeNode.new(array[0])
    else
      return nil
    end
    root
  end
end


tree = BinarySearchTree.new(arr)
p tree

def insert(value)
  # convert value to node
  # if value is less than root, move it to the left to the lowest node
  # if value is greater than root, move it to the right to the lowest node
  node = TreeNode.new(value)

end

# p insert(20)
