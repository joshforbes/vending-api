class InsertMoneyMutation < Types::BaseMutation
  description "Creates the specified money"

  argument :money, Types::Money, required: true

  field :money, Types::Money, null: true
  field :errors, resolver: Resolvers::Error

  def resolve(money:)
    money = money.new

    if money.save
      {money: money.class, errors: []}
    else
      {money: nil, errors: money.errors}
    end
  end
end
