# frozen_string_literal: true

require_relative 'node'

# binary search tree class
class Tree
  attr_accessor :root, :data

  def initialize(arr)
    @data = arr.sort.uniq
    @root = build_tree(data)
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2
    node = Node.new(arr[mid])
    node.left = build_tree(arr[0...mid])
    node.right = build_tree(arr[mid + 1...arr.length])

    node
  end

  def insert(value, node = @root)
    return node = Node.new(value) if node.nil?

    if value < node.data
      node.left = insert(value, node.left)
    else
      node.right = insert(value, node.right)
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
      # if it has only one child or no child
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      # if node has two children
      leftmost_child = min_value_node(node.right)
      node.data = leftmost_child.data
      node.right = delete(leftmost_child.data, node.right)
    end

    node
  end

  def find(value, count = 0, node = @root)
    return "#{value} aint here" if node.nil?
    return "we got em! #{node.data} at index #{count}" if node.data == value

    if value < node.data
      node.left = find(value, count + 1, node.left)
    else
      node.right = find(value, count + 1, node.right)
    end
  end

  def level_order(node = @root, queue = [], order = [])
    order << node.data

    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
    return order if queue.empty?

    level_order(queue.shift, queue, order)
  end

  def inorder(node = @root, order = [])
    return order if node.nil?

    order << node.data
    node.left = inorder(node.left, order)
    node.right = inorder(node.right, order)
  end

  def min_value_node(node)
    return node if node.left.nil?

    min_value_node(node.left)
  end
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
