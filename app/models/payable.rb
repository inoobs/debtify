class Payable < ApplicationRecord
  belongs_to :user
  has_many :payable_items, dependent: :destroy

  alias_method :items, :payable_items

  attr_accessor :amount, :due_on

  validates :name, presence: true, length: 1..255
end
