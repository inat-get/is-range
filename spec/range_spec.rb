require_relative 'spec_helper'

RSpec::describe Range do

  it 'AND' do
    a = 1..3
    b = 3..5
    c = 1...3
    expect(a & b).to eq(3..3)
    expect(a & c).to eq(1...3)
    expect(b & c).to eq(nil)
  end

  it 'OR' do
    a = 1..3
    b = 3..5
    c = 1...3
    expect(a | b).to eq(1..5)
    expect(a | c).to eq(1..3)
    expect(b | c).to eq(1..5)
  end

  it 'empty' do
    expect((1...1).empty?).to eq(true)
    expect((1..1).empty?).to eq(false)
  end

end
