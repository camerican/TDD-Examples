require 'rails_helper'

RSpec.describe "statuses/edit", :type => :view do
  before(:each) do
    @status = assign(:status, Status.create!(
      :body => "MyText",
      :dog_id => 1
    ))
  end

  it "renders the edit status form" do
    render

    assert_select "form[action=?][method=?]", status_path(@status), "post" do

      assert_select "textarea#status_body[name=?]", "status[body]"

      assert_select "input#status_dog_id[name=?]", "status[dog_id]"
    end
  end
end
