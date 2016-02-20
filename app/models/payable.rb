class Payable < ApplicationRecord
  belongs_to :user
  has_many :payable_items, dependent: :destroy
end
