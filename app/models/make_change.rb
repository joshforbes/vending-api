class MakeChange
  def initialize(due:, available_money:)
    @due = due
    @available_money = available_money
  end

  def call
    change = get_change
    if change.sum { |money| money.value } == due
      Result.success(change: change)
    else
      Result.failure("Could not make change")
    end
  end

  private

  attr_reader :due, :available_money

  def get_change
    result = money_sorted_big_to_little.reduce(remaining: due, change: []) { |acc, money|
      next(acc) unless (acc[:remaining] / money.value).positive?

      acc[:remaining] -= money.value
      acc[:change] << money
      acc
    }[:change]
  end

  def money_sorted_big_to_little
    available_money.sort { |a, b| b.value <=> a.value }
  end
end