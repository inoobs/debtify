class DashboardController < ApplicationController
  def index
    @plugins = current_user.plugins
    @overdue_items = current_user.payable_items.overdue.includes(:payable)
  end
end
