class PluginsUser < ApplicationRecord
  belongs_to :plugin
  belongs_to :user
end
