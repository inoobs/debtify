class Plugin < ApplicationRecord
  has_many :items, foreign_key: 'plugin_id', class_name: 'PluginsUser'
  has_many :users, through: :items

  scope :mailers, -> { where(plugin_type: 'mail_parser') }

  def get_url
    req = HTTP.get("#{url}/enable").body.readpartial
    JSON.parse(req)['url']
  end

  def user_enabled?(user_id)
    !items.find_by(user_id: user_id).nil?
  end
end
