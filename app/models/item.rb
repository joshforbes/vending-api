class Item < ApplicationRecord
  validates :name, presence: true
  validates :cost, presence: true, numericality: {greater_than: 0, only_integer: true}
end
