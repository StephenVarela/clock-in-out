FactoryBot.define do
  factory :user do
    first_name { 'Jane' }
    last_name { 'Doe' }
    email { 'janedoe@gmail.com' }
    password { 'abc' } 
  end
end