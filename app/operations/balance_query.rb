class BalanceQuery < Types::BaseResolver
  description "The total value of the pending money"
  type Integer, null: false

  def resolve
    Money.pending_balance
  end
end
