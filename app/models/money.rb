class Money < ApplicationRecord
  validates :type, presence: true

  scope :pending, -> { where(pending: true) }

  def self.pending_balance
    pending.sum { |coin| coin.class::VALUE }
  end

  def self.refund
    pending.destroy_all
  end
end
