# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :userstockinfo do
    user nil
    stock nil
    quantity 1
    price 1.5
  end
end
