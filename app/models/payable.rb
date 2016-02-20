class Payable < ApplicationRecord
  belongs_to :user
  has_many :payable_items, dependent: :destroy

  alias_method :items, :payable_items

  attr_accessor :amount, :due_on

  validates :name, presence: true, length: 1..255

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
    items.last&.due_on
  end
end
