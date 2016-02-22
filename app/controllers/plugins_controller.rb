class PluginsController < ApplicationController
  before_action :set_plugin_by_name, only: :oauth_callback
  before_action :set_plugin, only: [:disable, :enable]

  def index
    @plugins = Plugin.all.select(:name, :id)
    @mailers = current_user.plugins_users.mailers
  end

  def enable
    @pl = PluginsUser.find_or_initialize_by(
      user_id: current_user.id, plugin_id: @plugin.id
    )
    @pl.update!(data: params.to_hash)
    @url = @plugin.get_url
    redirect_to @url
  end

  def disable
    @plugin.items.find_by(user_id: current_user.id).destroy!
    redirect_to plugins_path, notice: 'Plugin disabled'
  end

  def oauth_callback
    @pl = PluginsUser.find_or_initialize_by(
      user_id: current_user.id, plugin_id: @plugin.id
    )
    @pl.update!(data: request.env['omniauth.auth'].merge(@pl.data))

    ## Move this to some method
    # Make post request to Micro-Service
    res = HTTP.post("#{@plugin.url}/get_data", json: @pl.data)
    JSON.parse(res.body.readpartial).each do |debt|
      data = {}
      data[:name] = @pl.data['name']
      data[:description] = @pl.data['description']
      data[:due_on] = debt['due']
      data[:amount] = debt['am']
      PayableService.create(user: current_user, params: data)
    end

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
