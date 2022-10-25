# frozen_string_literal: true

require_relative 'node'

# Binary search tree
arr = []
count = rand(5..30) + 1

until count.zero?
  arr << rand(0..1000) + 1
  count -= 1
end

p arr

def build_tree(array)
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
  
end

p build_tree(arr)
