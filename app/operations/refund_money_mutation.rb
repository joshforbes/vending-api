class RefundMoneyMutation < Types::BaseMutation
  description "Removes all the pending money from the machine"

  field :money, [Types::Money], null: true

  def resolve
    refund = Money.refund

    { money: refund.map(&:class) }
  end
end
