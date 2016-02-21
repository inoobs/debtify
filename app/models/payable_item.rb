class PayableItem < ApplicationRecord
  belongs_to :payable

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :due_on, presence: true

  scope :today_and_future, -> { where('due_on >= ?', Date.today) }
end
