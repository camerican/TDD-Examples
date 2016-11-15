require './triangle'
require 'rspec'

describe Triangle do
  before do
    @triangle = Triangle.new([3,4,5])
  end

  it "accepts an array of three integers" do
    expect(Triangle.new([3,4,5])).to be_instance_of(Triangle)
  end

  # to do: fix this test
  # it "rejects a non-array argument" do
  #   expect(Triangle.new("fail_me!")).to raise_error
  # end

  it "determines the perimeter" do
    expect(@triangle.perimeter).to eq(12)
  end

  #to do: test that array has three sides

  #to do: test that no side is double or more the other two sides

  it "#equilateral? detects whether all sides are equal to each other" do
    expect(@triangle.equilateral?).to eq(false)
  end

end




