class PayableItem < ApplicationRecord
  belongs_to :payable

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :due_on, presence: true

  scope :today_and_future, -> { where('due_on >= ?', Date.today) }
  scope :overdue, -> { where('paid_at is null and due_on < ?', Date.today) }
  scope :upcoming, ->(from = Date.today, to: 1.week.from_now.to_date) {
    where('paid_at is null and due_on between ? and ?', from, to)
  }
end
