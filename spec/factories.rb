FactoryGirl.define do 
  factory :user do
     first_name "First"
     last_name  "Last"
     sequence(:email) { |n| "user#{n}@odot.com" }
     password   "fake12345"
     password_confirmation "fake12345"
  end

  factory :todo_list do
  	title "Todo List Title"
  	description "Todo List Description"
  	association :user

  end
end
