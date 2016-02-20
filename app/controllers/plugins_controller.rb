class PluginsController < ApplicationController
  before_action :set_plugin_by_name, only: :oauth_callback
  before_action :set_plugin, only: [:disable, :enable]

  def index
    @plugins = Plugin.all.select(:name, :id)
  end

  def enable
    @url = @plugin.get_url
    redirect_to @url
  end

  def disable
    @plugin.plugins_users.find_by(user_id: current_user.id).destroy!
    redirect_to plugins_path, notice: 'Plugin disabled'
  end

  def oauth_callback
    @pl = PluginsUser.find_or_initialize_by(
      user_id: current_user.id, plugin_id: @plugin.id
    ).update!(data: request.env['omniauth.auth'])
    redirect_to plugins_path, notice: 'Plugin enabled'
  end

  def set_plugin_by_name
    @plugin = Plugin.find_by(name: params['provider'])
    redirect_to root_path unless @plugin
  end

  def set_plugin
    @plugin = Plugin.find(params[:id])
  end
end
