require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :ip => "MyString",
      :comment => "MyText"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_ip", :name => "user[ip]"
      assert_select "textarea#user_comment", :name => "user[comment]"
    end
  end
end
