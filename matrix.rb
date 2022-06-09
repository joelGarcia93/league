# frozen_string_literal: true

# matrix class to handle all the operations
class Matrix
  attr_accessor :data

  def initialize(data)
    self.data = data
  end

  def echo
    string_parse(data)
  end

  def invert
    string_parse(data.transpose)
  end

  def flatten
    data.join(',')
  end

  def sum
    data.transpose.map(&:sum).sum
  end

  def multiply
    data.flatten.inject(:*)
  end

  private

  def string_parse(info)
    info.map { |e| e.join(',') }.join("\n")
  end
end
