require 'rails_helper'

RSpec.describe "dogs/index", :type => :view do
  before(:each) do
    assign(:dogs, [
      Dog.create!(
        :name => "Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :city => "City",
        :state => "State",
        :newsletter => false
      ),
      Dog.create!(
        :name => "Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :city => "City",
        :state => "State",
        :newsletter => false
      )
    ])
  end

  it "renders a list of dogs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
