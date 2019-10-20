class InsertMoneyMutation < Types::BaseMutation
  description "Creates the specified money"

  argument :money, Types::Money, required: true

  field :success, Boolean, null: true

  def resolve(money:)
    { success: money.create }
  end
end
