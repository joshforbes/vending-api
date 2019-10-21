class Money < ApplicationRecord
  validates :type, presence: true

  scope :pending, -> { where(pending: true) }

  def self.pending_balance
    pending.sum { |coin| coin.value }
  end

  def self.refund
    pending.destroy_all
  end

  def value
    self.class::VALUE
  end
end
