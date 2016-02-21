class Payable < ApplicationRecord
  belongs_to :user
  has_many :payable_items, dependent: :destroy

  alias_method :items, :payable_items

  attr_accessor :amount, :due_on

  validates :name, presence: true, length: 1..255
  validates :recurring_type, inclusion: {
    in: RecurringService::ALLOWED.map(&:to_s),
    message: "is not allowed",
    allow_nil: true
  }

  def next_item
    items.where("due_on >= ?", Date.today).first
  end

  def next_amount
    next_item&.amount
  end

  def next_due_on
    next_item&.due_on
  end

  def last_due_on
    return if recurring_type && recurring_ends_on.blank?
    items.last&.due_on
  end
end
