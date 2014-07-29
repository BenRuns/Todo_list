require 'spec_helper'





describe "Creating todo lists" do
	let(:user) { create(:user) }

	def create_todo_list(options={})
		options[:title] ||= "My todo list"
		options[:description] ||="This is my todo list"
		visit "/todo_lists"	

		click_link "New Todo list"

		expect(page).to have_content("New todo_list")
		fill_in "Title", with: options[:title]

		fill_in "Description", with: options[:description]
		click_button "Create Todo list"
		visit "/todo_lists"	
	end
	
	before do 
		sign_in user, password: 'fake12345'
	end


	it "redirects to the todo list index page on success" do
		create_todo_list
		expect(page).to have_content("My todo list")
	end


		it "displays an error when the todo list has no description" do
		expect(TodoList.count).to eq(0)
		create_todo_list description: ""
		expect(page).to_not have_content("My todo list") 
	end

	it "displays an error when the todo list has a Description less than three characters" do
		expect(TodoList.count).to eq(0)
		create_todo_list description: "Hi"
		expect(page).to_not have_content("My todo list") 

	
	end

	it "displays an error when the todo list has no title" do
		expect(TodoList.count).to eq(0)
		create_todo_list title: ""
		expect(page).to_not have_content("This is my todo list") 
	end

	it "displays an error when the todo list has a titl less than three characters" do
		expect(TodoList.count).to eq(0)
		create_todo_list title: "Hi", description:"This is my todo list"
		expect(page).to_not have_content("This is my todo list") 

	
	end
end