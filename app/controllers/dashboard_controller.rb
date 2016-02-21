class DashboardController < ApplicationController
  def index
    @plugins = current_user.plugins
    @overdue_items = current_user
                       .payable_items
                       .overdue
                       .includes(:payable)
                       .order(due_on: :asc)
    @upcoming_items = current_user
                        .payable_items
                        .upcoming
                        .includes(:payable)
                        .order(due_on: :asc)
  end
end
