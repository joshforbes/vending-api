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
end
