class DashboardController < ApplicationController

  def index
    @plugins = current_user.plugins
  end
end
