# frozen_string_literal: true

require_relative 'node'

# Binary search tree
arr = []
count = rand(0..30) + 1

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

  def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else

      return node.right if node.left.nil?
      return node.left if node.right.nil?

      leftmost_node = smallest_leaf(node.right)
      node.data = leftmost_node.data
      node.right = delete(leftmost_node.data, node.right)
    end
    node
  end

  def smallest_leaf(node)
    node.left until node.left.nil?
  end

  def find(value, node = @root)
    return nil if node.nil?
    return "There is a match of #{node.data} at #{node}" if value == node.data

    if value < node.data
      node.left = find(value, node.left)
    elsif value > node.data
      node.right = find(value, node.right)
    end
  end

  def level_order(node = @root, queue = [], result = [])
    block_given? ? yield(node) : result << node.data
    queue << node.left unless  node.left.nil?
    queue << node.right unless node.right.nil?
    return result if queue.empty?

    level_order(queue.shift, queue, result)
  end

  def inorder(node = @root, result = [])
    return if node.nil?

    inorder(node.left, result)
    block_given? ? yield(node) : result << node.data
    inorder(node.right, result)
  end

  def preorder(node = @root, result =  [])
    return if node.nil?

    block_given? ? yield(node) : result << node.data
    preorder(node.left, result)
    preorder(node.right, result)
  end

  def postorder(node = @root,result = [])
    return if node.nil?

    postorder(node.left, result)
    postorder(node.right, result)
    block_given? ? yield(node) : result << node.data
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def height(node = @root, height_count = -1)
    return height_count if node.nil?

    height_count += 1
    [height(node.left, height_count), height(node.right,height_count)].max
  end

  def depth(value, node = @root, depth_count = -1)
    return nil if value.nil?
    return depth_count if value == node.data

    depth_count += 1
    if value < node.data
      depth(value, node.left, depth_count)
    elsif value > node.data
      depth(value, node.right, depth_count)
    end
  end
end

tree = BinarySearchTree.new(arr)
tree.insert(50)
tree.insert(12)
tree.insert(25)
tree.delete(50)
tree.pretty_print
# tree.find(25)
p tree.level_order
p tree.inorder
p tree.height
p tree.depth(25)