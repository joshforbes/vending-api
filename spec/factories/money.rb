FactoryBot.define do
  factory :money do
    trait :pending do
      pending { true }
    end

    trait :not_pending do
      pending { false }
    end
  end

  factory :quarter, parent: :money, class: Quarter
  factory :dime, parent: :money, class: Dime
  factory :nickel, parent: :money, class: Nickel
end
