class PayableItemsController < ApplicationController
  def mark_as_paid
    item = current_user.payable_items.find_by(id: params[:id])
    if item && item.update!(paid_at: Time.zone.now)
      flash[:success] = "Payable item #{item.payable.name} marked as paid"
    else
      flash[:error] = 'Payable item not found or does not belong to you'
    end

    redirect_to dashboard_path
  end
end
