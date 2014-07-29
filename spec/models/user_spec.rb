require 'spec_helper'

describe User do
	let(:valid_attributes) {
		{
			first_name:"Jason",
			last_name: "Patterson",
			email: "name@somethin.com",
			password: "j1235",
			password_confirmation: "j1235"
		}
	}
		context "relationships" do
			it {should have_many(:todo_lists) }
		end

		context "validation" do 
			let(:user) {User.new(valid_attributes)}


			before do 
				User.create(valid_attributes)
			end

			it "requires an email" do
				expect(user).to validate_presence_of(:email) 
			end
			it "requires a unique email" do
				expect(user).to validate_uniqueness_of(:email)
			end
			it " requires a unique email" do
				user.email = "NAME@SOMETHIN.COM"
				expect(user).to validate_uniqueness_of(:email)
			
			end
			it "requires the email address to look like an email" do
				user.email =  "benja"
				expect(user).to_not be_valid


			end




		end
		describe "#downcase_email" do 
			it "makes the email attribute lowercase" do
				user = User.new(valid_attributes.merge(email: "FAKE@EMAIL.COM"))

				expect{ user.downcase_email }.to change{ user.email }.from("FAKE@EMAIL.COM").to("fake@email.com")
			end

			it "downcases an email before saving" do 
				user = User.new(valid_attributes)
				user.email ="FAKE@EMAIL.COM"
				expect(user.save).to be_true
				expect(user.email).to eq("fake@email.com")
			end


		end
end
