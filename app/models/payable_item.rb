class PayableItem < ApplicationRecord
  belongs_to :payable

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :due_on_date_today_or_future

  private

  def due_on_date_today_or_future
    if due_on.blank?
      errors.add(:due_on, 'must be present')
    elsif due_on.to_date < Date.today
      errors.add(:due_on, 'must be today or later')
    end
  end
end
