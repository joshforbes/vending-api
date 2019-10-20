FactoryBot.define do
  factory :money do
  end

  factory :quarter, parent: :money, class: Quarter
end
