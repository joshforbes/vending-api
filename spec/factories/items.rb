FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    cost { 10 }
  end
end
