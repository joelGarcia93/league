# frozen_string_literal: true

require 'csv'

# import class to handle the csv file, read it and return data
class Import
  attr_accessor :data, :url, :column_size

  def initialize(url)
    self.url = url
    self.data = []
  end

  def read
    csv_text = File.read(url)
    CSV.parse(csv_text, headers: false).each do |row|
      break if row.nil? || row.length.zero?

      self.column_size = row.length if column_size.nil?
      check = row_validation(row)
      data.push(check)
    end
    data_validation(data)
  end

  private

  def row_validation(row)
    valid_numbers = row.any? { |i| !number?(i) || negative?(i.to_i) }
    throw StandardError.new('only allow numbers, 0 and negative not valid') if valid_numbers
    throw StandardError.new('columns should have same size for each row') if column_size && row.length != column_size
    row.map(&:to_i)
  end

  def number?(value)
    /\A[-+]?[0-9]+\z/.match(value)
  end

  def negative?(value)
    value <= 0
  end

  def data_validation(data)
    throw StandardError.new('the file is empty or the first row does not have information') if data.empty?
    rows = data.length
    cols = data[0].length
    throw StandardError.new('only allow number of rows are equal to the number of columns') unless rows == cols
    data
  end
end
