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

def build_tree(arr)
  # return nil if array is empty
  # if array is greater than 2
    # define the middle point of the array
    # assign the middle point of the array as the root node of the tree
    # define the left half of the array and convert them to the left node
    # left nodes are smaller than root node
    # define the right half of the array and convert them to the right node
    # right nodes are higher than the root nodes
  # if array is equal to  2
    # the root node is index 0
    # left node is nil
    # right node is index 1
  # if array equal 1
    # root node is index 0
    # execute root
  return nil if arr.empty?

  arr_sort = arr.sort
  array = arr_sort.uniq

  if array.length > 2
    mid_point = array.length / 2
    root = TreeNode.new(array[mid_point])
    root.left = build_tree(array[0...mid_point])
    root.right = build_tree(array[mid_point + 1..- 1])
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

p build_tree([1,2,3,4,5,6,7,8,9])
