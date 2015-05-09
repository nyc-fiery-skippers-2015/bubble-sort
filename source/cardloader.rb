
require_relative 'card.rb'

module Cardloader
  attr_accessor :card, :deck

  def self.load(file)
    array = []
    File.readlines(file).each do |x|
      array << x.to_s.chomp
    end

    sub_arrays = array.each_slice(3).to_a
    sub_arrays.map.with_index do |x, id|
      x.delete("")
      x << id.to_s
      Card.new({:definition =>x[0], :answer =>x[1], :id =>id})
    end


  end
end
