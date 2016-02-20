class Plugin < ApplicationRecord
  has_many :plugins_users
  has_many :users, through: :plugins_users

  def get_url
    req = HTTP.get("#{url}/enable").body.readpartial
    JSON.parse(req)['url']
  end

  def user_enabled?(user_id)
    !plugins_users.find_by(user_id: user_id).nil?
  end
end
