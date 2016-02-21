class PluginsUsersController < ApplicationController
  before_action :set_plugins_user, only: :destroy

  def destroy
    @item.destroy
    redirect_to plugins_path, notice: 'Plugin Item destroyed.'
  end

  def set_plugins_user
    @item = PluginsUser.find(params[:id])
  end
end
