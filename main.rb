# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/bst'

tree = Tree.new([3, 2, 5, 12, 5, 8, 12, 5, 6, 8, 0])
tree.insert(13)
tree.insert(11)
tree.insert(1)
tree.insert(7)
tree.insert(7)
tree.insert(7)
tree.delete(11)
# tree.delete(8)
# tree.delete(6)
p tree.pretty_print
# p tree.find(13)
p tree.level_order
#p tree.inorder
#p tree.preorder
#p tree.postorder
#p tree.depth(2)
p tree.height
p tree.balanced?
p tree.rebalance
#p tree.pretty_print
#p tree.balanced?
