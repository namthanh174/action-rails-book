FactoryGirl.define do
    factory :user do
       name "Example" 
       email "example@gmail.com"
       password "password"
       password_confirmation "password"
    end
end