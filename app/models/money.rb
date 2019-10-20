class Money < ApplicationRecord
  validates :type, presence: true
end
