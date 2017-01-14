#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  include Enumerable

  def each(&block)
    (0..csv_contents.size).step(headers.size) do |i|
      row = csv_contents[i]
      block.call(row)
    end
  end
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

# day3 modify the application to support and each method to return a CsvRow object
#      ass a method_missing on the CsvRow object to support returning the values for a given header
# day3 assignment expected call and output: Matsumoto, Tate
m.each{|row| puts row}
m.each{|row| puts row.last}
