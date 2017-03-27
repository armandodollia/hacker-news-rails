class UsersController < ApplicationController
  def new
  end
  
  def create
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to '/'
    else
      :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end