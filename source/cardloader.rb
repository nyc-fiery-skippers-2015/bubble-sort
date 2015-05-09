require 'csv'
require_relative 'card.rb'

module Cardloader
  attr_accessor :card, :deck

  def self.load(file)
    array = []
    File.readlines(file).each do |x|
      array << x.to_s.chomp
    end

    sub_arrays = array.each_slice(3).to_a
    sub_arrays.each_with_index do |card, id|
      card.delete("")
      card << id.to_s
    end

    headers = [:definition, :answer, :id]
      sub_arrays.map do |x|
      Hash[headers.zip(x)]
    end
  end
end

