class PayablesController < ApplicationController
  def index
    @payables = current_user.payables
  end

  def new
    @payable = current_user.payables.new
  end

  def create
    @payable = PayableService.create(
      user: current_user,
      params: permitted_params
    )

    if @payable.persisted?
      flash[:success] = "'#{@payable.name}' has been created successfully!"
      redirect_to dashboard_path
    else
      flash.now[:error] = @payable.errors.to_a.join("\n")
      render :new
    end
  end

  def edit
    @payable = current_user.payables.find(params[:id])

    unless @payable.items.today_and_future.any?
      flash.now[:info] = <<-MSG.squish
        Your bill doesn't have future payments. Only new payments
        will be created after saving your changes.
      MSG
    end
  end

  def update
    @payable = PayableService.update(
      id: params[:id],
      user: current_user,
      params: permitted_params
    )

    if @payable.errors.none?
      flash[:success] = "'#{@payable.name}' has been updated successfully!"
      redirect_to dashboard_path
    else
      flash.now[:error] = @payable.errors.to_a.join("\n")
      render :edit
    end
  end

  def destroy
  end

  private

  def permitted_params
    params.require(:payable).permit(
      :name, :description, :amount, :due_on, :recurring_type, :recurring_ends_on
    )
  end
end
