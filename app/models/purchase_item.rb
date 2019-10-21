class PurchaseItem
  def initialize(item)
    @item = item
  end

  def call
    return Result.failure("Not enough money provided") if !afford?

    result = MakeChange.new(
      due: pending_balance - item.cost,
      available_money: Money.all
    ).call

    if result.success?
      Money.deposit
      Result.success(
        item: item.delete,
        change: result.change.map { |change| change.destroy }
      )
    else
      result
    end
  end

  private

  attr_reader :item

  def afford?
    pending_balance >= item.cost
  end

  def pending_balance
    @pending_balance ||= Money.pending_balance
  end
end