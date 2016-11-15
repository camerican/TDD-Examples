describe Array do
  before(:all) do
    @array = Array.new
  end
  it "#new should return a blank instance" do
    expect(@array).to eq []
  end
  it "should allow us to #count the number of items" do
    expect(@array.count).to eq 0
  end
  it "should allow us to #push an element to the array" do
    expect(@array.push(2)).to eq([2])
  end
  it "should allow us to #push another element to the array" do
    expect(@array.push("happy")).to eq [2,"happy"]
  end

  # unshift - add an element to the front of an array
  it "should allow us to #unshift an element to the array" do
    expect(@array.unshift(1)).to eq [1,2,"happy"]
  end

  # shift - remove an element from the front of an array
  it "should allow us to #shift an element from the array" do
    expect(@array.shift).to eq(1)
    expect(@array).to eq([2,"happy"])
  end

  # pop - remove an element from the back of an array
  it "should allow us to #pop an element from the array" do
    expect(@array.pop).to eq("happy")
    expect(@array).to eq([2])
  end
end





