# frozen_string_literal: true

require 'rspec'
require_relative '../matrix'
require_relative '../import'

describe 'Matrix' do
  let(:path) { '/Users/joelgarcia/Downloads/matrix.csv' }
  let(:data) { Import.new(path).read }
  let(:matrix) { Matrix.new(data) }

  it 'should print matrix and inverse matrix' do
    puts matrix.echo
    puts matrix.invert
  end

  it 'should return the matrix as a string in matrix format.' do
    expect(matrix.echo.is_a?(String)).to eq(true)
  end

  it 'should return the matrix as a string in matrix format where the columns and rows are inverted' do
    expect(matrix.invert.is_a?(String)).to eq(true)
  end

  it 'should return the matrix as a 1 line string, with values separated by commas.' do
    expect(matrix.flatten).to eq('1,2,3,4,5,6,7,8,9')
  end

  it 'should return the sum of the integers in the matrix' do
    expect(matrix.sum).to eq(45)
  end

  it 'should return the product of the integers in the matrix' do
    expect(matrix.multiply).to eq(362_880)
  end
end
