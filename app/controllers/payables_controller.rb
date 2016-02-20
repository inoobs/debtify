class PayablesController < ApplicationController
  def index
  end

  def new
    @payable = current_user.payables.new
  end

  def create
    @payable = PayableService.create(create_params, current_user)

    if @payable.persisted?
      flash[:success] = "'#{@payable.name}' has been created successfully!"
      redirect_to dashboard_path
    else
      flash[:error] = @payable.errors.to_a.join("\n")
      render :new
    end
  end

  def edit
    @payable = current_user.payables.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def create_params
    params.require(:payable).permit(
      :name, :description, :amount, :due_on, :recurring_type, :recurring_ends_on
    )
  end
end
