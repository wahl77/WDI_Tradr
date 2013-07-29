# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :userstockinfo do
    user
    stock
    quantity 2
    price 10
  end
end
