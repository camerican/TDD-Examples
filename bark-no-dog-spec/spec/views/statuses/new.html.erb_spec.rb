require 'rails_helper'

RSpec.describe "statuses/new", :type => :view do
  before(:each) do
    assign(:status, Status.new(
      :body => "MyText",
      :dog_id => 1
    ))
  end

  it "renders new status form" do
    render

    assert_select "form[action=?][method=?]", statuses_path, "post" do

      assert_select "textarea#status_body[name=?]", "status[body]"

      assert_select "input#status_dog_id[name=?]", "status[dog_id]"
    end
  end
end
