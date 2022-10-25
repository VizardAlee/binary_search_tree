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

  def insert(value, node = root)
    return nil if value == node.data

    if value < node.data
      node.left.nil? ? node.left = TreeNode.new(value) : insert(value, node.left)
    elsif value > node.data
      node.right.nil? ? node.right = TreeNode.new(value) : insert(value, node.right)
    else
      return
    end
    node
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

tree = BinarySearchTree.new(arr)
tree.insert(50)
tree.insert(12)
p tree.insert(25)
tree.pretty_print
