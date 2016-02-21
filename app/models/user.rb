class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :payables, dependent: :destroy
  has_many :payable_items, through: :payables
  has_many :plugins_users
  has_many :plugins, through: :plugins_users
end
