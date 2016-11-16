require 'rails_helper'

RSpec.describe "dogs/edit", :type => :view do
  before(:each) do
    @dog = assign(:dog, Dog.create!(
      :name => "MyString",
      :email => "MyString",
      :password_digest => "MyString",
      :city => "MyString",
      :state => "MyString",
      :newsletter => false
    ))
  end

  it "renders the edit dog form" do
    render

    assert_select "form[action=?][method=?]", dog_path(@dog), "post" do

      assert_select "input#dog_name[name=?]", "dog[name]"

      assert_select "input#dog_email[name=?]", "dog[email]"

      assert_select "input#dog_password_digest[name=?]", "dog[password_digest]"

      assert_select "input#dog_city[name=?]", "dog[city]"

      assert_select "input#dog_state[name=?]", "dog[state]"

      assert_select "input#dog_newsletter[name=?]", "dog[newsletter]"
    end
  end
end
