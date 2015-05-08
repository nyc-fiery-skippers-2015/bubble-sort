require 'csv'
# require 'pry'
require_relative 'card.rb'

module Cardloader

def self.load(file)
  array = []
  File.open(file).each do |x|
    array << x unless x == "\n"
  end
sub_arrays = array.each_slice(2).to_a

  id = 1
    sub_arrays.map do |card|
      Card.new(:definition => card[0], :answer => card[1], :id => id)
      id +=1
    end
  end
end

file = 'flashcard_samples.txt'
Cardloader.load(file)
