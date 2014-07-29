require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :first_name => "Ben",
      :last_name => "Patt",
      :password => "fake12345",
      :password_confirmation => "fake12345",
      :email => "fake@email.com"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_first_name[name=?]", "user[first_name]"
      assert_select "input#user_last_name[name=?]", "user[last_name]"
      assert_select "input#user_password[name=?]", "user[password]"
      assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"
      assert_select "input#user_email[name=?]", "user[email]"
    end
  end
end
