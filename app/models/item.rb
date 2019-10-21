class Item < ApplicationRecord
  validates :name, presence: true
  validates :cost, presence: true, numericality: {greater_than: 0, only_integer: true}

  scope :one_of_each, -> { select('DISTINCT ON (name, cost) *').all }
end
