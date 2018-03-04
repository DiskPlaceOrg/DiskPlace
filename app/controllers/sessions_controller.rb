class SessionsController < ApplicationController
  def new
    redirect_to user_path(session[:user_id]) unless session[:user_id].nil?
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      render :new
    end
  end

  def destroy
    session[:user_filter] = nil
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out'
  end
end
