require 'rails_helper'

RSpec.describe Dog, :type => :model do
 # pending "add some examples to (or delete) #{__FILE__}"
 # let(:valid_attributes) {
 #  {
 #    name: 'Watson',
 #    email: 'bark@dev.com',
 #    password: 'barkbark',
 #    password_confirmation: 'barkbark',
 #    birthday: Time.now-3.years,
 #    city: "New York",
 #    state: "NY"
 #  }
 # }
 describe "is invalid if" do
  # let(:dog) {Dog.new valid_attributes}
  let(:dog) {build(:dog)}
  it "name" do
    p dog
    dog.name = nil
    expect(dog).to be_invalid
  end
  it "birthday" do
    dog.birthday = nil
    expect(dog).to be_invalid
  end
  it "city" do
    dog.city = nil
    expect(dog).to be_invalid
  end
  it "state" do
    dog.state = nil
    expect(dog).to be_invalid
  end
  it "email" do
    dog.email = nil
    expect(dog).to be_invalid
  end
  it "maintains name" do
    expect(dog.name).to eq("Watson")
  end

  it "detects if born on today's date" do
    expect(dog.birthday?).to eq(true)
  end
  it "detects if not born on today's date" do
    dog.birthday = Time.now - 4.days
    expect(dog.birthday?).to eq(false)
  end
  it "determines #age" do
    expect(dog.age).to eq(3)
  end
  it "determines #location" do
    expect(dog.location).to eq("New York, NY")
  end
  describe "identifies puppies" do
    it "when not a puppy" do
      expect(dog.puppy?).to eq(false)
    end
    it "when a puppy" do
      dog.birthday = Time.now - 70.days
      expect(dog.puppy?).to eq(true)
    end
  end
  it "calculates age in dog years" do
    expect(dog.age_in_dog_years).to eq(21)
  end
  it "allows subscription to newsletter" do
    dog.subscribe_to_newsletter
    expect(dog.newsletter).to eq(true)
  end
  it "allows unsubscription from newsletter" do
    dog.newsletter = true
    dog.unsubscribe_from_newsletter
    expect(dog.newsletter).to eq(false)
  end
 end


end




