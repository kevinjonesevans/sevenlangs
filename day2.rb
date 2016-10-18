#!/usr/bin/ruby

# print contents of array of 16 numbers four at a time using .each
# then just .each_slice
my_arr = ('a'...'z').to_a[0...16]
(0...4).each do |index|
  pass = index * 4
  puts my_arr[pass]
  puts my_arr[pass+1]
  puts my_arr[pass+2]
  puts my_arr[pass+3]
end

puts "_____________________"

my_arr.each_slice(4) do |slice|
  puts slice
end

class Tree
  attr_accessor :children, :node_name

  # original
  # def initialize(name, children=[])
  #   @children = children
  #   @node_name = name
  # end

  # mine
  def initialize(values={})
    @node_name = []
    @children = []
    values.each_pair do |key, value|
      puts key, " = ", value
      @node_name << key
      @children << Tree.new(value)
    end
  end

  def visit_all(&block)
    visit &block
    children.each{|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

# ruby_tree = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacRuby")])
ruby_tree = Tree.new({"Ruby" => {"Reia" => {}, "MacRuby" => {}}})
puts "Visiting a node"
ruby_tree.visit{|node| puts node.node_name}
puts "Visiting an entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

# make the above Tree class init accept nested hashes with empties
# should be able to specify liek this: {'grandpa' => {'dad' => {'child1': {}, 'child2': {}}}}

# open a file and search its text for a regex string
filename = 'test.txt'
search_string = 'Some Interesting Text'

File.open(filename) do |f|
  f.grep(search_string)
end
