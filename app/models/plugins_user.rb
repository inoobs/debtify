class PluginsUser < ApplicationRecord
  belongs_to :plugin
  belongs_to :user

  scope :mailers, lambda {
    where(
      "plugin_id in (select id from plugins where plugin_type = 'mail_parser')"
    )
  }
end
