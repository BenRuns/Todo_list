require "spec_helper"

describe "Logging In" do 
	it "logs the user in and goes to the todo lists" do
		User.create(first_name: "Ben", last_name: "Patterson", 
					email: "fake@email.com", password:"fake1234", 
					password_confirmation: "fake1234")
		visit new_user_session_path
		fill_in "Email Address", with: "fake@email.com"
		fill_in "Password", with: "fake1234"
		click_button "Log In"
		expect(page).to have_content("Todo Lists")
		expect(page).to have_content("Thanks for logging in!")
	end

	it "displays the email address in the event of a failed login" do
		visit new_user_session_path
		fill_in "Email Address", with: "fake@email.com"
		fill_in "Password", with: "incorrect"
		click_button "Log In"

		expect(page).to have_content("Please check your email and password")
		expect(page).to have_field("Email Address", with: "fake@email.com")
	end


end