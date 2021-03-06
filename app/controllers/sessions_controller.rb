class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:user][:email])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to 'sessions/new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
  
end